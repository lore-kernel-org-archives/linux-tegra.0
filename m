From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH RESEND 01/14] drm/bridge: ti-tfp410: Update
 drm_connector_init_with_ddc() error message
Date: Mon, 26 Aug 2019 21:25:43 +0200
Message-ID: <4967a5f92eb933ec12567617aa107835b7cf4853.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>, Harry Wentland <harry.wentland@amd.com>, linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KClRoZSBj
b2RlIHdhcyBjaGFuZ2VkIHRvIGNhbGwgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgaW5z
dGVhZCBvZgpkcm1fY29ubmVjdG9yX2luaXQoKSwgYnV0IHRoZSBjb3JyZXNwb25kaW5nIGVycm9y
IG1lc3NhZ2Ugd2FzIG5vdAp1cGRhdGVkLgoKRml4ZXM6IGNmYjQ0NDU1MjkyNjk4OWYgKCJkcm0v
YnJpZGdlOiB0aS10ZnA0MTA6IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2Zz
IGRpcmVjdG9yeSIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKaW5kZXggNjFjYzIzNTRlZjFiLi5iZTZjOTljYWM0MTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwpAQCAtMTM5LDcgKzEzOSw4IEBAIHN0YXRp
YyBpbnQgdGZwNDEwX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCQkJCQkgIGR2
aS0+Y29ubmVjdG9yX3R5cGUsCiAJCQkJCSAgZHZpLT5kZGMpOwogCWlmIChyZXQpIHsKLQkJZGV2
X2VycihkdmktPmRldiwgImRybV9jb25uZWN0b3JfaW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7
CisJCWRldl9lcnIoZHZpLT5kZXYsICJkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKSBmYWls
ZWQ6ICVkXG4iLAorCQkJcmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
