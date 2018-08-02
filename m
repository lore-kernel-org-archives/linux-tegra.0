From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/3] soc/tegra: pmc: set IO pad power state and voltage
 via pinctrl fw
Date: Thu, 2 Aug 2018 13:21:20 +0100
Message-ID: <76f4442e-842b-c08f-386d-a7062ed34a19@nvidia.com>
References: <1533211143-17517-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533211143-17517-1-git-send-email-vreddytalla@nvidia.com>
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
To: Venkat Reddy Talla <vreddytalla@nvidia.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, pdeschrijver@nvidia.com, vivek.gautam@codeaurora.org, p.zabel@pengutronix.de, thierry.reding@gmail.com, mperttunen@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: talho@nvidia.com, ldewangan@nvidia.com, avienamo@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Ck9uIDAyLzA4LzE4IDEyOjU5LCBWZW5rYXQgUmVkZHkgVGFsbGEgd3JvdGU6Cj4gVGhlIElPIHBp
bnMgb2YgVGVncmEgU29DcyBhcmUgZ3JvdXBlZCBmb3IgY29tbW9uIGNvbnRyb2wKPiBvZiBJTyBp
bnRlcmZhY2UgbGlrZSBzZXR0aW5nIHZvbHRhZ2Ugc2lnbmFsIGxldmVscyBhbmQKPiBwb3dlciBz
dGF0ZSBvZiB0aGUgaW50ZXJmYWNlLiBUaGVzZSBncm91cHMgYXJlIHJlZmVycmVkCj4gdG8gYXMg
SU8gcGFkcy5UaGUgcG93ZXIgc3RhdGUgYW5kIHZvbHRhZ2UgY29udHJvbCBvZiBJTyBwaW5zCj4g
Y2FuIGJlIGRvbmUgYXQgSU8gcGFkcyBsZXZlbC4KPiAKPiBUZWdyYSBTb0NzIHN1cHBvcnQgcG93
ZXJpbmcgZG93biBJTyBwYWRzIHdoZW4gdGhleSBhcmUKPiBub3QgdXNlZCBldmVuIGluIHRoZSBh
Y3RpdmUgc3RhdGUgb2Ygc3lzdGVtLgo+IFRoaXMgc2F2ZXMgcG93ZXIgZnJvbSB0aGF0IElPIGlu
dGVyZmFjZS4gQWxzbyBpdCBzdXBwb3J0cwo+IG11bHRpcGxlIHZvbHRhZ2UgbGV2ZWwgaW4gSU8g
cGlucyBmb3IgaW50ZXJmYWNpbmcgb24KPiBzb21lIG9mIHBhZHMuIFRoZSBJTyBwYWQgdm9sdGFn
ZSBpcyBhdXRvbWF0aWNhbGx5IGRldGVjdGVkCj4gdGlsbCBUZWdyYTEyNCwgaGVuY2UgU1cgbmVl
ZCBub3QgdG8gY29uZmlndXJlIHRoaXMuCj4gQnV0IGZyb20gVGVncmEyMTAsIHRoZSBhdXRvbWF0
aWMgZGV0ZWN0aW9uIGxvZ2ljIGhhcyBiZWVuCj4gcmVtb3ZlZCwgaGVuY2UgU1cgbmVlZCB0byBl
eHBsaWNpdGx5IHNldCB0aGUgSU8gcGFkCj4gdm9sdGFnZSBpbnRvIElPIHBhZCBjb25maWd1cmF0
aW9uIHJlZ2lzdGVycy4KPiAKPiBBZGQgc3VwcG9ydCB0byBjb25maWd1cmUgdGhlIHBvd2VyIHN0
YXRlIGFuZCB2b2x0YWdlIGxldmVsCj4gb2YgdGhlIElPIHBhZHMgZnJvbSBjbGllbnQgZHJpdmVy
IHZpYSBwaW5jb250cm9sIGZyYW1ld29yay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWZW5rYXQgUmVk
ZHkgVGFsbGEgPHZyZWRkeXRhbGxhQG52aWRpYS5jb20+CgpUaGlzIGFwcGVhcnMgdG8gYmUgYSBk
dXBsaWNhdGUgZWZmb3J0IG9mIHRoZSBmb2xsb3dpbmcgd2hpY2ggd2UgaGF2ZQpiZWVuIHJldmll
d2luZyAuLi4KCmh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LXRlZ3JhJm09MTUzMjk1OTMwODA4
OTE1Jnc9MgoKQ2hlZXJzCkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
