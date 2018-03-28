From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] drm/tegra: dc: Using NULL instead of plain integer
Date: Wed, 28 Mar 2018 12:52:10 +0000
Message-ID: <1522241530-77833-1-git-send-email-weiyongjun1@huawei.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZ3M6Cgpkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYzoyMTgxOjY5OiB3YXJuaW5nOgogIFVzaW5nIHBsYWluIGludGVnZXIgYXMgTlVMTCBw
b2ludGVyCgpTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKaW5kZXggNjE2Yzk2
My4uOTEwMTI1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKQEAgLTIxNzgsNyArMjE3OCw3IEBAIHN0YXRpYyBp
bnQgdGVncmFfZGNfY291cGxlKHN0cnVjdCB0ZWdyYV9kYyAqZGMpCiAJCXN0cnVjdCBkZXZpY2Vf
bGluayAqbGluazsKIAkJc3RydWN0IGRldmljZSAqcGFydG5lcjsKIAotCQlwYXJ0bmVyID0gZHJp
dmVyX2ZpbmRfZGV2aWNlKGRjLT5kZXYtPmRyaXZlciwgTlVMTCwgMCwKKwkJcGFydG5lciA9IGRy
aXZlcl9maW5kX2RldmljZShkYy0+ZGV2LT5kcml2ZXIsIE5VTEwsIE5VTEwsCiAJCQkJCSAgICAg
dGVncmFfZGNfbWF0Y2hfYnlfcGlwZSk7CiAJCWlmICghcGFydG5lcikKIAkJCXJldHVybiAtRVBS
T0JFX0RFRkVSOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
