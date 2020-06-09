From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v6 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
Date: Tue, 9 Jun 2020 09:18:22 +0800
Message-ID: <1591665502-6573-5-git-send-email-chun-hung.wu@mediatek.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

QWRkIGNvbXBhdGlibGUgbm9kZSBmb3IgbXQ2Nzc5IG1tYyBhbmQgSFcgY21kcSBzZWxlY3Rpb24N
Cm5vZGUgIm1lZGlhdGVrLGNxaGNpIi4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bi1IdW5nIFd1IDxj
aHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgNCArKysrDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21tYy9tdGstc2QudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21t
Yy9tdGstc2QudHh0DQppbmRleCA4YTUzMmY0Li5kNGQyMGI5IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0DQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50eHQNCkBAIC0xMiw2ICsxMiw3
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogCSJtZWRpYXRlayxtdDgxNzMtbW1jIjogZm9yIG1t
YyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDgxNzMNCiAJIm1lZGlhdGVrLG10ODE4My1tbWMi
OiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRoIG10ODE4Mw0KIAkibWVkaWF0ZWssbXQ4
NTE2LW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRpYmxlIHdpdGggbXQ4NTE2DQorCSJtZWRp
YXRlayxtdDY3NzktbW1jIjogZm9yIG1tYyBob3N0IGlwIGNvbXBhdGlibGUgd2l0aCBtdDY3NzkN
CiAJIm1lZGlhdGVrLG10MjcwMS1tbWMiOiBmb3IgbW1jIGhvc3QgaXAgY29tcGF0aWJsZSB3aXRo
IG10MjcwMQ0KIAkibWVkaWF0ZWssbXQyNzEyLW1tYyI6IGZvciBtbWMgaG9zdCBpcCBjb21wYXRp
YmxlIHdpdGggbXQyNzEyDQogCSJtZWRpYXRlayxtdDc2MjItbW1jIjogZm9yIE1UNzYyMiBTb0MN
CkBAIC00OSw2ICs1MCw5IEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6DQogCQkgICAgIGVycm9yIGNh
dXNlZCBieSBzdG9wIGNsb2NrKGZpZm8gZnVsbCkNCiAJCSAgICAgVmFsaWQgcmFuZ2UgPSBbMDow
eDddLiBpZiBub3QgcHJlc2VudCwgZGVmYXVsdCB2YWx1ZSBpcyAwLg0KIAkJICAgICBhcHBsaWVk
IHRvIGNvbXBhdGlibGUgIm1lZGlhdGVrLG10MjcwMS1tbWMiLg0KKy0gbWVkaWF0ZWssY3FoY2k6
IEhXIGNtZHEgc2VsZWN0aW9uDQorCQkgIElmIHByZXNlbnQsIGh3IGNvbW1hbmQgcXVldWUgaXMg
ZW5hYmxlZC4NCisJCSAgSWYgbm90IHByZXNlbnQsIGh3IGNvbW1hbmQgcXVldWUgaXMgZGlzYWJs
ZWQuDQogDQogRXhhbXBsZXM6DQogbW1jMDogbW1jQDExMjMwMDAwIHsNCi0tIA0KMS45LjENCg==
