From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 12/20] drm: sun4i: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:39 +0200
Message-ID: <1464877907-27723-13-git-send-email-boris.brezillon@free-electrons.com>
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

QWxsIG91dHB1dHMgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFu
ZCBlbmNvZGVycwphbmQgdGhlIGRyaXZlciBpcyByZWx5aW5nIG9uIHRoZSBhdG9taWMgaGVscGVy
czogd2UgY2FuIGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGltcGxlbWVudGF0aW9u
cyBhbmQgbGV0IHRoZSBjb3JlIGNhbGwKZHJtX2F0b21pY19oZWxwZXJfYmVzdF9lbmNvZGVyKCkg
Zm9yIHVzLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
ZnJlZS1lbGVjdHJvbnMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9yZ2Iu
YyB8IDEwIC0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90di5jICB8ICA5
IC0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfcmdiLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNGlfcmdiLmMKaW5kZXggYWI2NDk0OC4uNDQyY2ZlMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjRpX3JnYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV9yZ2IuYwpAQCAtOTAsMTkgKzkwLDkgQEAgc3RhdGljIGludCBzdW40aV9yZ2JfbW9kZV92
YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCXJldHVybiBNT0RFX09LOwog
fQogCi1zdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICoKLXN1bjRpX3JnYl9iZXN0X2VuY29kZXIo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKLXsKLQlzdHJ1Y3Qgc3VuNGlfcmdiICpy
Z2IgPQotCQlkcm1fY29ubmVjdG9yX3RvX3N1bjRpX3JnYihjb25uZWN0b3IpOwotCi0JcmV0dXJu
ICZyZ2ItPmVuY29kZXI7Ci19Ci0KIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3Mgc3VuNGlfcmdiX2Nvbl9oZWxwZXJfZnVuY3MgPSB7CiAJLmdldF9tb2Rlcwk9IHN1bjRp
X3JnYl9nZXRfbW9kZXMsCiAJLm1vZGVfdmFsaWQJPSBzdW40aV9yZ2JfbW9kZV92YWxpZCwKLQku
YmVzdF9lbmNvZGVyCT0gc3VuNGlfcmdiX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBlbnVt
IGRybV9jb25uZWN0b3Jfc3RhdHVzCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdHYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90di5jCmluZGV4IGJjMDQ3
ZjkuLmI4NDE0NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90di5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90di5jCkBAIC01MjYsMTggKzUyNiw5
IEBAIHN0YXRpYyBpbnQgc3VuNGlfdHZfY29tcF9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsCiAJcmV0dXJuIE1PREVfT0s7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZHJt
X2VuY29kZXIgKgotc3VuNGlfdHZfY29tcF9iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikKLXsKLQlzdHJ1Y3Qgc3VuNGlfdHYgKnR2ID0gZHJtX2Nvbm5lY3Rvcl90
b19zdW40aV90dihjb25uZWN0b3IpOwotCi0JcmV0dXJuICZ0di0+ZW5jb2RlcjsKLX0KLQogc3Rh
dGljIHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcyBzdW40aV90dl9jb21wX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmdldF9tb2Rlcwk9IHN1bjRpX3R2X2NvbXBfZ2V0X21v
ZGVzLAogCS5tb2RlX3ZhbGlkCT0gc3VuNGlfdHZfY29tcF9tb2RlX3ZhbGlkLAotCS5iZXN0X2Vu
Y29kZXIJPSBzdW40aV90dl9jb21wX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBlbnVtIGRy
bV9jb25uZWN0b3Jfc3RhdHVzCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ2Z4Cg==
