From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 3/6] arm64: tegra: Add VIC on Tegra186
Date: Tue,  5 Sep 2017 11:43:03 +0300
Message-ID: <20170905084306.19318-4-mperttunen@nvidia.com>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170905084306.19318-1-mperttunen@nvidia.com>
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
Ci0tLQp2MjoKLSBGaXhlZCByZWcgcHJvcGVydHkgaW4gYWNjb3JkYW5jZSB3aXRoIGNoYW5nZWQg
cGFyZW50IGNlbGxzLgoKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kg
fCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kKaW5kZXggYjFhM2U0MDRjN2JlLi41
ODRiY2U2NGQ0MWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3Jh
MTg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaQpA
QCAtMzcxLDYgKzM3MSwxOCBAQAogCQkjc2l6ZS1jZWxscyA9IDwxPjsKIAogCQlyYW5nZXMgPSA8
MHgxNTAwMDAwMCAweDAgMHgxNTAwMDAwMCAweDAxMDAwMDAwPjsKKworCQl2aWNAMTUzNDAwMDAg
eworCQkJY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExODYtdmljIjsKKwkJCXJlZyA9IDwweDE1
MzQwMDAwIDB4NDAwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIwNiBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmYnBtcCBURUdSQTE4Nl9DTEtfVklDPjsKKwkJCWNs
b2NrLW5hbWVzID0gInZpYyI7CisJCQlyZXNldHMgPSA8JmJwbXAgVEVHUkExODZfUkVTRVRfVklD
PjsKKwkJCXJlc2V0LW5hbWVzID0gInZpYyI7CisKKwkJCXBvd2VyLWRvbWFpbnMgPSA8JmJwbXAg
VEVHUkExODZfUE9XRVJfRE9NQUlOX1ZJQz47CisJCX07CiAJfTsKIAogCWdwdUAxNzAwMDAwMCB7
Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
