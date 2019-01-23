From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: vic: Do not clear driver data
Date: Wed, 23 Jan 2019 14:42:34 +0100
Message-ID: <20190123134234.2625-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
cml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKaW5kZXggOWNiMTBkMWU5MjNhLi5kMjBmY2Jm
NjE5NmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKQEAgLTQxMiw3ICs0MTIsNiBAQCBzdGF0aWMgaW50IHZp
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWVyciA9IGhvc3QxeF9jbGll
bnRfcmVnaXN0ZXIoJnZpYy0+Y2xpZW50LmJhc2UpOwogCWlmIChlcnIgPCAwKSB7CiAJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGhvc3QxeCBjbGllbnQ6ICVkXG4iLCBlcnIpOwot
CQlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBOVUxMKTsKIAkJZ290byBleGl0X2ZhbGNvbjsK
IAl9CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
