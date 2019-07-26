From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 04/24] drm: rockchip: Provide ddc symlink in
 rk3066_hdmi sysfs directory
Date: Fri, 26 Jul 2019 19:22:58 +0200
Message-ID: <c34953065bc81f0ff4c511b8e43e42fbdb73f6ed.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>, Dave
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIHwgNyArKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMKaW5kZXggODVmYzVmMDFmNzYxLi5lODc0
ZjVmZGVlYzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRt
aS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yazMwNjZfaGRtaS5jCkBAIC01NjQs
OSArNTY0LDEwIEBAIHJrMzA2Nl9oZG1pX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
IHN0cnVjdCByazMwNjZfaGRtaSAqaGRtaSkKIAogCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgm
aGRtaS0+Y29ubmVjdG9yLAogCQkJCSAmcmszMDY2X2hkbWlfY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyk7Ci0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJmhkbWktPmNvbm5lY3RvciwKLQkJCSAgICZy
azMwNjZfaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERN
SUEpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkcm0sICZoZG1pLT5jb25uZWN0b3Is
CisJCQkJICAgICZyazMwNjZfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RF
X0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgaGRtaS0+ZGRjKTsKIAogCWRybV9jb25uZWN0b3Jf
YXR0YWNoX2VuY29kZXIoJmhkbWktPmNvbm5lY3RvciwgZW5jb2Rlcik7CiAKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
