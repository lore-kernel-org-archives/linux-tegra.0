From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: bus: Add missing of_node_put
Date: Mon, 25 Jan 2016 15:02:28 +0100
Message-ID: <20160125140228.GB7014@ulmo.nvidia.com>
References: <20160124163210.GA24872@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160124163210.GA24872@amitoj-Inspiron-3542>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 10:02:10PM +0530, Amitoj Kaur Chawla wrote:
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
> // </smpl>
>=20
> Signed-off-by: Amitoj Kaur Chawla <amitoj1606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/host1x/bus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWpir0AAoJEN0jrNd/PrOhdfgP/RzDVzkGu+K76JXP3EL1y/sP
5bxLWjdNVDeZq+IB08byAbY2aTVby44MA4LYEiSgS/OSQ2iDueeD2ERh8sSU4wPC
MqSbt26vxfqxTGqzPB8ydolibFiZZ70u3LcOK1smdyP7bQ3/I5FQvNenybgvu0+n
2Af9F0JRy863zT06IYxQ+p0+4H0CypzLxYxEc/pyomz96OSn5f3Sq/zvEjveFZrP
KtNp0ZPukPxqnKe1+54w6ciGxUEtDdwD/i+YRDLHpAeOIBPTj1mwcaX7Fe0yDnD8
jKRb9AC5Xh6FS9GHpkPIHF93p7uNRCNw/eM0PWpxZiIxtWTcTrq31qqCJaKH5wpq
duGh5VGU7y0qDejBY7/n28o1PUdDC0gNGmLimIYoj6IwXqaDTiC6ILfRpLtVjW8X
n2NZbW4hCrDxKKRKWW7oxj0lOOUelNBGnMF7v+tGqO7aOsSmsMhAoRO0BAA/ApYv
76mSvEa8rMs+PTndRRQn0HvhEn2N/1TdAKtlZkSGpvliObsb//n9ifdf6L/GmOEv
7wKO0XiFOhv7rHsFAk/JiQV2YgyWHvLRUS3Nwt2It7F62Xas8nYLMx2GLiasylRy
EMeykHaGrNyDAIIioiqbIYtkw4wsvQM+aApwrS4ST32JwxbXnnxcwWLrDOfz8Fea
qWo4o5dN91j4n7ZMukHx
=CjLm
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
