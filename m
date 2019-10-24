From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 26/32] drm/tegra: sor: Support DisplayPort on Tegra194
Date: Thu, 24 Oct 2019 18:45:28 +0200
Message-ID: <20191024164534.132764-27-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJldXNlIHBhcmFtZXRl
cnMgZnJvbSBlYXJsaWVyIGdlbmVyYXRpb25zIHRvIHN1cHBvcnQgRGlzcGxheVBvcnQgb24KVGVn
cmExOTQuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggYWYyMzRkNWVmYmQ3Li5m
ZGJkNzZlYzFjZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTM3MjcsNiArMzcyNywxMSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3Nvcl9zb2MgdGVncmExOTRfc29yID0gewogCS5zZXR0aW5n
cyA9IHRlZ3JhMTk0X3Nvcl9oZG1pX2RlZmF1bHRzLAogCiAJLnhiYXJfY2ZnID0gdGVncmEyMTBf
c29yX3hiYXJfY2ZnLAorCS5sYW5lX21hcCA9IHRlZ3JhMTI0X3Nvcl9sYW5lX21hcCwKKwkudm9s
dGFnZV9zd2luZyA9IHRlZ3JhMTg2X3Nvcl92b2x0YWdlX3N3aW5nLAorCS5wcmVfZW1waGFzaXMg
PSB0ZWdyYTE4Nl9zb3JfcHJlX2VtcGhhc2lzLAorCS5wb3N0X2N1cnNvciA9IHRlZ3JhMTI0X3Nv
cl9wb3N0X2N1cnNvciwKKwkudHhfcHUgPSB0ZWdyYTEyNF9zb3JfdHhfcHUsCiB9OwogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZWdyYV9zb3Jfb2ZfbWF0Y2hbXSA9IHsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
