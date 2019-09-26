From: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
Date: Thu, 26 Sep 2019 12:44:53 +0200
Message-ID: <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1418888878=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Wahren <wahrenst-hi6Y0CQ0nG0@public.gmane.org>, james.quinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open
 list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============1418888878==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-spHfnjbbIi+e7UZn+wYh"


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > > Robin, have you looked into supporting multiple dma-ranges? It's th=
e
> > > > next thing
> > > > we need for BCM STB's PCIe. I'll have a go at it myself if nothing =
is in
> > > > the
> > > > works already.
> > >=20
> > > Multiple dma-ranges as far as configuring inbound windows should work
> > > already other than the bug when there's any parent translation. But i=
f
> > > you mean supporting multiple DMA offsets and masks per device in the
> > > DMA API, there's nothing in the works yet.

Sorry, I meant supporting multiple DMA offsets[1]. I think I could still ma=
ke
it with a single DMA mask though.

> > There's also the in-between step of making of_dma_get_range() return a
> > size based on all the dma-ranges entries rather than only the first one
> > - otherwise, something like [1] can lead to pretty unworkable default
> > masks. We implemented that when doing acpi_dma_get_range(), it's just
> > that the OF counterpart never caught up.
>=20
> Right. I suppose we assume any holes in the ranges are addressable by
> the device but won't get used for other reasons (such as no memory
> there). However, to be correct, the range of the dma offset plus mask
> would need to be within the min start and max end addresses. IOW,
> while we need to round up (0xa_8000_0000 - 0x2c1c_0000) to the next
> power of 2, the 'correct' thing to do is round down.

IIUC I also have this issue on my list. The RPi4 PCIe block has an integrat=
ion
bug that only allows DMA to the lower 3GB. With dma-ranges of size 0xc000_0=
000
you get a 32bit DMA mask wich is not what you need. So far I faked it in th=
e
device-tree but I guess it be better to add an extra check in
of_dma_configure(), decrease the mask and print some kind of warning statin=
g
that DMA addressing is suboptimal.

Regards,
Nicolas

[1] https://lkml.org/lkml/2018/9/19/641


--=-spHfnjbbIi+e7UZn+wYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2MlqUACgkQlfZmHno8
x/6+gwgAlzKCB9vN8cCZUfRnnPT+EcYA2/s3oFjf1ar+/e5UsMfCNI5W7cJaKzg9
w0PGZ5VKk5N0wpkGIpUjOYQ9J5PFZwu5bqsce0zWywlRlYCexKvzpQfkplWi0JuI
cVAt9Sw5mle+ppW+x9T5UlBcHoCByuQDG9ga44Z7O4jrk/lIp7vK2fmSN3hIEcHV
gUPxojWighnxCu+5COgwa182Ncfo3tTLw39oV8uiLOzxXxVkprxdxQHakXPoyg1o
WH0OvR09u1lXZAQ1qKtOxHNgKcrNzpr69VBUL/WYvrSqKdg0EI8QRmkByk5cYgrC
ztco//83y3fCRh8dEph0BSrKU3/vFA==
=P2KB
-----END PGP SIGNATURE-----

--=-spHfnjbbIi+e7UZn+wYh--


--===============1418888878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============1418888878==--
