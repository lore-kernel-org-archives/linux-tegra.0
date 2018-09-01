From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 05/13] drm/amdgpu: use simpler
 remove_conflicting_pci_framebuffers()
Date: Sat, 01 Sep 2018 16:08:46 +0200
Message-ID: <fe59ab587ef4ef799b525fcc03d87800c5dc26d9.1535810304.git.mirq-linux@rere.qmqm.pl>
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
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyNCArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDBiMTk0ODJiMzZiOC4u
OWI2ZTAzNzcxOWRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBA
IC01NjAsMjggKzU2MCw2IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBwY2lpZGxpc3QpOwog
CiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlcjsKIAotc3RhdGljIGludCBhbWRn
cHVfa2lja19vdXRfZmlybXdhcmVfZmIoc3RydWN0IHBjaV9kZXYgKnBkZXYpCi17Ci0Jc3RydWN0
IGFwZXJ0dXJlc19zdHJ1Y3QgKmFwOwotCWJvb2wgcHJpbWFyeSA9IGZhbHNlOwotCi0JYXAgPSBh
bGxvY19hcGVydHVyZXMoMSk7Ci0JaWYgKCFhcCkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlhcC0+
cmFuZ2VzWzBdLmJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCk7Ci0JYXAtPnJhbmdl
c1swXS5zaXplID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKTsKLQotI2lmZGVmIENPTkZJR19Y
ODYKLQlwcmltYXJ5ID0gcGRldi0+cmVzb3VyY2VbUENJX1JPTV9SRVNPVVJDRV0uZmxhZ3MgJiBJ
T1JFU09VUkNFX1JPTV9TSEFET1c7Ci0jZW5kaWYKLQlkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25m
bGljdGluZ19mcmFtZWJ1ZmZlcnMoYXAsICJhbWRncHVkcm1mYiIsIHByaW1hcnkpOwotCWtmcmVl
KGFwKTsKLQotCXJldHVybiAwOwotfQotCi0KIHN0YXRpYyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJCSAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
ZW50KQogewpAQCAtNjA5LDcgKzU4Nyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJcmV0dXJuIHJldDsKIAogCS8qIEdldCByaWQgb2YgdGhp
bmdzIGxpa2Ugb2ZmYiAqLwotCXJldCA9IGFtZGdwdV9raWNrX291dF9maXJtd2FyZV9mYihwZGV2
KTsKKwlyZXQgPSBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZm
ZXJzKHBkZXYsIDAsICJhbWRncHVkcm1mYiIpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAK
LS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
