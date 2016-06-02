From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 07/20] drm: mediatek: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:34 +0200
Message-ID: <1464877907-27723-8-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Stefan Agner <stefan@agner.ch>, virtualization@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexey Brodkin <abrodkin@synopsys.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.>
List-Id: linux-tegra@vger.kernel.org

V2UgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFuZCBlbmNvZGVy
cyBhbmQgdGhlCmRyaXZlciBpcyByZWx5aW5nIG9uIHRoZSBhdG9taWMgaGVscGVyczogd2UgY2Fu
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGltcGxlbWVudGF0aW9uIGFuZCBsZXQg
dGhlIGNvcmUgY2FsbApkcm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKSBmb3IgdXMuCgpT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0
cm9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDkgLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwppbmRleCAyZDgwOGU1Li43MzQzZmZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKQEAgLTU3NSwxNCArNTc1LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlyZXR1cm4gZHJt
X3BhbmVsX2dldF9tb2Rlcyhkc2ktPnBhbmVsKTsKIH0KIAotc3RhdGljIHN0cnVjdCBkcm1fZW5j
b2RlciAqbXRrX2RzaV9jb25uZWN0b3JfYmVzdF9lbmNvZGVyKAotCQlzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQotewotCXN0cnVjdCBtdGtfZHNpICpkc2kgPSBjb25uZWN0b3JfdG9f
ZHNpKGNvbm5lY3Rvcik7Ci0KLQlyZXR1cm4gJmRzaS0+ZW5jb2RlcjsKLX0KLQogc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgbXRrX2RzaV9lbmNvZGVyX2hlbHBl
cl9mdW5jcyA9IHsKIAkubW9kZV9maXh1cCA9IG10a19kc2lfZW5jb2Rlcl9tb2RlX2ZpeHVwLAog
CS5tb2RlX3NldCA9IG10a19kc2lfZW5jb2Rlcl9tb2RlX3NldCwKQEAgLTYwMyw3ICs1OTUsNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgbXRrX2RzaV9jb25uZWN0
b3JfZnVuY3MgPSB7CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzCiAJbXRrX2RzaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9kZXMgPSBt
dGtfZHNpX2Nvbm5lY3Rvcl9nZXRfbW9kZXMsCi0JLmJlc3RfZW5jb2RlciA9IG10a19kc2lfY29u
bmVjdG9yX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBpbnQgbXRrX2RybV9hdHRhY2hfYnJp
ZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJ
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
