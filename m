From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 02/10] thermal: tegra: combine sensor group-related
 data
Date: Thu, 14 Jan 2016 13:40:45 +0800
Message-ID: <569734DD.6000901@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com> <1452671929-32740-3-git-send-email-wni@nvidia.com> <20160113143123.GB2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113143123.GB2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 22:31, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 03:58:41PM +0800, Wei Ni wrote:
>> Combine sensor group-related data structures into struct
>> tegra_tsensor_group. This provides a single location for
>> sensor group data storage.
>> More sensor group data will be added in subsequent patches.
>>
>> Get rid of T124-specific PDIV/HOTSPOT hack.
>> tegra-soctherm.c contained a hack to set the SENSOR_PDIV and
>> SENSOR_HOTSPOT_OFFSET registers - it just did two writes of
>> T124-specific opaque values.  Convert these into a form that can be
>> substituted on a per-chip basis, and into structure fields that have
>> at least some independent meaning.
>=20
> This reads as two completely separate commit messages. Should the pat=
ch
> be split up to separate out the two logical changes?

Hmm, you are right, will do it.

>=20
>> diff --git a/drivers/thermal/tegra/tegra_soctherm.c b/drivers/therma=
l/tegra/tegra_soctherm.c
> [...]
>> +static struct tegra_tsensor_group tegra124_tsensor_group_cpu =3D {
> [...]
>> +};
>> +
>> +static struct tegra_tsensor_group tegra124_tsensor_group_gpu =3D {
> [...]
>> +};
>> +
>> +static struct tegra_tsensor_group tegra124_tsensor_group_pll =3D {
> [...]
>> +};
>> +
>> +static struct tegra_tsensor_group tegra124_tsensor_group_mem =3D {
> [...]
>> +};
>> +
>> +static struct tegra_tsensor_group *
>> +tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] =3D {
> [...]
>>  };
>=20
> These look like they should all be static const.

Yes, they should be "static const", I fixed them in the next patch [03/=
10].
I will change it in this patch.

>=20
>> @@ -168,7 +268,7 @@ struct tegra_soctherm {
>>  	struct clk *clock_soctherm;
>>  	void __iomem *regs;
>> =20
>> -	struct thermal_zone_device *thermctl_tzs[4];
>> +	struct thermal_zone_device *thermctl_tzs[TEGRA124_SOCTHERM_SENSOR_=
NUM];
>>  };
>=20
> Does it make sense to use macros here for the number of zones? I susp=
ect
> that since you do parameterize the Tegra210 support that will be adde=
d
> later on will have a different maximum number, in which case macros w=
ill
> not work very well.

All the Tegra serial chips support 4 thermal zones: cpu, gpu, mem, pllx=
,
including the Tegra 210, so we can use the TEGRA124_SOCTHERM_SENSOR_NUM=
=2E

>=20
> But perhaps I'll see how you solved that problem in a later patch.
>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
