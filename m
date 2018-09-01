From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 03/13] fbdev: add kerneldoc do
 remove_conflicting_framebuffers()
Date: Sat, 01 Sep 2018 16:08:45 +0200
Message-ID: <283fef19815b991700b56119d8d5874a2a8da44e.1535810304.git.mirq-linux@rere.qmqm.pl>
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

RG9jdW1lbnQgcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycygpIGJlaGF2aW91ci4KClNp
Z25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDEwICsrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpp
bmRleCAwZGYxNDhlYjQ2OTkuLjJkZTkzYjUwMTRlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZibWVtLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMKQEAgLTE3NzUsNiArMTc3NSwxNiBAQCBpbnQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0cnVjdCBm
Yl9pbmZvICpmYl9pbmZvKQogfQogRVhQT1JUX1NZTUJPTCh1bmxpbmtfZnJhbWVidWZmZXIpOwog
CisvKioKKyAqIHJlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMgLSByZW1vdmUgZmlybXdh
cmUtY29uZmlndXJlZCBmcmFtZWJ1ZmZlcnMKKyAqIEBhOiBtZW1vcnkgcmFuZ2UsIHVzZXJzIG9m
IHdoaWNoIGFyZSB0byBiZSByZW1vdmVkCisgKiBAbmFtZTogcmVxdWVzdGluZyBkcml2ZXIgbmFt
ZQorICogQHByaW1hcnk6IGFsc28ga2ljayB2Z2ExNmZiIGlmIHByZXNlbnQKKyAqCisgKiBUaGlz
IGZ1bmN0aW9uIHJlbW92ZXMgZnJhbWVidWZmZXIgZGV2aWNlcyAoaW5pdGlhbGl6ZWQgYnkgZmly
bXdhcmUvYm9vdGxvYWRlcikKKyAqIHdoaWNoIHVzZSBtZW1vcnkgcmFuZ2UgZGVzY3JpYmVkIGJ5
IEBhLiBJZiBAYSBpcyBOVUxMIGFsbCBzdWNoIGRldmljZXMgYXJlCisgKiByZW1vdmVkLgorICov
CiBpbnQgcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgYXBlcnR1cmVzX3N0
cnVjdCAqYSwKIAkJCQkgICAgY29uc3QgY2hhciAqbmFtZSwgYm9vbCBwcmltYXJ5KQogewotLSAK
Mi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
