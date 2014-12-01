From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [RESEND PATCH nouveau 2/3] volt: allow non-bios
	voltage scaling
Date: Mon, 01 Dec 2014 23:57:39 +0100
Message-ID: <547CF263.6070900@free.fr>
References: <1417173180-21726-1-git-send-email-vinceh@nvidia.com>
 <1417173180-21726-2-git-send-email-vinceh@nvidia.com>
 <CAAVeFuJp5pU62-=Bf=+i8nRX09vgZ4De00_f9kQjbp13jJa0+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAVeFuJp5pU62-=Bf=+i8nRX09vgZ4De00_f9kQjbp13jJa0+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

T24gMjkvMTEvMjAxNCAwOToyMiwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6Cj4gT24gRnJpLCBO
b3YgMjgsIDIwMTQgYXQgODoxMiBQTSwgVmluY2UgSHN1IDx2aW5jZWhAbnZpZGlhLmNvbT4gd3Jv
dGU6Cj4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlIEhzdSA8dmluY2VoQG52aWRpYS5jb20+Cj4gTWFr
ZSBzdXJlIHlvdSBhbHdheXMgd3JpdGUgYSBzaG9ydCBzdW1tYXJ5IGZvciB5b3VyIHBhdGNoZXMs
IGV2ZW4gaWYKPiB0aGUgdGl0bGUgc291bmRzIHN1ZmZpY2llbnQuCgpJIGFncmVlLiBTb21ldGhp
bmcgbGlrZSAiTW92ZSB0aGUgdmJpb3MgcGFyc2luZyBvdXQgb2YgaW5pdCgpIGFuZApjYWxsIGl0
IGNvbmRpdGlvbmFsbHkgaWYgdGhlIHBsYXRmb3JtIGhhcyBhIHZiaW9zLiBOb24tdmJpb3MgcGxh
dGZvcm1zCmNhbiB1c2UgdGhlIGN0b3IoKSB0byBpbml0IHRoZSBkYXRhIHN0cnVjdHVyZXMuIi4K
Cj4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBwYXRjaCBtYWtlcyB0aGUgY29kZSBlYXNpZXIgdG8g
cmVhZCwgc286Cj4KPiBBY2tlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRp
YS5jb20+CkFja2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BmcmVlLmZyPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
