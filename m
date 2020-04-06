From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH 1/5] [1/5] mmc: core: Extend mmc_of_parse() to parse CQE bindings
Date: Mon, 6 Apr 2020 17:27:57 +0800
Message-ID: <1586165281-11888-2-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

UGFyc2UgQ1FFIGJpbmRpbmdzICJzdXBwb3J0cy1jcWUiIGFuZCAiZGlzYWJsZS1jcWUtZGNtZCIN
CmluIG1tY19vZl9wYXJzZSgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVuLUh1bmcgV3UgPGNodW4t
aHVuZy53dUBtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21tYy9jb3JlL2hvc3QuYyB8IDUg
KysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL21tYy9jb3JlL2hvc3QuYyBiL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jDQppbmRleCBj
ODc2ODcyLi40NzUyMWM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvY29yZS9ob3N0LmMNCisr
KyBiL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jDQpAQCAtMzAyLDYgKzMwMiwxMSBAQCBpbnQgbW1j
X29mX3BhcnNlKHN0cnVjdCBtbWNfaG9zdCAqaG9zdCkNCiAJCWhvc3QtPmNhcHMyIHw9IE1NQ19D
QVAyX05PX1NEOw0KIAlpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJuby1tbWMi
KSkNCiAJCWhvc3QtPmNhcHMyIHw9IE1NQ19DQVAyX05PX01NQzsNCisJaWYgKGRldmljZV9wcm9w
ZXJ0eV9yZWFkX2Jvb2woZGV2LCAic3VwcG9ydHMtY3FlIikpDQorCQlob3N0LT5jYXBzMiB8PSBN
TUNfQ0FQMl9DUUU7DQorCWlmICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkaXNh
YmxlLWNxZS1kY21kIikpIHsNCisJCWhvc3QtPmNhcHMyIHw9IE1NQ19DQVAyX0NRRV9EQ01EOw0K
Kwl9DQogDQogCS8qIE11c3QgYmUgYWZ0ZXIgIm5vbi1yZW1vdmFibGUiIGNoZWNrICovDQogCWlm
IChkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiZml4ZWQtZW1tYy1kcml2ZXItdHlwZSIs
ICZkcnZfdHlwZSkgPT0gMCkgew0KLS0gDQoxLjkuMQ0K
