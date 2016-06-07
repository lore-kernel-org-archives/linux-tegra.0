From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 03/20] drm: atmel-hlcdc: Rely on the default
	->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:47:58 +0200
Message-ID: <1465300095-16971-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1465300095-16971-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Inki Dae <inki.dae@sams>
List-Id: linux-tegra@vger.kernel.org

V2UgaGF2ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2VlbiBjb25uZWN0b3JzIGFuZCBlbmNvZGVy
cyBhbmQgdGhlCmRyaXZlciBpcyByZWx5aW5nIG9uIHRoZSBhdG9taWMgaGVscGVyczogd2UgY2Fu
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGFuZCBsZXQgdGhlIGNvcmUgY2FsbCBk
cm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKQpmb3IgdXMuCgpTaWduZWQtb2ZmLWJ5OiBC
b3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX291dHB1dC5jIHwgMTIgLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX291dHB1dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX291dHB1dC5jCmluZGV4IDNkMzRmYzQu
LjYxMTliNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19vdXRwdXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfb3V0cHV0LmMKQEAgLTExMywyMSArMTEzLDkgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19y
Z2JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCXJldHVybiBh
dG1lbF9obGNkY19kY19tb2RlX3ZhbGlkKHJnYi0+ZGMsIG1vZGUpOwogfQogCi0KLQotc3RhdGlj
IHN0cnVjdCBkcm1fZW5jb2RlciAqCi1hdG1lbF9obGNkY19yZ2JfYmVzdF9lbmNvZGVyKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi17Ci0Jc3RydWN0IGF0bWVsX2hsY2RjX3JnYl9v
dXRwdXQgKnJnYiA9Ci0JCQlkcm1fY29ubmVjdG9yX3RvX2F0bWVsX2hsY2RjX3JnYl9vdXRwdXQo
Y29ubmVjdG9yKTsKLQotCXJldHVybiAmcmdiLT5lbmNvZGVyOwotfQotCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGF0bWVsX2hsY2RjX3BhbmVsX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MgPSB7CiAJLmdldF9tb2RlcyA9IGF0bWVsX2hsY2RjX3BhbmVsX2dl
dF9tb2RlcywKIAkubW9kZV92YWxpZCA9IGF0bWVsX2hsY2RjX3JnYl9tb2RlX3ZhbGlkLAotCS5i
ZXN0X2VuY29kZXIgPSBhdG1lbF9obGNkY19yZ2JfYmVzdF9lbmNvZGVyLAogfTsKIAogc3RhdGlj
IGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
