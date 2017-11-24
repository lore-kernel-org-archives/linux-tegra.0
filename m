From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 13/13] drm/tegra: kick out simplefb
Date: Fri, 24 Nov 2017 21:50:50 +0100
Message-ID: <20171124205049.GB12811@mithrandir>
References: <cover.1511544782.git.mirq-linux@rere.qmqm.pl>
 <89e22ee1c026b40a5bfa91de282d658b56dc8ee8.1511544782.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <89e22ee1c026b40a5bfa91de282d658b56dc8ee8.1511544782.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 06:53:34PM +0100, Micha=C5=82 Miros=C5=82aw wrote:
> Kick out firmware fb when loading tegra driver.
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ++++
>  1 file changed, 4 insertions(+)

Cool. Can you provide some background on how you tested this? What is
your firmware FB? That'd be useful information to put in the commit
message. Also, nit: "tegra driver" -> "Tegra driver".

Thierry

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAloYhiYACgkQ3SOs138+
s6GcuQ//fjuC4J9MIb3cB6fnasHKig0IPyoVv2PUydcxqwF20xRyyXVUeR8YNmG3
eSdUAHkTLrgsgckv3pSUKNdnVxUuuXmluBEfOxUNTGoX5SNP8OCRKZfw0DmNrPCk
ROdJPq9Cgbl/rhpyoT56sRQjt2gCPW7ZQeKISUV4YO7wpslajpr4Rt5gbOCEcqFj
4PtFASDpY7HQs7+nIz9FnWJb4hNjJr9F4okDfVQRH8Gs8diy/R/ENNFws3xo4SuW
g57wHET4cqvJSo6CXZqKdVOtBWXb41NuuRiurKhZHqELLHW5cjPlDPz4iv4A0RP+
6uoWJKeoxF7ZYl05X0plbJkwEGW6PcDDpl/K3EAFE8+/UFI2+BLwagHieaulT3BJ
lPeWa3hbVyGJ67KXVWPdRYUEqTjad9ToO+4oAYhRyVJyMNW+6URfE0CfyLVUBZIq
HGyN4V+YxzFLbUt03UJGEnaJqAkcJ2iFSFKifkh/E6yj4AxoTeBFFqLUHruLKqQL
dW/Oe/9MfSvPIuiIBNZy42vCS4baJ1uejAI+wFS9vrmLVsOQ/6z1lSmJmz8OZA7F
AaMhzSLoUN9JvbAwDgJhIYH+pcdM2AZ0i/l5ha5mUAcOJPPt5KZWnsV9mkRPqthj
a7+33PSF2OnkP4TmQsbus5YKbQ0OOh6ouQFhXzAtF8AzF07giUE=
=DRUx
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
