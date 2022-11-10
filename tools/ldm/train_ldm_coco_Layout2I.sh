
python main.py --base configs/ldm/coco_sg2im_ldm_Layout2I_vqgan_f8.yaml \
        -t True --gpus 1 -log_dir ./exp/ldm/Layout2I \
        -n coco_sg2im_ldm_Layout2I_vqgan_f8 --scale_lr False -tb True
