From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Date: Thu, 28 Nov 2019 17:14:51 +0100
Message-ID: <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <20191128160314.2381249-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191128160314.2381249-2-thierry.reding@gmail.com>
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>, linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgNTowMyBQTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Cj4KPiBDdXJyZW50bHkgdGhlIGRyaXZlciBQTSBjb3JlIHdpbGwgYXV0b21h
dGljYWxseSBhY3F1aXJlIGEgcnVudGltZSBQTQo+IHJlZmVyZW5jZSBmb3IgZGV2aWNlcyBiZWZv
cmUgc3lzdGVtIHNsZWVwIGlzIGVudGVyZWQuIFRoaXMgaXMgbmVlZGVkCj4gdG8gYXZvaWQgcG90
ZW50aWFsIGlzc3VlcyByZWxhdGVkIHRvIGRldmljZXMnIHBhcmVudHMgZ2V0dGluZyBwdXQgdG8K
PiBydW50aW1lIHN1c3BlbmQgYXQgdGhlIHdyb25nIHRpbWUgYW5kIGNhdXNpbmcgcHJvYmxlbXMg
d2l0aCB0aGVpcgo+IGNoaWxkcmVuLgoKTm90IG9ubHkgZm9yIHRoYXQuCgo+IEluIHNvbWUgY2Fz
ZXMgZHJpdmVycyBhcmUgY2FyZWZ1bGx5IHdyaXR0ZW4gdG8gYXZvaWQgc3VjaCBpc3N1ZXMgYW5k
Cj4gdGhlIGRlZmF1bHQgYmVoYXZpb3VyIGNhbiBiZSBjaGFuZ2VkIHRvIGFsbG93IHJ1bnRpbWUg
UE0gdG8gb3BlcmF0ZQo+IHJlZ3VsYXJseSBkdXJpbmcgc3lzdGVtIHNsZWVwLgoKQnV0IHRoaXMg
Y2hhbmdlIGJyZWFrcyBxdWl0ZSBhIGZldyBhc3N1bXB0aW9ucyBpbiB0aGUgY29yZSB0b28sIHNv
IG5vLAppdCBjYW4ndCBiZSBtYWRlLgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
