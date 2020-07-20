From: Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 1/4] mmc: mediatek: add MT6779 MMC driver support
Date: Mon, 20 Jul 2020 08:42:36 +0800
Message-ID: <1595205759-5825-2-git-send-email-chun-hung.wu@mediatek.com>
References: <1595205759-5825-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: base64
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595205759-5825-1-git-send-email-chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martin
Cc: kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chun-Hung Wu <chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

QWRkIG5ldyBjb2RlIHRvIHN1cHBvcnQgTVQ2Nzc5IG1tYyBkcml2ZXIuDQoNClNpZ25lZC1vZmYt
Ynk6IENodW4tSHVuZyBXdSA8Y2h1bi1odW5nLnd1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvbW1jL2hvc3QvbXRrLXNkLmMgfCAxMyArKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNk
LmMgYi9kcml2ZXJzL21tYy9ob3N0L210ay1zZC5jDQppbmRleCAzOWU3ZmM1Li5lZDM3YTNjIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYw0KKysrIGIvZHJpdmVycy9tbWMv
aG9zdC9tdGstc2QuYw0KQEAgLTUzOCw2ICs1MzgsMTggQEAgc3RydWN0IG1zZGNfaG9zdCB7DQog
CS51c2VfaW50ZXJuYWxfY2QgPSB0cnVlLA0KIH07DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfbW1jX2NvbXBhdGlibGUgbXQ2Nzc5X2NvbXBhdCA9IHsNCisJLmNsa19kaXZfYml0cyA9IDEy
LA0KKwkuaHM0MDBfdHVuZSA9IGZhbHNlLA0KKwkucGFkX3R1bmVfcmVnID0gTVNEQ19QQURfVFVO
RTAsDQorCS5hc3luY19maWZvID0gdHJ1ZSwNCisJLmRhdGFfdHVuZSA9IHRydWUsDQorCS5idXN5
X2NoZWNrID0gdHJ1ZSwNCisJLnN0b3BfY2xrX2ZpeCA9IHRydWUsDQorCS5lbmhhbmNlX3J4ID0g
dHJ1ZSwNCisJLnN1cHBvcnRfNjRnID0gdHJ1ZSwNCit9Ow0KKw0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG1zZGNfb2ZfaWRzW10gPSB7DQogCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTM1LW1tYyIsIC5kYXRhID0gJm10ODEzNV9jb21wYXR9LA0KIAl7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE3My1tbWMiLCAuZGF0YSA9ICZtdDgxNzNfY29tcGF0fSwNCkBA
IC01NDcsNiArNTU5LDcgQEAgc3RydWN0IG1zZGNfaG9zdCB7DQogCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ3NjIyLW1tYyIsIC5kYXRhID0gJm10NzYyMl9jb21wYXR9LA0KIAl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODUxNi1tbWMiLCAuZGF0YSA9ICZtdDg1MTZfY29tcGF0fSwN
CiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjAtbW1jIiwgLmRhdGEgPSAmbXQ3NjIw
X2NvbXBhdH0sDQorCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Nzc5LW1tYyIsIC5kYXRh
ID0gJm10Njc3OV9jb21wYXR9LA0KIAl7fQ0KIH07DQogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bXNkY19vZl9pZHMpOw0KLS0gDQoxLjkuMQ0K
