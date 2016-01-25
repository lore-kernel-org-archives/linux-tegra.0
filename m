From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 05/11] thermal: tegra: add T210-specific SOC_THERM
 driver
Date: Mon, 25 Jan 2016 13:48:43 +0800
Message-ID: <56A5B73B.6040706@nvidia.com>
References: <1453111426-12356-1-git-send-email-wni@nvidia.com> <20160121142546.GA32301@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121142546.GA32301@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8821=E6=97=A5 22:25, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Jan 18, 2016 at 06:03:46PM +0800, Wei Ni wrote:
>> Add Tegra210 specific SOC_THERM driver.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/thermal/tegra/Makefile            |   1 +
>>  drivers/thermal/tegra/soctherm-fuse.c     |  11 ++
>>  drivers/thermal/tegra/soctherm.c          |   6 +
>>  drivers/thermal/tegra/soctherm.h          |   4 +
>>  drivers/thermal/tegra/tegra210-soctherm.c | 181 +++++++++++++++++++=
+++++++++++
>>  5 files changed, 203 insertions(+)
>>  create mode 100644 drivers/thermal/tegra/tegra210-soctherm.c
>=20
> This looks pretty good, just a few minor nits...
>=20
>> diff --git a/drivers/thermal/tegra/soctherm.h b/drivers/thermal/tegr=
a/soctherm.h
> [...]
>> index 1ac66cafb392..bd0f03bc9d80 100644
>> --- a/drivers/thermal/tegra/soctherm.h
>> +++ b/drivers/thermal/tegra/soctherm.h
>> @@ -108,5 +108,9 @@ int tegra_soctherm_calculate_tsensor_calibration=
(
>>  extern struct tegra_soctherm_soc tegra124_soctherm;
>>  #endif
>> =20
>> +#ifdef CONFIG_ARCH_TEGRA_210_SOC
>> +extern struct tegra_soctherm_soc tegra210_soctherm;
>=20
> I would've expected this to be "const".

Yes, will change it.

>=20
>> diff --git a/drivers/thermal/tegra/tegra210-soctherm.c b/drivers/the=
rmal/tegra/tegra210-soctherm.c
> [...]
>> +static const struct tegra_tsensor_group tegra210_tsensor_group_cpu =
=3D {
>> +	.id				=3D TEGRA124_SOCTHERM_SENSOR_CPU,
>> +	.name				=3D "cpu",
>> +	.sensor_temp_offset		=3D SENSOR_TEMP1,
>> +	.sensor_temp_mask		=3D SENSOR_TEMP1_CPU_TEMP_MASK,
>> +	.pdiv				=3D 8,
>> +	.pdiv_ate			=3D 8,
>> +	.pdiv_mask			=3D SENSOR_PDIV_CPU_MASK,
>> +	.pllx_hotspot_diff		=3D 10,
>> +	.pllx_hotspot_mask		=3D SENSOR_HOTSPOT_CPU_MASK,
>> +};
>=20
> I prefer single spaces for padding because I find it easier to read t=
hat
> way. Also using tabs to make this look like a table has the drawback
> that you run the risk of having to adjust padding for all fields when=
 a
> new field is added whose name is longer than any existing ones. Or yo=
u
> have to rely on excessive padding (such as in this case) to make that
> unlikely. So I don't see any advantage in this, but I don't have very
> strong objections either.

Ok, will change it.

>=20
>> +static const struct tegra_tsensor_group *
>> +tegra210_tsensor_groups[] =3D {
>=20
> Why wrap these two lines? They seem to fit on one line and within 78
> columns.

Hmm, will fix it.

>=20
>> +static struct tegra_tsensor tegra210_tsensors[] =3D {
>=20
> "static const"?

Will change to "const".

>=20
>> +	{
>> +		.name =3D "cpu0",
>> +		.base =3D 0xc0,
>> +		.config =3D &tegra210_tsensor_config,
>> +		.calib_fuse_offset =3D 0x098,
>> +		.fuse_corr_alpha =3D 1085000,
>> +		.fuse_corr_beta =3D 3244200,
>> +		.group =3D &tegra210_tsensor_group_cpu,
>> +	},
>> +	{
>=20
> "}," and "{" can go on the same line.

Will change it.

>=20
>> +struct tegra_soctherm_soc tegra210_soctherm =3D {
>=20
> "const"?
>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
