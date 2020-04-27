From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH v5 0/5] mmc: mediatek: add mmc cqhci support
Date: Tue, 28 Apr 2020 07:56:03 +0800
Message-ID: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>
List-Id: linux-tegra@vger.kernel.org

VGhpcyBzZXJpZXMgcHJvdmlkZXMgTWVkaWFUZWsgY3FoY2kgaW1wbGVtZW50YXRpb25zIGFzIGJl
bG93Og0KICAtIEV4dGVuZCBtbWNfb2ZfcGFyc2UoKSB0byBwYXJzZSBDUUUgYmluZGluZ3MNCiAg
LSBSZW1vdmUgcmVkdW5kYW50IGhvc3QgQ1FFIGJpbmRpbmdzDQogIC0gUmVmaW5lIG1zZGMgdGlt
ZW91dCBhcGkgdG8gcmVkdWNlIHJlZHVuZGFudCBjb2RlDQogIC0gTWVkaWFUZWsgY29tbWFuZCBx
dWV1ZSBzdXBwb3J0DQogIC0gZHQtYmluZGluZ3MgZm9yIG10Njc3OQ0KDQp2MSAtPiB2MjoNCiAg
LSBBZGQgbW9yZSBwYXRjaCBkZXRhaWxzIGluIGNvbW1pdCBtZXNzYWdlDQogIC0gU2VwYXJhdGUg
bXNkYyB0aW1lb3V0IGFwaSByZWZpbmUgdG8gaW5kaXZpZHVhbCBwYXRjaA0KDQp2MiAtPiB2MzoN
CiAgLSBSZW1vdmUgQ1ItSWQsIENoYW5nZS1JZCBhbmQgRmVhdHVyZSBpbiBwYXRjaGVzDQogIC0g
QWRkIFNpZ25lZC1vZmYtYnkgaW4gcGF0Y2hlcw0KDQp2MyAtPiB2NDoNCiAgLSBSZWZpbmUgQ1FF
IGJpbmRpbmdzIGluIG1tY19vZl9wYXJzZSAoVWxmIEhhbnNzb24pDQogIC0gUmVtb3ZlIHJlZHVu
ZGFudCBob3N0IENRRSBiaW5kaW5ncyAoTGludXggV2FsbGVpaikNCg0KdjQgLT4gdjU6DQogIC0g
QWRkIEFja2VkLWJ5IGFuZCBtb3JlIG1haW50YWluZXJzDQoNCkNodW4tSHVuZyBXdSAoNSk6DQog
IFsxLzVdIG1tYzogY29yZTogRXh0ZW5kIG1tY19vZl9wYXJzZSgpIHRvIHBhcnNlIENRRSBiaW5k
aW5ncw0KICBbMi81XSBtbWM6IGhvc3Q6IFJlbW92ZSByZWR1bmRhbnQgQ1FFIGJpbmRpbmdzDQog
IFszLzVdIG1tYzogbWVkaWF0ZWs6IHJlZmluZSBtc2RjIHRpbWVvdXQgYXBpDQogIFs0LzVdIG1t
YzogbWVkaWF0ZWs6IGNvbW1hbmQgcXVldWUgc3VwcG9ydA0KICBbNS81XSBkdC1iaW5kaW5nczog
bW1jOiBtZWRpYXRlazogQWRkIGRvY3VtZW50IGZvciBtdDY3NzkNCg0KIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbXRrLXNkLnR4dCB8ICAgMSArDQogZHJpdmVycy9tbWMv
Y29yZS9ob3N0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCiBkcml2ZXJzL21t
Yy9ob3N0L210ay1zZC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxNTEgKysrKysrKysrKysr
KysrKysrKysrLS0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLWJyY21zdGIuYyAgICAgICAgICAg
ICAgICAgfCAgMTEgKy0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW1zbS5jICAgICAgICAgICAg
ICAgICAgICAgfCAgIDMgKy0NCiBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFyYXNhbi5jICAg
ICAgICAgICAgICAgfCAgIDMgLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktdGVncmEuYyAgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQ0KIDcgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNi40DQo=
