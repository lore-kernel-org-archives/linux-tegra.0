From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Date: Wed, 14 Aug 2019 18:36:57 +0200
Message-ID: <20190814163657.GA26556@ravnborg.org>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190812203805.GA10640@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190812203805.GA10640@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

PiA+IFRoaXMgc2V0IG9mIHBhdGNoZXMgaXMgb25lIG9mIHRoZSBmaW5hbCBzdGVwcyBiZWZvcmUK
PiA+IHdlIGhhdmUgc3VjY2VlZGVkIHRvIHN0b3AgdXNpbmcgZHJtUC5oIGluIGFsbCBvZiBkcm0v
Lgo+ID4gCj4gPiBUaGVyZSBpcyBhIGZldyBwYXRjaGVzIGluIGZsaWdodCB0aHJvdWdoIG90aGVy
IHRyZWVzCj4gPiBhbmQgdGhlIHBsYW4gaXMgdGhhdCBhbGwgdXNlcnMgc2hhbGwgYmUgZ29uZSBp
biB0aGUKPiA+IHVwc3RyZWFtIGtlcm5lbCBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdy4KPiA+IAo+
ID4gVGhlIHBhdGNoZXMgaGFzIHNlZW4gYnVpbGQgdGVzdCB3aXRoIHZhcmlvdXMgY29uZmlncwo+
ID4gd2l0aCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCj4gPiAKPiA+IFRoZSBwYXRjaGVzIGhhcyBi
ZWVuIHNlbnQgYmVmb3JlLCBidXQgdG8gbXkgYmVzdCBrbm93bGVkZ2UKPiA+IHRoZXkgaGF2ZSBu
b3QgYmVlbiBhcHBsaWVkIGFueXdoZXJlLgo+ID4gQWxsIGZvdXIgcGF0Y2hlcyBhcmUgYmFzZWQg
b24gZHJtLW1pc2MtbmV4dCwKPiA+IGJ1dCBJIGNoZWNrZWQgdGhhdCB0aGUgdGRhOTk4eCBwYXRj
aCBjYW4gYmUgYXBwbGllZCB0bwo+ID4gdGhlIHRkYTk5OHggdHJlZS4KPiA+IAo+ID4gVGhlcmUg
YXJlIG5vIGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVzLgo+ID4gCj4gPiB2MjoKPiA+
IC0gcmViYXNlIG9uIHRvcCBvZiBkcm0tbWlzYy1uZXh0Cj4gPiAKPiA+IFRvIG1haW50YWluZXJz
OiAoQXNzdW1pbmcgdGhlIHBhdGNoIGFyZSBPSykKPiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3UgdGFrZSB0aGUgcGF0Y2gsIG9yIHJlcXVlc3QKPiA+IG1lIHRvIGFwcGx5IGl0IHRvIGRybS1t
aXNjLW5leHQuCj4gPiBPciBsZXQgbWUgbWUga25vdyBpZiB0aGUgcGF0Y2ggc2hvdWxkIGJlIGJh
c2VkIG9uIGFub3RoZXIgdHJlZS4KPiAKPiBwaW5nLi4uCj4gCj4gVGhpcyBwYXRjaHNldCBpcyBv
bmUgb2YgdGhlIGxhc3Qgc3RlcHMgdG8gZ2V0IHJpZCBvZiBkcm1QLmguCj4gT3RoZXIgcGF0Y2hl
cyBhcmUgYXBwbGllZCB0byB2YXJpb3VzIHN1Yi1zeXN0ZW0gdHJlZXMuCj4gCj4gVGhlIGlkZWEg
aXMgdGhhdCBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdyBjYW4gZHJvcCBkcm1QLmguCj4gQXMgbG9u
ZyBhcyB3ZSBrZWVwIGRybVAuaCBhcm91bmQgbmV3IHVzZXJzIHdpbGwgc25lYWsgaW4uCgpUaGll
cnJ5IHJldmlld2VkIGFsbCBwYXRjaGVzIC0gdGhhbmtzIQoKQXBwbGllZCB0byBkcm0tbWlzYy1u
ZXh0IGFuZCBwdXNoZWQgb3V0LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
