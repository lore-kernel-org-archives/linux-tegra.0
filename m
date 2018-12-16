From: Joey Pabalinas <joeypabalinas@gmail.com>
Subject: Re: [PATCH] Staging: nvec: nvec: fixed check style issues
Date: Sun, 16 Dec 2018 13:02:37 -1000
Message-ID: <20181216230237.f6efaxfj4ejjemf7@gmail.com>
References: <1544996634-10427-1-git-send-email-indigoomega021@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="altdjwdkeypm32xa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544996634-10427-1-git-send-email-indigoomega021@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
Cc: marvin24@gmx.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, Joey Pabalinas <joeypabalinas@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--altdjwdkeypm32xa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2018 at 01:43:54PM -0800, Amir Mahdi Ghorbanian wrote:
> Replaced udelay() by the preferred usleep_range() function.
>=20
> Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>

Nack, usleep_range isn't for atomic contexts like interrupt handlers.

> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 08027a3..6f35f92 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -626,7 +626,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(0, 33);
>  			if (nvec->rx->data[0] !=3D 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");
> @@ -713,7 +713,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	 * We experience less incomplete messages with this delay than without
>  	 * it, but we don't know why. Help is appreciated.
>  	 */
> -	udelay(100);
> +	usleep_range(0, 100);
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.7.4
>=20

--=20
Cheers,
Joey Pabalinas

--altdjwdkeypm32xa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEENpTlWU2hUK/KMvHp2rGdfm9DtVIFAlwW2YwACgkQ2rGdfm9D
tVIV/hAA4Jna7ooCtJi65KnkkDxUnGxmapj9qkpOIcgVvBb467uqNmXl2faTHGNE
l9x2d+2m3rmBHCUsz/sZ0mrmOwZi44xLNYvQdrZ1jnBJzHMAaGsPdAyCr2jFBQLO
cP5+16XNIdIzRlhXql7v3Vd+mIXBXCY3Udyg0FWxaGoQWVVb6wX+u8gQ9MR+bM2V
pJC3n/JfD6ScJhvIu+L97yXKSQhruiCEOAHvjGm7zyZ4DSJY5GTcRfarIRKKCjE7
koGBvDpke0mrslRUZa483c655jBJ8g+3gIJJJvosJ/H5Ii67WaxhgO7RTTiojqtS
HYzIAm0KsLuR3us0dAx4/bh2MxmxUBoknip218QQvfEGF0ApCphBFR0PHMOBQ/Q8
yVMLb0XcocS3AZz9Oc7NgFOqUCMhApsJifGLKWRc5Q6FL7LsjN9RDKHSoypyZxBd
HVjXx392r2tNHoMbsS7QFQsxRJOzAqc4qD7T94EJO97PeqOjw4xShDRjNQf8WBT/
IzRMlHOjgoKVlIv2TleCRUAe2eK1X6abWZBoTeAUoojcWq6Ox84oIUUHDaUhqqrO
8wUplCiH6aUUHIK96W5JiPKDyCC4Fx2bk7YU+wgK4CurEZJEUsiHhCNpyvigrf83
rRY9FZ7yl5fi7r8M9Q4w5ObGQtaFE4HAtPmUMk333PJQP1hN0TU=
=bqCe
-----END PGP SIGNATURE-----

--altdjwdkeypm32xa--
