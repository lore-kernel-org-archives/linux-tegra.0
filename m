From: zhengbin <zhengbin13@huawei.com>
Subject: [PATCH 1/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
 tegra_bo_dumb_create
Date: Mon, 18 Nov 2019 19:46:11 +0800
Message-ID: <1574077572-59152-2-git-send-email-zhengbin13@huawei.com>
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jOjQ1
NzoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNlZAoKUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8
emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8
IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMKaW5kZXggNzQ2ZGFlMy4uZGFlM2VmZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpA
QCAtNDU0LDEwICs0NTQsNyBAQCBpbnQgdGVncmFfYm9fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9m
aWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAoKIAlibyA9IHRlZ3JhX2JvX2NyZWF0
ZV93aXRoX2hhbmRsZShmaWxlLCBkcm0sIGFyZ3MtPnNpemUsIDAsCiAJCQkJCSAmYXJncy0+aGFu
ZGxlKTsKLQlpZiAoSVNfRVJSKGJvKSkKLQkJcmV0dXJuIFBUUl9FUlIoYm8pOwotCi0JcmV0dXJu
IDA7CisJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhibyk7CiB9Cgogc3RhdGljIHZtX2ZhdWx0X3Qg
dGVncmFfYm9fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCi0tCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
