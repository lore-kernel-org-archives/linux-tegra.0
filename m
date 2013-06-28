From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pci: tegra: set up PADS_REFCLK_CFG1
Date: Fri, 28 Jun 2013 21:33:19 +0200
Message-ID: <20130628193318.GA21290@manwe>
References: <1372365722-3318-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372365722-3318-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 02:42:02PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The registers PADS_REFCLK_CFG are an array of 16-bit data, one entry per
> PCIe root port. For Tegra30, we therefore need to write a 3rd entry in
> this array. Doing so mays the mini-PCIe slot on Beaver operate correctly.
>=20
> While we're at it, add some #defines to partially document the fields
> within these 16-bit values.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is for Thierry to squash into his Tegra PCIe driver staging branch.
>=20
>  drivers/pci/host/pci-tegra.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 2888307..cb069f5 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -195,6 +195,26 @@
>  #define PADS_REFCLK_CFG0			0x000000C8
>  #define PADS_REFCLK_CFG1			0x000000CC
> =20
> +/*
> + * Fields in PADS_REFCLK_CFG*. Those registers form an array of 16-bit
> + * entries, one entry per PCIe port. These field definitions and desired
> + * values aren't in the TRM, but do come from NVIDIA.
> + */
> +
> +#define PADS_REFCLK_CFG_REFCLK2_TERM		2  /* 6:2 */
> +#define PADS_REFCLK_CFG_REFCLK2_E_TERM		7
> +#define PADS_REFCLK_CFG_REFCLK2_PREDI		8  /* 11:8 */
> +#define PADS_REFCLK_CFG_REFCLK2_DRVI		12 /* 15:12 */

I'd prefer to make these macros that mask and shift. Either that or
suffix them with _SHIFT to make it more explicit that they shift. Having
an additional mask encoded in the macro has the nice advantage that it
makes the comments obsolete. And why are they named *_REFCLK2_*? Could
they be named PADS_REFCLK_CFG_{TERM,E_TERM,PREDI,DRVI} instead?

Also can we make sure that these make it into the next version of the
TRM? It's good already to have symbolic names, but a description of what
they mean would be even better.

> +/* 0xfa5c */

Maybe change this comment into something like: "default value provided
by hardware engineering: 0xfa5c"?

> +#define PADS_REFCLK_CFG_VALUE \

Perhaps "PADS_REFCLK_CFG_DEFAULT"?

> +	( \
> +		(0x17 << PADS_REFCLK_CFG_REFCLK2_TERM)   | \
> +		(0    << PADS_REFCLK_CFG_REFCLK2_E_TERM) | \
> +		(0xa  << PADS_REFCLK_CFG_REFCLK2_PREDI)  | \
> +		(0xf  << PADS_REFCLK_CFG_REFCLK2_DRVI)     \
> +	)
> +
>  struct tegra_msi {
>  	struct msi_chip chip;
>  	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
> @@ -814,11 +834,11 @@ static int tegra_pcie_enable_controller(struct tegr=
a_pcie *pcie)
>  	value |=3D PADS_PLL_CTL_RST_B4SM;
>  	pads_writel(pcie, value, soc->pads_pll_ctl);
> =20
> -	/*
> -	 * Hack, set the clock voltage to the DEFAULT provided by hw folks.
> -	 * This doesn't exist in the documentation.
> -	 */
> -	pads_writel(pcie, 0xfa5cfa5c, PADS_REFCLK_CFG0);
> +	/* Configure the reference clock driver */
> +	pads_writel(pcie,
> +		PADS_REFCLK_CFG_VALUE | (PADS_REFCLK_CFG_VALUE << 16),
> +		PADS_REFCLK_CFG0);

Nit: Other parts in the driver use a temporary variable to avoid having
to split these calls, like so:

	value =3D (PADS_REFCLK_CFG_DEFAULT << 16) | PADS_REFCLK_CFG_DEFAULT;
	pads_writel(pcie, value, PADS_REFCLK_CFG0);

> +	pads_writel(pcie, PADS_REFCLK_CFG_VALUE, PADS_REFCLK_CFG1);

If using an intermediary variable as shown above, would it hurt if we
wrote the same value again for ports 2 and 3 instead of leaving the
higher 16 bits unset? Given that we can write the entry for port 2 on
Tegra20 which doesn't have a third one I'd expect the same to be true
for port 3. That way, perhaps if some future generation of Tegra gets
a fourth port the code won't have to be updated. And of course we save
a few characters and instructions by reusing the "value" variable.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzeT+AAoJEN0jrNd/PrOhpMAQALx2D666yDvtK7LkBij/sJCG
joC2knucOAtfEGIVCc4Pu5wvQEf1z0uctR7YUio+K5Ud6eRTxLvrSnFFACq+k3I/
S7QxgCWKF6iC/S9ki7VgbivNrI8QT5ig5EXbTUt5PTeK4N4prkWakEe2SA7IjUX8
hFUqp743329afcxe+YBStyXUyDb2HaZj548TBzXbjUvSLHFC7ajYTSils37auhcZ
E2ddsJijchEY58RiUQi9dImCqqnOq923JzPjrbztfFBN28XFrbddHtK8I5Ewkf7z
wG7806WG2srkP6BbW2KVFrKKdklbcbcIFE+HLWahmp4f1Im/El2TEwPrCH/Hl3uP
xBHVROOP7wt9FLg4YX+xeTSEYqm2a24AN4YlkWik7RckmNNzENDROEcr9oggrFjU
cXQ/ooBxChRedOAyS3ZctdzU/vs3qa67NPWL4v4UubVXXnnGtuOxv5Ckd7UKQPoW
7M5e7UX1NxpZnCJ553uUZqpaOfrIzlFgdp8Lllgez/roWVmNNEyPg1rpFtaiFhod
XZmXNzzYjktQJ2LAEVAYM4G4MzCAZdI3fdl1xNhaACcTBa2q/FuWOpeDkZFKqYY3
ssy6tQ546ck3jv8GQO2+4mdQbQH+1ObFMtv2s0Q7NCTe/lpjjlXh0a/BLCUPVPgt
7NjJsiEQjxRWgqyJKVrs
=ubfz
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
