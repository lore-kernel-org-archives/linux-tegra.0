From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v7 0/4] mmc: mediatek: add mmc cqhci support
Date: Mon, 20 Jul 2020 08:42:35 +0800
Message-ID: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

VGhpcyBzZXJpZXMgcHJvdmlkZXMgTWVkaWFUZWsgY3FoY2kgaW1wbGVtZW50YXRpb25zIGFzIGJl
bG93Og0KICAtIFJlZmluZSBtc2RjIHRpbWVvdXQgYXBpIHRvIHJlZHVjZSByZWR1bmRhbnQgY29k
ZQ0KICAtIE1lZGlhVGVrIGNvbW1hbmQgcXVldWUgc3VwcG9ydA0KICAtIGR0LWJpbmRpbmdzIGZv
ciBtdDY3NzkNCg0KdjEgLT4gdjI6DQogIC0gQWRkIG1vcmUgcGF0Y2ggZGV0YWlscyBpbiBjb21t
aXQgbWVzc2FnZQ0KICAtIFNlcGFyYXRlIG1zZGMgdGltZW91dCBhcGkgcmVmaW5lIHRvIGluZGl2
aWR1YWwgcGF0Y2gNCg0KdjIgLT4gdjM6DQogIC0gUmVtb3ZlIENSLUlkLCBDaGFuZ2UtSWQgYW5k
IEZlYXR1cmUgaW4gcGF0Y2hlcw0KICAtIEFkZCBTaWduZWQtb2ZmLWJ5IGluIHBhdGNoZXMNCg0K
djMgLT4gdjQ6DQogIC0gUmVmaW5lIENRRSBiaW5kaW5ncyBpbiBtbWNfb2ZfcGFyc2UgKFVsZiBI
YW5zc29uKQ0KICAtIFJlbW92ZSByZWR1bmRhbnQgaG9zdCBDUUUgYmluZGluZ3MgKExpbnV4IFdh
bGxlaWopDQoNCnY0IC0+IHY1Og0KICAtIEFkZCBBY2tlZC1ieSBhbmQgbW9yZSBtYWludGFpbmVy
cw0KDQp2NSAtPiB2NjoNCiAgLSBNb3ZlIENRRSBiaW5kaW5ncyBiYWNrIHRvIHZlbmRvciBkcml2
ZXINCiAgLSBBZGQgbXQ2Nzc5IG1tYyBzdXBwb3J0IGFzIGFuIGluZGl2aWR1YWwgcGF0Y2gNCiAg
LSBFcnJvciBoYW5kbGluZyBmb3IgY3FfaG9zdCBkZXZtX2t6YWxsbygpDQoNCnY2IC0+IHY3Og0K
ICAtIFNlbGVjdCBNTUNfQ1FIQ0kgZm9yIE1NQ19NVEsNCiAgLSBSZW1vdmUgdW5uZWNlc3Nhcnkg
b3B0aW9uIE1NQ19DUUhDSSBpbiBtdGstc2QuYw0KICAtIEFkZCBlcnJvciBoYW5kbGluZyBmb3Ig
Y3FoY2lfaW5pdCgpDQogIC0gVXNlIG5hdGl2ZSBjcWhjaSBkdC1iaW5kaW5ncyAnc3VwcG9ydHMt
Y3FlJw0KDQpDaHVuLUh1bmcgV3UgKDQpOg0KICBbMS80XSBtbWM6IG1lZGlhdGVrOiBhZGQgTVQ2
Nzc5IE1NQyBkcml2ZXIgc3VwcG9ydA0KICBbMi80XSBtbWM6IG1lZGlhdGVrOiByZWZpbmUgbXNk
YyB0aW1lb3V0IGFwaQ0KICBbMy80XSBtbWM6IG1lZGlhdGVrOiBjb21tYW5kIHF1ZXVlIHN1cHBv
cnQNCiAgWzQvNF0gZHQtYmluZGluZ3M6IG1tYzogbWVkaWF0ZWs6IEFkZCBkb2N1bWVudCBmb3Ig
bXQ2Nzc5DQoNCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL210ay1zZC50
eHQgfCAgIDEgKw0KIGRyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTYwICsrKysrKysrKysrKysrKysrKysrKy0tDQogMyBmaWxlcyBjaGFuZ2VkLCAx
NTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjENCg==
