From: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 21:53:53 +0100
Message-ID: <50B679E1.5070205@shipmail.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
	<CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
	<50B46336.8030605@nvidia.com>
	<CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
	<50B476E1.4070403@nvidia.com>
	<CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
	<50B47DA8.60609@nvidia.com>	<1354011776.1479.31.camel@tellur>
	<20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
	<50B4A483.8030305@nvidia.com>
	<CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>
	<50B60EFF.1050703@nvidia.com> <1354109602.1479.66.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1354109602.1479.66.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gMTEvMjgvMjAxMiAwMjozMyBQTSwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gQW0gTWl0dHdvY2gs
IGRlbiAyOC4xMS4yMDEyLCAxNToxNyArMDIwMCBzY2hyaWViIFRlcmplIEJlcmdzdHLDtm06Cj4+
IE9uIDI4LjExLjIwMTIgMDE6MDAsIERhdmUgQWlybGllIHdyb3RlOgo+Pj4gV2UgIGdlbmVyYWxs
eSBhaW0gZm9yIHRoZSBmaXJzdCwgdG8gc3RvcCB0aGUgZ3B1IGZyb20gcmVhZGluZy93cml0aW5n
Cj4+PiBhbnkgbWVtb3J5IGl0IGhhc24ndCBiZWVuIGdyYW50ZWQgYWNjZXNzIHRvLAo+Pj4gdGhl
IHNlY29uZCBpcyBuaWNlIHRvIGhhdmUgdGhvdWdoLCBidXQgcmVhbGx5IHJlcXVpcmVzIGEgR1BV
IHdpdGggVk0KPj4+IHRvIGltcGxlbWVudCBwcm9wZXJseS4KPj4gSSB3b25kZXIgaWYgd2Ugc2hv
dWxkIGFpbSBhdCByb290IG9ubHkgYWNjZXNzIG9uIFRlZ3JhMjAsIGFuZCBmb3JjZQo+PiBJT01N
VSBvbiBUZWdyYTMwIGFuZCBmaXggdGhlIHJlbWFpbmluZyBpc3N1ZXMgd2UgaGF2ZSB3aXRoIElP
TU1VLiBUaGUKPj4gZmlyZXdhbGwgdHVybnMgb3V0IHRvIGJlIG1vcmUgY29tcGxpY2F0ZWQgdGhh
biBJIHdpc2hlZC4KPj4KPj4gQmlnZ2VzdCBwcm9ibGVtIGlzIHRoYXQgd2UgYWltIGF0IHplcm8t
Y29weSBmb3IgZXZlcnl0aGluZyBwb3NzaWJsZSwKPj4gaW5jbHVkaW5nIGNvbW1hbmQgc3RyZWFt
cy4gS2VybmVsIGdldHMgYSBoYW5kbGUgdG8gYSBjb21tYW5kIHN0cmVhbSwgYnV0Cj4+IHRoZSBj
b21tYW5kIHN0cmVhbSBpcyBhbGxvY2F0ZWQgYnkgdGhlIHVzZXIgc3BhY2UgcHJvY2Vzcy4gU28g
dGhlIHVzZXIKPj4gc3BhY2UgY2FuIHRhbXBlciB3aXRoIHRoZSBzdHJlYW0gb25jZSBpdCdzIGJl
ZW4gd3JpdHRlbiB0byB0aGUgaG9zdDF4IDJECj4+IGNoYW5uZWwuCj4+Cj4gU28gdGhpcyBpcyBv
YnZpb3VzbHkgd3JvbmcuIFVzZXJzcGFjZSBoYXMgdG8gYWxsb2NhdGUgYSBwdXNoYnVmZmVyIGZy
b20KPiB0aGUga2VybmVsIGp1c3QgYXMgZXZlcnkgb3RoZXIgYnVmZmVyLCB0aGVuIG1hcCBpdCBp
bnRvIGl0J3Mgb3duIGFkZHJlc3MKPiBzcGFjZSB0byBwdXNoIGluIGNvbW1hbmRzLiBBdCBzdWJt
aXQgdGltZSBvZiB0aGUgcHVzaGJ1ZiBrZXJuZWwgaGFzIHRvCj4gbWFrZSBzdXJlIHRoYXQgdXNl
cnNwYWNlIGlzIG5vdCBhYmxlIHRvIGFjY2VzcyB0aGUgbWVtb3J5IGFueSBtb3JlLCBpLmUuCj4g
a2VybmVsIHNob290cyBkb3duIHRoZSB2bWEgb3IgcGFnZXRhYmxlIG9mIHRoZSB2bWEuCgpUbyBt
ZSB0aGlzIHNvdW5kcyB2ZXJ5IGV4cGVuc2l2ZS4gWmFwcGluZyB0aGUgcGFnZSB0YWJsZSByZXF1
aXJlcyBhIENQVSAKVExCIGZsdXNoCm9uIGFsbCBjb3JlcyB0aGF0IGhhdmUgdG91Y2hlZCB0aGUg
YnVmZmVyLCBub3QgdG8gbWVudGlvbiB0aGUga2VybmVsIGNhbGxzCnJlcXVpcmVkIHRvIHNldCB1
cCB0aGUgcGFnZSB0YWJsZSBvbmNlIHRoZSBidWZmZXIgaXMgcmV1c2VkLgoKSWYgdGhpcyB1c2Fn
ZSBzY2hlbWUgdGhlbiBpcyBjb21iaW5lZCB3aXRoIGEgY29tbWFuZCB2ZXJpZmllciBvciAKImZp
cmV3YWxsIiB0aGF0CnJlYWRzIGZyb20gYSAqd3JpdGUtY29tYmluZWQqIHB1c2hidWZmZXIgcGVy
Zm9ybWFuY2Ugd2lsbCBiZSBiYWQuIFJlYWxseSAKYmFkLgoKSW4gc3VjaCBzaXR1YXRpb25zIEkg
dGhpbmsgb25lIHNob3VsZCBjb25zaWRlciBjb3B5LWZyb20tdXNlciB3aGlsZSAKdmFsaWRhdGlu
ZywgYW5kCmxldCB1c2VyLXNwYWNlIHNldCB1cCB0aGUgY29tbWFuZCBidWZmZXIgaW4gbWFsbG9j
ZWQgbWVtb3J5LgoKL1Rob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
