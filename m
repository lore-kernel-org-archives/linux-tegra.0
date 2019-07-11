From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 10/23] drm/imx: imx-tve: Provide ddc symlink in connector's
 sysfs
Date: Thu, 11 Jul 2019 13:26:37 +0200
Message-ID: <f19b4279d73c64a55aa27955fdbb20f34e42125d.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org, Jyri Sarha <js>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LXR2ZS5jIHwgOCArKystLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14
LXR2ZS5jCmluZGV4IGU3MjVhZjhhMDAyNS4uYjhiZWU0ZTFmMTY5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaW14L2lteC10dmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC10
dmUuYwpAQCAtMTA5LDcgKzEwOSw2IEBAIHN0cnVjdCBpbXhfdHZlIHsKIAogCXN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpkYWNfcmVnOwotCXN0cnVjdCBpMmNfYWRh
cHRlciAqZGRjOwogCXN0cnVjdCBjbGsgKmNsazsKIAlzdHJ1Y3QgY2xrICpkaV9zZWxfY2xrOwog
CXN0cnVjdCBjbGtfaHcgY2xrX2h3X2RpOwpAQCAtMjE4LDE0ICsyMTcsMTMgQEAgc3RhdGljIGlu
dCB0dmVfc2V0dXBfdmdhKHN0cnVjdCBpbXhfdHZlICp0dmUpCiAKIHN0YXRpYyBpbnQgaW14X3R2
ZV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7
Ci0Jc3RydWN0IGlteF90dmUgKnR2ZSA9IGNvbl90b190dmUoY29ubmVjdG9yKTsKIAlzdHJ1Y3Qg
ZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0gMDsKIAotCWlmICghdHZlLT5kZGMpCisJaWYgKCFjb25u
ZWN0b3ItPmRkYykKIAkJcmV0dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3Rv
ciwgdHZlLT5kZGMpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3It
PmRkYyk7CiAJaWYgKGVkaWQpIHsKIAkJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0
eShjb25uZWN0b3IsIGVkaWQpOwogCQlyZXQgPSBkcm1fYWRkX2VkaWRfbW9kZXMoY29ubmVjdG9y
LCBlZGlkKTsKQEAgLTU1MSw3ICs1NDksNyBAQCBzdGF0aWMgaW50IGlteF90dmVfYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAogCWRk
Y19ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImRkYy1pMmMtYnVzIiwgMCk7CiAJaWYgKGRk
Y19ub2RlKSB7Ci0JCXR2ZS0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19u
b2RlKTsKKwkJdHZlLT5jb25uZWN0b3IuZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2Rl
KGRkY19ub2RlKTsKIAkJb2Zfbm9kZV9wdXQoZGRjX25vZGUpOwogCX0KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
