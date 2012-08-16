From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/4] i2c: tegra: required clock support for controller
Date: Thu, 16 Aug 2012 10:22:10 +0200
Message-ID: <20120816082210.GA26183@pengutronix.de>
References: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
 <5022A89F.8070604@wwwdotorg.org>
 <502BD51C.4010204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <502BD51C.4010204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 10:58:04AM -0600, Stephen Warren wrote:
> On 08/08/2012 11:57 AM, Stephen Warren wrote:
> > On 08/08/2012 01:51 AM, Laxman Dewangan wrote:
> >> The Tegra's i2c controller required two clock sources for proper
> >> operation named as div-clk and fast-clk.
> >>
> >> Adding support to make sure that driver will get these clocks and=20
> >> enable before any transfer and disable after transfer completed.
> >=20
> > This works fine on Cardhu and Ventana for me. I'll apply it once I get
> > an ack from Wolfram to take the I2C driver patch through the Tegra tree.
>=20
> I haven't heard from Wolfram, but since the I2C driver patch is pretty
> trivial, and pretty much has to go through the Tegra tree due to
> dependencies on other Tegra patches, I went ahead and applied this
> series to Tegra's for-3.7/clock branch.

For the I2C subsystem:

Acked-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlAsrbIACgkQD27XaX1/VRsaBgCgwGBW6bgVA5yX517dbWxnJHCO
a+MAn2SpJnx2oc6WKUCiizNC7tJCSzGC
=mDc/
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
