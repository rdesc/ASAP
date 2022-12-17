PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \

data_path="./data/nuscenes"
data_version="v1.0-trainval"
PY_ARGS=${@:1}

OUT_DIR="./out/"
LOG_DIR=$OUT_DIR/'lidar_20Hz'
if [ ! -d $LOG_DIR ]; then
    mkdir -p $LOG_DIR
fi

python -m sAP3D.nusc_lidar20Hz_instance-token_generator \
    --data_path $data_path \
    --data_version $data_version \
    $PY_ARGS | tee -a $LOG_DIR/instance_token_generator.txt
