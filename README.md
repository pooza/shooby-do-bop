# shooby-do-bop

拙作[tomato-shrieker](https://github.com/pooza/tomato-shrieker)と連携し、YouTube動画の再生回数を投稿するボットを作成する為のツール。

## 設定例

### config/local.yaml

```yaml
google:
  api:
    key: xxxx
entries:
  - key: shooby
    video:
      url: https://www.youtube.com/watch?v=uFfsTeExwbQ
    goal: 20000000
  - key: letsla
    video:
      url: https://www.youtube.com/watch?v=q0Ib86qUodw
    goal: 20000000
  - key: everybody
    video:
      url: https://www.youtube.com/watch?v=-HWLo0Al7sk
    goal: 10000000
```

### tomato-shrieker側

```yaml
sources:
  - id: shooby
    source:
      command:
        - bin/shooby.rb
        - --entry
        - shooby
      dir: /home/pooza/repos/shooby-do-bop
    schedule:
      cron: '1 6 * * *'
    dest:
      account:
        bot: true
      hooks:
        - https://mstdn.example.com/mulukhiya/webhook/xxxxx
      tags:
        - precure_fun
        - 宮本佳那子
        - シュビドゥビ_スイーツタイム2000万再生カウントダウン
  - id: letsla
    source:
      command:
        - bin/shooby.rb
        - --entry
        - letsla
      dir: /home/pooza/repos/shooby-do-bop
    schedule:
      cron: '2 6 * * *'
    dest:
      account:
        bot: true
      hooks:
        - https://mstdn.example.com/mulukhiya/webhook/xxxxx
      tags:
        - precure_fun
        - 宮本佳那子
        - レッツ_ラ_クッキン_ショータイム2000万再生カウントダウン
  - id: everybody
    source:
      command:
        - bin/shooby.rb
        - --entry
        - everybody
      dir: /home/pooza/repos/shooby-do-bop
    schedule:
      cron: '3 6 * * *'
    dest:
      account:
        bot: true
      hooks:
        - https://mstdn.example.com/mulukhiya/webhook/xxxxx
      tags:
        - precure_fun
        - 宮本佳那子
        - エビバディ_ヒーリングッデイ_1000万再生カウントダウン
```
