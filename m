From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm: tegra: add CONFIG_OF dependency
Date: Fri, 21 Jul 2017 18:13:23 +0200
Message-ID: <20170721161333.3332968-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <stephen.boyd@linaro.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

V2l0aG91dCBDT05GSUdfT0YsIHdlIGNhbiBydW4gaW50byBhIGJ1aWxkIGVycm9yOgoKZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmM6Mzc4OjIwOiBlcnJvcjogJ3BpbmNvbmZfZ2VuZXJpY19k
dF9ub2RlX3RvX21hcF9ncm91cCcgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7
IGRpZCB5b3UgbWVhbiAncGluY29uZl9nZW5lcmljX3BhcmFtcyc/CiAgLmR0X25vZGVfdG9fbWFw
ID0gcGluY29uZl9nZW5lcmljX2R0X25vZGVfdG9fbWFwX2dyb3VwLAogICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgICAgICAgICAg
ICAgIHBpbmNvbmZfZ2VuZXJpY19wYXJhbXMKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwYXV4LmM6
Mzc5OjE3OiBlcnJvcjogJ3BpbmNvbmZfZ2VuZXJpY19kdF9mcmVlX21hcCcgdW5kZWNsYXJlZCBo
ZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAncGluY29uZl9nZW5lcmljX3Bh
cmFtcyc/CgpUaGlzIGFkZHMgYW4gZXhwbGljaXQgZGVwZW5kZW5jeS4KClNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L0tjb25maWcKaW5kZXggMmRiMjlkNjcxOTNkLi5kYzU4YWIxNDAxNTEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9L
Y29uZmlnCkBAIC0zLDYgKzMsNyBAQCBjb25maWcgRFJNX1RFR1JBCiAJZGVwZW5kcyBvbiBBUkNI
X1RFR1JBIHx8IChBUk0gJiYgQ09NUElMRV9URVNUKQogCWRlcGVuZHMgb24gQ09NTU9OX0NMSwog
CWRlcGVuZHMgb24gRFJNCisJZGVwZW5kcyBvbiBPRgogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgog
CXNlbGVjdCBEUk1fTUlQSV9EU0kKIAlzZWxlY3QgRFJNX1BBTkVMCi0tIAoyLjkuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
