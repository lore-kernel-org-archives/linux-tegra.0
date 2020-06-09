From: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/4] mmc: mediatek: add mmc cqhci support
Date: Tue, 9 Jun 2020 09:18:18 +0800
Message-ID: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martin
Cc: kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
QWRkIEFja2VkLWJ5IGFuZCBtb3JlIG1haW50YWluZXJzDQoNCnY1IC0+IHY2Og0KICAtIE1vdmUg
Q1FFIGJpbmRpbmdzIGJhY2sgdG8gdmVuZG9yIGRyaXZlcg0KICAtIEFkZCBtdDY3NzkgbW1jIHN1
cHBvcnQgYXMgYW4gaW5kaXZpZHVhbCBwYXRjaA0KICAtIEVycm9yIGhhbmRsaW5nIGZvciBjcV9o
b3N0IGRldm1fa3phbGxvKCkNCg0KQ2h1bi1IdW5nIFd1ICg0KToNCiAgWzEvNF0gbW1jOiBtZWRp
YXRlazogYWRkIE1UNjc3OSBNTUMgZHJpdmVyIHN1cHBvcnQNCiAgWzIvNF0gbW1jOiBtZWRpYXRl
azogcmVmaW5lIG1zZGMgdGltZW91dCBhcGkNCiAgWzMvNF0gbW1jOiBtZWRpYXRlazogY29tbWFu
ZCBxdWV1ZSBzdXBwb3J0DQogIFs0LzRdIGR0LWJpbmRpbmdzOiBtbWM6IG1lZGlhdGVrOiBBZGQg
ZG9jdW1lbnQgZm9yIG10Njc3OQ0KDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21tYy9tdGstc2QudHh0IHwgICA0ICsNCiBkcml2ZXJzL21tYy9ob3N0L210ay1zZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNjQgKysrKysrKysrKysrKysrKysrKysrLS0NCiAyIGZpbGVz
IGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCg0KLS0gDQoxLjku
MQ0K
