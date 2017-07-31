From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix of_irq_get() error check
Date: Mon, 31 Jul 2017 11:30:57 +0200
Message-ID: <20170731093057.GA26667@ulmo>
References: <20170730181051.733168837@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170730181051.733168837-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2017 at 09:10:44PM +0300, Sergei Shtylyov wrote:
> of_irq_get() may return 0 as well as negative error number on failure,
> while the driver only checks for the negative values. The driver would th=
en
> call request_irq(0, ...) in tegra_adma_alloc_chan_resources() and never g=
et
> valid channel interrupt.
>=20
> Check for 'tdc->irq <=3D 0' instead and return -ENXIO from the driver's p=
robe
> iff of_irq_get() returned 0.
>=20
> Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADM=
A")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>=20
> ---
>  drivers/dma/tegra210-adma.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Yeah, that interface isn't very optimal. The problem with it, and we've
had this kind before, is that every driver ends up having to implement a
fallback for =3D=3D 0 with the result of everyone returning a different
error code.

Perhaps a good long-term solution would be to fix of_irq_get() to only
return positive for valid interrupts and negative error codes, so that
nobody has to deal with =3D=3D 0 anymore.

That's obviously going to be a fairly big undertaking, so I'm fine with
fixing up the individual callsites first.

> Index: slave-dma/drivers/dma/tegra210-adma.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- slave-dma.orig/drivers/dma/tegra210-adma.c
> +++ slave-dma/drivers/dma/tegra210-adma.c
> @@ -717,8 +717,8 @@ static int tegra_adma_probe(struct platf
>  		tdc->chan_addr =3D tdma->base_addr + ADMA_CH_REG_OFFSET(i);
> =20
>  		tdc->irq =3D of_irq_get(pdev->dev.of_node, i);
> -		if (tdc->irq < 0) {
> -			ret =3D tdc->irq;
> +		if (tdc->irq <=3D 0) {
> +			ret =3D tdc->irq ?: -ENXIO;
>  			goto irq_dispose;
>  		}
> =20

I think in this particular case it would be better to just call
platform_get_irq(), which already implements the equivalent.

Thierry

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll++M0ACgkQ3SOs138+
s6Hf9Q//fotZQ/jCJKvSp7HFUvS5q4UWaC31JF/bB/ZFroeL61MTXWoR6NqAGi37
fFBmt6mfaRDGV1VaTyqQ1zrrVjp/aXYSMeDFdewyv2n/0N1xpcZ1I0aSdxtNGq1p
G0BnGJL3N0TtZYj0MpT3nUsySr2BMFg8/zJQzlqm9f7AJArrenbIv05JHfBUKahA
ldkeGgMe1PNQc1XADtorFwu6q+vCMzfB3J0sUd/84tPnUC0jb6F52s2RnCZXlbtW
SCLCuYZNURx/EjzEgAo+nlHtcD93NUELKlFqyrf8b38+n4tD5sn8lBh4Tb8vmW3u
43ygiiD40lLDNPGC3mq9e29VjurPX3eB7q7CC3RT4F5b4hzZ54Ue08VaKuMzwejw
obhWI8WGxYuUSRV42a4T5cxTUEAKNMwrmglHLpne9OxYw3YeNHEyFHpQqQQ3jJxw
2Plw14AlumkvHNW4yVH97VXXosz7lW6KTAN/axK7llB5vK0VWYYZGmAl2sfvO/9l
FyE0oE7tZWtJc1kqE7L505w9rK23xNxvftOjSdTBr6K5MWWg4hPCYrQbsQ8xqJHt
up1tT6dU/1abytlFKXng1po4YTDhq6sp+1aWvq1BS8TWKVJkSQj0+Qg7gFkvtvk7
uCzncIj3yh6g1jJIIENoteGMEn97HPrC51oB3yiVjy8Wh+kC2jw=
=Be7T
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
