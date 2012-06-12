From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/4] i2c: tegra: make sure register writes completes
Date: Tue, 12 Jun 2012 09:54:22 +0200
Message-ID: <20120612075422.GB9230@pengutronix.de>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com>
 <1338901800-23968-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1338901800-23968-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2012 at 06:39:57PM +0530, Laxman Dewangan wrote:
> The Tegra PPSB (an peripheral bus) queues writes transactions.
> In order to guarantee that writes have completed before a
> certain time, a read transaction to a register on the same
> bus must be executed.
> This is necessary in situations such as when clearing an
> interrupt status or enable, so that when returning from an
> interrupt handler, the HW has already de-asserted its
> interrupt status output, which will avoid spurious interrupts.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 8b2e555..fa92396 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -430,6 +430,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_=
id)
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> =20
> +	/*
> +	 * Register write get queued in the PPSB bus and write can
> +	 * happen later. Read back register to make sure that register
> +	 * write is completed.
> +	 */
> +	i2c_readl(i2c_dev, I2C_INT_STATUS);

Does it make sense to put the read into i2c_writel?

> +
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		BUG_ON(i2c_dev->msg_buf_remaining);
>  		complete(&i2c_dev->msg_complete);
> @@ -444,6 +451,9 @@ err:
>  	if (i2c_dev->is_dvc)
>  		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
> =20
> +	/* Read back register to make sure that register writes completed */
> +	i2c_readl(i2c_dev, I2C_INT_STATUS);
> +
>  	complete(&i2c_dev->msg_complete);
>  	return IRQ_HANDLED;
>  }
> @@ -505,6 +515,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i=
2c_dev,
>  	ret =3D wait_for_completion_timeout(&i2c_dev->msg_complete, TEGRA_I2C_T=
IMEOUT);
>  	tegra_i2c_mask_irq(i2c_dev, int_mask);
> =20
> +	/* Read back register to make sure that register writes completed */
> +	i2c_readl(i2c_dev, I2C_INT_MASK);
> +

It definately makes sense to put this read into tegra_i2c_mask_irq()?

>  	if (WARN_ON(ret =3D=3D 0)) {
>  		dev_err(i2c_dev->dev, "i2c transfer timed out\n");

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/W9a4ACgkQD27XaX1/VRuUqQCglVAJt24rc4csHjA6Xcy/CXWO
0vkAoI/ySXqxiqSF9atgWue7VNs0G44G
=Bnh4
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
