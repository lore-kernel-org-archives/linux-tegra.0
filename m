From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPU-DRM-Tegra: Delete an unnecessary check before the
 function call "vunmap"
Date: Mon, 13 Jul 2015 23:16:17 +0900
Message-ID: <CAAVeFu+7cF-b0zneA7BTmNcanH9tnbzV32XOFiCbxnK4kz8buw@mail.gmail.com>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D335FA.6020101@users.sourceforge.net>
 <559D6E90.1040005@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <559D6E90.1040005@users.sourceforge.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>, Thierry Reding <thierry.reding@gmail.com>
Cc: =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBKdWwgOSwgMjAxNSBhdCAzOjQwIEFNLCBTRiBNYXJrdXMgRWxmcmluZwo8ZWxmcmlu
Z0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+PiBGcm9tOiBNYXJrdXMgRWxmcmluZyA8
ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4+IERhdGU6IFRodSwgNSBGZWIgMjAxNSAx
MDoxMjo1MSArMDEwMAo+Pgo+PiBUaGUgdnVubWFwKCkgZnVuY3Rpb24gcGVyZm9ybXMgYWxzbyBp
bnB1dCBwYXJhbWV0ZXIgdmFsaWRhdGlvbi4KPj4gVGh1cyB0aGUgdGVzdCBhcm91bmQgdGhlIGNh
bGwgaXMgbm90IG5lZWRlZC4KPj4KPj4gVGhpcyBpc3N1ZSB3YXMgZGV0ZWN0ZWQgYnkgdXNpbmcg
dGhlIENvY2NpbmVsbGUgc29mdHdhcmUuCgpUaGUgZml4IGlzIGNvcnJlY3QsIGJ1dCB0aGUgc3Vi
amVjdCBsb29rcyB3ZWlyZC4KIkdQVS1EUk0tVGVncmE6InNob3VsZCBiZSAiZHJtL3RlZ3JhOiIu
CgpPdGhlcndpc2UsCgpBY2tlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRp
YS5jb20+CgpNYXliZSBUaGllcnJ5IGNhbiB0YWtlIGl0IHRocm91Z2ggaGlzIHRyZWUgb25jZSB0
aGlzIGlzc3VlIGlzIGFkZHJlc3NlZD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
