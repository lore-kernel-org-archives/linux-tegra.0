From: dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org
Subject: Re: Re: [PATCH] PCI: tegra: fix runtime pm imbalance on error
Date: Thu, 21 May 2020 11:00:15 +0800 (GMT+08:00)
Message-ID: <a78d156.b93a0.172352c9b6e.Coremail.dinghao.liu@zju.edu.cn>
References: <20200520163739.GA1100601@bjorn-Precision-5520>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200520163739.GA1100601@bjorn-Precision-5520>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kjlu-OJFnDUYgAso@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

VGhhbmsgeW91IGZvciB5b3VyIGFkdmljZS4gSSB0aGluayB0ZWdyYTE5NCBpcyBhIGdvb2QgY2hv
aWNlIGFuZCAKSSB3aWxsIHVzZSBpdCBpbiB0aGUgbmV4dCBlZGl0aW9uIG9mIHBhdGNoLgoKJnF1
b3Q7Qmpvcm4gSGVsZ2FhcyZxdW90OyAmbHQ7aGVsZ2Fhc0BrZXJuZWwub3JnJmd0O+WGmemBk++8
mgo+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDExOjU5OjA4QU0gKzAyMDAsIFRoaWVycnkgUmVk
aW5nIHdyb3RlOg0KPiA+IE9uIFdlZCwgTWF5IDIwLCAyMDIwIGF0IDA0OjUyOjIzUE0gKzA4MDAs
IERpbmdoYW8gTGl1IHdyb3RlOg0KPiA+ID4gcG1fcnVudGltZV9nZXRfc3luYygpIGluY3JlbWVu
dHMgdGhlIHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlciBldmVuDQo+ID4gPiBpdCByZXR1cm5zIGFu
IGVycm9yIGNvZGUuIFRodXMgYSBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQgb24NCj4gPiAN
Cj4gPiBzL2V2ZW4gaXQvZXZlbiB3aGVuIGl0Lw0KPiA+IA0KPiA+IE1pZ2h0IGFsc28gYmUgYSBn
b29kIGlkZWEgdG8gdXNlIGEgZGlmZmVyZW50IHN1YmplY3QgcHJlZml4IGJlY2F1c2UgSQ0KPiA+
IHdhcyBhbG1vc3Qgbm90IGdvaW5nIHRvIGxvb2sgYXQgdGhlIG90aGVyIHBhdGNoLCB0YWtpbmcg
dGhpcyB0byBiZSBhDQo+ID4gcmVwbGFjZW1lbnQgZm9yIGl0Lg0KPiANCj4gQW1lbi4gIFRoaXMg
d291bGQgYmUgYSBnb29kIGNoYW5nZSB0byBzdGFydCB1c2luZyAiUENJOiB0ZWdyYTE5NCIgb3IN
Cj4gc29tZXRoaW5nIGZvciBwY2llLXRlZ3JhMTk0LmMuICBPciB3aWxsIHRoZXJlIGJlIHRlZ3Jh
MTk1LCB0ZWdyYSAxOTYsDQo+IGV0YyBhZGRlZCB0byB0aGlzIGRyaXZlcj8NCj4gDQo+IEFsc28s
IHBsZWFzZSBjYXBpdGFsaXplIHRoZSBmaXJzdCB3b3JkIGFuZCAiUE0iIGluIHRoZSBzdWJqZWN0
czoNCj4gDQo+ICAgUENJOiB0ZWdyYTE5NDogRml4IHJ1bnRpbWUgUE0gaW1iYWxhbmNlIG9uIGVy
cm9yDQo+IA0KPiBCam9ybg0K
