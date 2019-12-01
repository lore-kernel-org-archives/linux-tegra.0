From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 03/16] drm/exynos: fix opencoded use of drm_panel_*
Date: Sun, 1 Dec 2019 12:32:46 +0100
Message-ID: <20191201113246.GC8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-4-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-4-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-arm-kernel@list
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IENhbGwgdmlhIGRybV9wYW5lbF9nZXRfbW9kZXMoKS4KPiAKCkFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dC4KCiAgICAgICAgU2FtCgo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgo+
IENjOiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IFNldW5n
LVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5
dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+Cj4gQ2M6IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5v
cmc+Cj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29j
QHZnZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiBpbmRl
eCA2OTI2Y2VlOTFiMzYuLjM2YjAyYjQ1NmQ5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZHNpLmMKPiBAQCAtMTQ2MCw3ICsxNDYwLDcgQEAgc3RhdGljIGludCBleHlu
b3NfZHNpX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJc3Ry
dWN0IGV4eW5vc19kc2kgKmRzaSA9IGNvbm5lY3Rvcl90b19kc2koY29ubmVjdG9yKTsKPiAgCj4g
IAlpZiAoZHNpLT5wYW5lbCkKPiAtCQlyZXR1cm4gZHNpLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2Rl
cyhkc2ktPnBhbmVsKTsKPiArCQlyZXR1cm4gZHJtX3BhbmVsX2dldF9tb2Rlcyhkc2ktPnBhbmVs
KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
