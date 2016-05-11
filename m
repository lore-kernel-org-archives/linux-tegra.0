From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V4 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Wed, 11 May 2016 20:59:08 +0100
Message-ID: <57338F0C.2030101@nvidia.com>
References: <1462531548-12914-1-git-send-email-ldewangan@nvidia.com>
 <1462531548-12914-4-git-send-email-ldewangan@nvidia.com>
 <572CAC20.9030307@nvidia.com> <572CB906.3090004@nvidia.com>
 <572F2D84.3060505@nvidia.com> <57333366.2040500@nvidia.com>
 <5733513E.9080606@nvidia.com> <57336A42.3090507@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <57336A42.3090507@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laxman Dewangan <ldewangan@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Ck9uIDExLzA1LzE2IDE4OjIyLCBMYXhtYW4gRGV3YW5nYW4gd3JvdGU6Cj4gCj4gT24gV2VkbmVz
ZGF5IDExIE1heSAyMDE2IDA5OjA1IFBNLCBKb24gSHVudGVyIHdyb3RlOgo+PiBPbiAxMS8wNS8x
NiAxNDoyOCwgTGF4bWFuIERld2FuZ2FuIHdyb3RlOgo+Pj4gT24gU3VuZGF5IDA4IE1heSAyMDE2
IDA1OjQzIFBNLCBKb24gSHVudGVyIHdyb3RlOgo+Pj4+IE9uIDA2LzA1LzE2IDE2OjMyLCBMYXht
YW4gRGV3YW5nYW4gd3JvdGU6Cj4+Pj4+IE9uIEZyaWRheSAwNiBNYXkgMjAxNiAwODowNyBQTSwg
Sm9uIEh1bnRlciB3cm90ZToKPj4+Pj4+IE9uIDA2LzA1LzE2IDExOjQ1LCBMYXhtYW4gRGV3YW5n
YW4gd3JvdGU6Cj4+Pj4+PiArCj4+Pj4+PiArICAgIC8qIExhc3QgZW50cnkgKi8KPj4+Pj4+ICsg
ICAgVEVHUkFfSU9fUEFEX01BWCwKPj4+Pj4+IE5pdCBzaG91bGQgdGhlc2UgYmUgVEVHUkFfSU9f
UEFEU194eHg/Cj4+Pj4+IEJlY2F1c2UgdGhpcyB3YXMgbmFtZSBvZiBzaW5nbGUgcGFkIGFuZCBo
ZW5jZSBJIHNhaWQgVEVHUkFfSU9fUEFEX1hYWC4KPj4+PiBBcmVuJ3QgdGhlc2UgdXNlZCB0byBz
ZXQgdGhlIHZvbHRhZ2UgbGV2ZWwgYW5kIHBvd2VyIHN0YXRlIGZvciB0aGUKPj4+PiBlbnRpcmUg
Z3JvdXAgb2YgSU9zPyBDb25mdXNlZCA6LSgKPj4+IE9uZSBJTyBwYWQgY2FuIGhhdmUgbXVsdGlw
bGUgSU8gcGlucy4KPj4+IElPIFBhZCBjb250cm9sIHRoZSBwb3dlciBzdGF0ZSBhbmQgdm9sdGFn
ZSBvZiBhbGwgcGlucyBiZWxvbmdzIHRvIHRoYXQKPj4+IElPIHBhZC4KPj4gVWdoIC4uLiBJIHJl
bWVtYmVyIGZvciB4dXNiIHRoZXJlIHdhcyBzb21ldGhpbmcgc2ltaWxhciB3ZSB0aGUgVGVncmEK
Pj4gZG9jcyB1c2VkIHBhZCB0byBpbXBseSBtdWx0aXBsZS4gSG93ZXZlciwgaW4gZ2VuZXJhbCBw
YWQgPT0gcGluID09IGJhbGwKPj4gb3IgYXQgbGVhc3Qgc2hvdWxkLgo+IAo+IHdoZW4gd2Ugc2F5
IHNkZG1jMyBJTyBwYWRzLCB3ZSBkZWFsIHdpdGggYWxsIHNpZ25hbCBwaW5zIG9mIHNkbW0zLgoK
UmlnaHQgYnV0IG5vdyB5b3UgYXJlIHNheWluZyBpby1wYWRzIGFuZCBub3QgaW8tcGFkLiBZZXMg
aW8tcGFkcyB3b3VsZAptZWFuIG1vcmUgdGhhbiBvbmUsIGJ1dCBJTU8gaW8tcGFkIGltcGxpZXMg
c2luZ3VsYXIuIEFueXdheSwgZW5vdWdoCmJpa2Utc2hlZGRpbmcgLi4uCgpKb24KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
