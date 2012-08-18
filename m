From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH REBASE 2/2] i2c: tegra: dynamically control fast clk
Date: Sat, 18 Aug 2012 20:52:44 +0200
Message-ID: <20120818185244.GD19802@pengutronix.de>
References: <1345230155-4252-1-git-send-email-ldewangan@nvidia.com>
 <1345230155-4252-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345230155-4252-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 18, 2012 at 12:32:35AM +0530, Laxman Dewangan wrote:
> Tegra I2C driver enables the fast clock during initialization
> and does not disable till driver removed.
> Enable this clock before transfer and disable after transfer done.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Except that this patch is affected from the flaw of the previous patch,
it looks good to me.

> -	clk_prepare_enable(i2c_dev->clk);
> +	tegra_i2c_clock_enable(i2c_dev);

This should be div_clk.

>  	for (i =3D 0; i < num; i++) {
>  		enum msg_end_type end_type =3D MSG_END_STOP;
>  		if (i < (num - 1)) {
> @@ -597,7 +621,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, s=
truct i2c_msg msgs[],
>  		if (ret)
>  			break;
>  	}
> -	clk_disable_unprepare(i2c_dev->div_clk);
> +	tegra_i2c_clock_disable(i2c_dev);
>  	return ret ?: i;

If that is fixed, you can add

Reviewed-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAv5HwACgkQD27XaX1/VRvu6QCgphMFz7+xOciNKwLbn32hqw6x
GdgAniqA07wwMuAUHLwkEdC+phgcQzt9
=bubb
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
