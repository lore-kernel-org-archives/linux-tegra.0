From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/11] arm64: tegra: Enable GPU on Jetson TX2
Date: Mon, 16 Sep 2019 17:04:11 +0200
Message-ID: <20190916150412.10025-11-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190916150412.10025-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

RnJvbTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+CgpFbmFibGUgdGhl
IEdQVSBub2RlIGZvciB0aGUgSmV0c29uIFRYMiBib2FyZC4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5
IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMTg2LXAyNzcxLTAwMDAuZHRzIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVn
cmExODYtcDI3NzEtMDAwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE4
Ni1wMjc3MS0wMDAwLmR0cwppbmRleCBiZGFjZTAxNTYxYmEuLjZmN2M3YzRjNWMyOSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYtcDI3NzEtMDAwMC5kdHMK
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExODYtcDI3NzEtMDAwMC5kdHMK
QEAgLTI3Niw2ICsyNzYsMTAgQEAKIAkJfTsKIAl9OwogCisJZ3B1QDE3MDAwMDAwIHsKKwkJc3Rh
dHVzID0gIm9rYXkiOworCX07CisKIAlncGlvLWtleXMgewogCQljb21wYXRpYmxlID0gImdwaW8t
a2V5cyI7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
