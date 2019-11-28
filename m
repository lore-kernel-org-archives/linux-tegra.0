From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Date: Thu, 28 Nov 2019 16:37:33 +0100
Message-ID: <20191128153741.2380419-2-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkkgaGF2ZSBubyByZWNv
bGxlY3Rpb24gd2h5IHRoYXQgY2hlY2sgaXMgdGhlcmUsIGJ1dCBpdCBzZWVtcyB0byB0cmlnZ2Vy
CmFsbCB0aGUgdGltZSwgc28gcmVtb3ZlIGl0LiBFdmVyeXRoaW5nIHdvcmtzIGZpbmUgd2l0aG91
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYwppbmRleCA2YWNhMGZkNWE4ZTUuLmU1NmMwZjdk
M2ExMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9odWIuYwpAQCAtNjE1LDExICs2MTUsOCBAQCBzdGF0aWMgc3RydWN0
IHRlZ3JhX2Rpc3BsYXlfaHViX3N0YXRlICoKIHRlZ3JhX2Rpc3BsYXlfaHViX2dldF9zdGF0ZShz
dHJ1Y3QgdGVncmFfZGlzcGxheV9odWIgKmh1YiwKIAkJCSAgICBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0
YShodWItPmNsaWVudC5wYXJlbnQpOwogCXN0cnVjdCBkcm1fcHJpdmF0ZV9zdGF0ZSAqcHJpdjsK
IAotCVdBUk5fT04oIWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZHJtLT5tb2RlX2NvbmZpZy5jb25u
ZWN0aW9uX211dGV4KSk7Ci0KIAlwcml2ID0gZHJtX2F0b21pY19nZXRfcHJpdmF0ZV9vYmpfc3Rh
dGUoc3RhdGUsICZodWItPmJhc2UpOwogCWlmIChJU19FUlIocHJpdikpCiAJCXJldHVybiBFUlJf
Q0FTVChwcml2KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
