From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: remove NULL pointer check for
	clk_disable_unprepare
Date: Sat, 20 May 2017 19:45:59 -0400
Message-ID: <CAF6AEGuOETKok05PeyLpC95bPBEw5=YoxB83B-cxmAjt6JVBcQ@mail.gmail.com>
References: <1495303131-9814-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQCF1UATHONzLnrUN=uvVw6tsErfbDS9joFo3ya5Vgy4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAK7LNAQCF1UATHONzLnrUN=uvVw6tsErfbDS9joFo3ya5Vgy4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, The etnaviv authors <etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>Linux Kernel Mailing List <linu>
List-Id: linux-tegra@vger.kernel.org

T24gU2F0LCBNYXkgMjAsIDIwMTcgYXQgMzowNCBQTSwgTWFzYWhpcm8gWWFtYWRhCjx5YW1hZGEu
bWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGU6Cj4gMjAxNy0wNS0yMSAyOjU4IEdNVCswOTow
MCBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPjoKPj4gQWZ0
ZXIgbG9uZyB0ZXJtIGVmZm9ydHMgb2YgZml4aW5nIG5vbi1jb21tb24gY2xvY2sgaW1wbGVtZW50
YXRpb25zLAo+PiBjbGtfZGlzYWJsZSgpIGlzIGEgbm8tb3AgZm9yIGEgTlVMTCBwb2ludGVyIGlu
cHV0LCBhbmQgdGhpcyBpcyBub3cKPj4gdHJlZS13aWRlIGNvbnNpc3RlbnQuCj4+Cj4+IEFsbCBj
bG9jayBjb25zdW1lcnMgY2FuIHNhZmVseSBjYWxsIGNsa19kaXNhYmxlKF91bnByZXBhcmUpIHdp
dGhvdXQKPj4gTlVMTCBwb2ludGVyIGNoZWNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGly
byBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+Cj4KPiBTb3JyeSwgSSBy
ZXRyYWN0IHRoaXMgcGF0Y2guCj4KPiBLcnp5c3p0b2YgcG9pbnRlZCBvdXQKPiBjbGVhbnVwcyBv
bmx5IGZvciBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB3aWxsIGxvc2UgdGhlIGNvZGUgc3ltbWV0
cnkuCj4KPiBOVUxMIHBvaW50ZXIgY2hlY2tzIGZvciBjbGtfcHJlcGFyZV9lbmFibGUoKSBzaG91
bGQgYmUKPiByZW1vdmVkIHRvIGtlZXAgdGhlIGNvZGUgc3ltbWV0cmljYWwuCj4KPiBUaGlzIGlz
IHBvc3NpYmxlIGZvciBjb21tb24tY2xvY2sgZnJhbWV3b3JrIGJlY2F1c2UKPiBjbGtfcHJlcGFy
ZV9lbmFibGUoKSBpcyBhbHNvIGEgbm8tb3AgZm9yIGEgTlVMTCBjbGsgaW5wdXQuCj4gQnV0IGl0
IGlzIG5vdCBuZWNlc3NhcmlseSB0cnVlIGZvciBub24tY29tbW9uIGNsb2NrIGltcGxlbWVudGF0
aW9ucy4KCkF0IGxlYXN0IGZvciBkcm0vbXNtLCB1cHN0cmVhbSBJIHRoaW5rIHdlIGNhbiBhc3N1
bWUgQ0NGLi4gSSBzdGlsbApuZWVkIHRvIGNoZWNrIGZvciBwb3NzaWJsZSBkb3duc3RyZWFtIGtl
cm5lbHMgdG8gd2hpY2ggc29tZW9uZSBtaWdodAp3YW50IHRvIGJhY2twb3J0IGRybS9tc20uCgpJ
dCBtaWdodCBiZSBhbiBpZGVhIHRvIHNwbGl0IHRoaXMgdXAgcGVyLWRyaXZlciwgc2luY2UgYXQg
bGVhc3QgZm9yCnNvbWUgZHJpdmVycyBpdCBtaWdodCBiZSBzYWZlIHRvIGFzc3VtZSBDQ0YgKG9y
IG5vbi1DQ0YgY2xrIGRyaXZlcgp0aGF0IGJlaGF2ZXMgdGhlIHNhbWUpCgpCUiwKLVIKCj4KPiAt
LQo+IEJlc3QgUmVnYXJkcwo+IE1hc2FoaXJvIFlhbWFkYQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
