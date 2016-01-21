From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 04/11] thermal: tegra: split tegra_soctherm driver
Date: Thu, 21 Jan 2016 15:46:05 +0100
Message-ID: <20160121144605.GB32301@ulmo>
References: <1453111356-12298-1-git-send-email-wni@nvidia.com>
 <1453111356-12298-5-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453111356-12298-5-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 18, 2016 at 06:02:29PM +0800, Wei Ni wrote:
[...]
> +int tegra_soctherm_calculate_tsensor_calibration(
> +				struct tegra_tsensor *sensor,
> +				const struct tsensor_shared_calibration *shared)

The need to ident weirdly here should be an indication that the function
name is too long, how about:

int tegra_tsensor_calc_calib(struct tegra_tsensor *sensor,
			     const struct tsensor_shared_calibration *shared)

?

> +{
> +	const struct tegra_tsensor_group *sensor_group;
> +	u32 val, calib;
> +	s32 actual_tsensor_ft, actual_tsensor_cp;
> +	s32 delta_sens, delta_temp;
> +	s32 mult, div;
> +	s16 therma, thermb;
> +	int err;
> +
> +	sensor_group = sensor->group;
> +
> +	err = tegra_fuse_readl(sensor->calib_fuse_offset, &val);
> +	if (err)
> +		return err;
> +
> +	actual_tsensor_cp = (shared->base_cp * 64) + sign_extend32(val, 12);
> +	val = (val & FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK)
> +		>> FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT;

I think it's more canonical to put the >> on the first line line.

> +	actual_tsensor_ft = (shared->base_ft * 32) + sign_extend32(val, 12);
> +
> +	delta_sens = actual_tsensor_ft - actual_tsensor_cp;
> +	delta_temp = shared->actual_temp_ft - shared->actual_temp_cp;
> +
> +	mult = sensor_group->pdiv * sensor->config->tsample_ate;
> +	div = sensor->config->tsample * sensor_group->pdiv_ate;
> +
> +	therma = div64_s64_precise((s64)delta_temp * (1LL << 13) * mult,
> +			(s64)delta_sens * div);

Are the explicit casts necessary? Shouldn't an s32 be automatically
promoted to s64? Also arguments on subsequent lines should be aligned
with the first argument on the first line.

> +	thermb = div64_s64_precise(
> +			((s64)actual_tsensor_ft * shared->actual_temp_cp) -
> +			((s64)actual_tsensor_cp * shared->actual_temp_ft),
> +			(s64)delta_sens);

Perhaps add a temporary variable for the first parameter here for
readability?

> +
> +	therma = div64_s64_precise((s64)therma * sensor->fuse_corr_alpha,
> +			(s64)1000000LL);
> +	thermb = div64_s64_precise((s64)thermb * sensor->fuse_corr_alpha +
> +			sensor->fuse_corr_beta,
> +			(s64)1000000LL);

What are the 1000000LL? Does it perhaps make sense to have a macro for
it, or perhaps a comment would help.

> +	calib = ((u16)therma << SENSOR_CONFIG2_THERMA_SHIFT) |
> +		 ((u16)thermb << SENSOR_CONFIG2_THERMB_SHIFT);

Alignment here isn't right.

> diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegra/soctherm.h
[...]
> +struct tegra_soctherm_soc {
> +	struct tegra_tsensor *tsensors;

Can't these be const? Do they ever need to be modified? If so, they
should probably not be part of this structure. Or at least only part of
them should be. The invariant part.

The reason is that if ever a second instance of this device was present
both instances would share this same data. I know it's unlikely to
happen, but setting a bad example would be... well... bad.

Instead I think if you need to have non-const fields you could separate
this further into struct tegra_tsensor_soc, with only the static
information about the sensor, and make struct tegra_tsensor contain a
pointer to that SoC structure and provide the variable fields in
addition. That way you can create a struct tegra_tsensor for each struct
tegra_tsensor_soc and store those per-instance.

> diff --git a/drivers/thermal/tegra/tegra124-soctherm.c b/drivers/thermal/tegra/tegra124-soctherm.c
[...]
> +static struct tegra_tsensor tegra124_tsensors[] = {

Can this be "static const" instead?

> +	{
> +		.name = "cpu0",
> +		.base = 0xc0,
> +		.config = &t124_tsensor_config,
> +		.calib_fuse_offset = 0x098,
> +		.fuse_corr_alpha = 1135400,
> +		.fuse_corr_beta = -6266900,
> +		.group = &tegra124_tsensor_group_cpu,
> +	},
> +	{

"}," and "{" can go on the same line.

> +struct tegra_soctherm_soc tegra124_soctherm = {

"const"?

Thierry

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWoO8qAAoJEN0jrNd/PrOhAXQQAJgTu98mM8jUStv4lwMFyefM
iOqeWexmpDTqs6YoJ0ozQWu67egdDGbwTQ/ywGb2RgL0zNm1ZlPX0xNVngIfL3F7
Sc464H35PWYIWXg8rt1+j5ceVcCkVoRQ2BDaqiNaJpIRd/10ecLJ/ki1r2DRoLnB
Qj5b7Tkgg4fifYous88uhKhPkGvepADUd5341pFLIez7hOqHKf//i6ND9tH2qvbC
KpkSAF5IooUH8tRE+PvXeFG2O5XLwXdVbaZo83S5I62y0kRnmDHMR0mbd3rwonm+
gSfCT8cYNmW4cGY9NpzWypwXIvVde0IWKnWk0z3MMdW2qsE5Sv5PCr3mpQjFlsT0
n70DcirCAMn4BeaJVVOijhQISr+NzS8c97LVDM+uZy7yeo2xmktRialYYysVzOX1
ItdPdAhi61HVpu8uBvuv8gqvlw5ADVouyP1VXngkrWboH4n5AbQPL0IIIoJx2T1X
v3pZ8TszrMtvfUi31di+AzBIIWJeF+ZX9SJVvVtbBwvDvbSBfcjCo6BwntMksdp/
HaGShjJKM9EzM+p4IKh9thoMJiGqWPxfcsPpjrW0/ncSfFsb6gnZjyWyqUZAtGHA
2iENsAllDuHdWxU/umTww/JY6R0lLUZLfM38d4ooNgYv8bVinmJkMvw7168bqfl2
bmJoFwIlNFXDo3tD03d5
=lc/g
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
