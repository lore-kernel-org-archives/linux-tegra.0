From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Make <linux/of_reserved_mem.h> self-contained
Date: Thu, 7 May 2020 22:04:28 +0200
Message-ID: <20200507200428.GC2981633@ulmo>
References: <20200506123236.7463-1-geert+renesas@glider.be>
 <20200506123236.7463-2-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506123236.7463-2-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 02:32:35PM +0200, Geert Uytterhoeven wrote:
> <linux/of_reserved_mem.h> is not self-contained, as it uses
> _OF_DECLARE() to define RESERVEDMEM_OF_DECLARE(), but does not include
> <linux/of.h>.
>=20
> Fix this by adding the missing include.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
>  include/linux/of_reserved_mem.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl60acwACgkQ3SOs138+
s6FsFA/7B7X7gehd5I0pTYnsO1phcr4+EnGh1T1c9A8M/5MqPcKsQcylY7g3R1kz
3/rUSlzCOsUouLNzZsJE/sra1gVqC4eMeAEvmflM1EcijoVTsutz64qG273qsKkK
AxbYqFrA/ghLL8/x8pKCGu9WOLmWoOGhq9LKx+SoAZ5i9Oe/kvg1eiTfO+ph7jZ8
rOm01tFMdLuHKbAlWTilGTmMJ5SL6xZg0GRmmwDOWJTtnRDNKW4ooACxZQ9nkn/0
oLkAobbxi0Jv/N5FlWhmN0e4R1ZIOMZk4o48Kjh2eoJRITqfUho167uoXR2db90o
3kJ4Ug6a0niURulQhCWtCZAIkujCiXQ51KX9WLfd9iscor6pH1FuiDIiSLKIGc6M
cD6Z4Bacg7oxMGOex5czPzPhEnTgvMfkzWVKsMhYqF7s8QbnTDdOvqvEIE2cBvp7
uNw20L9vMUj4vQDNOPPy43nnbZoZsg44+nzfTR2NgKC1fpLyNbBfWSvR4rCb0uTd
ptNxChFyvtXMMvd/b9GrmZkO24XlLh34fbNBApaGECXWBaehFunuct56k9tbBErW
32wFoCsGYksfG1fGiZnhJ9foUhqtNXTbm4PhInvVy92nj1pQ70oHnTn0zwsQhnKt
EOoV9Iv6IltW49/Kdz0KBunWyEUziOzhPBFrHXP1WF+6DqKUhtI=
=V1u3
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
