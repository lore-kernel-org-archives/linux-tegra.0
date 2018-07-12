From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: RFC: tegra2/tegra3 automotive part changes
Date: Thu, 12 Jul 2018 09:56:52 -0600
Message-ID: <fecd5597-1b04-6409-b87c-5cda54d43ce0@wwwdotorg.org>
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
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Terry Hu <kejia.hu@codethink.co.uk>, Device Tree list <devicetree@vger.kernel.org>, jorgesanjuan <jorge.sanjuan@codethink.co.uk>, Thomas Preston <thomas.preston@codethink.co.uk>, linux-tegra <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Beth White <beth.white@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

T24gMDcvMTIvMjAxOCAwNzozNiBBTSwgQmVuIERvb2tzIHdyb3RlOgo+IEhlbGxvLCB3ZSBhcmUg
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
Im52aWRpYSx0ZWdyYTMwYS1jYXIiOwo+ICDCoMKgwqDCoMKgwqDCoCB9Owo+IH0KClRoaXMgZG9l
c24ndCBzb3VuZCByaWdodC4gQXV0byBhbmQgY29tbWVyY2lhbCBwYXJ0cyBhcmUgaWRlbnRpY2Fs
IEFGQUlLOyAKaXQncyBqdXN0IHF1YWxpZmljYXRpb24gZGlmZmVyZW5jZXMuIEhlbmNlIGF0IG1v
c3QgeW91J2QgYWRkIGFuIGV4dHJhIApjb21wYXRpYmxlIHZhbHVlIGFuZCBub3QgcmVtb3ZlIHRo
ZSBvbGQgb25lLiBCZXR0ZXIgbWlnaHQgYmUgdG8gZGV0ZWN0IAp0aGlzIGF0IHJ1bi10aW1lIGZy
b20gdGhlIGZ1c2VzLiBJIHRoaW5rIHdlIGFscmVhZHkgZG8gc29tZSBvZiB0aGF0IAphbHJlYWR5
OyBzZWFyY2ggZm9yIHNwZWVkbyByZWxhdGVkIGNvZGUgaW4gYXJjaC9hcm0vbWFjaC10ZWdyYS8u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
