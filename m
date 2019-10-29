From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] drm/tegra: Do not use ->load() and ->unload() callbacks
Date: Tue, 29 Oct 2019 16:25:36 +0300
Message-ID: <28aaf3c5-2e23-c947-9dd9-31571b5d5f1b@gmail.com>
References: <20191028121610.3889207-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191028121610.3889207-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

MjguMTAuMjAxOSAxNToxNiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoZSAtPmxvYWQoKSBhbmQgLT51
bmxvYWQoKSBkcml2ZXJzIGFyZSBtaWRsYXllcnMgYW5kIHNob3VsZCBiZSBhdm9pZGVkCj4gaW4g
bW9kZXJuIGRyaXZlcnMuIEZpeCB0aGlzIGJ5IG1vdmluZyB0aGUgY29kZSBpbnRvIHRoZSBkcml2
ZXIgLT5wcm9iZSgpCj4gYW5kIC0+cmVtb3ZlKCkgaW1wbGVtZW50YXRpb25zLCByZXNwZWN0aXZl
bHkuCj4gCj4gdjI6IGtpY2sgb3V0IGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVycyBiZWZvcmUgaW5p
dGlhbGl6aW5nIGZiZGV2Cj4gdjM6IHJlYmFzZSBvbnRvIGRybS90ZWdyYS9mb3ItbmV4dAo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8IDMyMSArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAx
NjcgZGVsZXRpb25zKC0pCgpIZWxsbyBUaGllcnJ5LAoKSSB0cmllZCBhIGJpdCBoYXJkZXIgYW5k
IG1hbmFnZWQgdG8gZ2V0IHNpbXBsZS1mcmFtZWJ1ZmZlciB3b3JraW5nLCB0aGUKYm9vdGxvYWRl
cidzIEZCIGhhbmRvdmVyIHdvcmtzIGZpbmUgZm9yIG1lIGJlZm9yZSBhbmQgYWZ0ZXIgdGhpcyBw
YXRjaC4KVGhhbmtzIQoKVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5j
b20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
