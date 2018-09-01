From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 10/13] drm/virtio: use simpler
 remove_conflicting_pci_framebuffers()
Date: Sat, 01 Sep 2018 16:08:49 +0200
Message-ID: <25f89daf6217da98a52d41c4ad62a78272bb0cf6.1535810304.git.mirq-linux@rere.qmqm.pl>
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
Cc: linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJtX2J1cy5jIHwgMjQgKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJtX2J1
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2RybV9idXMuYwppbmRleCA3ZGY4
ZDBjOTAyNmEuLjExNWVkNTQ2Y2E0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X2RybV9idXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZHJtX2J1cy5jCkBAIC0yOCwyNiArMjgsNiBAQAogCiAjaW5jbHVkZSAidmlydGdwdV9kcnYuaCIK
IAotc3RhdGljIHZvaWQgdmlydGlvX3BjaV9raWNrX291dF9maXJtd2FyZV9mYihzdHJ1Y3QgcGNp
X2RldiAqcGNpX2RldikKLXsKLQlzdHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYXA7Ci0JYm9vbCBw
cmltYXJ5OwotCi0JYXAgPSBhbGxvY19hcGVydHVyZXMoMSk7Ci0JaWYgKCFhcCkKLQkJcmV0dXJu
OwotCi0JYXAtPnJhbmdlc1swXS5iYXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBjaV9kZXYsIDAp
OwotCWFwLT5yYW5nZXNbMF0uc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4ocGNpX2RldiwgMCk7Ci0K
LQlwcmltYXJ5ID0gcGNpX2Rldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxhZ3MKLQkJ
JiBJT1JFU09VUkNFX1JPTV9TSEFET1c7Ci0KLQlkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGlj
dGluZ19mcmFtZWJ1ZmZlcnMoYXAsICJ2aXJ0aW9kcm1mYiIsIHByaW1hcnkpOwotCi0Ja2ZyZWUo
YXApOwotfQotCiBpbnQgZHJtX3ZpcnRpb19pbml0KHN0cnVjdCBkcm1fZHJpdmVyICpkcml2ZXIs
IHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7
CkBAIC02OSw3ICs0OSw5IEBAIGludCBkcm1fdmlydGlvX2luaXQoc3RydWN0IGRybV9kcml2ZXIg
KmRyaXZlciwgc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCiAJCQkgcG5hbWUpOwogCQlkZXYt
PnBkZXYgPSBwZGV2OwogCQlpZiAodmdhKQotCQkJdmlydGlvX3BjaV9raWNrX291dF9maXJtd2Fy
ZV9mYihwZGV2KTsKKwkJCWRybV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFt
ZWJ1ZmZlcnMocGRldiwKKwkJCQkJCQkJCSAgMCwKKwkJCQkJCQkJCSAgInZpcnRpb2RybWZiIik7
CiAKIAkJc25wcmludGYodW5pcXVlLCBzaXplb2YodW5pcXVlKSwgInBjaTolcyIsIHBuYW1lKTsK
IAkJcmV0ID0gZHJtX2Rldl9zZXRfdW5pcXVlKGRldiwgdW5pcXVlKTsKLS0gCjIuMTguMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
