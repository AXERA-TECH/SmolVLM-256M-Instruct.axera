# SmolVLM-256M-Instruct.axera
SmolVLM-256M-Instruct DEMO on Axera

- 预编译模型下载[models](https://huggingface.co/AXERA-TECH/SmolVLM-256M-Instruct)，如需自行转换请参考[模型转换](/model_convert/README.md)
- [cpp demo]((./cpp))

递归clone本项目
```
git clone --recursive https://github.com/techshoww/ax-llm.git
```

## 支持平台

- [x] AX650N
- [x] AX630C

## 模型转换

[模型转换](./model_convert/README.md)

## 上板部署

- AX650N 的设备已预装 Ubuntu22.04
- 以 root 权限登陆 AX650N 的板卡设备
- 链接互联网，确保 AX650N 的设备能正常执行 `apt install`, `pip install` 等指令
- 已验证设备：AX650N DEMO Board、爱芯派Pro(AX650N)、爱芯派2(AX630C)

### Python API 运行

#### Requirements

将 npu_python_llm 拷贝到具备 python 环境的 AX650N 开发板或者 爱芯派Pro 上  
执行以下命令安装pyaxengine
```
cd {your path to npu_python_llm}/axengein 
pip install -e .
``` 

#### 添加环境变量

将以下两行添加到 `/root/.bashrc`(实际添加的路径需要自行检查)后，重新连接终端或者执行 `source ~/.bashrc`

```
export LD_LIBRARY_PATH={your path to npu_python_llm}/engine_so/:$LD_LIBRARY_PATH
``` 

#### 运行

在开发板上运行命令

```
python3 infer_axmodel.py
```  
**输入**
图片：
![demo.jpg](assets/demo.jpg)
文本：
```
Can you describe this image?
```
**输出**  
```
The image depicts a large, historic statue of Liberty, located in New York City. The statue is a prominent landmark in the city and is known for its iconic presence and historical significance. The statue is located on Liberty Island, which is a part of the Empire State Building complex. The statue is made of bronze and is mounted on a pedestal. The pedestal is rectangular and has a weathered look, suggesting it has been in use for a long time. The statue is surrounded by a large, open area, which is likely a plaza or a plaza park.

The statue is surrounded by a large, open space, which is likely a plaza or a plaza park. The space is filled with trees and other greenery, and there is a clear view of the city skyline, which includes the Empire State Building and other notable landmarks. The sky is clear and blue, indicating that it is a sunny day.

In the background, there are tall buildings that are part of the Empire State Building complex. These buildings are modern and have a sleek, contemporary design. The buildings are well-maintained and appear to be part of the same building complex.

The statue is positioned in the center of the image, with the plaza in the foreground. The plaza is surrounded by trees and other greenery, and there is a clear view of the city skyline. The sky is clear and blue, indicating that it is a sunny day.

The statue is made of bronze and is mounted on a pedestal. The pedestal is rectangular and has a weathered look, suggesting it has been in use for a long time. The statue is surrounded by a large, open area, which is likely a plaza or a plaza park.

The statue is surrounded by a large, open space, which is likely a plaza or a plaza park. The space is filled with trees and other greenery, and there is a clear view of the city skyline. The sky is clear and blue, indicating that it is a sunny day.

In summary, the image depicts the Statue of Liberty in New York City, surrounded by a large open plaza with trees and other greenery. The statue is positioned in the center of the image, surrounded by a large open space with trees and other greenery. The sky is clear and blue, indicating a sunny day.<end_of_utterance>
```


## 推理速度 

### python demo
| Stage | Time |
|------|------|
| Image Encoder (512x512) | 121 ms  | 
| Prefill (prefill_len 320) |  512ms    |
| Decode  |  11.6 token/s |

### C++ demo
| Stage | Time |
|------|------|
| Image Encoder (512x512) | 120 ms  | 
| Prefill (prefill_len 128)|  57ms    |
| Decode  |  77 token/s |

python 代码性能不太好，推荐 [C++ code](./cpp)。

## 技术讨论

- Github issues
- QQ 群: 139953715
