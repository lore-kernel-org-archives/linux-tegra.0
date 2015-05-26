From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] nouveau: add coherent BO attribute
Date: Tue, 26 May 2015 20:46:07 +0000
Message-ID: <5564DB8F.3050405@gmail.com>
References: <1432188508-650-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv5qW74Lp5pYke-4GKi2BYgXot2SM93T_aZX=rztWwGJHA@mail.gmail.com>
 <555E228B.9090400@free.fr>
 <CAAVeFuJHL664jbsEBUYFp0atnuF3gisbwhJhR-R=cy+iB8gUCg@mail.gmail.com>
 <55616F1E.7020602@mblankhorst.nl>
 <CAAVeFuJ4oNi-_ALd3NRNeje7wNntcJ5QME2TWHKTBVWzE0yG1w@mail.gmail.com>
 <5564C430.7000900@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5564C430.7000900@free.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@free.fr>, Alexandre Courbot <gnurou@gmail.com>, Maarten Lankhorst <maarten@mblankhorst.nl>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, emil.l.velikov@gmail.com, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

T24gMjYvMDUvMTUgMTk6MDYsIE1hcnRpbiBQZXJlcyB3cm90ZToKPiBPbiAyNi8wNS8yMDE1IDE2
OjIzLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToKPj4gT24gU3VuLCBNYXkgMjQsIDIwMTUgYXQg
MzoyNiBQTSwgTWFhcnRlbiBMYW5raG9yc3QKPj4gPG1hYXJ0ZW5AbWJsYW5raG9yc3Qubmw+IHdy
b3RlOgo+Pj4gT3AgMjMtMDUtMTUgb20gMDg6NDUgc2NocmVlZiBBbGV4YW5kcmUgQ291cmJvdDoK
Pj4+PiBPbiBGcmksIE1heSAyMiwgMjAxNSBhdCAzOjIzIEFNLCBNYXJ0aW4gUGVyZXMgPG1hcnRp
bi5wZXJlc0BmcmVlLmZyPgo+Pj4+IHdyb3RlOgo+Pj4+PiBPbiAyMS8wNS8yMDE1IDExOjQ3LCBC
ZW4gU2tlZ2dzIHdyb3RlOgo+Pj4+Pj4gT24gMjEgTWF5IDIwMTUgYXQgMTY6MDgsIEFsZXhhbmRy
ZSBDb3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPgo+Pj4+Pj4gd3JvdGU6Cj4+Pj4+Pj4gQWRk
IGEgZmxhZyBhbGxvd2luZyBOb3V2ZWF1IHRvIHNwZWNpZnkgdGhhdCBhbiBvYmplY3Qgc2hvdWxk
IGJlCj4+Pj4+Pj4gY29oZXJlbnQKPj4+Pj4+PiBhdCBhbGxvY2F0aW9uIHRpbWUuIFRoaXMgaXMg
cmVxdWlyZWQgZm9yIHNvbWUgY2xhc3Mgb2Ygb2JqZWN0cyBsaWtlCj4+Pj4+Pj4gZmVuY2VzIHdo
aWNoIGFyZSByYW5kb21seS1hY2Nlc3NlZCBieSBib3RoIHRoZSBDUFUgYW5kIEdQVS4gVGhpcwo+
Pj4+Pj4+IGZsYWcKPj4+Pj4+PiBpbnN0cnVjdHMgdGhlIGtlcm5lbCBkcml2ZXIgdG8gbWFrZSBz
dXJlIHRoZSBvYmplY3QgcmVtYWlucyBjb2hlcmVudAo+Pj4+Pj4+IGV2ZW4gb24gYXJjaGl0ZWN0
dXJlcyBmb3Igd2hpY2ggY29oZXJlbmN5IGlzIG5vdCBndWFyYW50ZWVkIGJ5Cj4+Pj4+Pj4gdGhl
IGJ1cy4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxh
Y291cmJvdEBudmlkaWEuY29tPgo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KPj4+Pj4gUHVzaGVkIQo+Pj4+IFRoYW5rcyEgU2hvdWxkIHdlIGFsc28g
YnVtcCB0aGUgQUJJIHZlcnNpb24gb3Igc29tZXRoaW5nPwo+Pj4gSWYgeW91IG1lYW4gY2hhbmdp
bmcgbGliZHJtX25vdXZlYXUuc28uMiB0byAuc28uMyBubyEgSWYgeW91IG1lYW4KPj4+IGhhdmlu
ZyBzb21ldGhpbmcgdGhhdCBwa2ctY29uZmlnIGNhbiBwaWNrIHVwIHRoYXQncyBkb25lCj4+PiBh
dXRvbWF0aWNhbGx5IG9uIGV2ZXJ5IGRybSByZWxlYXNlLgo+PiBTb3JyeSBmb3Igbm90IGhhdmlu
ZyBiZWVuIGNsZWFyLiBJIHdhcyB0YWxraW5nIGFib3V0IGNoZWNraW5nIGFnYWluc3QKPj4gdGhl
IGRyaXZlciB2ZXJzaW9uIHRvIGVuc3VyZSBpdCBzdXBwb3J0cyBhbGwgdGhlIGZlYXR1cmVzIHRo
YXQgbGliZHJtCj4+IGNhbiB0aHJvdyBhdCBpdC4gV2UgaW5jcmVhc2VkIHRoZSBtb2R1bGVzJ3Mg
dmVyc2lvbiB0byAxLjIuMiB3aGVuCj4+IGFkZGluZyB0aGUgY29oZXJlbnQgZmxhZzoKPj4KPj4g
ZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uaDoKPj4gICAqIDEuMi4yOgo+PiAgICogICAgICAtIGFk
ZCBOT1VWRUFVX0dFTV9ET01BSU5fQ09IRVJFTlQgZmxhZwo+IAo+IFRoYXQgd2lsbCBiZSB0aGUg
am9iIG9mIG1lc2EgdG8gY2hlY2sgdGhlIERSTSB2ZXJzaW9uLCBJIHdvdWxkIGd1ZXNzLgpQcmVj
aXNlbHkuIEl0J3MgdXAtdG8gdGhlIHVzZXIgb2Ygbm91dmVhdV9ib19uZXcoKSB0byBjaGVjayBm
b3IgaXQuCgpTZWFyY2ggZm9yIGRybV92ZXJzaW9uIGluIHNyYy9nYWxsaXVtL2RyaXZlcnMvbm91
dmVhdSB0byBzZWUgaG93IHdlCmFscmVhZHkgZG8gaXQgZm9yIHNpbWlsYXIgY2hhbmdlcy4KCi1F
bWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
