From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH nouveau 05/11] platform: switch to the new gpu
	rail clamping function
Date: Tue, 23 Dec 2014 18:39:58 +0800
Message-ID: <1419331204-26679-6-git-send-email-vinceh@nvidia.com>
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

U2lnbmVkLW9mZi1ieTogVmluY2UgSHN1IDx2aW5jZWhAbnZpZGlhLmNvbT4KLS0tCiBkcm0vbm91
dmVhdV9wbGF0Zm9ybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXVfcGxhdGZvcm0uYyBiL2RybS9u
b3V2ZWF1X3BsYXRmb3JtLmMKaW5kZXggYjMwN2JiZWRkNGM0Li42ODc4OGIxN2E0NWMgMTAwNjQ0
Ci0tLSBhL2RybS9ub3V2ZWF1X3BsYXRmb3JtLmMKKysrIGIvZHJtL25vdXZlYXVfcGxhdGZvcm0u
YwpAQCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgaW50IG5vdXZlYXVfcGxhdGZvcm1fcG93ZXJfdXAo
c3RydWN0IG5vdXZlYXVfcGxhdGZvcm1fZ3B1ICpncHUpCiAJcmVzZXRfY29udHJvbF9hc3NlcnQo
Z3B1LT5yc3QpOwogCXVkZWxheSgxMCk7CiAKLQllcnIgPSB0ZWdyYV9wb3dlcmdhdGVfcmVtb3Zl
X2NsYW1waW5nKFRFR1JBX1BPV0VSR0FURV8zRCk7CisJZXJyID0gdGVncmFfcG93ZXJnYXRlX2dw
dV9zZXRfY2xhbXBpbmcoZmFsc2UpOwogCWlmIChlcnIpCiAJCWdvdG8gZXJyX2NsYW1wOwogCXVk
ZWxheSgxMCk7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
