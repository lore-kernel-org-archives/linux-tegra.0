From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:26 +0200
Message-ID: <20190804201637.1240-6-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrab>
List-Id: linux-tegra@vger.kernel.org

VXNlIGRybV9wYW5lbF9nZXRfbW9kZXMoKSB0byBhY2Nlc3MgbW9kZXMuClRoaXMgaGFzIGEgbmlj
ZSBzaWRlIGVmZmVjdCB0byBzaW1wbGlmeSB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVy
LmNoPgpDYzogQWxpc29uIFdhbmcgPGFsaXNvbi53YW5nQG54cC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZnNsLWRjdS9mc2xfZGN1X2RybV9yZ2IuYwppbmRleCAyNzlkODNlYWZmYzAuLmE5MmZkNmM3MGIw
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMKQEAgLTY1LDE3
ICs2NSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBmc2xfZGN1
X2RybV9jb25uZWN0b3JfZnVuY3MgPSB7CiBzdGF0aWMgaW50IGZzbF9kY3VfZHJtX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIHsKIAlzdHJ1Y3Qg
ZnNsX2RjdV9kcm1fY29ubmVjdG9yICpmc2xfY29ubmVjdG9yOwotCWludCAoKmdldF9tb2Rlcyko
c3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwotCWludCBudW1fbW9kZXMgPSAwOwogCiAJZnNsX2Nv
bm5lY3RvciA9IHRvX2ZzbF9kY3VfY29ubmVjdG9yKGNvbm5lY3Rvcik7Ci0JaWYgKGZzbF9jb25u
ZWN0b3ItPnBhbmVsICYmIGZzbF9jb25uZWN0b3ItPnBhbmVsLT5mdW5jcyAmJgotCSAgICBmc2xf
Y29ubmVjdG9yLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlcykgewotCQlnZXRfbW9kZXMgPSBmc2xf
Y29ubmVjdG9yLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2RlczsKLQkJbnVtX21vZGVzID0gZ2V0X21v
ZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKLQl9Ci0KLQlyZXR1cm4gbnVtX21vZGVzOworCXJl
dHVybiBkcm1fcGFuZWxfZ2V0X21vZGVzKGZzbF9jb25uZWN0b3ItPnBhbmVsKTsKIH0KIAogc3Rh
dGljIGludCBmc2xfZGN1X2RybV9jb25uZWN0b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
