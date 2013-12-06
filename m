From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [flasher PATCH 2/4] Increase padding between U-Boot binary and
 flash image
Date: Fri, 6 Dec 2013 16:12:15 +0100
Message-ID: <20131206151214.GB32372@ulmo.nvidia.com>
References: <1386281582-18561-1-git-send-email-swarren@wwwdotorg.org>
 <1386281582-18561-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386281582-18561-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 03:13:00PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The flasher currently places the flash image in RAM almost directly above
> the initial U-Boot binary location, with just a little padding/alignment
> in between. This is also where U-Boot's BSS is located, prior to U-Boot
> relocating itself to the top of RAM. Hence, if U-Boot touches its BSS, it
> will corrupt the flash image. Increase the padding between U-Boot/DT and
> the flash image to avoid this. U-Boot's BSS is roughly 300K at present.
> Make the pad size 1M to allow plenty of room for growth.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  tegra-uboot-flasher | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
> index d97b9e43aa45..06e297730112 100755
> --- a/tegra-uboot-flasher
> +++ b/tegra-uboot-flasher
> @@ -143,9 +143,9 @@ def func_flash():
>      if args.debug:
>          print 'u_boot_plus_dtb_size %d 0x%x' % (u_boot_plus_dtb_size, u_=
boot_plus_dtb_size)
> =20
> -    # Add 32k in case size changes due to fdtput
> +    # Add 1024k to avoid U-Boot's BSS, and in case the DT size changes d=
ue to fdtput
>      # Align to 4k, so flash writes don't need a bounce buffer for DMA
> -    padded_size =3D (u_boot_plus_dtb_size + (32 * 1024) + (4 * 1024) - 1=
) & ~((4 * 1024) - 1)
> +    padded_size =3D (u_boot_plus_dtb_size + (1024 * 1024) + (4 * 1024) -=
 1) & ~((4 * 1024) - 1)

You could save a multiplication here by extracting the common factor
1024... =3D)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoelOAAoJEN0jrNd/PrOh6YsP/20H+K0/PJHZt/zbnn4/dGXd
z+PwkueFpAER+6GLD6ONGcBHQL2BOi05djs1bZVKNd4m8JGbIBdPSbP6mCMiBJWL
bdWYHsBJUUV0CNGvjQtun16NzLAeWdX93fp/Au0f5RPEQSJm1stbjfYOS8NJoXo0
ReUxrCXTKvLNI6vzeEaIkSmY2SKBvRDWOMnvN1hLszH5W4q6m0MPWfJwGetfUkQV
xnC88v0rTXJEVKTfTQW5qa7diR7s6EX3J1vJDRbJAJIly7uOkLWnicJ1QpMW6z+d
ZR7XEO45GkWdRTCVrtW99wc0PLs6L5yHYeoG7T4zgt3iTFQiU+Pu0hnytXMUPt1g
ay9KJIbE8eKj858qZkhppggzDj8bD8XzRYDzXj+LPX3TPG6dZqBINhB0jCpCnWf8
B/IxmtibhjA7Canr1jEfhTC1THvK6ZaQAKRglxNVHbgkQZF7yoKdVmAcw/FmCTnY
FtT09ec2pREpVPXCZKQTA5eo3YM7uyO3zRviAVfBH/K2Omo/xp3wOBlO5uChKK1g
bCuVHjmpZygAcIsHKLJkYGOE7RVA7Ow418GtyPsvQIC1H5ReOVbvs3rOgLKBJg/k
Q494J/oR7ArOj/vqdluDuE3anKHkQOyEoV29pH4K37SOtGcvE8K1GwjajoUHETR7
tu/fVCIQnT73nQZWtPKg
=cH9f
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
