From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: dtc: tegra: enable front panel leds in TrimSlice
Date: Wed, 21 Feb 2018 09:46:28 -0700
Message-ID: <f291dd94-107f-cf03-a8e8-bc0806421c2d@wwwdotorg.org>
References: <20180219201623.6987-1-tmn505@gmail.com>
 <57945bd2-d8c2-f7bc-f01f-29d679762446@wwwdotorg.org>
 <873b01dc-3ca5-3151-2654-a8272cb9dd88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <873b01dc-3ca5-3151-2654-a8272cb9dd88@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

T24gMDIvMjEvMjAxOCAwOToyMCBBTSwgVG9tYXN6IE1hY2llaiBOb3dhayB3cm90ZToKPiBXIGRu
aXUgMjAuMDIuMjAxOCBvwqAyMDo1NSwgU3RlcGhlbiBXYXJyZW4gcGlzemU6Cj4+IE9uIDAyLzE5
LzIwMTggMDE6MTYgUE0sIFRvbWFzeiBNYWNpZWogTm93YWsgd3JvdGU6Cj4+PiBBZGRzIGRldmlj
ZSBub2RlcyBmb3IgdHdvIGZyb250IHBhbmVsIExFRHMuCj4+Cj4+IFdoeSBkbyB5b3UgbmVlZCB0
byBjaGFuZ2UgdGhlIHBpbm11eCBzZXR0aW5ncz8gQ29uZmlndXJpbmcgYSBwaW4gYXMgYSAKPj4g
R1BJTyBzaG91bGQgb3ZlcnJpZGUgYW55IHBpbm11eCBzcGVjaWFsIGZ1bmN0aW9uIHNlbGVjdGlv
biBhbmQgaGVuY2UgCj4+IG1ha2UgaXQgaXJyZWxldmFudCwgc28gSSBkb24ndCB0aGluayB5b3Ug
c2hvdWxkIG5lZWQgdG8gY2hhbmdlIHRoZSAKPj4gcGlubXV4Lgo+IAo+IEF0IGZpcnN0IEkgZGlk
IGV4YWN0bHkgdGhhdCB3aXRob3V0IGNoYW5naW5nIHRoZSBwaW5tdXgsIGJ1dCB0aGUgTEVEcyAK
PiBkaWRuJ3QgbGlnaHQgdXAuIEFmdGVyIHRoYXQgSSBjb21wYXJlZCB3aXRoIENvbXB1TGFiIHNv
dXJjZSB0cmVlIFsxXS4gCj4gVGhlIHBpbm11eCB3YXMgc3BlY2lmaWVkIGFzIGluIG15IHBhdGNo
LiBXaXRoIHRoaXMgY2hhbmdlIHRoZSBMRURzIGFyZSAKPiBmdWxseSBmdW5jdGlvbmFsLgo+IAo+
IDEuIAo+IGh0dHBzOi8vZ2l0b3Jpb3VzLm9yZy90cmltc2xpY2Uta2VybmVsL3RyaW1zbGljZS1r
ZXJuZWw/cD10cmltc2xpY2Uta2VybmVsOnRyaW1zbGljZS1rZXJuZWwuZ2l0O2E9YmxvYjtmPWFy
Y2gvYXJtL21hY2gtdGVncmEvYm9hcmQtdHJpbXNsaWNlLXBpbm11eC5jO2g9Y2M2ZDUyMjVkOTdl
YjkzMjdjODIwYmYxZDViMmJjMTZhYjhjNmRkYTtoYj1kMjViZjQ1ZDYzMTQwODk0ODliMzBkMjE4
ZWQ4YTBkNmQ5NDQxN2Y5I2w0NSAKCk9oIEkgc2VlLiBZb3VyIHBhdGNoIGlzbid0IGNoYW5naW5n
IHRoZSBwaW5tdXggZnVuY3Rpb24gc2VsZWN0aW9uIGJ1dCAKdGhlIG90aGVyIGNvbmZpZ3VyYXRp
b24gYml0cywgd2hpY2ggYXJlIHJlbGV2YW50IGV2ZW4gd2hlbiB0aGUgcGluIGlzIGluIApHUElP
IG1vZGUuIEluIHBhcnRpY3VsYXIsIGl0IGNsZWFycyB0aGUgdHJpc3RhdGUgYml0IGZvciB0aGUg
ZHRlIApwaW5ncm91cC4gVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
