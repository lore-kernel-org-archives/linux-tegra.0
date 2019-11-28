From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Date: Thu, 28 Nov 2019 16:37:35 +0100
Message-ID: <20191128153741.2380419-4-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0J3Mgbm90IGtub3du
IGF0IGltcG9ydCB0aW1lIHdoZXRoZXIgb3Igbm90IGFsbCB1c2VycyBvZiBhIERNQS1CVUYgd2ls
bApiZSBhYmxlIHRvIGRlYWwgd2l0aCBub24tY29udGlndW91cyBtZW1vcnkuIEVhY2ggdXNlciBu
ZWVkcyB0byB2ZXJpZnkgYXQKbWFwLXRpbWUgd2hldGhlciBpdCBjYW4gYWNjZXNzIHRoZSBidWZm
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCmluZGV4IDZkZmFkNTZlZWUyYi4uYmMx
NWI0MzAxNTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCkBAIC00NDAsMTMgKzQ0MCw2IEBAIHN0YXRpYyBz
dHJ1Y3QgdGVncmFfYm8gKnRlZ3JhX2JvX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAog
CQllcnIgPSB0ZWdyYV9ib19pb21tdV9tYXAodGVncmEsIGJvKTsKIAkJaWYgKGVyciA8IDApCiAJ
CQlnb3RvIGRldGFjaDsKLQl9IGVsc2UgewotCQlpZiAoYm8tPnNndC0+bmVudHMgPiAxKSB7Ci0J
CQllcnIgPSAtRUlOVkFMOwotCQkJZ290byBkZXRhY2g7Ci0JCX0KLQotCQliby0+aW92YSA9IHNn
X2RtYV9hZGRyZXNzKGJvLT5zZ3QtPnNnbCk7CiAJfQogCiAJYm8tPmdlbS5pbXBvcnRfYXR0YWNo
ID0gYXR0YWNoOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
