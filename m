From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d
Date: Mon, 7 Oct 2013 16:53:44 +0200
Message-ID: <20131007145343.GA19045@ulmo.nvidia.com>
References: <1380748361-32459-1-git-send-email-treding@nvidia.com>
 <524EF436.4000704@wwwdotorg.org>
 <20131007001433.7445.7915@quantum>
 <20131007142839.GC3973@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131007142839.GC3973-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 05:28:39PM +0300, Peter De Schrijver wrote:
> On Mon, Oct 07, 2013 at 02:14:33AM +0200, Mike Turquette wrote:
> > Quoting Stephen Warren (2013-10-04 10:00:38)
> > > On 10/02/2013 03:12 PM, Thierry Reding wrote:
> > > > These clocks were named gr2d and gr3d on Tegra20 and Tegra30, so us=
e the
> > > > same names on Tegra114 for consistency.
> > >=20
> > > The series,
> > > Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > Although I wonder if there will be merge conflicts with Peter's "clk:
> > > tegra: replace enum tegra114_clk by binding header"?
> >=20
> > There are merge conflicts in other places too. The latest clk-next
> > branch is based on -rc3 with only a few patches (publicly) applied so
> > far. As of the time of this writing the top-most commit is
> > 96a7ed9079a3483c5681b17f4713c37c1cf2b1c9.
> >=20
> > Can the Tegra folks send me a pull request with the following
> > patches applied? (likely in this order):
> >=20
> > ARM: tegra114: add missing clocks to binding
> > clk: tegra: replace enum tegra114_clk by binding header
> > [PATCH v2] clk: tegra: Correct sbc mux width & parent
> > clk: tegra: Fix vde/2d/3d clock src offset
> > clk: tegra: Set the clock parent of gr2d/gr3d to pll_c2
> > clk: tegra: Set the clk parent of host1x to pll_p
> > clk: tegra114: Rename gr_2d/gr_3d to gr2d/gr3d
> > clk: tegra114: Initialize gr2d clock
>=20
> This conflicts with 'clk: tegra: Set the clock parent of gr2d/gr3d to pll=
_c2'
> I suggest we drop 'clk: tegra114: Initialize gr2d clock' and use pll_c2 t=
o clock gr2d.

What's wrong with pll_c? We've used it for Tegra20 and Tegra30 and I
have at least tested that gr2d works properly with it. It will also
cause both host1x and gr2d to run off the same clock, which I guess may
not matter at all.

Furthermore we've usually only added clock initialization when a driver
became available to use it. There is currently no driver for gr3d in the
upstream kernel, so perhaps we should leave the gr3d clock unconfigured
for now?

> > The set of patches above (with their functional dependencies) were
> > giving me some conflict resolution issues (e.g. large data tables that
> > needed to be updated in clk-tegra-114.c) against the latest clk-next.
> >=20
> > Additionally I've looked at the following patches on the list which can
> > be added to the pull request if you want (these patches all look fine
> > but I haven't yet Acked each individually):
> >=20
> > clk: tegra30: Don't wait for PLL_U lock bit
>=20
> This is already part of next-20130927.
>=20
> > clk: tegra114: Initialize host1x and related clocks
>=20
> This conflicts with 'clk: tegra: Set the clk parent of host1x to pll_p'. I
> suggest we drop 'clk: tegra: Set the clk parent of host1x to pll_p' and r=
un
> host1x from pll_c. Mark, Thierry, is this ok?

Sounds good to me. We use pll_c for host1x on earlier SoC generations as
well.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSUsr3AAoJEN0jrNd/PrOhPFcP/31VbotxqQaLyVqdPbUjfhMC
wyj7rUmbDBkfpXj2LJ7GLv77scgYsL8KEPiUlxHN8z4ta/wJ6oUEOjWhTtyrQkZH
umQAaMI8RFPyrGCKgJy8vBuCUjaPrs64uaeff6tVK0PUqU7xyRKZ7SgqZ1lAmdrY
ggb9rDAg6IdmDCtiJWMEqfRU8PqActD0APNSnpQS00W+X4Dryd7I2GltP4F1zw4W
M8kJRxs4PiVMaeX6v1PrbJFMZTD5LZ7fFRDoQ9x9sY7JhXmU/OWHgc3uUwndW8TW
9hmwXmsiubtBZ207lisyrEVD48Kg/p4DucePBSPpEV8542/u0JlvyO5QOjLduIbF
+qdBbWwr/+SRSiWh/6elAKm1StSep8fQ1e9kTc4RIX05VNn0WYZnVQBTFHIl2ozJ
tC1hGAvARXUO4kNj+OJe2bH8YZYkZixDCX+L1yz+9Kag7dtyg6HRvKRcoSlTDfgp
WDhJreik+tjk5KtZKZJ0TxitfsXQIFp+auNgoYJHwrmKE0i57dY0VZ7/31lsdX73
/A83q09g/MVj+woMt3lf5pLEJWsWul+AWhuYtYeS4s/ubM2GCnT0OkLYaLo6FOgJ
NVysA8fY3vLw+AvgATn5wL+D362rQy4eguz+qu54IPu5HhxRGI4M+XXzFF5t+VHl
ldkL7Ykkuyoq2xpU/ixz
=O0Nb
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
