From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to *_noirq
Date: Tue, 24 Jul 2012 17:29:34 +0200
Message-ID: <20120724152934.GA25942@pengutronix.de>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
 <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
 <500D96E6.4060507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <500D96E6.4060507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 12:24:38PM -0600, Stephen Warren wrote:
> On 07/10/2012 05:20 AM, Laxman Dewangan wrote:
> > To provide the late suspend and early resume for i2c
> > driver, convert the suspend/resume as
> > 	suspend-> suspend_noirq
> > 	resume -> resume_noirq
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Why do we need this change?
>=20
> IIRC, I proposed it before solely to solve some suspend/resume ordering
> issues, and Colin Cross NAKd it. These days, deferred probe should make
> this change unnecessary.
>=20
> Unless there's a really good reason for this change, I'd tend to request
> reverting it.

I will drop it from my tree and exclude it from my pull request. Please
resend if it should go in later.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAOv14ACgkQD27XaX1/VRvV3wCfcHSaErshHwP4cAd+V1ysV+8M
i9sAn1pSEwrBjkeb/zrWtlZ0zYvi4gNl
=goUI
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
