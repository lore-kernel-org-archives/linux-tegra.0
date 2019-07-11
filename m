From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 17/23] drm/ast: Provide ddc symlink in connector sysfs
 directory
Date: Thu, 11 Jul 2019 13:26:44 +0200
Message-ID: <d3651bd2fd8ba69b8380304bca4c629a8c1da4e9.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cover.1562843413.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1562843413.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1562843413.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: "Y.C. Chen" <yc_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Ramalingam C <ramalingam.c-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vincent Abriou <vincent.abriou@s>
List-Id: linux-tegra@vger.kernel.org

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDkgKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21vZGUuYwppbmRleCBmZmNjYmVmOTYyYTQuLjFjYTliYzRhYTNiYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21vZGUuYwpAQCAtODkwLDYgKzg5MCwxMSBAQCBzdGF0aWMgaW50IGFzdF9jb25uZWN0b3Jf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWNvbm5l
Y3RvciA9ICZhc3RfY29ubmVjdG9yLT5iYXNlOworCWFzdF9jb25uZWN0b3ItPmkyYyA9IGFzdF9p
MmNfY3JlYXRlKGRldik7CisJaWYgKCFhc3RfY29ubmVjdG9yLT5pMmMpCisJCURSTV9FUlJPUigi
ZmFpbGVkIHRvIGFkZCBkZGMgYnVzIGZvciBjb25uZWN0b3JcbiIpOworCisJY29ubmVjdG9yLT5k
ZGMgPSAmYXN0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyOwogCWRybV9jb25uZWN0b3JfaW5pdChk
ZXYsIGNvbm5lY3RvciwgJmFzdF9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RFX0NPTk5FQ1RPUl9W
R0EpOwogCiAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJmFzdF9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzKTsKQEAgLTkwNCwxMCArOTA5LDYgQEAgc3RhdGljIGludCBhc3RfY29u
bmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAllbmNvZGVyID0gbGlzdF9maXJz
dF9lbnRyeSgmZGV2LT5tb2RlX2NvbmZpZy5lbmNvZGVyX2xpc3QsIHN0cnVjdCBkcm1fZW5jb2Rl
ciwgaGVhZCk7CiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29k
ZXIpOwogCi0JYXN0X2Nvbm5lY3Rvci0+aTJjID0gYXN0X2kyY19jcmVhdGUoZGV2KTsKLQlpZiAo
IWFzdF9jb25uZWN0b3ItPmkyYykKLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWRkIGRkYyBidXMg
Zm9yIGNvbm5lY3RvclxuIik7Ci0KIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
