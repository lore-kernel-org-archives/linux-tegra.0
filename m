From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 13/14] drm/tegra: gem: Always map SG tables for DMA-BUFs
Date: Mon, 14 Oct 2019 14:50:48 +0200
Message-ID: <20191014125049.425101-14-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gYW4gaW1wb3J0
ZXIgd2FudHMgdG8gbWFwIGEgRE1BLUJVRiwgbWFrZSBzdXJlIHRvIGFsd2F5cyBhY3R1YWxseQpt
YXAgaXQsIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHRoZSBidWZmZXIgaXMgY29udGlndW91cyBv
ciBub3QuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRl
eCAzMzQ1Y2NlMTQ2NjIuLjAwNzAxY2FkYWNlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtNTE2LDE1
ICs1MTYsMTUgQEAgdGVncmFfZ2VtX3ByaW1lX21hcF9kbWFfYnVmKHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmF0dGFjaCwKIAogCQlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIGJvLT5udW1f
cGFnZXMsIGkpCiAJCQlzZ19zZXRfcGFnZShzZywgYm8tPnBhZ2VzW2ldLCBQQUdFX1NJWkUsIDAp
OwotCi0JCWlmIChkbWFfbWFwX3NnKGF0dGFjaC0+ZGV2LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywg
ZGlyKSA9PSAwKQotCQkJZ290byBmcmVlOwogCX0gZWxzZSB7CiAJCWlmIChkbWFfZ2V0X3NndGFi
bGUoYXR0YWNoLT5kZXYsIHNndCwgYm8tPnZhZGRyLCBiby0+aW92YSwKIAkJCQkgICAgZ2VtLT5z
aXplKSA8IDApCiAJCQlnb3RvIGZyZWU7CiAJfQogCisJaWYgKGRtYV9tYXBfc2coYXR0YWNoLT5k
ZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBkaXIpID09IDApCisJCWdvdG8gZnJlZTsKKwogCXJl
dHVybiBzZ3Q7CiAKIGZyZWU6Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
