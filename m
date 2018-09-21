From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 4/5] drm/tegra: dpaux: Add Tegra194 support
Date: Fri, 21 Sep 2018 12:27:45 +0200
Message-ID: <20180921102746.13095-4-thierry.reding@gmail.com>
References: <20180921102746.13095-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180921102746.13095-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUEFVWCBjb250
cm9sbGVyIGZvdW5kIG9uIFRlZ3JhMTk0IGlzIGFsbW9zdCBpZGVudGljYWwgdG8gaXRzCnByZWRl
Y2Vzc29yIGZyb20gVGVncmExODYuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHBhdXguYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jCmluZGV4
IGQ4NGU4MWZmMzZhZC4uYjk2ODE3YjAxMzBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHBhdXguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYwpAQCAtNjM5
LDYgKzYzOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB0ZWdyYV9kcGF1eF9w
bV9vcHMgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZWdyYV9k
cGF1eF9vZl9tYXRjaFtdID0geworCXsgLmNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTk0LWRw
YXV4IiwgfSwKIAl7IC5jb21wYXRpYmxlID0gIm52aWRpYSx0ZWdyYTE4Ni1kcGF1eCIsIH0sCiAJ
eyAuY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmEyMTAtZHBhdXgiLCB9LAogCXsgLmNvbXBhdGli
bGUgPSAibnZpZGlhLHRlZ3JhMTI0LWRwYXV4IiwgfSwKLS0gCjIuMTkuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
