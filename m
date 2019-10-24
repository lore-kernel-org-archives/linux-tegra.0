From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 23/32] drm/tegra: sor: Use correct SOR index on Tegra210
Date: Thu, 24 Oct 2019 18:45:25 +0200
Message-ID: <20191024164534.132764-24-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkZXZpY2UgdHJl
ZSBiaW5kaW5ncyBmb3IgdGhlIFRlZ3JhMjEwIFNPUiBkb24ndCByZXF1aXJlIHRoZQpjb250cm9s
bGVyIGluc3RhbmNlIHRvIGJlIGRlZmluZWQsIHNpbmNlIHRoZSBpbnN0YW5jZSBjYW4gYmUgZGVy
aXZlZApmcm9tIHRoZSBjb21wYXRpYmxlIHN0cmluZy4gVGhlIGluZGV4IGlzIG5ldmVyIHVzZWQg
b24gVGVncmEyMTAsIHNvIHdlCmdvdCBhd2F5IHdpdGggaXQgbm90IGdldHRpbmcgc2V0LiBIb3dl
dmVyLCBzdWJzZXF1ZW50IHBhdGNoZXMgd2lsbApjaGFuZ2UgdGhhdCwgc28gbWFrZSBzdXJlIHRo
ZSBwcm9wZXIgaW5kZXggaXMgdXNlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0
cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRl
eCA0ZTQ2NTI0ZjIyZTMuLmM3ZmFmMDg4Y2FiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMzc1OSw2
ICszNzU5LDExIEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3BhcnNlX2R0KHN0cnVjdCB0ZWdyYV9z
b3IgKnNvcikKIAkJICogZWFybGllcgogCQkgKi8KIAkJc29yLT5wYWQgPSBURUdSQV9JT19QQURf
SERNSV9EUDAgKyBzb3ItPmluZGV4OworCX0gZWxzZSB7CisJCWlmIChzb3ItPnNvYy0+c3VwcG9y
dHNfZWRwKQorCQkJc29yLT5pbmRleCA9IDA7CisJCWVsc2UKKwkJCXNvci0+aW5kZXggPSAxOwog
CX0KIAogCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5wLCAibnZpZGlhLHhiYXIt
Y2ZnIiwgeGJhcl9jZmcsIDUpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
