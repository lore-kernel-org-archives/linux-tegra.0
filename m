From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 05/20] drm: fsl-dcu: Rely on the default
	->best_encoder() behavior
Date: Thu,  2 Jun 2016 16:31:32 +0200
Message-ID: <1464877907-27723-6-git-send-email-boris.brezillon@free-electrons.com>
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
cyBhbmQgdGhlCmRyaXZlciBpcyByZWx5aW5nIG9uIHRoZSBhdG9taWMgaGVscGVyczogd2UgY2Fu
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGFuZCBsZXQgdGhlIGNvcmUgY2FsbCBk
cm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKQpmb3IgdXMuCgpTaWduZWQtb2ZmLWJ5OiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgfCA5IC0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2ZzbC1kY3UvZnNsX2RjdV9kcm1fcmdiLmMgYi9kcml2ZXJzL2dwdS9kcm0vZnNsLWRjdS9m
c2xfZGN1X2RybV9yZ2IuYwppbmRleCA5OGM5OThkLi4wYjA5ODllIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZnNsLWRjdS9mc2xfZGN1X2RybV9yZ2IuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZnNsLWRjdS9mc2xfZGN1X2RybV9yZ2IuYwpAQCAtMTAyLDE0ICsxMDIsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgZnNsX2RjdV9kcm1fY29ubmVjdG9yX2Z1
bmNzID0gewogCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCwKIH07
CiAKLXN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKgotZnNsX2RjdV9kcm1fY29ubmVjdG9yX2Jl
c3RfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQotewotCXN0cnVjdCBm
c2xfZGN1X2RybV9jb25uZWN0b3IgKmZzbF9jb24gPSB0b19mc2xfZGN1X2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOwotCi0JcmV0dXJuIGZzbF9jb24tPmVuY29kZXI7Ci19Ci0KIHN0YXRpYyBpbnQgZnNs
X2RjdV9kcm1fY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQogewogCXN0cnVjdCBmc2xfZGN1X2RybV9jb25uZWN0b3IgKmZzbF9jb25uZWN0b3I7CkBA
IC0xMzYsNyArMTI4LDYgQEAgc3RhdGljIGludCBmc2xfZGN1X2RybV9jb25uZWN0b3JfbW9kZV92
YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogfQogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGNvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mg
PSB7Ci0JLmJlc3RfZW5jb2RlciA9IGZzbF9kY3VfZHJtX2Nvbm5lY3Rvcl9iZXN0X2VuY29kZXIs
CiAJLmdldF9tb2RlcyA9IGZzbF9kY3VfZHJtX2Nvbm5lY3Rvcl9nZXRfbW9kZXMsCiAJLm1vZGVf
dmFsaWQgPSBmc2xfZGN1X2RybV9jb25uZWN0b3JfbW9kZV92YWxpZCwKIH07Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
