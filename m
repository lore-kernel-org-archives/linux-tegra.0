From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 09/24] drm/tegra: Provide ddc symlink in
 output connector sysfs directory
Date: Fri, 26 Jul 2019 19:23:03 +0200
Message-ID: <e48025c100e419c4f467da764c79bfc92ca16449.1564161140.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMgfCA3ICsrKystLS0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgfCA3ICsrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCmluZGV4IDMzNGM0
ZDdkMjM4Yi4uNDE2YTI4NjJhODRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMKQEAgLTE0MjUsOSArMTQy
NSwxMCBAQCBzdGF0aWMgaW50IHRlZ3JhX2hkbWlfaW5pdChzdHJ1Y3QgaG9zdDF4X2NsaWVudCAq
Y2xpZW50KQogCiAJaGRtaS0+b3V0cHV0LmRldiA9IGNsaWVudC0+ZGV2OwogCi0JZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRybSwgJmhkbWktPm91dHB1dC5jb25uZWN0b3IsCi0JCQkgICAmdGVncmFfaGRt
aV9jb25uZWN0b3JfZnVuY3MsCi0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOworCWRy
bV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkcm0sICZoZG1pLT5vdXRwdXQuY29ubmVjdG9yLAor
CQkJCSAgICAmdGVncmFfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NP
Tk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgaGRtaS0+b3V0cHV0LmRkYyk7CiAJZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKCZoZG1pLT5vdXRwdXQuY29ubmVjdG9yLAogCQkJCSAmdGVncmFfaGRtaV9j
b25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAloZG1pLT5vdXRwdXQuY29ubmVjdG9yLmRwbXMgPSBE
Uk1fTU9ERV9EUE1TX09GRjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRleCA0ZmZlMzc5NGU2ZDMuLjNhNjll
Mzg3YzYyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMjgzMiw5ICsyODMyLDEwIEBAIHN0YXRpYyBp
bnQgdGVncmFfc29yX2luaXQoc3RydWN0IGhvc3QxeF9jbGllbnQgKmNsaWVudCkKIAogCXNvci0+
b3V0cHV0LmRldiA9IHNvci0+ZGV2OwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJnNvci0+
b3V0cHV0LmNvbm5lY3RvciwKLQkJCSAgICZ0ZWdyYV9zb3JfY29ubmVjdG9yX2Z1bmNzLAotCQkJ
ICAgY29ubmVjdG9yKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmc29yLT5v
dXRwdXQuY29ubmVjdG9yLAorCQkJCSAgICAmdGVncmFfc29yX2Nvbm5lY3Rvcl9mdW5jcywKKwkJ
CQkgICAgY29ubmVjdG9yLAorCQkJCSAgICBzb3ItPm91dHB1dC5kZGMpOwogCWRybV9jb25uZWN0
b3JfaGVscGVyX2FkZCgmc29yLT5vdXRwdXQuY29ubmVjdG9yLAogCQkJCSAmdGVncmFfc29yX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCXNvci0+b3V0cHV0LmNvbm5lY3Rvci5kcG1zID0gRFJN
X01PREVfRFBNU19PRkY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWdmeA==
