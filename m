From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2 3/4] i2c: tegra: support for I2C_M_NOSTART
 functionality
Date: Tue, 12 Jun 2012 18:25:27 +0200
Message-ID: <20120612162527.GB24753@pengutronix.de>
References: <1339497451-26260-1-git-send-email-ldewangan@nvidia.com>
 <1339497451-26260-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1339497451-26260-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 04:07:30PM +0530, Laxman Dewangan wrote:
> Adding support for functionality I2C_M_NOSTART.
> When multiple message transfer request made through i2c
> and if any message is flagged with I2C_M_NOSTART then
> it will not send the start/repeat-start and address of
> that message i.e. sends data directly.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is rebased of earlier patch on same support.
> At this time using the new flag I2C_FUNC_NOSTART.
>=20
> No change from V1.

There is a change. It is now dependant on the clk_prepare_enable change
which will go in via arm-soc as discussed previously. Can you resend
please?

> @@ -564,8 +579,14 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, =
struct i2c_msg msgs[],
> =20
>  	clk_prepare_enable(i2c_dev->clk);

^^^^

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/XbXcACgkQD27XaX1/VRtdqACfeEe0JtvcWCgbwSaFVHFCaPdp
LpsAn1JhjLP8fwszNoQEA/2obYH2G1wl
=+Iev
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
