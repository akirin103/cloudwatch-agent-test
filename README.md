# cloudwatch-agent-test
EC2初期化時に`CloudWatch Agent`をインストール・有効化し、メトリクスを取得できるようにします。

<br />

## 確認方法
1. AWSマネジメントコンソール - CloudWatch - すべてのメトリクスの画面を開く。
2. カスタム名前空間`CWAgent`からメトリクスが取得できていることを確認します。

<br />

## 参考
[CloudWatch エージェントを使用して Amazon EC2 インスタンスとオンプレミスサーバーからメトリクスとログを収集する](https://docs.aws.amazon.com/ja_jp/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
