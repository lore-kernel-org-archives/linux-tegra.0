From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] firmware: Move Trusted Foundations support
Date: Thu, 11 Apr 2019 00:20:20 +0300
Message-ID: <f31d103c-c2b4-9d43-60c9-cc957457b96a@gmail.com>
References: <20190410085708.10798-1-thierry.reding@gmail.com>
 <20190410085708.10798-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410085708.10798-2-thierry.reding@gmail.com>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

MTAuMDQuMjAxOSAxMTo1NywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IE1vdmUgdGhlIFRydXN0ZWQgRm91
bmRhdGlvbnMgc3VwcG9ydCBvdXQgb2YgYXJjaC9hcm0vZmlybXdhcmUgYW5kIGludG8KPiBkcml2
ZXJzL2Zpcm13YXJlIHdoZXJlIG1vc3Qgb3RoZXIgZmlybXdhcmUgc3VwcG9ydCBpbXBsZW1lbnRh
dGlvbnMgYXJlCj4gbG9jYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8
dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiAtLQo+ICBhcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL2Zpcm13YXJlL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICB8IDI5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm0vZmly
bXdhcmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDQgLS0tCj4gIGFyY2gvYXJtL21h
Y2gtdGVncmEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGFyY2gvYXJtL21h
Y2gtdGVncmEvY3B1aWRsZS10ZWdyYTExNC5jICAgICAgICB8ICAzICstCj4gIGFyY2gvYXJtL21h
Y2gtdGVncmEvcG0uYyAgICAgICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGFyY2gvYXJtL21h
Y2gtdGVncmEvcmVzZXQuYyAgICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGFyY2gvYXJtL21h
Y2gtdGVncmEvdGVncmEuYyAgICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGRyaXZlcnMvZmly
bXdhcmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysKPiAgZHJp
dmVycy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAuLi4v
ZmlybXdhcmUvdHJ1c3RlZF9mb3VuZGF0aW9ucy5jICAgICAgICAgICAgfCAgNCArKy0KPiAgLi4u
L2xpbnV4L2Zpcm13YXJlfS90cnVzdGVkX2ZvdW5kYXRpb25zLmggICAgIHwgIDQgKy0tCj4gIDEz
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQoKUGxlYXNl
IGFkZCB0aGUgTUFJTlRBSU5FUlMgZW50cnkgZm9yIHRoZSBkcml2ZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxp
bmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
