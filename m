From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 17/20] drm/bridge: anx78xx: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:44 +0200
Message-ID: <1464877907-27723-18-git-send-email-boris.brezillon@free-electrons.com>
References: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1464877907-27723-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Stefan Agner <stefan@agner.ch>, virtualization@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexey Brodkin <abrodkin@synopsys.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.>
List-Id: linux-tegra@vger.kernel.org

V2UgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFuZCBlbmNvZGVy
cywgYW5kIHRoZSBkcml2ZXIKaXMgcmVseWluZyBvbiB0aGUgYXRvbWljIGhlbHBlcnM6IHdlIGNh
biBkcm9wIHRoZSBjdXN0b20gLT5iZXN0X2VuY29kZXIoKSwKYW5kIGxldCB0aGUgY29yZSBjYWxs
IGRybV9hdG9taWNfaGVscGVyX2Jlc3RfZW5jb2RlcigpIGZvciB1cy4KClNpZ25lZC1vZmYtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDggLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC1hbng3OHh4LmMKaW5kZXggZDA4N2IwNS4uZjlmMDNiYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKQEAgLTk4NiwxNiArOTg2LDggQEAgdW5sb2Nr
OgogCXJldHVybiBudW1fbW9kZXM7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKmFu
eDc4eHhfYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi17Ci0J
c3RydWN0IGFueDc4eHggKmFueDc4eHggPSBjb25uZWN0b3JfdG9fYW54Nzh4eChjb25uZWN0b3Ip
OwotCi0JcmV0dXJuIGFueDc4eHgtPmJyaWRnZS5lbmNvZGVyOwotfQotCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGFueDc4eHhfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyA9IHsKIAkuZ2V0X21vZGVzID0gYW54Nzh4eF9nZXRfbW9kZXMsCi0JLmJlc3RfZW5j
b2RlciA9IGFueDc4eHhfYmVzdF9lbmNvZGVyLAogfTsKIAogc3RhdGljIGVudW0gZHJtX2Nvbm5l
Y3Rvcl9zdGF0dXMgYW54Nzh4eF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
