From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 07/23] drm/mediatek: Provide ddc symlink in
 hdmi connector sysfs directory
Date: Thu, 11 Jul 2019 13:26:34 +0200
Message-ID: <8ff08f7aa7cbd9b264c564382b8206ec5fd21f74.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCA1ZDZhOWYwOTRkZjUuLjZjNTMyMWRjYzRi
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE0Niw3ICsxNDYsNiBAQCBz
dHJ1Y3QgbXRrX2hkbWkgewogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgcGh5ICpwaHk7
CiAJc3RydWN0IGRldmljZSAqY2VjX2RldjsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkY19hZHB0
OwogCXN0cnVjdCBjbGsgKmNsa1tNVEtfSERNSV9DTEtfQ09VTlRdOwogCXN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIG1vZGU7CiAJYm9vbCBkdmlfbW9kZTsKQEAgLTEyMTMsMTAgKzEyMTIsMTAgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9jb25uX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0OwogCi0JaWYgKCFoZG1pLT5kZGNf
YWRwdCkKKwlpZiAoIWNvbm4tPmRkYykKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLQllZGlkID0gZHJt
X2dldF9lZGlkKGNvbm4sIGhkbWktPmRkY19hZHB0KTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNv
bm4sIGNvbm4tPmRkYyk7CiAJaWYgKCFlZGlkKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtMTUw
OSw5ICsxNTA4LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWksCiAJfQogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKLQloZG1pLT5kZGNf
YWRwdCA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShpMmNfbnApOworCWhkbWktPmNvbm4u
ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGkyY19ucCk7CiAJb2Zfbm9kZV9wdXQo
aTJjX25wKTsKLQlpZiAoIWhkbWktPmRkY19hZHB0KSB7CisJaWYgKCFoZG1pLT5jb25uLmRkYykg
ewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVc
biIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA==
