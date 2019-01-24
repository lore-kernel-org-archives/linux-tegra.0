From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 22/26] drm/qxl: Use drm_fb_helper_fill_info
Date: Thu, 24 Jan 2019 17:58:27 +0100
Message-ID: <20190124165831.16427-23-daniel.vetter@ffwll.ch>
References: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190124165831.16427-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>
List-Id: linux-tegra@vger.kernel.org

QW5vdGhlciBkcml2ZXIgdGhhdCBkaWRuJ3Qgc2V0IGZiaW5mby0+Zml4LmlkIGJlZm9yZS4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IEpvbmF0aGFuIEh1
bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+CkNjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5v
cmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZmIuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMKaW5kZXggNWVl
NDhhNmJiM2FkLi44MjM0OGRkZDBiODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jCkBAIC0yNTUsMTIgKzI1NSwx
MCBAQCBzdGF0aWMgaW50IHRlZ3JhX2ZiZGV2X3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpo
ZWxwZXIsCiAJaGVscGVyLT5mYiA9IGZiOwogCWhlbHBlci0+ZmJkZXYgPSBpbmZvOwogCi0JaW5m
by0+cGFyID0gaGVscGVyOwogCWluZm8tPmZsYWdzID0gRkJJTkZPX0ZMQUdfREVGQVVMVDsKIAlp
bmZvLT5mYm9wcyA9ICZ0ZWdyYV9mYl9vcHM7CiAKLQlkcm1fZmJfaGVscGVyX2ZpbGxfZml4KGlu
Zm8sIGZiLT5waXRjaGVzWzBdLCBmYi0+Zm9ybWF0LT5kZXB0aCk7Ci0JZHJtX2ZiX2hlbHBlcl9m
aWxsX3ZhcihpbmZvLCBoZWxwZXIsIGZiLT53aWR0aCwgZmItPmhlaWdodCk7CisJZHJtX2ZiX2hl
bHBlcl9maWxsX2luZm8oaW5mbywgaGVscGVyKTsKIAogCW9mZnNldCA9IGluZm8tPnZhci54b2Zm
c2V0ICogYnl0ZXNfcGVyX3BpeGVsICsKIAkJIGluZm8tPnZhci55b2Zmc2V0ICogZmItPnBpdGNo
ZXNbMF07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
