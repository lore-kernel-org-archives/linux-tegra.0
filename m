From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/7] Add cros_ec changes for newer boards
Date: Mon, 28 Apr 2014 10:19:14 +0100
Message-ID: <20140428091914.GK6264@lee--X1>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <20140423123240.GA640@lee--X1> <5357E832.1000806@wwwdotorg.org>
 <CAD=FV=XbjeOR+A-ZVYgOT69gsdp-YrjbkGrjL2Vf4F31ZkGXTA@mail.gmail.com>
 <CAD=FV=UWnLLzqzmrt0z=38iDOBSRJJLNAG8PL0GSHt1758ACcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=UWnLLzqzmrt0z=38iDOBSRJJLNAG8PL0GSHt1758ACcg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew@lunn.ch, Wolfram Sang <wsa@the-dreams.de>, Andrew Bresticker <abrestic@chromium.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Matt Porter <matt.porter@linaro.org>, jdelvare@suse.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-doc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, u.kleine-koenig@pengutronix.de, kevin.strasser@linux.intel.com, Dylan Reid <dgreid@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, schwidefsky@de.ibm.com, laurent.pinchart+renesas@ideasonboard.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kerne>
List-Id: linux-tegra@vger.kernel.org

Wy4uLl0KCj4gPj4+IE5lZWQgdG8gd2FpdCBmb3IgdGhlIEFSTSwgRFQgYW5kIEkyQyBndXlzIHRv
IHJldmlldywgYXQgd2hpY2ggcG9pbnQKPiA+Pj4gSSdsbCBiZSBoYXBweSB0byB0YWtlIGluIGFu
ZCBzdXBwbHkgYSBicmFuY2ggZm9yIHRoZW0gdG8gcHVsbCBmcm9tIGlmCj4gPj4+IHJlcXVpcmVk
LiBJZiB0aGVyZSBhcmUgbm8gX3RydWVfIGRlcGVuZGVuY2llcyBhbmQgdGhlIE1GRCBjaGFuZ2Vz
IGNhbgo+ID4+PiBiZSBhZGRlZCBpbmRlcGVuZGVudGx5IHdpdGhvdXQgZmVhciBvZiBidWlsZCBi
cmVha2FnZXMsIGxldCBtZSBrbm93Cj4gPj4+IGFuZCBJJ2xsIGFwcGx5IHRoZW0gc2VwYXJhdGVs
eS4KPiA+Pgo+ID4+IEkgYmVsaWV2ZSB0aGVyZSBhcmVuJ3QgZGlyZWN0IGRlcGVuZGVuY2llcyBi
ZXR3ZWVuIHRoZSBwYXRjaGVzLiBTbywgdGhlCj4gPj4gTUZEIHBhdGNoZXMgY2FuIGJlIGFwcGxp
ZWQgdG8gdGhlIE1GRCB0cmVlIGFuZCB0aGUgRFQgcGF0Y2ggYXBwbGllZCB0bwo+ID4+IHRoZSBU
ZWdyYSB0cmVlLiBJJ20gc2ltcGx5IHdhaXRpbmcgZm9yIHRoZSBNRkQgcGF0Y2hlcyB0byBiZSBh
cHBsaWVkCj4gPj4gYmVmb3JlIGFwcGx5aW5nIHRoZSBEVCBwYXRjaCBzbyB0aGF0IEkga25vdyB0
aGUgRFQgYmluZGluZyBkZWZpbml0aW9uIGlzCj4gPj4gZnVsbHkgYWNjZXB0ZWQgYmVmb3JlIGFw
cGx5aW5nIGEgcGF0Y2ggdGhhdCB1c2VzIGl0Lgo+ID4KPiA+IEFsbCBvZiB0aGUgTUZEIHBhdGNo
ZXMgYXJlIHNhZmUgdG8gYXBwbHkgYW5kIGluIHByZXR0eSBtdWNoIGFyYml0cmFyeQo+ID4gb3Jk
ZXIuICBUaGUgc3Ryb25nIGRlcGVuZGVuY2llcyBpbiB0aGUgY2hhaW4gYXJlOgo+ID4KPiA+ICog
V2UgbmVlZCBwYXRjaCAjNSAobWZkOiBjcm9zX2VjOiBTeW5jIHRvIHRoZSBsYXRlc3QKPiA+IGNy
b3NfZWNfY29tbWFuZHMuaCBmcm9tIEVDIHNvdXJjZXMpIGJlZm9yZSB0aGUgaTJjIHR1bm5lbCBj
YW4gY29tcGlsZS4KPiA+Cj4gPiAqIEFzIFN0ZXBoZW4gc2F5cywgaGUgc2hvdWxkbid0IGFwcGx5
IHRoZSBkZXZpY2UgdHJlZSB1bnRpbCB3ZSdyZQo+ID4gY29uZmlkZW50IHRoYXQgdGhlIGJpbmRp
bmdzIGFyZSByaWdodC4gIEhvd2V2ZXIgdGhlcmUncyBubyBzdHJvbmcKPiA+IGRlcGVuZGVuY3kg
b3RoZXJ3aXNlLgo+ID4KPiA+ICogUGF0Y2hlcyAjMSAjMiBhbmQgIzMgYXJlIHNpbXBseSByZWxp
YWJpbGl0eSBmaXhlcy4gIFRob3NlIGNvdWxkIGxhbmQKPiA+IGF0IGFueSBwb2ludCBpbiB0aW1l
IGFuZCB3aWxsIGltcHJvdmUgb3RoZXIgdXNlcnMgb2YgY3Jvc19lY19zcGkgKGxpa2UKPiA+IHRo
ZSBrZXlib2FyZCBvbiB0ZWdyYTEyNC12ZW5pY2UyKS4KPiA+Cj4gPiAqIFBhdGNoICM0IGNhbiBh
cHBseSBhbnkgdGltZSB3aXRoIG5vIGlzc3Vlcy4gIFdpdGhvdXQgaXQgbGFyZ2UgaTJjCj4gPiB0
dW5uZWwgdHJhbnNmZXJzIHdvbid0IHdvcmssIGJ1dCB0aGF0J3Mgbm90IGEgdGVycmlibGUgcHJv
YmxlbSAoYWxsCj4gPiBub3JtYWwgdHJhbnNmZXJzIGFyZSBzbWFsbCkuCj4gCj4gUGF0Y2ggIzUg
KGxhdGVzdCBlYyBjb21tYW5kcykgY2FuIGFsc28gYXBwbHkgYXQgYW55IHRpbWUgd2l0aCBubwo+
IGlzc3VlcywgYnV0IGl0J3MgbmVlZGVkIGZvciBwYXRjaCAjNiAodGhlIHR1bm5lbCkgdG8gY29t
cGlsZS4KPiAKPiBBbGwgdGhhdCBiZWluZyBzYWlkLCBJJ2QgcmVxdWVzdCB0aGF0IHlvdSBtZXJn
ZSBwYXRjaGVzICMxLSM1IGFzIHNvb24KPiBhcyB5b3UgY2FuIGFuZCBtYWtlIHN1cmUgeW91IGNh
biBwcm92aWRlIGEgd2F5IHRoYXQgV29sZnJhbSBjYW4gcHVsbAo+IHRoZW0gKG9yIGF0IGxlYXN0
IHBhdGNoICM1KSBpbnRvIGhpcyBpMmMgdHJlZSB0byBrZWVwIHRoZW0gYXBwbHlpbmcKPiB3aGVu
IGhlIGlzIHJlYWR5IHRvIGxhbmQgIzYuCgpWZXJ5IHdlbGwuIFNvIGlmIEkgY2FuIG9idGFpbiBX
b2xmcmFtJ3MgQWNrLCBJIGNhbiBhcHBseSB0aGUgTUZECmNoYW5nZXMgYWxvbmcgd2l0aCBwYXRj
aCAjNiBhbmQgc3VwcGx5IGhpbSB3aXRoIGEgYnJhbmNoLgoKLS0gCkxlZSBKb25lcwpMaW5hcm8g
U1RNaWNyb2VsZWN0cm9uaWNzIExhbmRpbmcgVGVhbSBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
