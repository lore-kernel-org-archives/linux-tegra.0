From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Check for overflow errors with BUG_ON.
Date: Mon, 15 Aug 2011 22:17:46 +0300
Message-ID: <20110815191745.GA7178@legolas.emea.dhcp.ti.com>
References: <1313434172-18319-1-git-send-email-dianders@chromium.org>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313434172-18319-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 15, 2011 at 11:49:32AM -0700, Doug Anderson wrote:
> This change doesn't fix any known problems but turns
> on the overflow detection feature of the i2c controller
> in the hopes of flushing out any current (or future)
> bugs in the i2c driver.
>=20
> Inspired by a change on nvidia's git server:
>   http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-2.6.git;a=3Dcommit;h=3D266=
d1b7397284505e55d06254b497cb32be07b69
>=20
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 2440b74..4dbba23 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -367,7 +367,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_d=
ev)
>  static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  {
>  	u32 status;
> -	const u32 status_err =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
> +	const u32 status_err =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
> +		I2C_INT_TX_FIFO_OVERFLOW;
>  	struct tegra_i2c_dev *i2c_dev =3D dev_id;
> =20
>  	status =3D i2c_readl(i2c_dev, I2C_INT_STATUS);
> @@ -389,6 +390,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_i=
d)
>  	}
> =20
>  	if (unlikely(status & status_err)) {
> +		/* Don't pass this back--it can only happen due to a bug. */
> +		BUG_ON(status & I2C_INT_TX_FIFO_OVERFLOW);

so due to a FIFO overflow you lock up the whole system ? Can't you e.g.
reset the controller and reconfigure it rather than locking up the
system ?

--=20
balbi

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOSXDZAAoJEAv8Txj19kN1sqgH/0qunZbxaH1EKndqvuHmsNE/
jHap7J8Dzc52bCHb8ZWJdEztjvIh26ZnG+SQsqbQz5bwe8nfGs/00V0W4slB01l0
+6k/Mbn2KoiLSIVU7Os3frGBViY4A9nVk1+YzD0OM5ZvQkpt3lYOdFNGUim6CCSq
jh5Dp5DfQ10F3OP2qWU4BI8fNygImI6FdL57sT4GxuVBO6VpfMMZegVaYjRL2E2O
BU8nKrtYXT7gZLibutNbl/cG8Y6pKdZv1h/NXYKaYWLWEV+lq3vjjcdmmMmroYmX
P/ZjUKU9zsSYaprecLXIU0waAP1gsHj2mhi+s0xzYioD55SAmlJj9assy7WRd+g=
=MK/f
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
