From: Arto Merilainen <amerilainen@nvidia.com>
Subject: [PATCH 4/4] ARM: tegra: Add VIC for Tegra124
Date: Thu, 21 May 2015 16:20:25 +0300
Message-ID: <1432214425-27137-5-git-send-email-amerilainen@nvidia.com>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com
Cc: achew@nvidia.com, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, srasal@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIFZJQyBkZXZpY2UgdHJlZSBub2RlIGZvciBWaWRlbyBJbWFnZSBDb21w
b3NpdG9yLgoKU2lnbmVkLW9mZi1ieTogQXJ0byBNZXJpbGFpbmVuIDxhbWVyaWxhaW5lbkBudmlk
aWEuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3RlZ3JhMTI0LmR0c2kgfCAxMSArKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmExMjQu
ZHRzaQppbmRleCAxM2NjN2NhNWUwMzEuLjYyNjM1NTY5M2E0MSAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvdGVncmExMjQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTEy
NC5kdHNpCkBAIC0xMzYsNiArMTM2LDE3IEBACiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCQl9
OwogCisJCXZpY0A1NDM0MDAwMCB7CisJCQljb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTEyNC12
aWMiOworCQkJcmVnID0gPDB4MCAweDU0MzQwMDAwIDB4MCAweDAwMDQwMDAwPjsKKwkJCWNsb2Nr
cyA9IDwmdGVncmFfY2FyIFRFR1JBMTI0X0NMS19WSUMwMz47CisJCQljbG9jay1uYW1lcyA9ICJ2
aWMwMyI7CisJCQlyZXNldHMgPSA8JnRlZ3JhX2NhciBURUdSQTEyNF9DTEtfVklDMDM+OworCQkJ
cmVzZXQtbmFtZXMgPSAidmljMDMiOworCisJCQlpb21tdXMgPSA8Jm1jIFRFR1JBX1NXR1JPVVBf
VklDPjsKKwkJfTsKKwogCQlzb3JAMCw1NDU0MDAwMCB7CiAJCQljb21wYXRpYmxlID0gIm52aWRp
YSx0ZWdyYTEyNC1zb3IiOwogCQkJcmVnID0gPDB4MCAweDU0NTQwMDAwIDB4MCAweDAwMDQwMDAw
PjsKLS0gCjEuOC4xLjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
