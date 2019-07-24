From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v5 17/24] drm/mgag200: Provide ddc symlink in
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:39 +0200
Message-ID: <f86dfa1ed6e84ab8b36a0b2c24df897bdb957294.1563960855.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgMTMgKysr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCmluZGV4IDgyMmYyYTEzNzQ4
Zi4uNWU3NzhiNWYxYTEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwpA
QCAtMTY3OCwxOCArMTY3OCwxOSBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3IgKm1nYV92
Z2FfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlyZXR1cm4gTlVMTDsKIAogCWNvbm5l
Y3RvciA9ICZtZ2FfY29ubmVjdG9yLT5iYXNlOworCW1nYV9jb25uZWN0b3ItPmkyYyA9IG1nYWcy
MDBfaTJjX2NyZWF0ZShkZXYpOworCWlmICghbWdhX2Nvbm5lY3Rvci0+aTJjKQorCQlEUk1fRVJS
T1IoImZhaWxlZCB0byBhZGQgZGRjIGJ1c1xuIik7CiAKLQlkcm1fY29ubmVjdG9yX2luaXQoZGV2
LCBjb25uZWN0b3IsCi0JCQkgICAmbWdhX3ZnYV9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RFX0NP
Tk5FQ1RPUl9WR0EpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsIGNvbm5lY3Rv
ciwKKwkJCQkgICAgJm1nYV92Z2FfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9D
T05ORUNUT1JfVkdBLAorCQkJCSAgICAmbWdhX2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsKIAog
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZtZ2FfdmdhX2Nvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MpOwogCiAJZHJtX2Nvbm5lY3Rvcl9yZWdpc3Rlcihjb25uZWN0b3IpOwogCi0J
bWdhX2Nvbm5lY3Rvci0+aTJjID0gbWdhZzIwMF9pMmNfY3JlYXRlKGRldik7Ci0JaWYgKCFtZ2Ff
Y29ubmVjdG9yLT5pMmMpCi0JCURSTV9FUlJPUigiZmFpbGVkIHRvIGFkZCBkZGMgYnVzXG4iKTsK
LQogCXJldHVybiBjb25uZWN0b3I7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
