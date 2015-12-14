From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/9] drm/tegra: dc: add missing of_node_put
Date: Mon, 14 Dec 2015 14:35:39 +0100
Message-ID: <20151214133539.GA986@ulmo.nvidia.com>
References: <1445697755-26341-1-git-send-email-Julia.Lawall@lip6.fr>
 <1445697755-26341-6-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445697755-26341-6-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2015 at 04:42:31PM +0200, Julia Lawall wrote:
> for_each_matching_node performs an of_node_get on each iteration, so
> a break out of the loop requires an of_node_put.
>=20
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):
>=20
> // <smpl>
> @@
> local idexpression n;
> expression e;
> @@
>=20
>  for_each_matching_node(n,...) {
>    ...
> (
>    of_node_put(n);
> |
>    e =3D n
> |
> +  of_node_put(n);
> ?  break;
> )
>    ...
>  }
> ... when !=3D n
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>=20
> ---
>  drivers/gpu/drm/tegra/dc.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWbsWoAAoJEN0jrNd/PrOhKcIP/iMrCcTQ8BLErzBzVdW+Ot1d
hn94/vydY5aDdbvh1Qzj7WETUuSxiAXIDChETgxlvxliBNVFLPbwK4J8nIBMqsLE
Zwz2yZWF5FzW9JZpHQF9uQDHZu2nhQ36iPnZpcSb1uQ9Um0+7HOBCPbT5qYwD+gW
CNhHNG+ua1uLSKrfFdA7KtPM/ZuPon0Dj+RuCP/WIZ/JXwC2+ZRGxS2rUupMTbyB
HbxkxWmlfrvSuD8LOqriv/qg3vPM2dmqaPpTbGzu7FeYu31lo00Y5Iki8g8OL6dz
nxkCeDhUeFGhDkUggdin5x4xTzbE3oJlYRLr6r0FDwclFalpb9v8+2vpqjhcoB84
BpFEV39qsT0srU2lLewbIWr8ioSjvL6LiE413XihR17N+Ezagn38FpEx/ZhnNSg6
3m0Ydr1RFQUbHyQX7Za5hWhnENUXN9WBKO2Tr+o+j1CYNyMLBS6bhxjeAIF7nadC
A6+EVN3pa/LZISdJ8qo7RcZmDkYU1nk9ZbJ86Eal3s7qSPiwG1nL2xqYVMBHWReI
5lHL5g3GPIpatDzMYmn2HF0CTZTRL8cw6WYdwAGOyXMNHzqAYjCrgTOU8TwQhLHz
jOmwsA8ztsiun1z1tftMuuZoEODV+d4ag9igfxgXljBYItxGG0GegOERuWaHiK8i
xfEoAo8dtof2S6OCchnP
=Enb3
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
