From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 11/13] drm/vc4: use simpler
 remove_conflicting_framebuffers(NULL)
Date: Sat, 01 Sep 2018 16:08:50 +0200
Message-ID: <be7e6396e6e7159695a5bccc109c6ab49a51e0d8.1535810304.git.mirq-linux@rere.qmqm.pl>
References: <cover.1535810304.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1535810304.git.mirq-linux@rere.qmqm.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@bootlin.com>, virtualization@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

VXNlIHJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoTlVMTCkgaW5zdGVhZCBvZiBvcGVu
LWNvZGluZyBpdC4KClNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4
QHJlcmUucW1xbS5wbD4KQWNrZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkFj
a2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jIHwgMjAgKy0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
cnYuYwppbmRleCA5NGI5OWM5MDQyNWEuLjk2YmI5MDMyNTk5NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2
LmMKQEAgLTI0NiwyNCArMjQ2LDYgQEAgc3RhdGljIHZvaWQgdmM0X21hdGNoX2FkZF9kcml2ZXJz
KHN0cnVjdCBkZXZpY2UgKmRldiwKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIHZjNF9raWNrX291dF9m
aXJtd2FyZV9mYih2b2lkKQotewotCXN0cnVjdCBhcGVydHVyZXNfc3RydWN0ICphcDsKLQotCWFw
ID0gYWxsb2NfYXBlcnR1cmVzKDEpOwotCWlmICghYXApCi0JCXJldHVybjsKLQotCS8qIFNpbmNl
IFZDNCBpcyBhIFVNQSBkZXZpY2UsIHRoZSBzaW1wbGVmYiBub2RlIG1heSBoYXZlIGJlZW4KLQkg
KiBsb2NhdGVkIGFueXdoZXJlIGluIG1lbW9yeS4KLQkgKi8KLQlhcC0+cmFuZ2VzWzBdLmJhc2Ug
PSAwOwotCWFwLT5yYW5nZXNbMF0uc2l6ZSA9IH4wOwotCi0JZHJtX2ZiX2hlbHBlcl9yZW1vdmVf
Y29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKGFwLCAidmM0ZHJtZmIiLCBmYWxzZSk7Ci0Ja2ZyZWUo
YXApOwotfQotCiBzdGF0aWMgaW50IHZjNF9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7
CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkZXYp
OwpAQCAtMjk2LDcgKzI3OCw3IEBAIHN0YXRpYyBpbnQgdmM0X2RybV9iaW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKIAlpZiAocmV0KQogCQlnb3RvIGdlbV9kZXN0cm95OwogCi0JdmM0X2tpY2tfb3V0
X2Zpcm13YXJlX2ZiKCk7CisJZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVi
dWZmZXJzKE5VTEwsICJ2YzRkcm1mYiIsIGZhbHNlKTsKIAogCXJldCA9IGRybV9kZXZfcmVnaXN0
ZXIoZHJtLCAwKTsKIAlpZiAocmV0IDwgMCkKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBs
aXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
