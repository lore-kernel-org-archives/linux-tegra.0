From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 18/20] drm/bridge: ptn3460: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:45 +0200
Message-ID: <1464877907-27723-19-git-send-email-boris.brezillon@free-electrons.com>
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
cywgYW5kIHRoZSBkcml2ZXIKaXMgcmVseWluZyBvbiB0aGUgYXRvbWljIGhlbHBlcnM6IHdlIGNh
biBkcm9wIHRoZSBjdXN0b20gLT5iZXN0X2VuY29kZXIoKSwKYW5kIGxldCB0aGUgY29yZSBjYWxs
IGRybV9hdG9taWNfaGVscGVyX2Jlc3RfZW5jb2RlcigpIGZvciB1cy4KClNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMgfCA4IC0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL254cC1wdG4zNDYwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYw
LmMKaW5kZXggN2VjZDU5Zi4uOTNmM2RhYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9ueHAtcHRuMzQ2MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0
NjAuYwpAQCAtMjM1LDE2ICsyMzUsOCBAQCBvdXQ6CiAJcmV0dXJuIG51bV9tb2RlczsKIH0KIAot
c3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqcHRuMzQ2MF9iZXN0X2VuY29kZXIoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKLXsKLQlzdHJ1Y3QgcHRuMzQ2MF9icmlkZ2UgKnB0bl9i
cmlkZ2UgPSBjb25uZWN0b3JfdG9fcHRuMzQ2MChjb25uZWN0b3IpOwotCi0JcmV0dXJuIHB0bl9i
cmlkZ2UtPmJyaWRnZS5lbmNvZGVyOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3JfaGVscGVyX2Z1bmNzIHB0bjM0NjBfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKIAku
Z2V0X21vZGVzID0gcHRuMzQ2MF9nZXRfbW9kZXMsCi0JLmJlc3RfZW5jb2RlciA9IHB0bjM0NjBf
YmVzdF9lbmNvZGVyLAogfTsKIAogc3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgcHRu
MzQ2MF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZngg
bWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
