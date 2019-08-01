From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 02/13] drm/radeon: Eliminate possible use of an
 uninitialized variable
Date: Thu, 1 Aug 2019 14:15:15 +0200
Message-ID: <7cacac43-737e-1ddb-2951-394fcf9ad0b2@baylibre.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cfff357a07bfa572baad058947f281b7095e1794.1564591626.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Anthony Koo <Anthony.Koo-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Francis <David.Francis-5C7GfCeVMHo@public.gmane.org>, Mamta Shukla <mamtashukla555-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Allison Randal <allison-wcfNWazeolPR7s880joybQ@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Bhawanpreet Lakha <Bhawanpreet.Lakha-5C7GfCeVMHo@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

SGkgQW5kcnplaiwKCkkgaGFkIHRvIHJldmVydCB0aGUgcHJldmlvdXMgcGF0Y2gsIHNvIHlvdSBz
aG91bGQgcmUtc3BpbiBpdCBlbnRpcmVseSA6Cgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQpBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQg
YnVpbGQgKHg4Nl82NAphbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6Cgpkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmM6IEluIGZ1bmN0aW9uICdyYWRlb25fYWRk
X2xlZ2FjeV9jb25uZWN0b3InOgpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0
b3JzLmM6MjQzMzo1OiBlcnJvcjogJ2RkYycgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pCiAgICAgZGRjID0gJnJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7
CiAgICAgXn5+CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYzoyNDMz
OjU6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCgpDYXVzZWQgYnkgY29tbWl0CgogIGJl
ZDdhMjE4MmRlNiAoImRybS9yYWRlb246IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9y
IHN5c2ZzIGRpcmVjdG9yeSIpCgpJIGhhdmUgdXNlZCB0aGUgZHJtLW1pc2MgdHJlZSBmcm9tIG5l
eHQtMjAxOTA3MzEgZm9yIHRvZGF5Lgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpOZWlsCgpPbiAzMS8wNy8yMDE5IDE4OjU4LCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6
Cj4gZGRjIGxvY2FsIHZhcmlhYmxlIGlzIHBhc3NlZCB0byBkcm1fY29ubmVjdG9yX2luaXRfd2l0
aF9kZGMoKSBhbmQgc2hvdWxkCj4gYmUgTlVMTCBpZiBubyBkZGMgaXMgYXZhaWxhYmxlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9y
YS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IGluZGV4
IGIzYWQ4ZDg5MDgwMS4uZDExMTMxZDAzZWQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Nvbm5lY3RvcnMuYwo+IEBAIC0xODcwLDcgKzE4NzAsNyBAQCByYWRlb25fYWRk
X2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAlzdHJ1Y3QgcmFkZW9u
X2Nvbm5lY3Rvcl9hdG9tX2RpZyAqcmFkZW9uX2RpZ19jb25uZWN0b3I7Cj4gIAlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXI7Cj4gIAlzdHJ1Y3QgcmFkZW9uX2VuY29kZXIgKnJhZGVvbl9lbmNv
ZGVyOwo+IC0Jc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmRkYyA9IE5VTEw7Cj4gIAl1aW50MzJfdCBzdWJwaXhlbF9vcmRlciA9IFN1YlBpeGVsTm9uZTsK
PiAgCWJvb2wgc2hhcmVkX2RkYyA9IGZhbHNlOwo+ICAJYm9vbCBpc19kcF9icmlkZ2UgPSBmYWxz
ZTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
