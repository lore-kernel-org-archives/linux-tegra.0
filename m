From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 05/12] drm/bochs: use simpler
 remove_conflicting_pci_framebuffers()
Date: Thu, 30 Aug 2018 23:00:07 +0200
Message-ID: <a290d295c473ebe7c9c78dd02133d8bfbb99504c.1535656077.git.mirq-linux@rere.qmqm.pl>
References: <cover.1535656077.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1535656077.git.mirq-linux@rere.qmqm.pl>
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
Cc: linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJt
L2JvY2hzL2JvY2hzX2Rydi5jCmluZGV4IDdiMjAzMTg0ODNlNC4uYzYxYjQwYzcyYjYyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jCkBAIC0xNDMsMjIgKzE0Myw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZGV2X3BtX29wcyBib2Noc19wbV9vcHMgPSB7CiAvKiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICov
CiAvKiBwY2kgaW50ZXJmYWNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICovCiAKLXN0YXRpYyBpbnQgYm9jaHNfa2lja19vdXRfZmlybXdh
cmVfZmIoc3RydWN0IHBjaV9kZXYgKnBkZXYpCi17Ci0Jc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3Qg
KmFwOwotCi0JYXAgPSBhbGxvY19hcGVydHVyZXMoMSk7Ci0JaWYgKCFhcCkKLQkJcmV0dXJuIC1F
Tk9NRU07Ci0KLQlhcC0+cmFuZ2VzWzBdLmJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwg
MCk7Ci0JYXAtPnJhbmdlc1swXS5zaXplID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKTsKLQlk
cm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoYXAsICJib2Noc2Ry
bWZiIiwgZmFsc2UpOwotCWtmcmVlKGFwKTsKLQotCXJldHVybiAwOwotfQotCiBzdGF0aWMgaW50
IGJvY2hzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJCSAgIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkICplbnQpCiB7CkBAIC0xNzEsNyArMTU1LDcgQEAgc3RhdGljIGludCBi
b2Noc19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJCXJldHVybiAtRU5PTUVNOwog
CX0KIAotCXJldCA9IGJvY2hzX2tpY2tfb3V0X2Zpcm13YXJlX2ZiKHBkZXYpOworCXJldCA9IGRy
bV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMocGRldiwgMCwg
ImJvY2hzZHJtZmIiKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE4LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0t
a2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsCg==
