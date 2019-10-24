From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 13/32] drm/tegra: dp: Enable alternate scrambler reset when
 supported
Date: Thu, 24 Oct 2019 18:45:15 +0200
Message-ID: <20191024164534.132764-14-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIGlz
IGVEUCBhbmQgc3VwcG9ydHMgdGhlIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQsIGVuYWJsZQpp
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCmluZGV4IGNhMjg3YjUwZmFkOC4uNjM4MDgx
YjU2OGY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwpAQCAtMjI1LDUgKzIyNSwxMiBAQCBpbnQgZHJtX2RwX2xp
bmtfY29uZmlndXJlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAq
bGluaykKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAorCWlmIChsaW5rLT5jYXBzLmFs
dGVybmF0ZV9zY3JhbWJsZXJfcmVzZXQpIHsKKwkJZXJyID0gZHJtX2RwX2RwY2Rfd3JpdGViKGF1
eCwgRFBfRURQX0NPTkZJR1VSQVRJT05fU0VULAorCQkJCQkgRFBfQUxURVJOQVRFX1NDUkFNQkxF
Ul9SRVNFVF9FTkFCTEUpOworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVybiBlcnI7CisJfQorCiAJ
cmV0dXJuIDA7CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
