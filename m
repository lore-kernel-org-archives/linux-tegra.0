From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 07/20] drm: mediatek: Rely on the default
	->best_encoder() behavior
Date: Tue,  7 Jun 2016 13:48:02 +0200
Message-ID: <1465300095-16971-8-git-send-email-boris.brezillon@free-electrons.com>
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
IGRyb3AgdGhlIGN1c3RvbQotPmJlc3RfZW5jb2RlcigpIGltcGxlbWVudGF0aW9uIGFuZCBsZXQg
dGhlIGNvcmUgY2FsbApkcm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKSBmb3IgdXMuCgpT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0
cm9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDkgLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYwppbmRleCAyZDgwOGU1Li43MzQzZmZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHNpLmMKQEAgLTU3NSwxNCArNTc1LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX2Nvbm5lY3Rv
cl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlyZXR1cm4gZHJt
X3BhbmVsX2dldF9tb2Rlcyhkc2ktPnBhbmVsKTsKIH0KIAotc3RhdGljIHN0cnVjdCBkcm1fZW5j
b2RlciAqbXRrX2RzaV9jb25uZWN0b3JfYmVzdF9lbmNvZGVyKAotCQlzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQotewotCXN0cnVjdCBtdGtfZHNpICpkc2kgPSBjb25uZWN0b3JfdG9f
ZHNpKGNvbm5lY3Rvcik7Ci0KLQlyZXR1cm4gJmRzaS0+ZW5jb2RlcjsKLX0KLQogc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgbXRrX2RzaV9lbmNvZGVyX2hlbHBl
cl9mdW5jcyA9IHsKIAkubW9kZV9maXh1cCA9IG10a19kc2lfZW5jb2Rlcl9tb2RlX2ZpeHVwLAog
CS5tb2RlX3NldCA9IG10a19kc2lfZW5jb2Rlcl9tb2RlX3NldCwKQEAgLTYwMyw3ICs1OTUsNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgbXRrX2RzaV9jb25uZWN0
b3JfZnVuY3MgPSB7CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzCiAJbXRrX2RzaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9kZXMgPSBt
dGtfZHNpX2Nvbm5lY3Rvcl9nZXRfbW9kZXMsCi0JLmJlc3RfZW5jb2RlciA9IG10a19kc2lfY29u
bmVjdG9yX2Jlc3RfZW5jb2RlciwKIH07CiAKIHN0YXRpYyBpbnQgbXRrX2RybV9hdHRhY2hfYnJp
ZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApG
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
