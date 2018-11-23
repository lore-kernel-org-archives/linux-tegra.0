From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] drm/tegra: falcon: Wait for memory scrubbing to complete
Date: Fri, 23 Nov 2018 13:06:39 +0100
Message-ID: <20181123120639.16706-3-thierry.reding@gmail.com>
References: <20181123120639.16706-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181123120639.16706-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkJlZm9yZSBib290aW5n
IHRoZSBGYWxjb24gcHJvY2Vzc29yLCBtYWtlIHN1cmUgdG8gd2FpdCBmb3IgbWVtb3J5CnNjcnVi
YmluZyB0byBjb21wbGV0ZS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZhbGNvbi5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9mYWxjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYWxjb24u
YwppbmRleCA3OGM3YTAxNTY2MDEuLjM1MmQwNWZlYWJiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2ZhbGNvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYWxjb24u
YwpAQCAtMTk3LDExICsxOTcsMTkgQEAgdm9pZCBmYWxjb25fZXhpdChzdHJ1Y3QgZmFsY29uICpm
YWxjb24pCiBpbnQgZmFsY29uX2Jvb3Qoc3RydWN0IGZhbGNvbiAqZmFsY29uKQogewogCXVuc2ln
bmVkIGxvbmcgb2Zmc2V0OworCXUzMiB2YWx1ZTsKIAlpbnQgZXJyOwogCiAJaWYgKCFmYWxjb24t
PmZpcm13YXJlLnZhZGRyKQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCWVyciA9IHJlYWRsX3BvbGxf
dGltZW91dChmYWxjb24tPnJlZ3MgKyBGQUxDT05fRE1BQ1RMLCB2YWx1ZSwKKwkJCQkgKHZhbHVl
ICYgKEZBTENPTl9ETUFDVExfSU1FTV9TQ1JVQkJJTkcgfAorCQkJCQkgICBGQUxDT05fRE1BQ1RM
X0RNRU1fU0NSVUJCSU5HKSkgPT0gMCwKKwkJCQkgMTAsIDEwMDAwKTsKKwlpZiAoZXJyIDwgMCkK
KwkJcmV0dXJuIGVycjsKKwogCWZhbGNvbl93cml0ZWwoZmFsY29uLCAwLCBGQUxDT05fRE1BQ1RM
KTsKIAogCS8qIHNldHVwIHRoZSBhZGRyZXNzIG9mIHRoZSBiaW5hcnkgZGF0YSBzbyBGYWxjb24g
Y2FuIGFjY2VzcyBpdCBsYXRlciAqLwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
