From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] nouveau: add coherent BO attribute
Date: Tue, 26 May 2015 22:23:17 +0900
Message-ID: <CAAVeFuJ4oNi-_ALd3NRNeje7wNntcJ5QME2TWHKTBVWzE0yG1w@mail.gmail.com>
References: <1432188508-650-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv5qW74Lp5pYke-4GKi2BYgXot2SM93T_aZX=rztWwGJHA@mail.gmail.com>
 <555E228B.9090400@free.fr>
 <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg@mail.gmail.com>
 <55616F1E.7020602@mblankhorst.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55616F1E.7020602@mblankhorst.nl>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten@mblankhorst.nl>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gU3VuLCBNYXkgMjQsIDIwMTUgYXQgMzoyNiBQTSwgTWFhcnRlbiBMYW5raG9yc3QKPG1hYXJ0
ZW5AbWJsYW5raG9yc3Qubmw+IHdyb3RlOgo+IE9wIDIzLTA1LTE1IG9tIDA4OjQ1IHNjaHJlZWYg
QWxleGFuZHJlIENvdXJib3Q6Cj4+IE9uIEZyaSwgTWF5IDIyLCAyMDE1IGF0IDM6MjMgQU0sIE1h
cnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGZyZWUuZnI+IHdyb3RlOgo+Pj4gT24gMjEvMDUvMjAx
NSAxMTo0NywgQmVuIFNrZWdncyB3cm90ZToKPj4+PiBPbiAyMSBNYXkgMjAxNSBhdCAxNjowOCwg
QWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+IHdyb3RlOgo+Pj4+PiBBZGQg
YSBmbGFnIGFsbG93aW5nIE5vdXZlYXUgdG8gc3BlY2lmeSB0aGF0IGFuIG9iamVjdCBzaG91bGQg
YmUgY29oZXJlbnQKPj4+Pj4gYXQgYWxsb2NhdGlvbiB0aW1lLiBUaGlzIGlzIHJlcXVpcmVkIGZv
ciBzb21lIGNsYXNzIG9mIG9iamVjdHMgbGlrZQo+Pj4+PiBmZW5jZXMgd2hpY2ggYXJlIHJhbmRv
bWx5LWFjY2Vzc2VkIGJ5IGJvdGggdGhlIENQVSBhbmQgR1BVLiBUaGlzIGZsYWcKPj4+Pj4gaW5z
dHJ1Y3RzIHRoZSBrZXJuZWwgZHJpdmVyIHRvIG1ha2Ugc3VyZSB0aGUgb2JqZWN0IHJlbWFpbnMg
Y29oZXJlbnQKPj4+Pj4gZXZlbiBvbiBhcmNoaXRlY3R1cmVzIGZvciB3aGljaCBjb2hlcmVuY3kg
aXMgbm90IGd1YXJhbnRlZWQgYnkgdGhlIGJ1cy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6
IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPj4+Cj4+PiBQdXNoZWQhCj4+IFRoYW5r
cyEgU2hvdWxkIHdlIGFsc28gYnVtcCB0aGUgQUJJIHZlcnNpb24gb3Igc29tZXRoaW5nPwo+IElm
IHlvdSBtZWFuIGNoYW5naW5nIGxpYmRybV9ub3V2ZWF1LnNvLjIgdG8gLnNvLjMgbm8hIElmIHlv
dSBtZWFuIGhhdmluZyBzb21ldGhpbmcgdGhhdCBwa2ctY29uZmlnIGNhbiBwaWNrIHVwIHRoYXQn
cyBkb25lIGF1dG9tYXRpY2FsbHkgb24gZXZlcnkgZHJtIHJlbGVhc2UuCgpTb3JyeSBmb3Igbm90
IGhhdmluZyBiZWVuIGNsZWFyLiBJIHdhcyB0YWxraW5nIGFib3V0IGNoZWNraW5nIGFnYWluc3QK
dGhlIGRyaXZlciB2ZXJzaW9uIHRvIGVuc3VyZSBpdCBzdXBwb3J0cyBhbGwgdGhlIGZlYXR1cmVz
IHRoYXQgbGliZHJtCmNhbiB0aHJvdyBhdCBpdC4gV2UgaW5jcmVhc2VkIHRoZSBtb2R1bGVzJ3Mg
dmVyc2lvbiB0byAxLjIuMiB3aGVuCmFkZGluZyB0aGUgY29oZXJlbnQgZmxhZzoKCmRybS9ub3V2
ZWF1L25vdXZlYXVfZHJtLmg6CiAqIDEuMi4yOgogKiAgICAgIC0gYWRkIE5PVVZFQVVfR0VNX0RP
TUFJTl9DT0hFUkVOVCBmbGFnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
