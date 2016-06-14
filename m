From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] memory: tegra: mc: Add missing of_node_put
Date: Tue, 14 Jun 2016 11:36:00 +0200
Message-ID: <20160614093600.GA22567@ulmo.ba.sec>
References: <20160125172307.GA26190@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160125172307.GA26190@amitoj-Inspiron-3542>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 10:53:07PM +0530, Amitoj Kaur Chawla wrote:
> for_each_child_of_node performs an of_node_get on each iteration, so
> to break out of the loop an of_node_put is required.
>=20
> Found using Coccinelle. The semantic patch used for this is as follows:
>=20
> // <smpl>
> @@
> expression e;
> local idexpression n;
> @@
>=20
>  for_each_child_of_node(..., n) {
>    ... when !=3D of_node_put(n)
>        when !=3D e =3D n
> (
>    return n;
> |
> +  of_node_put(n);
> ?  return ...;
> )
>    ...
>  }
> // </smpl
>=20
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>         -None
>=20
> There is also an extra of_node_put() before a continue in the same loop
> on line 212 of this file which should be deleted. Julia Lawall has
> already sent a patch to delete this but if preferred I can send one patch=
 to=20
> do both the changes.
>=20
>  drivers/memory/tegra/mc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXX8/9AAoJEN0jrNd/PrOh3CgP/1YEhGVSisA8HCAs0KV2871E
scw2OuhOy89kJBj9M6h8eKatv2hflwXHU8zc7DWgr83XNK9pIOPzCza8Ff8Bb30G
R1em56sRuMYNCvBKIo2UrNPLtlvGm1PFiq9AGGO3fjQ/f0Kv28/QIUlkdGLGuJeO
QjIraznLNYkSh/8f77G92SYLznyJ92I85ri+OxuE3S8C7fN8BxE9RQ4o4ch+VC5G
cQqez2pj9fXS4JetNJF4iMRMzg2nZEXXvtZ02lm1QtuQIyPYN1ZFBhCfrauewQHM
XfnuZhe+HQiBroOVRj8mCM/dV9CVco9j7rrlsUlrRwJHKOMhvKIOOEP4jiCrAx+O
xDmsNRwoloNmoYL7MWvgznn2vAOndE8tgIbNwj6HUX015JDFz8q/zmaEqnU5MnXU
Teq6hyFqt0k/JjWyFUr7KnovAcN8CYi0n3ppI9ovSIiAO8fbJrCwYy5E8PV96SjK
oMLSG3waCMx+k3ur6HwFNxYEXoBTMwqfUFqH8TlaUQ5RjvE1jYNzy9mZdO3/AVjg
UWMvp8w6jTaijOSHUAf5FP8u21QylAI++UnbUt3CaBlf9FsPb0nSo1JgYBPDM3bv
ZY6+xqp7b+lFHgZN9jeIiy+LGc4BzoFH3VVVlKlmWCne89Kv9gzTG7DITtKZWhTP
fN6ZU8G75Ehf+8V5kga/
=lsZh
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
