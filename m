From: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 1/4] mmc: mediatek: add MT6779 MMC driver support
Date: Tue, 9 Jun 2020 09:18:19 +0800
Message-ID: <1591665502-6573-2-git-send-email-chun-hung.wu@mediatek.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1591665502-6573-1-git-send-email-chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martin
Cc: kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

TVQ2Nzc5IGFkZCBjcWhjaSBzdXBwb3J0LCBzbyBuZWVkIHRvIGFkZCBuZXcgY29kZQ0KdG8gc3Vw
cG9ydCBpdC4NCg0KU2lnbmVkLW9mZi1ieTogQ2h1bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVk
aWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyB8IDEzICsrKysrKysr
KysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMNCmlu
ZGV4IGIyMjFjMDIuLjhhZGE2NzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21tYy9ob3N0L210ay1z
ZC5jDQorKysgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQpAQCAtNTM4LDYgKzUzOCwxOCBA
QCBzdHJ1Y3QgbXNkY19ob3N0IHsNCiAJLnVzZV9pbnRlcm5hbF9jZCA9IHRydWUsDQogfTsNCiAN
CitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19tbWNfY29tcGF0aWJsZSBtdDY3NzlfY29tcGF0ID0g
ew0KKwkuY2xrX2Rpdl9iaXRzID0gMTIsDQorCS5oczQwMF90dW5lID0gZmFsc2UsDQorCS5wYWRf
dHVuZV9yZWcgPSBNU0RDX1BBRF9UVU5FMCwNCisJLmFzeW5jX2ZpZm8gPSB0cnVlLA0KKwkuZGF0
YV90dW5lID0gdHJ1ZSwNCisJLmJ1c3lfY2hlY2sgPSB0cnVlLA0KKwkuc3RvcF9jbGtfZml4ID0g
dHJ1ZSwNCisJLmVuaGFuY2VfcnggPSB0cnVlLA0KKwkuc3VwcG9ydF82NGcgPSB0cnVlLA0KK307
DQorDQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXNkY19vZl9pZHNbXSA9IHsN
CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxMzUtbW1jIiwgLmRhdGEgPSAmbXQ4MTM1
X2NvbXBhdH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLW1tYyIsIC5kYXRh
ID0gJm10ODE3M19jb21wYXR9LA0KQEAgLTU0Nyw2ICs1NTksNyBAQCBzdHJ1Y3QgbXNkY19ob3N0
IHsNCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjItbW1jIiwgLmRhdGEgPSAmbXQ3
NjIyX2NvbXBhdH0sDQogCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4NTE2LW1tYyIsIC5k
YXRhID0gJm10ODUxNl9jb21wYXR9LA0KIAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYy
MC1tbWMiLCAuZGF0YSA9ICZtdDc2MjBfY29tcGF0fSwNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDY3NzktbW1jIiwgLmRhdGEgPSAmbXQ2Nzc5X2NvbXBhdH0sDQogCXt9DQogfTsNCiBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtc2RjX29mX2lkcyk7DQotLSANCjEuOS4xDQo=
