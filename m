From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 03/10] thermal: tegra: split tegra_soctherm driver
Date: Thu, 14 Jan 2016 17:54:31 +0800
Message-ID: <56977057.2010703@nvidia.com>
References: <1452671929-32740-1-git-send-email-wni@nvidia.com> <1452671929-32740-4-git-send-email-wni@nvidia.com> <20160113150433.GC2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113150433.GC2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thierry,

On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:04, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 03:58:42PM +0800, Wei Ni wrote:
>> Split most of the T124 data and code into a T124-specific driver.
>> Split most of the fuse-related code into a fuse-related source file.
>> Now drivers/thermal/tegra_soctherm.c contains common SOC_THERM libra=
ry
>=20
> That path no longer exists since patch 01/10.

Yes, will remove it.

>=20
>> diff --git a/drivers/thermal/tegra/Kconfig b/drivers/thermal/tegra/K=
config
>> index a6e6cd4528dc..ae7e5e93dab9 100644
>> --- a/drivers/thermal/tegra/Kconfig
>> +++ b/drivers/thermal/tegra/Kconfig
>> @@ -1,6 +1,10 @@
>>  config TEGRA_SOCTHERM
>> -	tristate "Tegra SOCTHERM thermal management"
>> -	depends on ARCH_TEGRA
>> +	bool
>> +
>> +config TEGRA124_SOCTHERM
>> +	bool "Tegra124 SOCTHERM thermal management"
>> +	depends on ARCH_TEGRA_124_SOC
>> +	select TEGRA_SOCTHERM
>>  	help
>>  	  Enable this option for integrated thermal management support on =
NVIDIA
>>  	  Tegra124 systems-on-chip. The driver supports four thermal zones
>=20
> I'd like to do this differently to reduce the number of Kconfig symbo=
ls.
> The alternate proposal would be for the TEGRA_SOCTHERM symbol to rema=
in
> as it is and then build in driver support depending on the selected
> ARCH_TEGRA_*_SOC options.

Yes, it will make the kconfig more clear. Will change it.

>=20
>> diff --git a/drivers/thermal/tegra/Makefile b/drivers/thermal/tegra/=
Makefile
>> index 8c51076e4b1e..7a864ec07a25 100644
>> --- a/drivers/thermal/tegra/Makefile
>> +++ b/drivers/thermal/tegra/Makefile
>> @@ -3,4 +3,5 @@
>>  #
>> =20
>>  # Tegra soc thermal drivers
>> -obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra_soctherm.o
>> +obj-$(CONFIG_TEGRA_SOCTHERM)	+=3D tegra_soctherm.o tegra_soctherm_f=
use.o
>> +obj-$(CONFIG_TEGRA124_SOCTHERM)	+=3D tegra124_soctherm.o
>=20
> So this would look roughly like:
>=20
> 	obj-$(CONFIG_TEGRA_SOCTHERM) +=3D tegra-soctherm.o
>=20
> 	tegra-soctherm-y :=3D soctherm.c
> 	tegra-soctherm-$(CONFIG_ARCH_TEGRA_124_SOC) +=3D tegra124.o
> 	tegra-soctherm-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210.o
>=20
> Two things to note here: I've replaced the underscore in the filename
> with a dash, because that's more commonly used in filenames for other
> drivers on Tegra. This could be done in patch 01/10 since the file is

Yes, will change to use dash.

> already moved anyway. The second thing to note here is that the SoC-
> generation specific drivers don't contain the redundant _soctherm
> suffix. I suppose that if this directory will ever contain anything
> other than soctherm drivers it might be useful to have the suffix to
> differentiate between different drivers, so feel free to ignore that
> suggestion if you have plans to add other thermal-related drivers to
> this directory.

Yes, I plan to add thermal-throttle driver in this directory, so will k=
eep the
name tegraxxx_soctherm.c

>=20
> The advantage of the above is that we'll have a single Kconfig option
> to worry about and also everything will be included in a single drive=
r
> rather than per-SoC "drivers" that merely provide the SoC-specific
> data. This will require some slight changes to the driver code, see
> below.
>=20
>> diff --git a/drivers/thermal/tegra/tegra124_soctherm.c b/drivers/the=
rmal/tegra/tegra124_soctherm.c
> [...]
>> +static const struct tegra_tsensor_group *
>> +tegra124_tsensor_groups[TEGRA124_SOCTHERM_SENSOR_NUM] =3D {
>> +	&tegra124_tsensor_group_cpu,
>> +	&tegra124_tsensor_group_gpu,
>> +	&tegra124_tsensor_group_pll,
>> +	&tegra124_tsensor_group_mem,
>> +};
>> +
>> +static struct tegra_tsensor tegra124_tsensors[] =3D {
> [...]
>> +	{ .name =3D NULL },
>> +};
>=20
> I think it'd be good not to rely on this sentinel entry being there.
> It's more error-prone than simply storing the number of entries in a
> separate location. See below.

Ok, will do it.

>=20
>> +static const struct of_device_id tegra124_soctherm_of_match[] =3D {
>> +	{ .compatible =3D "nvidia,tegra124-soctherm" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
>=20
> The general idea would be to keep the of_device_id table in the
> tegra_soctherm.c file and have it include entries depending on which =
SoC
> generation is being supported. See for example the memory controller
> driver in drivers/memory/tegra for a reference that uses this style o=
f
> multi-SoC support.

Got it, will do it.

>=20
>> +
>> +static int tegra124_soctherm_probe(struct platform_device *pdev)
>> +{
>> +	return tegra_soctherm_probe(pdev,
>> +				    tegra124_tsensors,
>> +				    tegra124_tsensor_groups,
>> +				    &tegra124_soctherm_fuse);
>> +}
>> +
>> +static struct platform_driver tegra124_soctherm_driver =3D {
>> +	.probe =3D tegra124_soctherm_probe,
>> +	.remove =3D tegra_soctherm_remove,
>> +	.driver =3D {
>> +		.name =3D "tegra124_soctherm",
>> +		.of_match_table =3D tegra124_soctherm_of_match,
>> +	},
>> +};
>> +module_platform_driver(tegra124_soctherm_driver);
>> +
>> +MODULE_AUTHOR("NVIDIA");
>> +MODULE_DESCRIPTION("Tegra124 SOCTHERM thermal management driver");
>> +MODULE_LICENSE("GPL v2");
>=20
> With the alternate proposal you can get rid of all of this, which has=
 a
> number of other advantages like not having to export all of the libra=
ry
> functions that these subdrivers rely on.
>=20
> What you'd do instead is add a new structure, along the lines of this=
:
>=20
> 	struct tegra_soctherm_soc {
> 		const struct tegra_tsensor_groups *groups;
> 		unsigned int num_groups;
> 		const struct tegra_tsensor *sensors;
> 		unsigned int num_sensors;
> 		const struct tegra_soctherm_fuse *fuse;
> 	};
>=20
> and create one of these with the SoC-specific groups, sensors and FUS=
E
> parameters. Then you pass these structures to the generic driver as t=
he
> struct of_device_id's .data field:
>=20
> 	static const struct of_device_id tegra_soctherm_of_match[] =3D {
> 		{ .compatible =3D "nvidia,tegra124-soctherm", .data =3D &tegra124_s=
octherm },
> 		{ .compatible =3D "nvidia,tegra210-soctherm", .data =3D &tegra210_s=
octherm },
> 		{ }
> 	};
>=20
> Also, please use your name and email address if you're the author.
> Companies don't write code, people do.

Will do it.

>=20
>> -static int tegra_soctherm_probe(struct platform_device *pdev)
>> +int tegra_soctherm_probe(struct platform_device *pdev,
>> +			 struct tegra_tsensor *tsensors,
>> +			 const struct tegra_tsensor_group **ttgs,
>> +			 const struct tegra_soctherm_fuse *tfuse)
>>  {
> [...]
>>  }
>> =20
>> -static int tegra_soctherm_remove(struct platform_device *pdev)
>> +int tegra_soctherm_remove(struct platform_device *pdev)
>>  {
>>  	struct tegra_soctherm *tegra =3D platform_get_drvdata(pdev);
>>  	unsigned int i;
>> @@ -564,16 +273,6 @@ static int tegra_soctherm_remove(struct platfor=
m_device *pdev)
>>  	return 0;
>>  }
>=20
> Both the tegra_soctherm_probe() and tegra_soctherm_remove() functions
> would need to be exported with this type of driver design, otherwise
> building everything as modules the per-SoC drivers couldn't access th=
e
> functions.
>=20
> If you create a single driver there is no need to export any of the
> symbols because they are never required by another module.

I will use the new type, so will not export them.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
