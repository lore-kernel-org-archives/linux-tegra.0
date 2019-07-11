From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v4 09/23] drm/imx: imx-ldb: Provide ddc symlink in connector's
 sysfs
Date: Thu, 11 Jul 2019 13:26:36 +0200
Message-ID: <9b61fe88ad7e1de60839a1484bb8a74c4e3d9710.1562843413.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jIHwgMTMgKysrKysrLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
bXgvaW14LWxkYi5jCmluZGV4IDM4MzczMzMwMjI4MC4uNDRmZGIyNjQzMzllIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14
L2lteC1sZGIuYwpAQCAtNTUsNyArNTUsNiBAQCBzdHJ1Y3QgaW14X2xkYl9jaGFubmVsIHsKIAlz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOwogCiAJc3RydWN0IGRldmljZV9ub2RlICpjaGlsZDsK
LQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAlpbnQgY2hubzsKIAl2b2lkICplZGlkOwogCWlu
dCBlZGlkX2xlbjsKQEAgLTEzMSw4ICsxMzAsOCBAQCBzdGF0aWMgaW50IGlteF9sZGJfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkJcmV0dXJu
IG51bV9tb2RlczsKIAl9CiAKLQlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgaW14X2xkYl9jaC0+
ZGRjKQotCQlpbXhfbGRiX2NoLT5lZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaW14X2xk
Yl9jaC0+ZGRjKTsKKwlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgY29ubmVjdG9yLT5kZGMpCisJ
CWlteF9sZGJfY2gtPmVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRk
Yyk7CiAKIAlpZiAoaW14X2xkYl9jaC0+ZWRpZCkgewogCQlkcm1fY29ubmVjdG9yX3VwZGF0ZV9l
ZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwKQEAgLTU1MCwxNSArNTQ5LDE1IEBAIHN0YXRpYyBpbnQg
aW14X2xkYl9wYW5lbF9kZGMoc3RydWN0IGRldmljZSAqZGV2LAogCiAJZGRjX25vZGUgPSBvZl9w
YXJzZV9waGFuZGxlKGNoaWxkLCAiZGRjLWkyYy1idXMiLCAwKTsKIAlpZiAoZGRjX25vZGUpIHsK
LQkJY2hhbm5lbC0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsK
KwkJY2hhbm5lbC0+Y29ubmVjdG9yLmRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShk
ZGNfbm9kZSk7CiAJCW9mX25vZGVfcHV0KGRkY19ub2RlKTsKLQkJaWYgKCFjaGFubmVsLT5kZGMp
IHsKKwkJaWYgKCFjaGFubmVsLT5jb25uZWN0b3IuZGRjKSB7CiAJCQlkZXZfd2FybihkZXYsICJm
YWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlclxuIik7CiAJCQlyZXR1cm4gLUVQUk9CRV9ERUZF
UjsKIAkJfQogCX0KIAotCWlmICghY2hhbm5lbC0+ZGRjKSB7CisJaWYgKCFjaGFubmVsLT5jb25u
ZWN0b3IuZGRjKSB7CiAJCS8qIGlmIG5vIEREQyBhdmFpbGFibGUsIGZhbGxiYWNrIHRvIGhhcmRj
b2RlZCBFRElEICovCiAJCWRldl9kYmcoZGV2LCAibm8gZGRjIGF2YWlsYWJsZVxuIik7CiAKQEAg
LTcyNSw3ICs3MjQsNyBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX3VuYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkJCWRybV9wYW5lbF9kZXRhY2goY2hhbm5l
bC0+cGFuZWwpOwogCiAJCWtmcmVlKGNoYW5uZWwtPmVkaWQpOwotCQlpMmNfcHV0X2FkYXB0ZXIo
Y2hhbm5lbC0+ZGRjKTsKKwkJaTJjX3B1dF9hZGFwdGVyKGNoYW5uZWwtPmNvbm5lY3Rvci5kZGMp
OwogCX0KIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
