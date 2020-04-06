From: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/5] mmc: mediatek: add mmc cqhci support
Date: Mon, 6 Apr 2020 17:27:56 +0800
Message-ID: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
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
ZGFudCBob3N0IENRRSBiaW5kaW5ncyAoTGludXggV2FsbGVpaikNCg0KQ2h1bi1IdW5nIFd1ICg1
KToNCiAgWzEvNV0gbW1jOiBjb3JlOiBFeHRlbmQgbW1jX29mX3BhcnNlKCkgdG8gcGFyc2UgQ1FF
IGJpbmRpbmdzDQogIFsyLzVdIG1tYzogaG9zdDogUmVtb3ZlIHJlZHVuZGFudCBDUUUgYmluZGlu
Z3MNCiAgWzMvNV0gbW1jOiBtZWRpYXRlazogcmVmaW5lIG1zZGMgdGltZW91dCBhcGkNCiAgWzQv
NV0gbW1jOiBtZWRpYXRlazogY29tbWFuZCBxdWV1ZSBzdXBwb3J0DQogIFs1LzVdIGR0LWJpbmRp
bmdzOiBtbWM6IG1lZGlhdGVrOiBBZGQgZG9jdW1lbnQgZm9yIG10Njc3OQ0KDQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tdGstc2QudHh0IHwgICAxICsNCiBkcml2ZXJz
L21tYy9jb3JlL2hvc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKw0KIGRyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE1MSArKysrKysr
KysrKysrKysrKysrKystLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktYnJjbXN0Yi5jICAgICAg
ICAgICAgICAgICB8ICAxMSArLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktbXNtLmMgICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArLQ0KIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtYXJhc2Fu
LmMgICAgICAgICAgICAgICB8ICAgMyAtDQogZHJpdmVycy9tbWMvaG9zdC9zZGhjaS10ZWdyYS5j
ICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogNyBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQoNCi0tIA0KMS45LjENCg==
