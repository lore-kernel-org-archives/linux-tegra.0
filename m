From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v6 17/24] drm/mgag200: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 26 Jul 2019 19:23:11 +0200
Message-ID: <d9e8d4281f6778e5598410a44f1b29c85df1c16d.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Douglas Anderson <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCAxMyArKysrKysr
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKaW5kZXggODIyZjJhMTM3NDhmLi41
ZTc3OGI1ZjFhMTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCkBAIC0x
Njc4LDE4ICsxNjc4LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqbWdhX3ZnYV9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCXJldHVybiBOVUxMOwogCiAJY29ubmVjdG9y
ID0gJm1nYV9jb25uZWN0b3ItPmJhc2U7CisJbWdhX2Nvbm5lY3Rvci0+aTJjID0gbWdhZzIwMF9p
MmNfY3JlYXRlKGRldik7CisJaWYgKCFtZ2FfY29ubmVjdG9yLT5pMmMpCisJCURSTV9FUlJPUigi
ZmFpbGVkIHRvIGFkZCBkZGMgYnVzXG4iKTsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNv
bm5lY3RvciwKLQkJCSAgICZtZ2FfdmdhX2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVfQ09OTkVD
VE9SX1ZHQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9yLAor
CQkJCSAgICAmbWdhX3ZnYV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5F
Q1RPUl9WR0EsCisJCQkJICAgICZtZ2FfY29ubmVjdG9yLT5pMmMtPmFkYXB0ZXIpOwogCiAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJm1nYV92Z2FfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyk7CiAKIAlkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7CiAKLQltZ2Ff
Y29ubmVjdG9yLT5pMmMgPSBtZ2FnMjAwX2kyY19jcmVhdGUoZGV2KTsKLQlpZiAoIW1nYV9jb25u
ZWN0b3ItPmkyYykKLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWRkIGRkYyBidXNcbiIpOwotCiAJ
cmV0dXJuIGNvbm5lY3RvcjsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
