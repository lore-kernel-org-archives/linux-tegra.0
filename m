From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] platform: release IOMMU's mm upon exit
Date: Fri, 20 Mar 2015 19:41:04 +0900
Message-ID: <1426848066-13700-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

bnZrbV9tbV9maW5pKCkgd2FzIG5vdCBjYWxsZWQgd2hlbiBleGl0aW5nIHRoZSBkcml2ZXIsIHJl
c3VsdGluZyBpbiBhCm1lbW9yeSBsZWFrLiBGaXggdGhpcy4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgotLS0KIGRybS9ub3V2ZWF1L25vdXZl
YXVfcGxhdGZvcm0uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0Zm9ybS5jIGIvZHJtL25vdXZlYXUvbm91
dmVhdV9wbGF0Zm9ybS5jCmluZGV4IDM2OTE5ODI0NTJhOS4uZjgzYWExMmVlNWM2IDEwMDY0NAot
LS0gYS9kcm0vbm91dmVhdS9ub3V2ZWF1X3BsYXRmb3JtLmMKKysrIGIvZHJtL25vdXZlYXUvbm91
dmVhdV9wbGF0Zm9ybS5jCkBAIC0xNTIsNiArMTUyLDcgQEAgc3RhdGljIHZvaWQgbm91dmVhdV9w
bGF0Zm9ybV9yZW1vdmVfaW9tbXUoc3RydWN0IGRldmljZSAqZGV2LAogCQkJCQkgIHN0cnVjdCBu
b3V2ZWF1X3BsYXRmb3JtX2dwdSAqZ3B1KQogewogCWlmIChncHUtPmlvbW11LmRvbWFpbikgewor
CQludmttX21tX2ZpbmkoJmdwdS0+aW9tbXUuX21tKTsKIAkJaW9tbXVfZGV0YWNoX2RldmljZShn
cHUtPmlvbW11LmRvbWFpbiwgZGV2KTsKIAkJaW9tbXVfZG9tYWluX2ZyZWUoZ3B1LT5pb21tdS5k
b21haW4pOwogCX0KLS0gCjIuMy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
