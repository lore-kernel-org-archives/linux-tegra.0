From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 10/13] drm: zte: Provide ddc symlink in hdmi
 connector sysfs directory
Date: Wed, 31 Jul 2019 18:58:19 +0200
Message-ID: <a9a8278926506c1981b0f07c175fdefa583a155f.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <cover.1564591626.git.andrzej.p@collabora.com>
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>, Harry Wentland <harry.wentland@amd.com>, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Leo Li <sunpeng.li@>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0venRlL3p4X2hkbWkuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS96
dGUvenhfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMKaW5kZXggYTUwZjVh
MWYwOWI4Li5iOThhMTQyMGRjZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS96dGUvenhf
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jCkBAIC0zMTksOCArMzE5
LDEwIEBAIHN0YXRpYyBpbnQgenhfaGRtaV9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
LCBzdHJ1Y3QgenhfaGRtaSAqaGRtaSkKIAogCWhkbWktPmNvbm5lY3Rvci5wb2xsZWQgPSBEUk1f
Q09OTkVDVE9SX1BPTExfSFBEOwogCi0JZHJtX2Nvbm5lY3Rvcl9pbml0KGRybSwgJmhkbWktPmNv
bm5lY3RvciwgJnp4X2hkbWlfY29ubmVjdG9yX2Z1bmNzLAotCQkJICAgRFJNX01PREVfQ09OTkVD
VE9SX0hETUlBKTsKKwlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZHJtLCAmaGRtaS0+Y29u
bmVjdG9yLAorCQkJCSAgICAmenhfaGRtaV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9N
T0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgJmhkbWktPmRkYy0+YWRhcCk7CiAJZHJtX2Nv
bm5lY3Rvcl9oZWxwZXJfYWRkKCZoZG1pLT5jb25uZWN0b3IsCiAJCQkJICZ6eF9oZG1pX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWdmeA==
