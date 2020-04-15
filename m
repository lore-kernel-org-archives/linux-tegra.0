From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 2/2] i2c: tegra: Synchronize DMA before termination
Date: Wed, 15 Apr 2020 18:31:24 +0200
Message-ID: <20200415163123.GD2830@ninjato>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200324191217.1829-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 10:12:17PM +0300, Dmitry Osipenko wrote:
> DMA transfer could be completed, but CPU (which handles DMA interrupt)
> may get too busy and can't handle the interrupt in a timely manner,
> despite of DMA IRQ being raised. In this case the DMA state needs to
> synchronized before terminating DMA transfer in order not to miss the
> DMA transfer completion.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to for-current, thanks!


--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6XNtsACgkQFA3kzBSg
KbbADhAAqwvNfOD7mXtxEJtV3RcBhdYNCoJRUtxcGTAHQVpPbAXy6CzQPj/fYsAB
rUFJEFrFEBBwxemI9pSRgzgR/k1cq/6lxW+S3rH0yaxmSwO0SH2UtctpHnCwI8zQ
Uk5KwRs5b6jlNaSIWpraI3+7KKMc9n+vpHwqMZAqdqvadgkeyMyLrZq84zZJM1oH
PB9HUFpEmvxfk0vpI2R7oOSEMYJRZ50z1AX0XfokWwrJ6seqPzDsET3MJLC1bep5
bLLFD4pHhQ2Cng0DuoEV0APFbpSuW78Yn9nnQY4NdWjE/7UWA35tCdxwsVWSIx0t
Uqdm4TrYhhJ0neGXb2is8z18NRpsqu9Xyxq5GNFNIKqMeaMRJqy8qDrNfC7vJ4nS
BdnlYUdQ1SH/IpoCntv7MFFBJ3c11xMKJ1BRXgmltDe+McV0yi5zYND2BIx0B0ZN
sKe72nwPSalYNYsuCHg3K2wl+mMuZI+l1+TeVrWVK4AHY4RfHp188J/XfhuzJOXm
PHSZ7L8wMx8b/4iez+J2JtAQCknI93f/tyXxEoCDJBD8Y2PANwzbI5LqVTxiIyq+
Bwu8bZy0q42hKjN7B2HkF8ynBtumNAZZPc5nlvhLCoG+IdnZKRdjEbvw4e2deQCH
SHOCCRo+Q1FHRAeiicNlwsSeO0Yoyqz7LVyVBy3dyD6lwjHQReE=
=C3tM
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
