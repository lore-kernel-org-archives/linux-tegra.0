From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 09/13] drm/radeon: use simpler
 remove_conflicting_pci_framebuffers()
Date: Sat, 01 Sep 2018 16:08:48 +0200
Message-ID: <b61a2e458b6a2964039693d724cc75b4fcfb3ddb.1535810304.git.mirq-linux@rere.qmqm.pl>
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

U2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBs
PgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpBY2tl
ZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyB8IDIzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXggYjI4Mjg4YTc4MWVmLi4zNmM5OGEwZWM5OTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0zMTEsMjcgKzMxMSw2IEBAIHN0
YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrbXNfZHJpdmVyOwogCiBib29sIHJhZGVvbl9kZXZpY2Vf
aXNfdmlydHVhbCh2b2lkKTsKIAotc3RhdGljIGludCByYWRlb25fa2lja19vdXRfZmlybXdhcmVf
ZmIoc3RydWN0IHBjaV9kZXYgKnBkZXYpCi17Ci0Jc3RydWN0IGFwZXJ0dXJlc19zdHJ1Y3QgKmFw
OwotCWJvb2wgcHJpbWFyeSA9IGZhbHNlOwotCi0JYXAgPSBhbGxvY19hcGVydHVyZXMoMSk7Ci0J
aWYgKCFhcCkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlhcC0+cmFuZ2VzWzBdLmJhc2UgPSBwY2lf
cmVzb3VyY2Vfc3RhcnQocGRldiwgMCk7Ci0JYXAtPnJhbmdlc1swXS5zaXplID0gcGNpX3Jlc291
cmNlX2xlbihwZGV2LCAwKTsKLQotI2lmZGVmIENPTkZJR19YODYKLQlwcmltYXJ5ID0gcGRldi0+
cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxhZ3MgJiBJT1JFU09VUkNFX1JPTV9TSEFET1c7
Ci0jZW5kaWYKLQlkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMo
YXAsICJyYWRlb25kcm1mYiIsIHByaW1hcnkpOwotCWtmcmVlKGFwKTsKLQotCXJldHVybiAwOwot
fQotCiBzdGF0aWMgaW50IHJhZGVvbl9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJ
CQkgICAgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIHsKQEAgLTM0MSw3ICszMjAs
NyBAQCBzdGF0aWMgaW50IHJhZGVvbl9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJ
CXJldHVybiAtRVBST0JFX0RFRkVSOwogCiAJLyogR2V0IHJpZCBvZiB0aGluZ3MgbGlrZSBvZmZi
ICovCi0JcmV0ID0gcmFkZW9uX2tpY2tfb3V0X2Zpcm13YXJlX2ZiKHBkZXYpOworCXJldCA9IGRy
bV9mYl9oZWxwZXJfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMocGRldiwgMCwg
InJhZGVvbmRybWZiIik7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotLSAKMi4xOC4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
