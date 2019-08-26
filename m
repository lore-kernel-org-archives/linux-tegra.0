From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH RESEND 08/14] drm/mediatek: Provide ddc symlink in hdmi
 connector sysfs directory
Date: Mon, 26 Aug 2019 21:25:50 +0200
Message-ID: <ef25d32d9306b1302b53eb7f84100f3683cdfd5d.1566845537.git.andrzej.p@collabora.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, Emil Velikov <emil.velikov@collabora.com>, linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-msm@vger.kernel.org, Uma Shankar <uma.shankar@intel.com>, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Mamta Shukla <mamtashukla555@gmail.com>, linux-me
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jCmluZGV4IGNlOTFiNjEzNjRlYi4uZjQxOTc2NWI3Y2MwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYwpAQCAtMTI5OSw5ICsxMjk5LDEwIEBAIHN0YXRpYyBpbnQgbXRrX2hk
bWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCXN0cnVjdCBtdGtf
aGRtaSAqaGRtaSA9IGhkbWlfY3R4X2Zyb21fYnJpZGdlKGJyaWRnZSk7CiAJaW50IHJldDsKIAot
CXJldCA9IGRybV9jb25uZWN0b3JfaW5pdChicmlkZ2UtPmVuY29kZXItPmRldiwgJmhkbWktPmNv
bm4sCi0JCQkJICZtdGtfaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQkJIERSTV9NT0RFX0NPTk5F
Q1RPUl9IRE1JQSk7CisJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGJyaWRnZS0+
ZW5jb2Rlci0+ZGV2LCAmaGRtaS0+Y29ubiwKKwkJCQkJICAmbXRrX2hkbWlfY29ubmVjdG9yX2Z1
bmNzLAorCQkJCQkgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkJICBoZG1pLT5kZGNf
YWRwdCk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGhkbWktPmRldiwgIkZhaWxlZCB0byBpbml0
aWFsaXplIGNvbm5lY3RvcjogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
