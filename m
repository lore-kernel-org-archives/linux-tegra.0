From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/11] ARM: tegra: add mc node for Tegra124 GPU
Date: Tue, 23 Dec 2014 18:39:57 +0800
Message-ID: <1419331204-26679-5-git-send-email-vinceh@nvidia.com>
References: <1419331204-26679-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1419331204-26679-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, martin.peres-GANU6spQydw@public.gmane.org, seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org, samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

VGhlIFRlZ3JhMTI0IEdQVSBuZWVkcyB0aGUgbWVtb3J5IGNvbnRyb2xsZXIgZm9yIHRoZSBtZW1v
cnkgZmx1c2ggb3BlcmF0b2luLgpTbyBhZGQgdGhlIG5vZGUgcmVmZXJlbmNlIG9mIG1lbW9yeSBj
b250cm9sbGVyIGluIGRldmljZSB0cmVlLgoKU2lnbmVkLW9mZi1ieTogVmluY2UgSHN1IDx2aW5j
ZWhAbnZpZGlhLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNpIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy90ZWdyYTEyNC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvdGVncmExMjQuZHRzaQpp
bmRleCA0YmUwNmM2ZWEwYzguLjQxMDljNDU0OGI1NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvdGVncmExMjQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy90ZWdyYTEyNC5kdHNp
CkBAIC0xODcsNiArMTg3LDcgQEAKIAkJY2xvY2stbmFtZXMgPSAiZ3B1IiwgInB3ciI7CiAJCXJl
c2V0cyA9IDwmdGVncmFfY2FyIDE4ND47CiAJCXJlc2V0LW5hbWVzID0gImdwdSI7CisJCW1jID0g
PCZtYyBURUdSQV9TV0dST1VQX0dQVT47CiAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJfTsKIAot
LSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
