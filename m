From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 1/6] arm64: tegra: Add #power-domain-cells for BPMP
Date: Thu, 17 Aug 2017 21:54:08 +0300
Message-ID: <20170817185413.6324-2-mperttunen@nvidia.com>
References: <20170817185413.6324-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170817185413.6324-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, dnibade@nvidia.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, amerilainen@nvidia.com, linux-tegra@vger.kernel.org, sgurrappadi@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>, digetx@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

QWRkICNwb3dlci1kb21haW4tY2VsbHMgZm9yIHRoZSBCUE1QIG5vZGUgb24gVGVncmExODYgc28g
dGhhdCB0aGUgcG93ZXIKZG9tYWluIHByb3ZpZGVyIG1heSBiZSB1c2VkLgoKU2lnbmVkLW9mZi1i
eTogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVuQG52aWRpYS5jb20+Ci0tLQogYXJjaC9hcm02
NC9ib290L2R0cy9udmlkaWEvdGVncmExODYuZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVn
cmExODYuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kKaW5k
ZXggMGIwNTUyYzlmN2RkLi5hOTY0ZDI0NmMwZTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbnZpZGlhL3RlZ3JhMTg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlk
aWEvdGVncmExODYuZHRzaQpAQCAtNDQzLDYgKzQ0Myw3IEBACiAJCXNobWVtID0gPCZjcHVfYnBt
cF90eCAmY3B1X2JwbXBfcng+OwogCQkjY2xvY2stY2VsbHMgPSA8MT47CiAJCSNyZXNldC1jZWxs
cyA9IDwxPjsKKwkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKIAogCQlicG1wX2kyYzogaTJj
IHsKIAkJCWNvbXBhdGlibGUgPSAibnZpZGlhLHRlZ3JhMTg2LWJwbXAtaTJjIjsKLS0gCjIuMTQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
