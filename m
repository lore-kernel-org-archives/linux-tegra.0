From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/10] drm/tegra: dpaux: Use unsigned int for register offsets
Date: Tue, 15 Aug 2017 15:41:06 +0200
Message-ID: <20170815134114.17547-2-thierry.reding@gmail.com>
References: <20170815134114.17547-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170815134114.17547-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJlZ2lzdGVyIG9mZnNl
dHMgYXJlIHVzdWFsbHkgZmFpcmx5IHNtYWxsIG51bWJlcnMsIHNvIGFuIHVuc2lnbmVkIGludCBp
cwptb3JlIHRoYW4gZW5vdWdoIHRvIHJlcHJlc2VudCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZHBhdXguYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcGF1eC5jCmluZGV4IDlkNDYyOTAyMWZiMi4uNzkzY2I0
YWQ5OWM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYwpAQCAtNjUsMTMgKzY1LDEzIEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHRlZ3JhX2RwYXV4ICp3b3JrX3RvX2RwYXV4KHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKIH0KIAogc3RhdGljIGlubGluZSB1MzIgdGVncmFfZHBhdXhfcmVhZGwoc3RydWN0
IHRlZ3JhX2RwYXV4ICpkcGF1eCwKLQkJCQkgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQpCisJCQkJ
ICAgIHVuc2lnbmVkIGludCBvZmZzZXQpCiB7CiAJcmV0dXJuIHJlYWRsKGRwYXV4LT5yZWdzICsg
KG9mZnNldCA8PCAyKSk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCB0ZWdyYV9kcGF1eF93cml0
ZWwoc3RydWN0IHRlZ3JhX2RwYXV4ICpkcGF1eCwKLQkJCQkgICAgICB1MzIgdmFsdWUsIHVuc2ln
bmVkIGxvbmcgb2Zmc2V0KQorCQkJCSAgICAgIHUzMiB2YWx1ZSwgdW5zaWduZWQgaW50IG9mZnNl
dCkKIHsKIAl3cml0ZWwodmFsdWUsIGRwYXV4LT5yZWdzICsgKG9mZnNldCA8PCAyKSk7CiB9Ci0t
IAoyLjEzLjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
