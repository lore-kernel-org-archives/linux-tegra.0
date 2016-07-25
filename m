From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Mon, 25 Jul 2016 16:18:18 +0200
Message-ID: <20160725141818.GO21170@ulmo.ba.sec>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <20160718095802.GA422@ulmo.ba.sec>
 <6423681.52qkIkgFBQ@wuerfel>
 <c44f8315-d9dd-cf0b-775b-231af99ba7d3@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx/LfW4V5TfZLeq7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c44f8315-d9dd-cf0b-775b-231af99ba7d3-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2016 at 10:38:38PM +0200, Ralf Ramsauer wrote:
> On 07/21/2016 02:28 PM, Arnd Bergmann wrote:
> > On Monday, July 18, 2016 11:58:02 AM CEST Thierry Reding wrote:
> >> On Mon, Jul 18, 2016 at 11:46:48AM +0200, Ralf Ramsauer wrote:
> >>> c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
> >>> quirk, wrong addresses were introduced. Fix it and use the correct
> >>> addresses.
> >>>
> >>> Thierry let me know, that there is another patch (b5896f67ab3c in
> >>> linux-next) in preparation which removes all the '0,' prefixes of unit
> >>> addresses on Tegra124 and is planned to go upstream in 4.8, so
> >>> this patch will get reverted then.
> >>>
> >>> But for the moment, this patch is necessary to fix current misbehavio=
ur.
> >>>
> >>> Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 de=
vice tree")
> >>> Signed-off-by: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
> >>> Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> ---
> >>>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> ARM-SoC maintainers,
> >>
> >> Just to clarify, this is targetted at v4.7 because the offending patch
> >> was merged in v4.7-rc1. If at all possible it'd be great to get this i=
n,
> >> even if this is terribly last minute.
> >>
> >=20
> > I've applied it to the fixes branch, but as Linus is currently offline
> > and hasn't pulled the previous set of fixes, I suspect it's not
> > going to make it.
> Yep, didn't make it. I'll resend the fix with stable in Cc tomorrow.
> Keep you also in Cc.
>=20
> Thierry, this fix is only required for 4.7.x and gets superfluous when
> b5896f67ab3c is applied. So I guess there is no need to fix mainline, rig=
ht?

Agreed.

Thierry

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlh+qAAoJEN0jrNd/PrOhifsQAKxhR4sRMciJXPc+Prwdq1B0
wm+7kRhJpestlB9N8OUkiNa+LFwdukSzRqptF0dj/1x7awyO5zc8mpNAy3Xqjp2W
eX7DjJSYMb9cHJDxVorjmdNZS/+f+GGI78l4IvmBoAn0tMAzhlq0ebHpann5qbdG
5zdvZ7z+tW3/FWKU/xY6M2rTt0DVamcYIlgK8VnQfPKC1c7fG4HmDhir9RYqU6EZ
b/xU/CReOJofiV75iyTE2DfWHqMKSunyqGhMX0C1ioN+xObdD6xldnMFrrUEw/4R
RvX4QAv/203ofns/AsbGAa+bdHl4OPgLP0epd8SNkDjP4pWsSZlIm3rQt/MalKnl
dkHGtShzby7ZVpHTREcBfzMCHsmYzZzvCjNo96IkktUOA4euLtJguAePo16VZ+UO
JbRFhOF/W9MIcQDQxWM1UGcagQbhebIWLJ5RVfsHGFVaPhOiEj46X3uMa0VYVb9a
wmU/G/3wbne0DWE7swQxHFc3Ju+Wpi4IO2649Ly7/vc1jt1RQAumvQuS5GZaoigZ
Mmuis6xxjRlG53JvptZUcQF+VO0tehYj3ZN9+PsQm2YW2/G4n0nb9fH8iHdgMOMX
j/fQcJmygPaoosExnIYoA8N9qaZ2nJ986eYUjKdIjZNveiJjmKJAqaUiMkKtOBP3
N88RNfAEXP4Xk9RwhS7V
=85Zt
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--
