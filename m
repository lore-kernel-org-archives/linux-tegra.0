From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 02/13] drm/radeon: Eliminate possible use of an
 uninitialized variable
Date: Wed, 31 Jul 2019 18:58:11 +0200
Message-ID: <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564591626.git.andrzej.p@collabora.com>
References: <cover.1564591626.git.andrzej.p@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>, Harry Wentland <harry.wentland@amd.com>, freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Leo Li <sunpeng.li@>
List-Id: linux-tegra@vger.kernel.org

ZGRjIGxvY2FsIHZhcmlhYmxlIGlzIHBhc3NlZCB0byBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9k
ZGMoKSBhbmQgc2hvdWxkCmJlIE5VTEwgaWYgbm8gZGRjIGlzIGF2YWlsYWJsZS4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jCmluZGV4IGIzYWQ4ZDg5MDgwMS4uZDExMTMx
ZDAzZWQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0
b3JzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jCkBA
IC0xODcwLDcgKzE4NzAsNyBAQCByYWRlb25fYWRkX2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCiAJc3RydWN0IHJhZGVvbl9jb25uZWN0b3JfYXRvbV9kaWcgKnJhZGVvbl9k
aWdfY29ubmVjdG9yOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlzdHJ1Y3QgcmFk
ZW9uX2VuY29kZXIgKnJhZGVvbl9lbmNvZGVyOwotCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwor
CXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjID0gTlVMTDsKIAl1aW50MzJfdCBzdWJwaXhlbF9vcmRl
ciA9IFN1YlBpeGVsTm9uZTsKIAlib29sIHNoYXJlZF9kZGMgPSBmYWxzZTsKIAlib29sIGlzX2Rw
X2JyaWRnZSA9IGZhbHNlOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1nZng=
