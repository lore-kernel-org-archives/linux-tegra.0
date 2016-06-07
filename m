From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 02/20] drm: arc: Rely on the default
	->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:47:57 +0200
Message-ID: <1465300095-16971-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
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
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpLCBhbmQgbGV0IHRoZSBjb3JlIGNhbGwg
ZHJtX2F0b21pY19oZWxwZXJfYmVzdF9lbmNvZGVyKCkKZm9yIHVzLgoKU2lnbmVkLW9mZi1ieTog
Qm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2hkbWkuYyB8IDE4IC0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcmMvYXJjcGd1X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcmMvYXJjcGd1X2hk
bWkuYwppbmRleCAwOGI2YmFlLi5iN2E4YjJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJjL2FyY3BndV9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfaGRtaS5j
CkBAIC00NiwyMyArNDYsNiBAQCBzdGF0aWMgaW50IGFyY3BndV9kcm1fY29ubmVjdG9yX2dldF9t
b2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXJldHVybiBzZnVuY3MtPmdl
dF9tb2Rlcygmc2xhdmUtPmJhc2UsIGNvbm5lY3Rvcik7CiB9CiAKLXN0cnVjdCBkcm1fZW5jb2Rl
ciAqCi1hcmNwZ3VfZHJtX2Nvbm5lY3Rvcl9iZXN0X2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikKLXsKLQlzdHJ1Y3QgZHJtX2VuY29kZXJfc2xhdmUgKnNsYXZlOwotCXN0
cnVjdCBhcmNwZ3VfZHJtX2Nvbm5lY3RvciAqY29uID0KLQkJY29udGFpbmVyX29mKGNvbm5lY3Rv
ciwgc3RydWN0IGFyY3BndV9kcm1fY29ubmVjdG9yLCBjb25uZWN0b3IpOwotCi0Jc2xhdmUgPSBj
b24tPmVuY29kZXJfc2xhdmU7Ci0JaWYgKHNsYXZlID09IE5VTEwpIHsKLQkJZGV2X2Vycihjb25u
ZWN0b3ItPmRldi0+ZGV2LAotCQkJImNvbm5lY3Rvcl9iZXN0X2VuY29kZXI6IGNhbm5vdCBmaW5k
IHNsYXZlIGVuY29kZXIgZm9yIGNvbm5lY3RvclxuIik7Ci0JCXJldHVybiBOVUxMOwotCX0KLQot
CXJldHVybiAmc2xhdmUtPmJhc2U7Ci19Ci0KIHN0YXRpYyBlbnVtIGRybV9jb25uZWN0b3Jfc3Rh
dHVzCiBhcmNwZ3VfZHJtX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciwgYm9vbCBmb3JjZSkKIHsKQEAgLTk3LDcgKzgwLDYgQEAgc3RhdGljIHZvaWQgYXJj
cGd1X2RybV9jb25uZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5jcwogYXJjcGd1
X2RybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9kZXMgPSBhcmNwZ3VfZHJt
X2Nvbm5lY3Rvcl9nZXRfbW9kZXMsCi0JLmJlc3RfZW5jb2RlciA9IGFyY3BndV9kcm1fY29ubmVj
dG9yX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9mdW5jcyBhcmNwZ3VfZHJtX2Nvbm5lY3Rvcl9mdW5jcyA9IHsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGlu
ZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
