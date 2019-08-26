From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH RESEND 09/14] drm/tegra: Provide ddc symlink in output
 connector sysfs directory
Date: Mon, 26 Aug 2019 21:25:51 +0200
Message-ID: <d1a0b3f9d6b50f33dea96b53d7599d37d2a5ff6f.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>, Mamta Shukla <mamtashukla555@gmail.com>, linux-m
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvaGRtaS5jIHwgNyArKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgIHwgNyArKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYwppbmRleCA1MDI2OWZmYmNiNmIuLjIxYTYyOWFk
Y2I1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCkBAIC0xNDMwLDkgKzE0MzAsMTAgQEAgc3RhdGljIGlu
dCB0ZWdyYV9oZG1pX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAogCWhkbWkt
Pm91dHB1dC5kZXYgPSBjbGllbnQtPmRldjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZo
ZG1pLT5vdXRwdXQuY29ubmVjdG9yLAotCQkJICAgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2Z1bmNz
LAotCQkJICAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRf
d2l0aF9kZGMoZHJtLCAmaGRtaS0+b3V0cHV0LmNvbm5lY3RvciwKKwkJCQkgICAgJnRlZ3JhX2hk
bWlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCisJ
CQkJICAgIGhkbWktPm91dHB1dC5kZGMpOwogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmaGRt
aS0+b3V0cHV0LmNvbm5lY3RvciwKIAkJCQkgJnRlZ3JhX2hkbWlfY29ubmVjdG9yX2hlbHBlcl9m
dW5jcyk7CiAJaGRtaS0+b3V0cHV0LmNvbm5lY3Rvci5kcG1zID0gRFJNX01PREVfRFBNU19PRkY7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMKaW5kZXggZTE2NjlhZGEwYTQwLi4wYWQ5OWRjMGI0YTEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvc29yLmMKQEAgLTI4MzUsOSArMjgzNSwxMCBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9pbml0
KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCiAKIAlzb3ItPm91dHB1dC5kZXYgPSBzb3It
PmRldjsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkcm0sICZzb3ItPm91dHB1dC5jb25uZWN0b3Is
Ci0JCQkgICAmdGVncmFfc29yX2Nvbm5lY3Rvcl9mdW5jcywKLQkJCSAgIGNvbm5lY3Rvcik7CisJ
ZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRybSwgJnNvci0+b3V0cHV0LmNvbm5lY3RvciwK
KwkJCQkgICAgJnRlZ3JhX3Nvcl9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIGNvbm5lY3RvciwK
KwkJCQkgICAgc29yLT5vdXRwdXQuZGRjKTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnNv
ci0+b3V0cHV0LmNvbm5lY3RvciwKIAkJCQkgJnRlZ3JhX3Nvcl9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzKTsKIAlzb3ItPm91dHB1dC5jb25uZWN0b3IuZHBtcyA9IERSTV9NT0RFX0RQTVNfT0ZGOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
