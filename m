From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nouveau: add coherent BO attribute
Date: Wed, 22 Apr 2015 18:08:08 +0900
Message-ID: <CAAVeFuKoryrWPcDkcFuk+OwJjaUn6C-he+xxphkZ7iMBa=Qdkg@mail.gmail.com>
References: <1426228051-20298-1-git-send-email-acourbot@nvidia.com>
 <55033B99.4040300@canonical.com> <550545A4.6060106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <550545A4.6060106-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCBNYXIgMTUsIDIwMTUgYXQgNTo0MSBQTSwgQWxleGFuZHJlIENvdXJib3QgPGFjb3Vy
Ym90QG52aWRpYS5jb20+IHdyb3RlOgo+IE9uIDAzLzE0LzIwMTUgMDQ6MzMgQU0sIE1hYXJ0ZW4g
TGFua2hvcnN0IHdyb3RlOgo+Pgo+PiBIZXksCj4+Cj4+IE9wIDEzLTAzLTE1IG9tIDA3OjI3IHNj
aHJlZWYgQWxleGFuZHJlIENvdXJib3Q6Cj4+Pgo+Pj4gQWRkIGEgZmxhZyBhbGxvd2luZyBOb3V2
ZWF1IHRvIHNwZWNpZnkgdGhhdCBhbiBvYmplY3Qgc2hvdWxkIGJlIGNvaGVyZW50Cj4+PiBhdCBh
bGxvY2F0aW9uIHRpbWUuIFRoaXMgaXMgcmVxdWlyZWQgZm9yIHNvbWUgY2xhc3Mgb2Ygb2JqZWN0
cyBsaWtlCj4+PiBmZW5jZXMgd2hpY2ggYXJlIHJhbmRvbWx5LWFjY2Vzc2VkIGJ5IGJvdGggdGhl
IENQVSBhbmQgR1BVLiBUaGlzIGZsYWcKPj4+IGluc3RydWN0cyB0aGUga2VybmVsIGRyaXZlciB0
byBtYWtlIHN1cmUgdGhlIG9iamVjdCByZW1haW5zIGNvaGVyZW50Cj4+PiBldmVuIG9uIGFyY2hp
dGVjdHVyZXMgZm9yIHdoaWNoIGNvaGVyZW5jeSBpcyBub3QgZ3VhcmFudGVlZCBieSB0aGUgYnVz
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlk
aWEuY29tPgo+Pgo+PiBJIGRvbid0IHNlZSBhIHByb2JsZW0gd2l0aCB0aGlzIHBhdGNoLCBidXQg
c2ltaWxhciBwYXRjaGVzIHRvIGludGVsIHRvCj4+IGxpYmRybSBoYXZlIGJlZW4gc2hvdCBkb3du
IHdoZW4gdGhlIGNoYW5nZXMgd2VyZW4ndCBpbiBhbiBvZmZpY2lhbCBrZXJuZWwKPj4geWV0LCBz
byBJIHRoaW5rIHRoaXMgc2hvdWxkIHdhaXQgdW50aWwgdGhlIGNoYW5nZSBpcyBhdCBsZWFzdCBp
biBkcm0tbmV4dC4KPj4gOy0pCj4KPgo+IFNvdW5kcyBnb29kLiBJIHdpbGwgcGluZyB5b3UgYWdh
aW4gb25jZSB0aGUga2VybmVsIGNoYW5nZSByZWFjaGVzIC1uZXh0LgoKSGkgTWFydGVlbiwKClRo
ZSBrZXJuZWwgY2hhbmdlIHJlcXVpcmVkIGZvciB0aGlzIHBhdGNoIGlzIG5vdyBpbiAtbmV4dC4g
RG8geW91CnRoaW5rIHdlIGNhbiBtZXJnZSBpdCBub3c/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
