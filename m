From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH RESEND 04/14] drm/exynos: Provide ddc symlink in connector's
 sysfs
Date: Mon, 26 Aug 2019 21:25:46 +0200
Message-ID: <7c0585b22f9d9f04b7e84db53887f08b31e26075.1566845537.git.andrzej.p@collabora.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org, Jyri
List-Id: linux-tegra@vger.kernel.org

U3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9y
LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFi
b3JhLmNvbT4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3
ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfaGRtaS5jCmluZGV4IGJjMTU2NWYxODIyYS4uZDRhOWM5ZTE3NDM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCkBAIC05NDAsOCArOTQwLDEwIEBAIHN0YXRpYyBpbnQg
aGRtaV9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAljb25u
ZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gdHJ1ZTsKIAljb25uZWN0b3ItPnBvbGxlZCA9IERS
TV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKLQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoaGRhdGEt
PmRybV9kZXYsIGNvbm5lY3RvciwKLQkJCSZoZG1pX2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVf
Q09OTkVDVE9SX0hETUlBKTsKKwlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoaGRh
dGEtPmRybV9kZXYsIGNvbm5lY3RvciwKKwkJCQkJICAmaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJ
CQkJCSAgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBLAorCQkJCQkgIGhkYXRhLT5kZGNfYWRwdCk7
CiAJaWYgKHJldCkgewogCQlEUk1fREVWX0VSUk9SKGhkYXRhLT5kZXYsCiAJCQkgICAgICAiRmFp
bGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yIHdpdGggZHJtXG4iKTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
