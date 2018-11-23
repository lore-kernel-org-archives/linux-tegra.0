From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 6/7] arm64: tegra: Add VIC support on Tegra194
Date: Fri, 23 Nov 2018 13:31:37 +0100
Message-ID: <20181123123138.20739-6-thierry.reding@gmail.com>
References: <20181123123138.20739-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181123123138.20739-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRlZ3JhMTk0IGhhcyBh
IHZlcnNpb24gb2YgVklDIHRoYXQgaXMgdmVyeSBzaW1pbGFyIHRvIHRoYXQgb24gVGVncmExODYu
CkFkZCB0aGUgZGV2aWNlIHRyZWUgbm9kZSBmb3IgaXQgdGhhdCBpcyBlbmFibGVkIGJ5IGRlZmF1
bHQuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTk0LmR0c2kgfCAxMiArKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExOTQuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbnZpZGlhL3RlZ3JhMTk0LmR0c2kKaW5kZXggY2U3NDgxY2I5ZTViLi4xOWNmZGRhZWE2OTcg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTk0LmR0c2kKKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExOTQuZHRzaQpAQCAtMTM3LDYgKzEz
NywxOCBAQAogCQkJCX07CiAJCQl9OwogCisJCQl2aWNAMTUzNDAwMDAgeworCQkJCWNvbXBhdGli
bGUgPSAibnZpZGlhLHRlZ3JhMTk0LXZpYyI7CisJCQkJcmVnID0gPDB4MTUzNDAwMDAgMHgwMDA0
MDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIwNiBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKKwkJCQljbG9ja3MgPSA8JmJwbXAgVEVHUkExOTRfQ0xLX1ZJQz47CisJCQkJY2xvY2stbmFt
ZXMgPSAidmljIjsKKwkJCQlyZXNldHMgPSA8JmJwbXAgVEVHUkExOTRfUkVTRVRfVklDPjsKKwkJ
CQlyZXNldC1uYW1lcyA9ICJ2aWMiOworCisJCQkJcG93ZXItZG9tYWlucyA9IDwmYnBtcCBURUdS
QTE5NF9QT1dFUl9ET01BSU5fVklDPjsKKwkJCX07CisKIAkJCWRwYXV4MDogZHBhdXhAMTU1YzAw
MDAgewogCQkJCWNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTk0LWRwYXV4IjsKIAkJCQlyZWcg
PSA8MHgxNTVjMDAwMCAweDEwMDAwPjsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
