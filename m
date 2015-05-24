From: Maarten Lankhorst <maarten-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Subject: Re: [PATCH v2] nouveau: add coherent BO attribute
Date: Sun, 24 May 2015 08:26:38 +0200
Message-ID: <55616F1E.7020602@mblankhorst.nl>
References: <1432188508-650-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv5qW74Lp5pYke-4GKi2BYgXot2SM93T_aZX=rztWwGJHA@mail.gmail.com>
 <555E228B.9090400@free.fr>
 <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T3AgMjMtMDUtMTUgb20gMDg6NDUgc2NocmVlZiBBbGV4YW5kcmUgQ291cmJvdDoKPiBPbiBGcmks
IE1heSAyMiwgMjAxNSBhdCAzOjIzIEFNLCBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BmcmVl
LmZyPiB3cm90ZToKPj4gT24gMjEvMDUvMjAxNSAxMTo0NywgQmVuIFNrZWdncyB3cm90ZToKPj4+
IE9uIDIxIE1heSAyMDE1IGF0IDE2OjA4LCBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZp
ZGlhLmNvbT4gd3JvdGU6Cj4+Pj4gQWRkIGEgZmxhZyBhbGxvd2luZyBOb3V2ZWF1IHRvIHNwZWNp
ZnkgdGhhdCBhbiBvYmplY3Qgc2hvdWxkIGJlIGNvaGVyZW50Cj4+Pj4gYXQgYWxsb2NhdGlvbiB0
aW1lLiBUaGlzIGlzIHJlcXVpcmVkIGZvciBzb21lIGNsYXNzIG9mIG9iamVjdHMgbGlrZQo+Pj4+
IGZlbmNlcyB3aGljaCBhcmUgcmFuZG9tbHktYWNjZXNzZWQgYnkgYm90aCB0aGUgQ1BVIGFuZCBH
UFUuIFRoaXMgZmxhZwo+Pj4+IGluc3RydWN0cyB0aGUga2VybmVsIGRyaXZlciB0byBtYWtlIHN1
cmUgdGhlIG9iamVjdCByZW1haW5zIGNvaGVyZW50Cj4+Pj4gZXZlbiBvbiBhcmNoaXRlY3R1cmVz
IGZvciB3aGljaCBjb2hlcmVuY3kgaXMgbm90IGd1YXJhbnRlZWQgYnkgdGhlIGJ1cy4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29t
Pgo+Pj4gUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPj4KPj4g
UHVzaGVkIQo+IFRoYW5rcyEgU2hvdWxkIHdlIGFsc28gYnVtcCB0aGUgQUJJIHZlcnNpb24gb3Ig
c29tZXRoaW5nPwpJZiB5b3UgbWVhbiBjaGFuZ2luZyBsaWJkcm1fbm91dmVhdS5zby4yIHRvIC5z
by4zIG5vISBJZiB5b3UgbWVhbiBoYXZpbmcgc29tZXRoaW5nIHRoYXQgcGtnLWNvbmZpZyBjYW4g
cGljayB1cCB0aGF0J3MgZG9uZSBhdXRvbWF0aWNhbGx5IG9uIGV2ZXJ5IGRybSByZWxlYXNlLgoK
fk1hYXJ0ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
