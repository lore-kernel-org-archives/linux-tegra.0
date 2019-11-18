From: zhengbin <zhengbin13@huawei.com>
Subject: [PATCH 2/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
 tegra_gem_create
Date: Mon, 18 Nov 2019 19:46:12 +0800
Message-ID: <1574077572-59152-3-git-send-email-zhengbin13@huawei.com>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: treding@nvidia.com, airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: zhengbin13@huawei.com
List-Id: linux-tegra@vger.kernel.org

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jOjM1
MDoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNlZAoKUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8
emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8
IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHJtLmMKaW5kZXggNTZlNWU3YS4uOGI2YTFmN2QgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMK
QEAgLTM0NywxMCArMzQ3LDcgQEAgc3RhdGljIGludCB0ZWdyYV9nZW1fY3JlYXRlKHN0cnVjdCBk
cm1fZGV2aWNlICpkcm0sIHZvaWQgKmRhdGEsCgogCWJvID0gdGVncmFfYm9fY3JlYXRlX3dpdGhf
aGFuZGxlKGZpbGUsIGRybSwgYXJncy0+c2l6ZSwgYXJncy0+ZmxhZ3MsCiAJCQkJCSAmYXJncy0+
aGFuZGxlKTsKLQlpZiAoSVNfRVJSKGJvKSkKLQkJcmV0dXJuIFBUUl9FUlIoYm8pOwotCi0JcmV0
dXJuIDA7CisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhibyk7CiB9Cgogc3RhdGljIGludCB0ZWdy
YV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB2b2lkICpkYXRhLAotLQoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
