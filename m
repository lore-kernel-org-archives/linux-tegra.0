From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 13/13] drm/tegra: kick out simplefb
Date: Sat, 01 Sep 2018 16:08:51 +0200
Message-ID: <b5c3972e5774d0d1f8887054a993bbc54e9dbe2a.1535810304.git.mirq-linux@rere.qmqm.pl>
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
Cc: linux-fbdev@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, linux-tegra@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Maxime Ripard <maxime.ripard@bootlin.com>, virtualization@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

S2ljayBvdXQgZmlybXdhcmUgZmIgd2hlbiBsb2FkaW5nIFRlZ3JhIGRyaXZlci4KClNpZ25lZC1v
ZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KQWNrZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RybS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2RybS5jCmluZGV4IDdhZmUyZjYzNWY3NC4uYjUxZWMxMzhmZWQyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2RybS5jCkBAIC0xMjAzLDYgKzEyMDMsMTAgQEAgc3RhdGljIGludCBob3N0MXhfZHJt
X3Byb2JlKHN0cnVjdCBob3N0MXhfZGV2aWNlICpkZXYpCiAKIAlkZXZfc2V0X2RydmRhdGEoJmRl
di0+ZGV2LCBkcm0pOwogCisJZXJyID0gZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3Rpbmdf
ZnJhbWVidWZmZXJzKE5VTEwsICJ0ZWdyYWRybWZiIiwgZmFsc2UpOworCWlmIChlcnIgPCAwKQor
CQlnb3RvIHVucmVmOworCiAJZXJyID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOwogCWlmIChl
cnIgPCAwKQogCQlnb3RvIHVucmVmOwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
