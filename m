From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm/tegra: remove unused variable
Date: Tue,  9 Feb 2016 13:28:15 +0100
Message-ID: <1455020923-1089878-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?q?Terje=20Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Daniel Stone <daniels@collabora.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

QSBuZXdseSBtZXJnZWQgcGF0Y2ggcmVtb3ZlZCB0aGUgb25seSB1c2VyIG9mIHRoaXMgdmFyaWFi
bGUsCmxlYWRpbmcgdG8gYSBoYXJtbGVzcyBnY2Mgd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYzogSW4gZnVuY3Rpb24gJ3RlZ3JhX2RybV9wcmVjbG9zZSc6CmRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYzo4NjE6MTk6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUgJ2NydGMnIFst
V2Vycm9yPXVudXNlZC12YXJpYWJsZV0KClRoaXMgcmVtb3ZlcyB0aGUgdmFyaWFibGUgYXMgd2Vs
bC4KCkNjOiBUZXJqZSBCZXJnc3Ryw7ZtIDx0YmVyZ3N0cm9tQG52aWRpYS5jb20+CkNjOiBEYW5p
ZWwgU3RvbmUgPGRhbmllbHNAY29sbGFib3JhLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5j
b20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KRml4ZXM6IDA0
MTdkNDI0YWMwZCAoImRybS90ZWdyYTogU3RvcCBjYW5jZWxsaW5nIHBhZ2UgZmxpcCBldmVudHMi
KQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHJtLmMKaW5kZXggMDIxZDBlMTM5OGZiLi44ZTZiMThjYWE3MDYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHJtLmMKQEAgLTg1OCw3ICs4NTgsNiBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9kcm1fcHJl
Y2xvc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IGRybV9maWxlICpmaWxlKQogewog
CXN0cnVjdCB0ZWdyYV9kcm1fZmlsZSAqZnByaXYgPSBmaWxlLT5kcml2ZXJfcHJpdjsKIAlzdHJ1
Y3QgdGVncmFfZHJtX2NvbnRleHQgKmNvbnRleHQsICp0bXA7Ci0Jc3RydWN0IGRybV9jcnRjICpj
cnRjOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGNvbnRleHQsIHRtcCwgJmZwcml2LT5j
b250ZXh0cywgbGlzdCkKIAkJdGVncmFfZHJtX2NvbnRleHRfZnJlZShjb250ZXh0KTsKLS0gCjIu
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
