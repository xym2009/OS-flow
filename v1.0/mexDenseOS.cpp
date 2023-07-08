#include "mex.h"
#include "Image.h"
#include "ImageFeature.h"
#include "Vector.h"
#include <vector>

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
	DImage im;
	im.LoadMatlabImage(prhs[0]);
	bool IsMultiScale = false;
	vector<int> cellSizeVect;
	int cellSize = 3;
	int stepSize = 1;
    int IsSAR = 1;
    int IsReversal = 0;
	bool IsBoundaryIncluded = true;

	Vector para;
	if(nrhs>1) // if cell size is inputed
	{
		para.readVector(prhs[1]);
		if(para.dim()>1)
		{
			IsMultiScale = true;
			for(int i = 0;i<para.dim();i++)
				cellSizeVect.push_back(para[i]);
		}
		else
			cellSize = para[0];
	}
	if(nrhs>2)
	{
		para.readVector(prhs[2]);
		stepSize = para[0];
	}
	if(nrhs>3)
	{
		para.readVector(prhs[3]);
		IsSAR = para[0];
	}
    if(nrhs>4)
	{
		para.readVector(prhs[4]);
		IsReversal = para[0];
	}
    if(nrhs>5)
	{
		para.readVector(prhs[5]);
		IsBoundaryIncluded = para[0]>0;
	}
	UCImage imsift;
    if(IsMultiScale)
		ImageFeature::imSIFT(im,imsift,cellSizeVect,stepSize,IsSAR,IsReversal,IsBoundaryIncluded);
	else
        ImageFeature::imSIFT(im,imsift,cellSize,stepSize,IsSAR,IsReversal,IsBoundaryIncluded);
	imsift.OutputToMatlab(plhs[0]);
}