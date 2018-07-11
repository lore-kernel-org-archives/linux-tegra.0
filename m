From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH] arm: tegra: Restore host1x/dc dm-pre-reloc
	properties
Date: Wed, 11 Jul 2018 11:38:24 -0600
Message-ID: <CAPnjgZ2f34deCLacg=DdWQ6Lad_o-TTXmxXV1WMUqmx+1uy5tQ@mail.gmail.com>
References: <20180711151948.21779-1-kwizart@gmail.com>
 <20180711172412.13220-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20180711172412.13220-1-kwizart@gmail.com>
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: linux-tegra@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gMTEgSnVseSAyMDE4IGF0IDExOjI0LCBOaWNvbGFzIENoYXV2ZXQgPGt3aXphcnRAZ21haWwu
Y29tPiB3cm90ZToKPiBTaW5jZSBjb21taXQgZjJmYWZmZWNiMDE2LCB0ZWdyYTogQ29udmVydCB0
byB1c2UgYmlubWFuCj4gdGhlIGRtLXByZS1yZWxvYyBwcm9wZXJ0aWVzIGFyZSByZW1vdmVkLgo+
Cj4gVGhpcyBsZWFkcyB1Ym9vdCBub3QgdG8gZW5hYmxlIHRoZSBkaXNwbGF5IG9uIHBhejAwCgpV
LUJvb3QgOi0pCgo+Cj4gVGhpcyBwYXRjaCByZXN0b3JlIHRoZSBkbS1wcmUtcmVsb2MgcHJvcGVy
dGllcyBhbGxvd2luZwo+IHRoZSBib290bG9hZGVyIHRvIG91dHB1dCB0byB0aGUgZGlzcGxheSBw
YW5lbAo+Cj4gdjM6IC0gRml4IGZldyB0eXBvcwo+IHYyOiAtIEFkZCBtb3JlIGNoYXJhY3RlcnMg
dG8gY29tbWl0IGhhc2gKPgo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgQ2hhdXZldCA8a3dpemFy
dEBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3Jn
Pgo+IC0tLQo+ICBhcmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaSB8IDEwICsrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy90ZWdyYTIwLXUt
Ym9vdC5kdHNpCj4gaW5kZXggN2MxMTk3MjU1Mi4uZjY0NjY3ZTU0OSAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FybS9kdHMvdGVncmEyMC11LWJvb3QuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy90ZWdy
YTIwLXUtYm9vdC5kdHNpCj4gQEAgLTEsMyArMSwxMyBAQAo+ICAjaW5jbHVkZSA8Y29uZmlnLmg+
Cj4KPiAgI2luY2x1ZGUgInRlZ3JhLXUtYm9vdC5kdHNpIgo+ICsKPiArCj4gKy8gewo+ICsgICAg
ICAgaG9zdDF4QDUwMDAwMDAwIHsKPiArICAgICAgICAgICAgICAgdS1ib290LGRtLXByZS1yZWxv
YzsKPiArICAgICAgICAgICAgICAgZGNANTQyMDAwMDAgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHUtYm9vdCxkbS1wcmUtcmVsb2M7Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9
Owo+ICt9Owo+IC0tCj4gMi4xNy4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVS1Cb290IG1haWxpbmcgbGlzdApVLUJvb3RAbGlzdHMuZGVueC5kZQpo
dHRwczovL2xpc3RzLmRlbnguZGUvbGlzdGluZm8vdS1ib290Cg==
