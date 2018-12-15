From: Frank Lee <tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu/drm: remove
 DEFINE_DPU_DEBUGFS_SEQ_FOPS()
Date: Sat, 15 Dec 2018 17:13:04 +0800
Message-ID: <CAEExFWscup+j7ich70wo+oWix3iLWQAmWQbdN50cD166E3KQ7Q@mail.gmail.com>
References: <20181202031912.9736-1-tiny.windzz@gmail.com>
 <20181204145943.GS154160@art_vandelay>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20181204145943.GS154160@art_vandelay>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>
Cc: ryadav-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, abhinavk-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, bzwang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, jsanka-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, skolluku-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

T24gVHVlLCBEZWMgNCwgMjAxOCBhdCAxMDo1OSBQTSBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4gd3JvdGU6Cj4KPiBPbiBTYXQsIERlYyAwMSwgMjAxOCBhdCAxMDoxOToxMVBNIC0wNTAwLCBZ
YW5ndGFvIExpIHdyb3RlOgo+ID4gV2UgYWxyZWFkeSBoYXZlIHRoZSBERUZJTkVfU0hPV19BVFRS
SUJVVEUuVGhlcmUgaXMgbm8gbmVlZCB0byBkZWZpbmUKPiA+IHN1Y2ggYSBtYWNybyBzZXBhcmF0
ZWx5LHNvIHJlbW92ZSBERUZJTkVfRFBVX0RFQlVHRlNfU0VRX0ZPUFMuCj4gPiBBbHNvIHVzZSBE
RUZJTkVfU0hPV19BVFRSSUJVVEUgdG8gc2ltcGxpZnkgc29tZSBjb2RlLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2RlYnVnZnMuYyAgICAgIHwgMjEgKysrKy0t
LS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfaXJxLmMg
fCAxNCArLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRj
LmMgICAgIHwgMzMgKysrLS0tLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2VuY29kZXIuYyAgfCAxNyArKy0tLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgICAgICB8IDM2ICsrKystLS0tLS0tLS0tLS0tLS0t
Cj4KPiBGb3IgdGhlIGRwdSBwb3J0aW9uOgo+IEFja2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KcGluZy4uLi4uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9m
cmVlZHJlbm8K
