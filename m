From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 19/20] drm/bridge: ps8622: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:46 +0200
Message-ID: <1464877907-27723-20-git-send-email-boris.brezillon@free-electrons.com>
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
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2MjIuYyB8IDEwIC0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2MjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFy
YWRlLXBzODYyMi5jCmluZGV4IGJlODgxZTkuLjVjZDhkZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvcGFyYWRlLXBzODYyMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvcGFyYWRlLXBzODYyMi5jCkBAIC00NzQsMTggKzQ3NCw4IEBAIHN0YXRpYyBpbnQgcHM4NjIy
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXJldHVybiBkcm1f
cGFuZWxfZ2V0X21vZGVzKHBzODYyMi0+cGFuZWwpOwogfQogCi1zdGF0aWMgc3RydWN0IGRybV9l
bmNvZGVyICpwczg2MjJfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCi17Ci0Jc3RydWN0IHBzODYyMl9icmlkZ2UgKnBzODYyMjsKLQotCXBzODYyMiA9IGNvbm5l
Y3Rvcl90b19wczg2MjIoY29ubmVjdG9yKTsKLQotCXJldHVybiBwczg2MjItPmJyaWRnZS5lbmNv
ZGVyOwotfQotCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNz
IHBzODYyMl9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9kZXMgPSBwczg2MjJf
Z2V0X21vZGVzLAotCS5iZXN0X2VuY29kZXIgPSBwczg2MjJfYmVzdF9lbmNvZGVyLAogfTsKIAog
c3RhdGljIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgcHM4NjIyX2RldGVjdChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
