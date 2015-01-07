From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra20: fix GR3D, DSI unit and reg base
 addresses
Date: Wed, 7 Jan 2015 15:40:42 +0100
Message-ID: <20150107144041.GE1621@ulmo>
References: <1418397559-19646-1-git-send-email-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418397559-19646-1-git-send-email-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2014 at 06:19:19PM +0300, Dmitry Osipenko wrote:
> Commit 58ecb23f64ee ("ARM: tegra: add missing unit addresses to DT") added
> unit address and changed reg base for GR3D and DSI host1x modules, but th=
ese
> addresses belongs to GR2D and TVO modules respectively. Fix it by changing
> modules unit and reg base addresses to proper ones.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Fixes: 58ecb23f64ee (ARM: tegra: add missing unit addresses to DT)
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.13+
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrUVpAAoJEN0jrNd/PrOhdDwP/jfeCTVNYT7ZzmmuHp9XA7Va
YCOFCqX/fCjWhas7XmJbjIesTBf3GhuabfkcCR8XBCRhPcUxyHrCP9WLZonB3D66
Kt64zUr94ygkdA9kpQeE54L77zVoRlE8BpSyCIyntID+o5itBQFyDG0PJk0RtBvB
I8ntvqtML40ADc+6Lqehv47c5iPNfYkl+QqcrAC+4ch2ZxoFnN3OFvgYJbTkktH6
K1pU93GT49b0NlMT7e6kLrDtJv/i36uURLsmZdtVXX2yIAcCraFN8idv6qSKMp6+
/07TQqDDU0L/xPrwBF2M3ffzaqzH19CSOdyTcsxzJXnHN833GkT9LMR4NiXorvpf
OBk804clSbDJXJdg5joWfwERkdUocVrp3zzD70tDiEM4/wQS3ju2TtJ45oV+Vmie
+i2niBylKQKwZiwu1t1eOKqAkJW+JQODQgA9+Z1WUntpJbcHQ3iBNjqfKpw06Z+7
FmnZnobAAED3xVmvWti9OhZfDdcTnnZ3uV9wQHbV6wdXdSUrmoL3uxSC2ymfJBkO
Kl2F4PZW2OsqAr8D4VBErzXGj8QhjHKjhueeigO7J98amB8iSwpobZ5LHAGTAGit
KkUj4A2fXBu5nfrnUeoi3c/wuIGcslh5f/Umo3NP7+VU0koYym1g+oB7UQ2T5+wO
ZnG9hoSgQ0gJp5bi57HA
=Msuw
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
