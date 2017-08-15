From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/10] drm/tegra: hdmi: Use unsigned int for register offsets
Date: Tue, 15 Aug 2017 15:41:08 +0200
Message-ID: <20170815134114.17547-4-thierry.reding@gmail.com>
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
cmEvaGRtaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCmluZGV4IGE2MjFiMGRhNDA5Mi4uYWE3NTI1NjE5
ZjNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9oZG1pLmMKQEAgLTEwMCwxMyArMTAwLDEzIEBAIGVudW0gewogfTsK
IAogc3RhdGljIGlubGluZSB1MzIgdGVncmFfaGRtaV9yZWFkbChzdHJ1Y3QgdGVncmFfaGRtaSAq
aGRtaSwKLQkJCQkgICB1bnNpZ25lZCBsb25nIG9mZnNldCkKKwkJCQkgICB1bnNpZ25lZCBpbnQg
b2Zmc2V0KQogewogCXJldHVybiByZWFkbChoZG1pLT5yZWdzICsgKG9mZnNldCA8PCAyKSk7CiB9
CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCB0ZWdyYV9oZG1pX3dyaXRlbChzdHJ1Y3QgdGVncmFfaGRt
aSAqaGRtaSwgdTMyIHZhbHVlLAotCQkJCSAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQpCisJCQkJ
ICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0KQogewogCXdyaXRlbCh2YWx1ZSwgaGRtaS0+cmVncyAr
IChvZmZzZXQgPDwgMikpOwogfQotLSAKMi4xMy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
