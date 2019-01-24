From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 13/13] arm64: tegra: Enable SMMU for VIC on Tegra186
Date: Thu, 24 Jan 2019 19:02:54 +0100
Message-ID: <20190124180254.20080-14-thierry.reding@gmail.com>
References: <20190124180254.20080-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190124180254.20080-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkVuYWJsZSBhZGRyZXNz
IHRyYW5zbGF0aW9uIGZvciBWSUMgdmlhIHRoZSBTTU1VIG9uIFRlZ3JhMTg2LgoKU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4Ni5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdy
YTE4Ni5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaQppbmRl
eCAyMjgxNWRiNGEzZWQuLmM1Y2RhMTNjODE5NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9udmlkaWEvdGVncmExODYuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRp
YS90ZWdyYTE4Ni5kdHNpCkBAIC03OTksNiArNzk5LDcgQEAKIAkJCXJlc2V0LW5hbWVzID0gInZp
YyI7CiAKIAkJCXBvd2VyLWRvbWFpbnMgPSA8JmJwbXAgVEVHUkExODZfUE9XRVJfRE9NQUlOX1ZJ
Qz47CisJCQlpb21tdXMgPSA8JnNtbXUgVEVHUkExODZfU0lEX1ZJQz47CiAJCX07CiAKIAkJZHNp
YjogZHNpQDE1NDAwMDAwIHsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
