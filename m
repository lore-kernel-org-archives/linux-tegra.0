From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH REBASE 1/2] i2c: tegra: I2_M_NOSTART functionality not
 supported in Tegra20
Date: Sat, 18 Aug 2012 20:29:40 +0200
Message-ID: <20120818182940.GA19802@pengutronix.de>
References: <1345230155-4252-1-git-send-email-ldewangan@nvidia.com>
 <20120818124703.GC12839@pengutronix.de>
 <502F8F83.5030902@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <502F8F83.5030902-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>-	clk_prepare_enable(i2c_dev->div_clk);
> >>+	/* Support I2C_M_NOSTART only if HW support continue xfer. */
> >>+	for (i =3D 0; i<  num - 1; i++) {
> >>+		if ((msgs[i + 1].flags&  I2C_M_NOSTART)&&
> >>+			!i2c_dev->has_continue_xfer_support) {
> >>+			dev_err(i2c_dev->dev,
> >>+				"mesg %d have illegal flag\n", i + 1);
> >>+			return -EINVAL;
> >>+		}
> >>+	}
> >Drivers are requested to explicitly check for features of the I2C bus
> >(like M_NOSTART) before using them, so I'd skip this extra check.
> >
>=20
> Ok, I kept this as part of flag checking so illegal flag should not
> be passed. I will remove this on next version patch.
>=20
> >>+
> >>+	clk_prepare_enable(i2c_dev->clk);
> > From a glimpse, this change looks unrelated at least. Even wrong, no?
> >
>=20
> It was already there, just before above check. Due to insertion of
> check, this code shifted, otherwise it is not a new code.

It used to be ->div_clk and now it is ->clk?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAv3xQACgkQD27XaX1/VRuMSwCgwWBZ/GTWIGew9JIPPT1F+OJW
QOIAoKnHdvNb2jtx3suvGHm+WNAro7p9
=SQ3A
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
