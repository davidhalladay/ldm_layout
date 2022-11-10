
python main.py --base configs/ldm/coco_stuff_ldm_T2I_vqgan_f8.yaml \
        -t True --gpus 1 -log_dir ./exp/ldm/T2I \
        -n coco_stuff_ldm_T2I_vqgan_f8 --scale_lr False -tb True
