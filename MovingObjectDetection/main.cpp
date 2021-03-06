#include "ViBe.h"
#include "LKFlow.h"

using namespace std;
using namespace cv;

// 帧差法
Mat FrameMinus(const Mat& imgA, const Mat& imgB)
{
    Mat Res;
    Res.create(imgA.size(), CV_32FC1);

    Mat tempA, tempB;
    Mat tempRes;

    cvtColor(imgA, tempA, CV_BGR2GRAY);
    tempA.convertTo(tempA, CV_32FC1, 1.0 / 255);
    cvtColor(imgB, tempB, CV_BGR2GRAY);
    tempB.convertTo(tempB, CV_32FC1, 1.0 / 255);

    //Res = abs(imgA - imgB);
    absdiff(tempA, tempB, tempRes);
    threshold(tempRes, tempRes, 0.2, 1, THRESH_BINARY);
    tempRes.convertTo(tempRes, CV_8UC1, 255);
    //Res = tempA;

    // do Morph structuring element: close operaton
    Mat Kernel = getStructuringElement(MORPH_RECT, Size(3, 3));
    // Way 1:
    morphologyEx(tempRes, Res, MORPH_CLOSE, Kernel);
    // Way 2: dilate -> erode
    //dilate(tempRes, tempRes, Kernel);
    //erode(tempRes, Res, Kernel);

    return Res;
}

Mat FrameMinus(const Mat& imgA, const Mat& imgB, Mat& imgIO)
{
    Mat Res;
    Res.create(imgA.size(), CV_32FC1);

    Mat tempA, tempB;
    Mat tempRes;

    cvtColor(imgA, tempA, CV_BGR2GRAY);
    tempA.convertTo(tempA, CV_32FC1, 1.0 / 255);
    cvtColor(imgB, tempB, CV_BGR2GRAY);
    tempB.convertTo(tempB, CV_32FC1, 1.0 / 255);

    //Res = abs(imgA - imgB);
    absdiff(tempA, tempB, tempRes);
    threshold(tempRes, tempRes, 0.2, 1, THRESH_BINARY);
    tempRes.convertTo(tempRes, CV_8UC1, 255);
    //Res = tempA;
    imgIO = tempRes;

    // do Morph structuring element: close operaton
    Mat Kernel = getStructuringElement(MORPH_RECT, Size(3, 3));
    // Way 1:
    morphologyEx(tempRes, Res, MORPH_CLOSE, Kernel);
    // Way 2: dilate -> erode
    //dilate(tempRes, tempRes, Kernel);
    //erode(tempRes, Res, Kernel);

    return Res;
}

// 背景差分法: Using mean filter
Mat BackGroundDifference(const vector<Mat> &imgBGs, const Mat& imgCurr)
{
    Mat tempSum = Mat::zeros(imgCurr.size(), CV_32FC1);
    Mat tempImg;

    for (auto & ele : imgBGs)
        tempSum = tempSum + ele;

    size_t N = imgBGs.size();
    Mat imgBG = tempSum / N;

    Mat Res = FrameMinus(imgBG, imgCurr);

    return Res;
}

// TODO: ViBe+

// 光流法

int main(int argc, char ** argv) {
    // For test
    //Mat A = (Mat_<float>(3, 3) << 1, 2, 3, 4, 5, 6, 7, 8, 0);
    //cout << A << endl;
    //A.reshape(1);
    //A = A.reshape(1, 9);
    //cout << A << endl;
    //cout << "1, 2 = " << A.at<float>(1, 2) << endl;
    const String keys = "{h | help | print help message}"
            "{@imgA | imgA.png | Read the input A image }"
            "{@imgB | imgB.png | Read the input B image}";

    CommandLineParser clp(argc, argv, keys);

    //string help = "h";
    if (clp.get<bool>("h")) {
        cout << "Usage: ./MovingObjectDetection [imgA name] [imgB name]" << endl;
    }

    string nameA, nameB;

    if (argc == 3)
    {
        cout << "Read images." << endl;
        nameA = clp.get<string>("@imgA");
        nameB = clp.get<string>("@imgB");
    }

    Mat imgA = imread(nameA, IMREAD_COLOR);
    Mat imgB = imread(nameB, IMREAD_COLOR);

    assert(!imgA.empty() && !imgB.empty());

    cout << "Image Info: " << imgA.size() << endl;

    //imgA.convertTo(imgA, CV_32FC3, 1.0);
    //imgB.convertTo(imgB, CV_32FC3, 1.0);

    Mat imgB_OF;
    LK lkof;
    lkof.calcOF(imgB_OF, imgA, imgB);

    imgA.convertTo(imgA, CV_8UC1, 1.0);
    imshow("Input", imgA);
    imshow("Result", imgB_OF);

    waitKey(0);

    /*
    Ptr<ORB> d = ORB::create();
    vector<KeyPoint> test;
    d->detect(imgA, test, Mat());

    cout << "Kps size = " << test.size() << endl;

    //cout << "x = " << test[1].pt.x << " y = " << test[1].pt.y << endl;
    //cout << "Size of keypoint: " << test[1].size << endl;              // Output : 31

    waitKey(0);
    */
    /*
    Mat Res, resBefore;
    ViBe tvb;
    tvb.initViBe(imgA.cols, imgA.rows);
    tvb.initialFrame(imgA);
    tvb.detectionBG(imgB);

    Res = tvb.getBGimg();

    //Res = FrameMinus(imgA, imgB, resBefore);

    //imshow("Before Morph", resBefore);
    imshow("Result", Res);

    waitKey(0);
    */

    return 0;
}

/*
int main(int argc, char **argv) {
    std::cout << "Hello, World!" << std::endl;

    assert(argc == 3);

    string nameA(argv[1]);
    string nameB(argv[2]);

    Mat imgA = imread(nameA, IMREAD_COLOR);
    Mat imgB = imread(nameB, IMREAD_COLOR);

    assert(imgA.empty() == false);
    assert(imgB.empty() == false);

    //Mat Res = Mat::zeros(imgA.size(), imgA.type());
    Mat Res, resBefore;
    ViBe tvb;
    tvb.initViBe(imgA.cols, imgA.rows);
    tvb.initialFrame(imgA);
    tvb.detectionBG(imgB);

    Res = tvb.getBGimg();

    //Res = FrameMinus(imgA, imgB, resBefore);

    //imshow("Before Morph", resBefore);
    imshow("Result", Res);

    waitKey(0);

    return 0;
}
 */
