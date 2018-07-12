From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: RFC: tegra2/tegra3 automotive part changes
Date: Thu, 12 Jul 2018 16:50:25 +0300
Message-ID: <62581f70-4f55-05b4-5210-221698d501c7@kapsi.fi>
References: <3916c0ea-964e-42ab-8bfd-8e8edc5110ee@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3916c0ea-964e-42ab-8bfd-8e8edc5110ee@codethink.co.uk>
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
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-tegra <linux-tegra@vger.kernel.org>, Device Tree list <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Preston <thomas.preston@codethink.co.uk>, Terry Hu <kejia.hu@codethink.co.uk>, jorgesanjuan <jorge.sanjuan@codethink.co.uk>, Beth White <beth.white@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

T24gMDcvMTIvMjAxOCAwNDozNiBQTSwgQmVuIERvb2tzIHdyb3RlOgo+IEhlbGxvLCB3ZSBhcmUg
bG9va2luZyBhdCB1cC1zdHJlYW1pbmcgc29tZSBvZiB0aGUgd29yayB3ZSBoYXZlCj4gZG9uZSBv
biB0aGUgdGVncmEyIGFuZCB0ZWdyYTMgYXV0b21vdGl2ZSBkZXZpY2VzLiBUaGUgYXV0b21vdGl2
ZQo+IGdyYWRlIGRldmljZXMgYXJlIGNsb3NlIHRoZSBjb21tZXJjaWFsIHBhcnRzIHNvIHdlIHdv
dWxkIGxpa2UgdG8KPiBkaXNjdXNzIHRoZSBjb3JlIGNoYW5nZXMgYmVmb3JlIHN1Ym1pdHRpbmcu
Cj4gCj4gVGhlIGNoYW5nZXMgYXJlIG1vc3RseSB3aXRoIHRoaW5ncyBsaWtlIHRoZSBjbG9jayBz
ZXR1cCBhbmQgYQo+IGZldyBwZXJpcGhlcmFsIHF1aXJrcyAoSUlSQyB0aGVzZSBhcmUgbW9zdGx5
IE1NQykuCj4gCj4gV2UgYXJlIHByb3Bvc2luZyB0byBjaGFuZ2UgdGhlIGRldmljZS10cmVlIHBy
b3BlcnRpZXMgZm9yIHRoZSByb290Cj4gbm9kZSBhbmQgYW55IG90aGVyIGFmZmVjdGVkIGRldmlj
ZXMgZnJvbSAibnZpZGlhLHRlZ3JhWFgiIHRvIGEgbmV3Cj4gIm52aWRpYSx0ZWdyYVhYYSIuIFdl
IHdvdWxkIHdlbGNvbWUgZGlzY3Vzc2lvbiBvbiB3aGV0aGVyIHRvIHVwZGF0ZQo+IGFsbCB0aGUg
ZGV2aWNlcyBhdCB0aGUgc3RhcnQKPiAKPiBBbiBleGFtcGxlIG9mIHRlZ3JhMzBhLmR0c2k6Cj4g
Cj4gI2luY2x1ZGUgInRlZ3JhMzAuZHRzaSIKPiAKPiAvIHsKPiAgwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICJudmlkaWEsdGVncmEzMGEiOwo+IAo+ICDCoMKgwqDCoMKgwqDCoCBjbG9ja0A2
MDAwNjAwMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
Im52aWRpYSx0ZWdyYTMwYS1jYXIiOwo+ICDCoMKgwqDCoMKgwqDCoCB9Owo+IH0KPiAKPiBXZSBk
b24ndCB0aGluayB0aGUgY2hhbmdlcyBhcmUgYmlnIGVub3VnaCB0byB3YXJyYW50IHRoZWlyIG93
bgo+IEtjb25maWcvZGVmY29uZmlnIHVwZGF0ZXMuCj4gCgpXaGF0IGtpbmQgb2YgY2hhbmdlcyBk
byB5b3UgaGF2ZT8gVGVncmEzMGEgd291bGQgcG9pbnQgdG8gYSBzZXBhcmF0ZSBTb0MgCnJldmlz
aW9uIG9mIFRlZ3JhMyB0aGUgZXhpc3RlbmNlIG9mIHdoaWNoIEknbSBub3QgYXdhcmUgb2YuIElm
IHlvdSBjYW4gCnNob3cgc29tZSBvZiB0aGUgY2hhbmdlcyBpdCB3b3VsZCBiZSBlYXNpZXIgdG8g
c2F5IGhvdyB0aGUgc3lzdGVtIHNob3VsZCAKYmUgc3BlY2lmaWVkLgoKVGhhbmtzLApNaWtrbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
