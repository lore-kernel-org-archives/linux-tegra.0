From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 06/16] drm/msm: fix opencoded use of drm_panel_*
Date: Sun, 1 Dec 2019 12:33:07 +0100
Message-ID: <20191201113307.GD8753@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
 <20190804201637.1240-7-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190804201637.1240-7-sam@ravnborg.org>
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

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMTA6MTY6MjdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IFVzZSB0aGUgZnVuY3Rpb24gZHJtX3BhbmVsX2dldF9tb2RlcygpLgo+IAoKQXBwbGll
ZCB0byBkcm0tbWlzYy1uZXh0LgoKICAgICAgICBTYW0KCj4gU2lnbmVkLW9mZi1ieTogU2FtIFJh
dm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBBbGV4aW9zIFphdnJhcyA8YWxleGlvcy56
YXZyYXNAaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT4KPiBDYzogQWxsaXNvbiBSYW5kYWwgPGFsbGlzb25AbG9odXRvay5uZXQ+Cj4gQ2M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogRW5yaWNvIFdlaWdlbHQgPGluZm9AbWV0
dXgubmV0Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNf
Y29ubmVjdG9yLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRw
NC9tZHA0X2x2ZHNfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9t
ZHA0X2x2ZHNfY29ubmVjdG9yLmMKPiBpbmRleCBlY2VmNGY1YjlmMjYuLjBlMjEyNTJmZDFkNiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNfY29u
bmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9tZHA0X2x2ZHNf
Y29ubmVjdG9yLmMKPiBAQCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgaW50IG1kcDRfbHZkc19jb25u
ZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlpZiAo
cGFuZWwpIHsKPiAgCQlkcm1fcGFuZWxfYXR0YWNoKHBhbmVsLCBjb25uZWN0b3IpOwo+ICAKPiAt
CQlyZXQgPSBwYW5lbC0+ZnVuY3MtPmdldF9tb2RlcyhwYW5lbCk7Cj4gKwkJcmV0ID0gZHJtX3Bh
bmVsX2dldF9tb2RlcyhwYW5lbCk7Cj4gIAo+ICAJCWRybV9wYW5lbF9kZXRhY2gocGFuZWwpOwo+
ICAJfQo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
