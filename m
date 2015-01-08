From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra: add slave capabilities reporting
Date: Thu, 8 Jan 2015 18:04:09 +0100
Message-ID: <20150108170409.GW7853@lukather>
References: <alpine.DEB.2.02.1501060640220.28771@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HxEkdbCoFEDbFH5U"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1501060640220.28771-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--HxEkdbCoFEDbFH5U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 06:44:56AM +0000, Paul Walmsley wrote:
>=20
> After commit ecc19d17868be9c9f8f00ed928791533c420f3e0 ("dmaengine: Add
> a warning for drivers not using the generic slave caps retrieval"),
> the Tegra APB DMA driver causes this warning during boot:
>=20
> WARNING: CPU: 0 PID: 1 at drivers/dma/dmaengine.c:830 dma_async_device_re=
gister+0x294/0x538()
> this driver doesn't support generic slave capabilities reporting
>=20
> Fix by setting the appropriate reporting structure fields that are
> passed to dma_async_device_register().
>=20
> Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
> Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HxEkdbCoFEDbFH5U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUrriJAAoJEBx+YmzsjxAgvksP/2o1c/5D1p4WnXYYFW1f99aZ
Ht4nr38/LZ+n2O8UOMQdz3Sy4BLFI+9Caht1KWES3BA/hXXa1KRcnwiMD5qleCAj
aLrt3w8NmtxmweR2UUOO7HyrAjBBEI7PqPw0XagRQtxaHkXqm1+0ZLN+n0hDIQzj
jc0kWzArtbG5dDH9LeE+dnp70TOBQtXBKlS3/nlVFBWJR7JoVc9BbgG/4Ir0lMs4
O4EpPU0yr3Pyir/0ViRqLxBGSGHGTS7XewjK/+/pBGMT6sJgqCnQnNPdDS+8VnfV
S652EI6Tt/RK952yWA6WxMS9tDOLhks8loU8PKdHRxnHf1e1rWApNzkhOcn2Ale4
1i//lTv8iWOnopTX/99KghNq83Ha5e5nbJurMeS+W+0V9/WAtvovCifNHoKJQMxu
5xtNKWONZByV6+k1QaIT3fYScIWkfYjxJSVFxyrIj7g4p6YSgkXZv5Cs7+2t4eb4
HRb6Tcdt5XKkG6apmsTTXCGMYacuTPotP1Tt3qj0Dhmsm6s+YY6Sh4T5OwBwOgei
kWJmem6MbymzCp0Xj/o6bdn1PWVffZQykkI5jMuKPjwPDD4le9QUxNC0ULDttihj
LkETEGHLItmdr/U4S6LvbrQKLHVHNOxNk5cEPOEv5ZSJYdg85JnXguEO27h2vCjN
LBedy1+7YokoSPihmkSu
=ciJk
-----END PGP SIGNATURE-----

--HxEkdbCoFEDbFH5U--
