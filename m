From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 2/7] gpu: host1x: Fix syncpoint ID field size on Tegra186
Date: Mon, 26 Nov 2018 13:15:45 +0200
Message-ID: <a7df6abb-b79e-54ea-9e9b-8fdb8ed71951@kapsi.fi>
References: <20181123123138.20739-1-thierry.reding@gmail.com>
 <20181123123138.20739-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181123123138.20739-2-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

UmV2aWV3ZWQtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5lbkBudmlkaWEuY29tPgoKT24g
MjMuMTEuMjAxOCAxNDozMSwgVGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4gRnJvbTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAKPiBUaGUgbnVtYmVyIG9mIHN5bmNwb2ludHMg
b24gVGVncmExODYgaXMgNTc2IGFuZCB0aGVyZWZvcmUgbm8gbG9uZ2VyIGZpdHMKPiBpbnRvIDgg
Yml0cy4gSW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIHN5bmNwb2ludCBJRCBmaWVsZCB0byAxMCBp
biBvcmRlcgo+IHRvIGFjY29tb2RhdGUgYWxsIHN5bmNwb2ludHMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2hvc3QxeC9ody9od19ob3N0MXgwNl91Y2xhc3MuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9ob3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmggYi9kcml2ZXJzL2dwdS9ob3N0
MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmgKPiBpbmRleCA0NDU3NDg2YzcyYjAuLmU1OTllMTVi
Zjk5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNs
YXNzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvaHcvaHdfaG9zdDF4MDZfdWNsYXNzLmgK
PiBAQCAtNTksNyArNTksNyBAQCBzdGF0aWMgaW5saW5lIHUzMiBob3N0MXhfdWNsYXNzX2luY3Jf
c3luY3B0X3Iodm9pZCkKPiAgIAlob3N0MXhfdWNsYXNzX2luY3Jfc3luY3B0X3IoKQo+ICAgc3Rh
dGljIGlubGluZSB1MzIgaG9zdDF4X3VjbGFzc19pbmNyX3N5bmNwdF9jb25kX2YodTMyIHYpCj4g
ICB7Cj4gLQlyZXR1cm4gKHYgJiAweGZmKSA8PCA4Owo+ICsJcmV0dXJuICh2ICYgMHhmZikgPDwg
MTA7Cj4gICB9Cj4gICAjZGVmaW5lIEhPU1QxWF9VQ0xBU1NfSU5DUl9TWU5DUFRfQ09ORF9GKHYp
IFwKPiAgIAlob3N0MXhfdWNsYXNzX2luY3Jfc3luY3B0X2NvbmRfZih2KQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
