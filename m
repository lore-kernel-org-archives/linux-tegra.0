From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] drm/tegra: Refactor CEC support
Date: Tue, 11 Dec 2018 10:22:14 +0100
Message-ID: <cae0b43a-c206-531b-927e-a5ec5bf89dea@xs4all.nl>
References: <20181210163455.13627-1-thierry.reding@gmail.com>
 <1611ab47-9ba6-83dc-6f6d-8add7b0a9751@xs4all.nl>
 <57066560-7c1b-5702-5269-9bc9deffc53e@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <57066560-7c1b-5702-5269-9bc9deffc53e@xs4all.nl>
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
Cc: linux-tegra@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

T24gMTIvMTAvMTggNjowNyBQTSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IE9uIDEyLzEwLzE4IDU6
MzYgUE0sIEhhbnMgVmVya3VpbCB3cm90ZToKPj4gT24gMTIvMTAvMTggNTozNCBQTSwgVGhpZXJy
eSBSZWRpbmcgd3JvdGU6Cj4+PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgo+Pj4KPj4+IE1vc3Qgb2YgdGhlIENFQyBzdXBwb3J0IGNvZGUgYWxyZWFkeSBsaXZlcyBp
biB0aGUgIm91dHB1dCIgbGlicmFyeSBjb2RlLgo+Pj4gTW92ZSByZWdpc3RyYXRpb24gYW5kIHVu
cmVnaXN0cmF0aW9uIHRvIHRoZSBsaWJyYXJ5IGNvZGUgYXMgd2VsbCB0byBtYWtlCj4+PiB1c2Ug
b2YgdGhlIHNhbWUgY29kZSB3aXRoIEhETUkgb24gVGVncmEyMTAgYW5kIGxhdGVyIHZpYSB0aGUg
U09SLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhz
NGFsbC5ubD4KPiAKPiBCdXQgcmVhZCBteSByZXBseSB0byAiW1BBVENIIDEvMl0gbWVkaWE6IHRl
Z3JhLWNlYzogU3VwcG9ydCBUZWdyYTE4NiBhbmQgVGVncmExOTQiLgo+IFlvdSBtYXkgd2FudCB0
byB0YWtlIGEgZGlmZmVyZW50IGFwcHJvYWNoIGhlcmUuCgpJZ25vcmUgdGhpcyBsYXN0IGNvbW1l
bnQsIHRoaXMgY29kZSBpcyBmaW5lLgoKUmVnYXJkcywKCglIYW5zCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
