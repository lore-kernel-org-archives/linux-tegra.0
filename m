From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 04/11] thermal: tegra: split tegra_soctherm driver
Date: Fri, 22 Jan 2016 16:52:20 +0800
Message-ID: <56A1EDC4.6000401@nvidia.com>
References: <1453111356-12298-1-git-send-email-wni@nvidia.com> <1453111356-12298-5-git-send-email-wni@nvidia.com> <20160121144605.GB32301@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121144605.GB32301@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8821=E6=97=A5 22:46, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Jan 18, 2016 at 06:02:29PM +0800, Wei Ni wrote:
> [...]
>> +int tegra_soctherm_calculate_tsensor_calibration(
>> +				struct tegra_tsensor *sensor,
>> +				const struct tsensor_shared_calibration *shared)
>=20
> The need to ident weirdly here should be an indication that the funct=
ion
> name is too long, how about:

Hmm, yes, it's too long.

>=20
> int tegra_tsensor_calc_calib(struct tegra_tsensor *sensor,
> 			     const struct tsensor_shared_calibration *shared)
>=20
> ?

There have two functions about calibration, I prefer to name them as:
tegra_calc_tsensor_calib() and tegra_calc_shared_calib().

>=20
>> +{
>> +	const struct tegra_tsensor_group *sensor_group;
>> +	u32 val, calib;
>> +	s32 actual_tsensor_ft, actual_tsensor_cp;
>> +	s32 delta_sens, delta_temp;
>> +	s32 mult, div;
>> +	s16 therma, thermb;
>> +	int err;
>> +
>> +	sensor_group =3D sensor->group;
>> +
>> +	err =3D tegra_fuse_readl(sensor->calib_fuse_offset, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	actual_tsensor_cp =3D (shared->base_cp * 64) + sign_extend32(val, =
12);
>> +	val =3D (val & FUSE_TSENSOR_CALIB_FT_TS_BASE_MASK)
>> +		>> FUSE_TSENSOR_CALIB_FT_TS_BASE_SHIFT;
>=20
> I think it's more canonical to put the >> on the first line line.

Ok, will fix it.

>=20
>> +	actual_tsensor_ft =3D (shared->base_ft * 32) + sign_extend32(val, =
12);
>> +
>> +	delta_sens =3D actual_tsensor_ft - actual_tsensor_cp;
>> +	delta_temp =3D shared->actual_temp_ft - shared->actual_temp_cp;
>> +
>> +	mult =3D sensor_group->pdiv * sensor->config->tsample_ate;
>> +	div =3D sensor->config->tsample * sensor_group->pdiv_ate;
>> +
>> +	therma =3D div64_s64_precise((s64)delta_temp * (1LL << 13) * mult,
>> +			(s64)delta_sens * div);
>=20
> Are the explicit casts necessary? Shouldn't an s32 be automatically
> promoted to s64? Also arguments on subsequent lines should be aligned
> with the first argument on the first line.

I made a mistake, the div64_s64_precise(s64 a, s64 b) should be
div64_s64_precise(s64 a, s32b), so to make the value more precise, I ad=
ded (s64)
cast in here.
And I will use temporary variable, and align the arguments.

>=20
>> +	thermb =3D div64_s64_precise(
>> +			((s64)actual_tsensor_ft * shared->actual_temp_cp) -
>> +			((s64)actual_tsensor_cp * shared->actual_temp_ft),
>> +			(s64)delta_sens);
>=20
> Perhaps add a temporary variable for the first parameter here for
> readability?

Yes, will use temporary variable, and remove the cast for delta_sens.

>=20
>> +
>> +	therma =3D div64_s64_precise((s64)therma * sensor->fuse_corr_alpha=
,
>> +			(s64)1000000LL);
>> +	thermb =3D div64_s64_precise((s64)thermb * sensor->fuse_corr_alpha=
 +
>> +			sensor->fuse_corr_beta,
>> +			(s64)1000000LL);
>=20
> What are the 1000000LL? Does it perhaps make sense to have a macro fo=
r
> it, or perhaps a comment would help.

It's the coefficient data for the therma and thermb. I will use macro f=
or it.
#define CALIB_COEFFICIENT 1000000LL

>=20
>> +	calib =3D ((u16)therma << SENSOR_CONFIG2_THERMA_SHIFT) |
>> +		 ((u16)thermb << SENSOR_CONFIG2_THERMB_SHIFT);
>=20
> Alignment here isn't right.

will do it.

>=20
>> diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegr=
a/soctherm.h
> [...]
>> +struct tegra_soctherm_soc {
>> +	struct tegra_tsensor *tsensors;
>=20
> Can't these be const? Do they ever need to be modified? If so, they
> should probably not be part of this structure. Or at least only part =
of
> them should be. The invariant part.
>=20
> The reason is that if ever a second instance of this device was prese=
nt
> both instances would share this same data. I know it's unlikely to
> happen, but setting a bad example would be... well... bad.
>=20
> Instead I think if you need to have non-const fields you could separa=
te
> this further into struct tegra_tsensor_soc, with only the static
> information about the sensor, and make struct tegra_tsensor contain a
> pointer to that SoC structure and provide the variable fields in
> addition. That way you can create a struct tegra_tsensor for each str=
uct
> tegra_tsensor_soc and store those per-instance.

There has a member "calib" in the tsensors which will be written in the=
 driver,
so I didn't make it as const.
But you are right, I need to consider the risk that the system have two=
 more SOCs.
I will remove the "calib" to struct tegra_soctherm, then can fix this i=
ssue, and
can make all data to "const" in the chip-specific file.

>=20
>> diff --git a/drivers/thermal/tegra/tegra124-soctherm.c b/drivers/the=
rmal/tegra/tegra124-soctherm.c
> [...]
>> +static struct tegra_tsensor tegra124_tsensors[] =3D {
>=20
> Can this be "static const" instead?

Will fix this one.

>=20
>> +	{
>> +		.name =3D "cpu0",
>> +		.base =3D 0xc0,
>> +		.config =3D &t124_tsensor_config,
>> +		.calib_fuse_offset =3D 0x098,
>> +		.fuse_corr_alpha =3D 1135400,
>> +		.fuse_corr_beta =3D -6266900,
>> +		.group =3D &tegra124_tsensor_group_cpu,
>> +	},
>> +	{
>=20
> "}," and "{" can go on the same line.

Got it, will change it.

>=20
>> +struct tegra_soctherm_soc tegra124_soctherm =3D {
>=20
> "const"?

Will fix it.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
