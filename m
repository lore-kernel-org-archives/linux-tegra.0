From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 14/16] drm/tegra: vic: Do not clear driver data
Date: Fri,  1 Feb 2019 14:28:35 +0100
Message-ID: <20190201132837.12327-15-thierry.reding@gmail.com>
References: <20190201132837.12327-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190201132837.12327-1-thierry.reding@gmail.com>
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVwb24gZHJpdmVyIGZh
aWx1cmUsIHRoZSBkcml2ZXIgY29yZSB3aWxsIHRha2UgY2FyZSBvZiBjbGVhcmluZyB0aGUKZHJp
dmVyIGRhdGEsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBkbyBzbyBleHBsaWNpdGx5IGluIHRoZSBk
cml2ZXIuCgpSZXZpZXdlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvdmljLmMKaW5kZXggNzM5Yjg5NDY2MWFiLi41NWE4Y2MxNjJlOWQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvdmljLmMKQEAgLTQxMiw3ICs0MTIsNiBAQCBzdGF0aWMgaW50IHZpY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWVyciA9IGhvc3QxeF9jbGllbnRfcmVnaXN0
ZXIoJnZpYy0+Y2xpZW50LmJhc2UpOwogCWlmIChlcnIgPCAwKSB7CiAJCWRldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIHJlZ2lzdGVyIGhvc3QxeCBjbGllbnQ6ICVkXG4iLCBlcnIpOwotCQlwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YShwZGV2LCBOVUxMKTsKIAkJZ290byBleGl0X2ZhbGNvbjsKIAl9CiAKLS0g
CjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
