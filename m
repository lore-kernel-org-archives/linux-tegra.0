From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v7 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Date: Mon, 20 Jul 2020 08:42:39 +0800
Message-ID: <1595205759-5825-5-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYy4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1
bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgMSArDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbW1jL210ay1zZC50eHQNCmluZGV4IDhhNTMyZjQuLjBjOWNmNmEgMTAwNjQ0DQotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnR4dA0KQEAgLTEy
LDYgKzEyLDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCiAJIm1lZGlhdGVrLG10ODE3My1tbWMi
OiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE3Mw0KIAkibWVkaWF0ZWssbXQ4
MTgzLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4MTgzDQogCSJtZWRp
YXRlayxtdDg1MTYtbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDg1MTYN
CisJIm1lZGlhdGVrLG10Njc3OS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRo
IG10Njc3OQ0KIAkibWVkaWF0ZWssbXQyNzAxLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRp
YmxlIHdpdGggbXQyNzAxDQogCSJtZWRpYXRlayxtdDI3MTItbW1jIjogZm9yIG1tYyBob3N0IGlw
IGNvbXBhdGlibGUgd2l0aCBtdDI3MTINCiAJIm1lZGlhdGVrLG10NzYyMi1tbWMiOiBmb3IgTVQ3
NjIyIFNvQw0KLS0gDQoxLjkuMQ0K
