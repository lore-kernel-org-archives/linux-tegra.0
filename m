From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 15/20] drm: virtgpu: Rely on the default
	->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:48:10 +0200
Message-ID: <1465300095-16971-16-git-send-email-boris.brezillon@free-electrons.com>
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

VGhlIHZpcnRncHUgb3V0cHV0IGV4cG9zZXMgYSAxOjEgcmVsYXRpb25zaGlwIGJldHdlZW4gY29u
bmVjdG9ycyBhbmQKZW5jb2RlcnMgYW5kIHRoZSBkcml2ZXIgaXMgcmVseWluZyBvbiB0aGUgYXRv
bWljIGhlbHBlcnM6IHdlIGNhbiBkcm9wCnRoZSBjdXN0b20gLT5iZXN0X2VuY29kZXIoKSBpbXBs
ZW1lbnRhdGlvbiBhbmQgbGV0IHRoZSBjb3JlIGNhbGwKZHJtX2F0b21pY19oZWxwZXJfYmVzdF9l
bmNvZGVyKCkgZm9yIHVzLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AZnJlZS1lbGVjdHJvbnMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kaXNwbGF5LmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMKaW5kZXgg
ZDQzMDVkYS4uNGQ0MWRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZGlzcGxh
eS5jCkBAIC0zNDEsMTUgKzM0MSw2IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9jb25uX21vZGVf
dmFsaWQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlyZXR1cm4gTU9ERV9CQUQ7
CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIqCi12aXJ0aW9fZ3B1X2Jlc3RfZW5jb2Rl
cihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQotewotCXN0cnVjdCB2aXJ0aW9fZ3B1
X291dHB1dCAqdmlydGlvX2dwdV9vdXRwdXQgPQotCQlkcm1fY29ubmVjdG9yX3RvX3ZpcnRpb19n
cHVfb3V0cHV0KGNvbm5lY3Rvcik7Ci0KLQlyZXR1cm4gJnZpcnRpb19ncHVfb3V0cHV0LT5lbmM7
Ci19Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIHZpcnRp
b19ncHVfZW5jX2hlbHBlcl9mdW5jcyA9IHsKIAkubW9kZV9zZXQgICA9IHZpcnRpb19ncHVfZW5j
X21vZGVfc2V0LAogCS5lbmFibGUgICAgID0gdmlydGlvX2dwdV9lbmNfZW5hYmxlLApAQCAtMzU5
LDcgKzM1MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNz
IHZpcnRpb19ncHVfZW5jX2hlbHBlcl9mdW5jcyA9IHsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgdmlydGlvX2dwdV9jb25uX2hlbHBlcl9mdW5jcyA9IHsK
IAkuZ2V0X21vZGVzICAgID0gdmlydGlvX2dwdV9jb25uX2dldF9tb2RlcywKIAkubW9kZV92YWxp
ZCAgID0gdmlydGlvX2dwdV9jb25uX21vZGVfdmFsaWQsCi0JLmJlc3RfZW5jb2RlciA9IHZpcnRp
b19ncHVfYmVzdF9lbmNvZGVyLAogfTsKIAogc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0
dXMgdmlydGlvX2dwdV9jb25uX2RldGVjdCgKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
