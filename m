From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/4] i2c: tegra: Bug fixes, cleanups and M_NOSTART support
Date: Tue, 12 Jun 2012 10:50:40 +0200
Message-ID: <20120612085040.GC9230@pengutronix.de>
References: <1338901800-23968-1-git-send-email-ldewangan@nvidia.com>
 <4FCE3078.1030008@wwwdotorg.org>
 <4FCE3CD8.8060502@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FCE3CD8.8060502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2012 at 10:37:36PM +0530, Laxman Dewangan wrote:
> On Tuesday 05 June 2012 09:44 PM, Stephen Warren wrote:
> >On 06/05/2012 07:09 AM, Laxman Dewangan wrote:
> >>This patch series having the:
> >>- Handling of late register write due to Tegra PPSB design.
> >>- support for I2C_M_NOSTART
> >>- Use devm_* for all allocation.
> >The series,
> >
> >Acked-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> >
> >Note that patch 4 touches context adjacent to Prashant's "i2c: tegra:
> >Add clk_prepare/clk_unprepare" patch, which I hope to take through the
> >Tegra tree since it's a requirement for the Tegra common clock
> >conversion. I don't think this will cause any significant conflict, but
> >perhaps it's worth resolving it explicitly.

Is it really a requirement? Just wondering if it will cause problems, if
Prashant's patch goes in via I2C after arm-soc has been merged. I am
fine with simply acking the patch, though.

> >Wolfram, perhaps we should put these 4 patches and Prashan'ts into their
> >own topic branch so that you can merge it into the I2C tree, and I can
> >merge it into the Tegra tree too? Or, I can take everything through
> >Tegra if you want, and ack it.

Laxman's patches should really go via I2C, I think. Can't we just fix
the conflict in arm-soc?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/XAuAACgkQD27XaX1/VRvJZACgmJUb4NCK9hURE+7FGYME/+LZ
OzEAoKY7E/RqXHNHCLmrYYM0lm5vXHfQ
=01H1
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
