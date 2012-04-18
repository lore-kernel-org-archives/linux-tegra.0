From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Wed, 18 Apr 2012 22:20:37 +0200
Message-ID: <20120418202037.GA32444@pengutronix.de>
References: <1333345982-16595-1-git-send-email-alokc@nvidia.com>
 <20120418142758.GE19220@pengutronix.de>
 <4F8F1DBD.8000009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F8F1DBD.8000009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Applied with Stephen's ACK and slightly reworded comment and commit msg.
> >=20
> > Wondering a bit that you want it for 3.5, not for 3.4. Looks like a
> > bugfix to me.
>=20
> Yes, applying this to 3.4 would make sense. When I said "for 3.5"
> earlier, I meant I'd like it to at least get into 3.5 not later.

Done, thanks for clarifying.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+PIhUACgkQD27XaX1/VRvUFQCfUaLzzZvLpqp2vD4w4NktXG3/
KH4AoMxEDPPUrybbZIFpKgxfmpIph/9n
=kkAs
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
