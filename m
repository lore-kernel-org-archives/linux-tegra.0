From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v5 5/5] dt-bindings: mmc: mediatek: Add document for mt6779
Date: Tue, 28 Apr 2020 07:56:08 +0800
Message-ID: <1588031768-23677-6-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYw0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVu
LUh1bmcgV3UgPGNodW4taHVuZy53dUBtZWRpYXRlay5jb20+DQpBY2tlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCi0tLQ0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tbWMvbXRrLXNkLnR4dCB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9t
dGstc2QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2Qu
dHh0DQppbmRleCA4YTUzMmY0Li4wYzljZjZhIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCkBAIC0xMiw2ICsxMiw3IEBAIFJlcXVp
cmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDgxNzMtbW1jIjogZm9yIG1tYyBob3N0IGlw
IGNvbXBhdGlibGUgd2l0aCBtdDgxNzMNCiAJIm1lZGlhdGVrLG10ODE4My1tbWMiOiBmb3IgbW1j
IGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE4Mw0KIAkibWVkaWF0ZWssbXQ4NTE2LW1tYyI6
IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4NTE2DQorCSJtZWRpYXRlayxtdDY3
NzktbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDY3NzkNCiAJIm1lZGlh
dGVrLG10MjcwMS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10MjcwMQ0K
IAkibWVkaWF0ZWssbXQyNzEyLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGgg
bXQyNzEyDQogCSJtZWRpYXRlayxtdDc2MjItbW1jIjogZm9yIE1UNzYyMiBTb0MNCi0tIA0KMi42
LjQNCg==
