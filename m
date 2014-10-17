From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: drm/tegra: Add hardware cursor support
Date: Fri, 17 Oct 2014 15:15:05 +0200
Message-ID: <20141017131504.GB22700@ulmo.nvidia.com>
References: <20141017113123.GA24962@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141017113123.GA24962@mwanda>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 02:31:23PM +0300, Dan Carpenter wrote:
> Hello Thierry Reding,
>=20
> The patch e687651bc1ed: "drm/tegra: Add hardware cursor support" from
> Dec 20, 2013, leads to the following static checker warning:
>=20
> 	drivers/gpu/drm/tegra/dc.c:597 tegra_dc_cursor_set2()
> 	warn: mask and shift to zero
>=20
> drivers/gpu/drm/tegra/dc.c
>    594          if (bo) {
>    595                  unsigned long addr =3D (bo->paddr & 0xfffffc00) >=
> 10;
>    596  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>    597                  unsigned long high =3D (bo->paddr & 0xfffffffc) >=
> 32;

How timely. I'm in fact revising this code at this very moment. =3D)

The masking here is indeed somewhat fishy. While it does the right
thing, it's also needless to some degree. A better version would be:

	addr =3D (bo->paddr >> 10) & 0x3fffff;

Since this is written to a register where the upper 10 bits (actually
only 8 because bits 22 and 23 are reserved) are used for additional
control parameters (cursor size and clipping region). The above will
properly write bits 31:10 into bits 21:0 of addr.

For the upper 32 bits the mask is completely redundant. According to the
register documentation, bits 1:0 should correspond to bits 33:32 of the
physical address, so something like:

	high =3D (bo->paddr >> 32) & 0x3;

would be more correct.

Thierry

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUQRZXAAoJEN0jrNd/PrOh/woQAI/BFJ2ymUUtLGYj8Nn9Kam2
2QgZIwQTLTIYIOmX4VqZ93Lbyw45Vn8KNpxs8ZIA1q8Foqc4ulYhBvhqboS/GF17
xiox7eoRx8ZIsVI1onR0Y9eQ63witmf8hDm0jr14qbpWt4eDkh7qSlaep43+pEsi
WWzQr6TvYCGe5vyafHzHcrgGvcvk2KpbtAfSpPCl4rrHYIl4efiS9qoCf8/FpdsF
DdMDMIDWOmUwP5CThTfS+CjJEj0xLIp35mafJ8D+HTbwZRaMVVEZXo7XE5EKNnxG
LaN1hZD6h4t5UZCfmARqPjQSKvpMDHk7VqnD1XvZDIWG0gDoR9/9CLoyMTdlhwPr
VsEM7fSqkPjbRUni3+PrJwXDRNQIXQXiFwXGjC/LmRejGNH+y0Kd8fx33N2tnCmO
2nWUwGO5A0GJjLZ0vOy9lBRsEjqpqq2p7UOR50pK49h/+nDj8wbQnW5XwCLlbyyq
X26sDov27kIa9tIk/Opppmaz5m9mmmI9fa3WmahH4VuC6E+cDZPPy1JNvdDDcQkM
6SCWZBUUs0tVzxRyqyvf/yrnMoDdZjLpd/2eQhqzPL5V993PpfJJP4tTzpkjeKLN
VcUORDTvm3CcvOaponUvfVOZj3oYU3w9GjK8FCfenVRwLs/ttbBPOrIRDeH+1SQW
3Qh/bjqtEW/P/BEG3JxZ
=WjnX
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
