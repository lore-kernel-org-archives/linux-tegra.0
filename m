From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] memory: tegra: delete unneeded of_node_put
Date: Tue, 14 Jun 2016 11:38:38 +0200
Message-ID: <20160614093838.GC22567@ulmo.ba.sec>
References: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
 <1444412861-2580-2-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444412861-2580-2-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2015 at 07:47:40PM +0200, Julia Lawall wrote:
> for_each_child_of_node performs an of_node_put on each iteration, so
> putting an of_node_put before a continue results in a double put.
>=20
> The semantic match that finds this problem is as follows
> (http://coccinelle.lip6.fr):
>=20
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> iterator name for_each_child_of_node;
> @@
>=20
>  for_each_child_of_node(root, child) {
>    ... when !=3D of_node_get(child)
> *  of_node_put(child);
>    ...
> *  continue;
> }
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
>=20
> ---
>  drivers/memory/tegra/mc.c           |    4 +---
>  drivers/memory/tegra/tegra124-emc.c |    4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXX9CeAAoJEN0jrNd/PrOhvN4P/3Rp1fGCzC2Epyc58Cv7ACNz
IGxwuZApdOhvshR/DGLpxhSULJlvUXtI9MBJ6kK56lGUoTYAppH3KKl0KGLKlAHw
df80hjG59Pu1atjGt9LdEk98kqCXjmoSTR5Gy7sfIxRwoP2lL8VwiwsB/41H2ZYT
BhFVc//9+bLYWgFDetbKrKiNzziRy6oRdSXuhNsYqW5FCvBbzypCflzD39IkOrKW
hDef60Dk9SbqCGXEAPL/2XOiUMMUYYcMLDOATvTe3yCxpd6klNS4dnUQoRiWl2pc
DosJdCLRX8REdELiACxRboHHqNoZxuw6h+xdjIhvbOOqh9oZdBac9jEUknAv0WUZ
9XJC7PO99hF4pExV/Y8CnIQUhLMevnI7x3LmjpsJGGbjXw6fNhEw90PwuwWOie4I
F7BU554VKHURj3oUhSBFBze6asiOB4Foeh+abI2fGtwGK9GQi8Sx6NJ1ApGL3I7w
YkOuXczdc/7n48aOA06gHGBwnbsc5Cr/Kb5otMo5kP1UKXQK436PwbC2VomFWQgL
y61Yf+xTLECeDcEuemgRVSJeBGthUgc7brOq5Dnwy+hMiGW9RkOWCkmp5Kr7JCXv
XwRkQA5Tb025TXX0xxm6+U88zQX54gNNew21Yr6zf0Olsggq2mvDMT4rY2agULVW
6n3D8Coy5frp20laFxTO
=H3GI
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
