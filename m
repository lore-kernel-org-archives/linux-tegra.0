From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Include linux/types.h
Date: Mon, 17 Jun 2013 22:33:54 +0200
Message-ID: <20130617203353.GC5265@mithrandir>
References: <1371470294.26299.21.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371470294.26299.21.camel-uMdlDhfIn7prKue/0VVhAg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2013 at 01:58:14PM +0200, Paul Bolle wrote:
> "make headers_check" complains about include/uapi/drm/tegra_drm.h:
>     [...]/usr/include/drm/tegra_drm.h:21: found __[us]{8,16,32,64} type w=
ithout #include <linux/types.h>
>=20
> So let's include linux/types.h in this header.
>=20
> Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
> ---
> Tested only with "make headers_check". I don't actually build or run
> code that uses tegra_drm.h.
>=20
>  include/uapi/drm/tegra_drm.h | 2 ++
>  1 file changed, 2 insertions(+)

That has already been fixed in linux-next.

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRv3KxAAoJEN0jrNd/PrOhyV8P/AqOcKEtzd0mvftiBLi2PhcB
TJUXu/DQNFkyGLTpxNTPxJtOvWv/QpY3czSeCkNj/eJ13gYW+ILIVP6X9lXw70+5
pa9Ij4OtSVX+DTcNZ7st+2J1nWBW9odIsxxdigwgmlNEH+g4vPpmapuls+fYsuzL
LnwsfbXw3m9K4Udfr9O4U3M03lz0Ta0Hv31+sW5qCBrn7XDQTugqUC/l1z6Ugj9K
+UPeY8heVLrOcSrn/EsFtrk3JWpiRb5wwNAR1+K/GbmJjdZJNsP/aZhXGk1Ot0xv
54ZuAlFydlwzu9kLnN0GJUsqqRD4XRYMjnOb/UjNNciUaFnmVeMDS6PuPYlu24yF
2pYjV4SmErHv2tNwB+NcQeTXhahVmv3UY/05w6DzK6rt4uWdRY0Ia4NJTM+kiFif
F+KR9hIxEnCGftJ8K9v2jJ2BAdlLa19+P3qs5Sau28K1EBNeQQ0ZYzSIXSL89M+f
zq49PUcIjHyZy+tkoIZErzLdTbBjW6BoViyubk0Nhhd+hICaaXxm8XIFTXZNdTHj
e/iekSEyMTpg+cJKNFXJeLhHvop+Gcf8UfGDFPPFuPCmVD1TcUUuLIyDrcaY0z4a
4meFaQF+vmdZHAArVT0DnfA5jzuhuk30yAEWhou6HyqKdh7jQrPXIfVLZUrR/zcV
O4E+dpi+AuNN6I3W3pxn
=VzP9
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
