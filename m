From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/6] platform: recognize GM20B
Date: Tue, 23 Jun 2015 15:16:06 +0900
Message-ID: <1435040166-25651-7-git-send-email-acourbot@nvidia.com>
References: <1435040166-25651-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1435040166-25651-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

QWxsb3cgdGhlIHBsYXRmb3JtIGRyaXZlciB0byByZWNvZ25pemUgR00yMEIuCgpTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4KLS0tCiBkcm0vbm91
dmVhdS9ub3V2ZWF1X3BsYXRmb3JtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L25vdXZlYXVfcGxhdGZvcm0uYyBiL2RybS9u
b3V2ZWF1L25vdXZlYXVfcGxhdGZvcm0uYwppbmRleCBkY2ZiYmZhZjE3MzkuLjdhMzlkNDQ5ZmVm
YSAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbm91dmVhdV9wbGF0Zm9ybS5jCisrKyBiL2RybS9u
b3V2ZWF1L25vdXZlYXVfcGxhdGZvcm0uYwpAQCAtMjUyLDYgKzI1Miw3IEBAIHN0YXRpYyBpbnQg
bm91dmVhdV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICNp
ZiBJU19FTkFCTEVEKENPTkZJR19PRikKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG5vdXZlYXVfcGxhdGZvcm1fbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gIm52aWRpYSxn
azIwYSIgfSwKKwl7IC5jb21wYXRpYmxlID0gIm52aWRpYSxnbTIwYiIgfSwKIAl7IH0KIH07CiAK
LS0gCjIuNC40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
