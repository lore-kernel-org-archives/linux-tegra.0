From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V5 7/9] ARM: dts: tegra: add non-removable and
 keep-power-in-suspend property for MMC
Date: Wed, 3 Apr 2013 07:45:49 +0200
Message-ID: <20130403054549.GA6764@avionic-0098.mockup.avionic-design.de>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com>
 <1364901613-25080-8-git-send-email-josephl@nvidia.com>
 <515B3871.50801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515B3871.50801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2013 at 01:58:41PM -0600, Stephen Warren wrote:
> On 04/02/2013 05:20 AM, Joseph Lo wrote:
> > This patch adds "non-removable" property of MMC host where the eMMC dev=
ice
> > is for Tegra platform.
> >=20
> > And the "keep-power-in-suspend" property was used for the SDIO device t=
hat
> > need this to go into suspend mode (e.g. BRCM43xx series).
>=20
> >  arch/arm/boot/dts/tegra20-paz00.dts      | 1 +
> >  arch/arm/boot/dts/tegra20-seaboard.dts   | 2 ++
> >  arch/arm/boot/dts/tegra20-ventana.dts    | 2 ++
> >  arch/arm/boot/dts/tegra20-whistler.dts   | 1 +
> >  arch/arm/boot/dts/tegra30-beaver.dts     | 1 +
> >  arch/arm/boot/dts/tegra30-cardhu-a02.dts | 1 +
> >  arch/arm/boot/dts/tegra30-cardhu-a04.dts | 1 +
> >  arch/arm/boot/dts/tegra30-cardhu.dtsi    | 1 +
>=20
> I think there are a bunch of other boards that need a similar change,
> right? There are certainly eMMC devices on other boards, and shouldn't
> they be marked with non-removable? In particular, Beaver, Dalmore, and
> Pluto, and likely some/all of the Colibri and Avionic Design boards. I
> think it should be obvious which SDHCI devices need this, since there
> won't be any cd-gpios property and the bus-width will likely be 8.

For Tegra20 Tamonten we don't use eMMC. Ideally we'd be using NAND to
boot from but that doesn't have mainline support. I have a semi-working
patch and will probably spend some more time getting it ready. The MMC
cards are all removable, though I guess since they are the boot device
they still should remain powered in suspend?

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRW8INAAoJEN0jrNd/PrOhKsoP/2QXx3UL0902H0s3dDCsRp0B
jlPlmFQ836vwXVXUcWJsxQJqhELjiETppHF9ly4A+b1F8EFdjBRlfweWN7vblim8
111hQDDx3GSop489SvnTukX0+qsZhUm8eQx3kegTK/wngd14iLgju5J3sRP7878C
EAXSCvTm8kG+jB9bIYyr5u20CIrZn0zC+T2pImSHynLkG1wqrL+VH3pgaooqQagz
Hy167seT0sHRIRzC2ISN7fCaS5GCEOi7t7IpNNtiEKuA0rhwSXB3cOyDsrwWI8Kn
CfQjZny+c2BhDNoJhEPoXTvGyT8Rdw9WKa3+Qcq57uiX4DgCb9SDw1i5LZW7tUCC
XQf/J5kAQGkFuBAcIIoTT/PAqf5aqaZnAPffrqlS/fE2fioCJYaAUgmTSJIBQnaz
AtP6rd2a6CF5Vo+YwFttIPq5Pkm/JOZDzwyzRKS+nFyVTlR1WH4SqqKbfzYPYL/0
bcinSkHXgeADTN+aOB9X1giJEfoKtJ/80eWRG+kGOAKpJtbE89ZzNA1j9blPCb31
KrGgON9OdSK2SSmITnKkat+KtPyrdnS1WC48liLV3jQjcoRCEFtpi/h8lfANolSo
+vN7i3uV/bF0TbhBo03m6Ngr3FJ+cyFx8ZcKibFG+GNH34Vyo8i/sGaD+Y0ps8LB
C8OjQeBLOewBu31uMn7V
=3Y1E
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
