From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 06/12] drm/cirrus: use simpler
 remove_conflicting_pci_framebuffers()
Date: Thu, 30 Aug 2018 23:00:07 +0200
Message-ID: <8a330a00dad89889550ff9fb7d7309d58d64181c.1535656077.git.mirq-linux@rere.qmqm.pl>
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
cml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1c19kcnYuYyB8IDIzICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2NpcnJ1cy9jaXJydXNfZHJ2LmMKaW5kZXggNjljNGUzNTJkZDc4Li44NWVkODY1
N2M4NjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzX2Rydi5jCkBAIC00MiwzMyArNDIsMTIg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewogfTsK
IAogCi1zdGF0aWMgaW50IGNpcnJ1c19raWNrX291dF9maXJtd2FyZV9mYihzdHJ1Y3QgcGNpX2Rl
diAqcGRldikKLXsKLQlzdHJ1Y3QgYXBlcnR1cmVzX3N0cnVjdCAqYXA7Ci0JYm9vbCBwcmltYXJ5
ID0gZmFsc2U7Ci0KLQlhcCA9IGFsbG9jX2FwZXJ0dXJlcygxKTsKLQlpZiAoIWFwKQotCQlyZXR1
cm4gLUVOT01FTTsKLQotCWFwLT5yYW5nZXNbMF0uYmFzZSA9IHBjaV9yZXNvdXJjZV9zdGFydChw
ZGV2LCAwKTsKLQlhcC0+cmFuZ2VzWzBdLnNpemUgPSBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDAp
OwotCi0jaWZkZWYgQ09ORklHX1g4NgotCXByaW1hcnkgPSBwZGV2LT5yZXNvdXJjZVtQQ0lfUk9N
X1JFU09VUkNFXS5mbGFncyAmIElPUkVTT1VSQ0VfUk9NX1NIQURPVzsKLSNlbmRpZgotCWRybV9m
Yl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhhcCwgImNpcnJ1c2RybWZi
IiwgcHJpbWFyeSk7Ci0Ja2ZyZWUoYXApOwotCi0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBpbnQg
Y2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJCSAgICBjb25zdCBzdHJ1
Y3QgcGNpX2RldmljZV9pZCAqZW50KQogewogCWludCByZXQ7CiAKLQlyZXQgPSBjaXJydXNfa2lj
a19vdXRfZmlybXdhcmVfZmIocGRldik7CisJcmV0ID0gZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29u
ZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycyhwZGV2LCAwLCAiY2lycnVzZHJtZmIiKTsKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjE4LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
