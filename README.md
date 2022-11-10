# Latent Diffusion Model (LDM) for Layout-to-image generation

---
This is the non-official repository of [LDM](https://arxiv.org/abs/2112.10752) for layout-to-image generation. Currently, the config and code in official LDM repo is incompleted. Thus, the repo aims to reproduce LDM on Layout-to-image generation task. If you find it useful, please cite their original paper [LDM](https://arxiv.org/abs/2112.10752).

---
## Machine environment
- Ubuntu version: 18.04.5 LTS
- CUDA version: 11.6
- Testing GPU: Nvidia Tesla V100
---

## Requirements
A [conda](https://conda.io/) environment named `ldm_layout` can be created and activated with:

```bash
conda env create -f environment.yaml
conda activate ldm_layout
```
---

## Datasets setup
We provide two approaches to set up the datasets:
### Auto-download
To automatically download datasets and save it into the default path (`../`), please use following script:
```bash
bash tools/download_datasets.sh
```
### Manual setup

#### Text-to-image generation
- We use COCO 2014 splits for text-to-image task, which can be downloaded from [official COCO website](https://cocodataset.org/#download).
- Please create a folder name `2014` and collect the downloaded data and annotations as follows.

   <details><summary>COCO 2014 file structure</summary>

   ```
   >2014
   ├── annotations
   │   └── captions_val2014.json
   │   └── ...
   └── val2014
      └── COCO_val2014_000000000073.jpg
      └── ... 
   ```

   </details>


#### Layout-to-image generation
- We use COCO 2017 splits to test Frido on layout-to-image task, which can be downloaded from [official COCO website](https://cocodataset.org/#download).
- Please create a folder name `2017` and collect the downloaded data and annotations as follows.

   <details><summary>COCO 2017 file structure</summary>

   ```
   >2017
   ├── annotations
   │   └── captions_val2017.json
   │   └── ...
   └── val2017
      └── 000000000872.jpg
      └── ... 
   ```

   </details>


#### File structure for dataset and code
Please make sure that the file structure is the same as the following. Or, you might modify the config file to match the corresponding paths.

   <details><summary>File structure</summary>

   ```
   >datasets
   ├── coco
   │   └── 2014
   │        └── annotations
   │        └── val2014
   │        └── ...
   │   └── 2017
   │        └── annotations
   │        └── val2017
   │        └── ...
   >ldm_layout
   └── configs
   │   └── ldm
   │   └── ... 
   └── exp
   │   └── ...
   └── ldm
   └── taming
   └── scripts
   └── tools
   └── ...
   ```

   </details>

---


## VQGAN models setup
We provide script to download VQGAN-f8 in [LDM github](https://github.com/CompVis/latent-diffusion):

To automatically download VQGAN-f8 and save it into the default path (`exp/`), please use following script:
```bash
bash tools/download_models.sh
```

## Train LDM for layout-to-image generation
We now provide scripts for training LDM on text-to-image and layout-to-image. 

Once the datasets are properly set up, one may train LDM by the following commands.
### Text-to-image 
```bash
bash tools/ldm/train_ldm_coco_T2I.sh
```
 - Default output folder will be `exp/ldm/T2I`
### Layout-to-image

```bash
bash tools/ldm/train_ldm_coco_Layout2I.sh
```
- Default output folder will be `exp/ldm/Layout2I`

### Multi-GPU testing

Change "--gpus" to identify the number of GPUs for training.

For example, using 4 gpus
```bash

python main.py --base configs/ldm/coco_sg2im_ldm_Layout2I_vqgan_f8.yaml \
        -t True --gpus 0,1,2,3 -log_dir ./exp/ldm/Layout2I \
        -n coco_sg2im_ldm_Layout2I_vqgan_f8 --scale_lr False -tb True
```

---

## Inference

Change "-t" to identify training or testing phase.
(Note that multi-gpu testing is supported.)

For example, using 4 gpus for testing
```bash

python main.py --base configs/ldm/coco_sg2im_ldm_Layout2I_vqgan_f8.yaml \
        -t False --gpus 0,1,2,3 -log_dir ./exp/ldm/Layout2I \
        -n coco_sg2im_ldm_Layout2I_vqgan_f8 --scale_lr False -tb True
```

## Acknowledgement
We build LDM_layout codebase heavily on the codebase of [Latent Diffusion Model (LDM)](https://github.com/CompVis/latent-diffusion) and [VQGAN](https://github.com/CompVis/taming-transformers). We sincerely thank the authors for open-sourcing! 

## Citation
If you find this code useful for your research, please consider citing:
```bibtex
@misc{rombach2021highresolution,
      title={High-Resolution Image Synthesis with Latent Diffusion Models}, 
      author={Robin Rombach and Andreas Blattmann and Dominik Lorenz and Patrick Esser and Björn Ommer},
      year={2021},
      eprint={2112.10752},
      archivePrefix={arXiv},
      primaryClass={cs.CV}
}

@misc{https://doi.org/10.48550/arxiv.2204.11824,
  doi = {10.48550/ARXIV.2204.11824},
  url = {https://arxiv.org/abs/2204.11824},
  author = {Blattmann, Andreas and Rombach, Robin and Oktay, Kaan and Ommer, Björn},
  keywords = {Computer Vision and Pattern Recognition (cs.CV), FOS: Computer and information sciences, FOS: Computer and information sciences},
  title = {Retrieval-Augmented Diffusion Models},
  publisher = {arXiv},
  year = {2022},  
  copyright = {arXiv.org perpetual, non-exclusive license}
}

```
