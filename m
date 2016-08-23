From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/tegra: Modify error handling
Date: Tue, 23 Aug 2016 19:13:02 +0200
Message-ID: <CAAVeFuK=bFGCX8mw5aEZ88cRNQia9etyO98gh81dR3pKV4J_Rw@mail.gmail.com>
References: <20160815045409.GA12886@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20160815045409.GA12886@amitoj-Inspiron-3542>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBBdWcgMTUsIDIwMTYgYXQgNjo1NCBBTSwgQW1pdG9qIEthdXIgQ2hhd2xhCjxhbWl0
b2oxNjA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4gaW9tbXVfZG9tYWluX2FsbG9jIHJldHVybnMgTlVM
TCBvbiBlcnJvciBzbyByZXBsYWNlIGFuIGluY29ycmVjdAo+IElTX0VSUiBjaGVjayB3aXRoIGEg
TlVMTCBjaGVjay4KPgo+IFRoZSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoIHVzZWQgdG8gZmlu
ZCB0aGlzIGlzc3VlIGlzIGFzIGZvbGxvd3M6Cj4gQEAKPiBleHByZXNzaW9uIGU7Cj4gc3RhdGVt
ZW50IFM7Cj4gQEAKPgo+ICplID0gaW9tbXVfZG9tYWluX2FsbG9jKC4uLik7Cj4gaWYgKElTX0VS
UihlKSkgUwo+Cj4gU2lnbmVkLW9mZi1ieTogQW1pdG9qIEthdXIgQ2hhd2xhIDxhbWl0b2oxNjA2
QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZp
ZGlhLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
