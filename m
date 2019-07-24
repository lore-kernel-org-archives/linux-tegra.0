From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v5 16/24] drm: sti: Provide ddc symlink in hdmi
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:38 +0200
Message-ID: <00095033f5740ad29dbd9baadba4e428dbfdebbd.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Joonyoung Shim <jy0922.shim@samsung.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyB8IDYgKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2hkbWkuYwppbmRleCBmMDNkNjE3ZWRjNGMuLjMzZDA2ZTBhOTE2OCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2hkbWkuYwpAQCAtMTI4NCw4ICsxMjg0LDEwIEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfYmluZChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAog
CWRybV9jb25uZWN0b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7CiAKLQlkcm1f
Y29ubmVjdG9yX2luaXQoZHJtX2RldiwgZHJtX2Nvbm5lY3RvciwKLQkJCSZzdGlfaGRtaV9jb25u
ZWN0b3JfZnVuY3MsIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJZHJtX2Nvbm5lY3Rvcl9p
bml0X3dpdGhfZGRjKGRybV9kZXYsIGRybV9jb25uZWN0b3IsCisJCQkJICAgICZzdGlfaGRtaV9j
b25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkg
ICAgaGRtaS0+ZGRjX2FkYXB0KTsKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoZHJtX2Nvbm5l
Y3RvciwKIAkJCSZzdGlfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1n
ZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
