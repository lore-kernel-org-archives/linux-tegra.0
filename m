From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Acquire a reference to the IOVA cache
Date: Mon, 23 Apr 2018 11:43:16 +0300
Message-ID: <c07b8a6a-3509-74d0-17a1-f7ace40f532b@gmail.com>
References: <20180423065745.26102-1-thierry.reding@gmail.com>
 <20180423065745.26102-2-thierry.reding@gmail.com>
 <98ffd7c2-1184-a667-39e5-68d011e516a4@gmail.com>
 <ae552ade-e4e7-669c-ee85-820a92490871@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ae552ade-e4e7-669c-ee85-820a92490871@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

T24gMjMuMDQuMjAxOCAxMTo0MSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IE9uIDIzLjA0LjIw
MTggMTE6MzQsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gT24gMjMuMDQuMjAxOCAwOTo1Nywg
VGhpZXJyeSBSZWRpbmcgd3JvdGU6Cj4+PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgo+Pj4KPj4+IFRoZSBJT1ZBIEFQSSB1c2VzIGEgbWVtb3J5IGNhY2hlIHRvIGFs
bG9jYXRlIElPVkEgbm9kZXMgZnJvbS4gVG8gbWFrZQo+Pj4gc3VyZSB0aGF0IHRoaXMgY2FjaGUg
aXMgYXZhaWxhYmxlLCBvYnRhaW4gYSByZWZlcmVuY2UgdG8gaXQgYW5kIHJlbGVhc2UKPj4+IHRo
ZSByZWZlcmVuY2Ugd2hlbiB0aGUgY2FjaGUgaXMgbm8gbG9uZ2VyIG5lZWRlZC4KPj4+Cj4+PiBP
biA2NC1iaXQgQVJNIHRoaXMgaXMgaGlkZGVuIGJ5IHRoZSBmYWN0IHRoYXQgdGhlIERNQSBtYXBw
aW5nIEFQSSBnZXRzCj4+PiB0aGF0IHJlZmVyZW5jZSBhbmQgbmV2ZXIgcmVsZWFzZXMgaXQuIE9u
IDMyLWJpdCBBUk0sIGhvd2V2ZXIsIHRoZSBETUEKPj4+IG1hcHBpbmcgQVBJIGRvZXNuJ3QgZG8g
dGhhdCwgc28gYWxsb2NhdGlvbiBvZiBJT1ZBIG5vZGVzIGZhaWxzLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4+PiAtLS0KPj4KPj4g
UmV2aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gVGVzdGVk
LWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+Cj4+IENPTkZJR19URUdS
QV9JT01NVV9TTU1VIGlzIGVuYWJsZWQgaW4gdGhlIGRlZmF1bHQga2VybmVsIGNvbmZpZ3MgYW5k
IGhlbmNlIERSTQo+PiBzaG91bGQgZmFpbCB0byBwcm9iZSBvbiB0MTI0IHNpbmNlIDQuMTEuIFdo
YXQgYWJvdXQgdG8gYWRkIHN0YWJsZSB0YWcgZm9yIHY0LjExKwo+PiBoZXJlIHRvIHVuYnJlYWsg
c3RhYmxlIGtlcm5lbHMgYXMgd2VsbD8KPiAKPiBJT01NVSBub2RlIGZvciBob3N0MXggd2FzIGFk
ZGVkIHRvIHQxMjQgRFQgaW4ga2VybmVsIHY0LjE0LCBzbyBzLzQuMTEvNC4xNC8uCgpPbiB0aGUg
b3RoZXIgaGFuZCBub3RoaW5nIHN0b3BzIHRvIHVzZSBuZXdlciBEVCB3aXRoIG9sZGVyIGtlcm5l
bC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
