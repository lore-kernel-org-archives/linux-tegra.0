From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 3/6] arm64: tegra: Add VIC on Tegra186
Date: Thu, 17 Aug 2017 21:54:10 +0300
Message-ID: <20170817185413.6324-4-mperttunen@nvidia.com>
References: <20170817185413.6324-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170817185413.6324-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, amerilainen@nvidia.com, linux-tegra@vger.kernel.org, sgurrappadi@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>, digetx@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

QWRkIGEgbm9kZSBmb3IgdGhlIFZpZGVvIEltYWdlIENvbXBvc2l0b3Igb24gdGhlIFRlZ3JhMTg2
LgoKU2lnbmVkLW9mZi1ieTogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVuQG52aWRpYS5jb20+
Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaSB8IDEyICsrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9udmlkaWEvdGVncmExODYuZHRzaQppbmRleCAzNTU2Zjg5ZGRmMWQuLjQ3N2Q3MzNmMjNl
YiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5kdHNpCkBAIC0zNzEsNiAr
MzcxLDE4IEBACiAJCSNzaXplLWNlbGxzID0gPDI+OwogCiAJCXJhbmdlcyA9IDwweDAgMHgxNTAw
MDAwMCAweDAgMHgxNTAwMDAwMCAweDAgMHgwMTAwMDAwMD47CisKKwkJdmljQDE1MzQwMDAwIHsK
KwkJCWNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTg2LXZpYyI7CisJCQlyZWcgPSA8MHgwIDB4
MTUzNDAwMDAgMHgwIDB4NDAwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIwNiBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmYnBtcCBURUdSQTE4Nl9DTEtfVklDPjsK
KwkJCWNsb2NrLW5hbWVzID0gInZpYyI7CisJCQlyZXNldHMgPSA8JmJwbXAgVEVHUkExODZfUkVT
RVRfVklDPjsKKwkJCXJlc2V0LW5hbWVzID0gInZpYyI7CisKKwkJCXBvd2VyLWRvbWFpbnMgPSA8
JmJwbXAgVEVHUkExODZfUE9XRVJfRE9NQUlOX1ZJQz47CisJCX07CiAJfTsKIAogCWdwdUAxNzAw
MDAwMCB7Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
