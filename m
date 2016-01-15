From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 08/10] thermal: tegra: add PM support
Date: Fri, 15 Jan 2016 17:51:02 +0800
Message-ID: <5698C106.4080805@nvidia.com>
References: <1452672043-475-1-git-send-email-wni@nvidia.com> <20160113155540.GH2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113155540.GH2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:55, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 04:00:43PM +0800, Wei Ni wrote:
>> Add suspend/resume function in soctherm driver.
>> And enable it for Tegra124 and Tegra210.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/thermal/tegra/tegra124_soctherm.c |   9 ++
>>  drivers/thermal/tegra/tegra210_soctherm.c |   9 ++
>>  drivers/thermal/tegra/tegra_soctherm.c    | 154 +++++++++++++++++++=
++---------
>>  drivers/thermal/tegra/tegra_soctherm.h    |   5 +
>>  4 files changed, 130 insertions(+), 47 deletions(-)
>=20
> This all looks like it'd be a better candidate for runtime PM. The
> implementation would be mostly the same, except that you'd need to
> add a few more things to tegra_soctherm_probe() and use the runtime
> PM API to enable/disable the device (clocks, resets, ...). System
> sleep should then be taken care of automatically.

We can not handle it as runtime PM, because this is used to monitor the
temperatures, once they reach to critical value, it need to trigger ope=
rations
to protect system, such as shutdown or throttle. If this device suspend=
 in
runtime, then it can't handle these events.

>=20
> Another comment irrespective of that...
>=20
>> diff --git a/drivers/thermal/tegra/tegra124_soctherm.c b/drivers/the=
rmal/tegra/tegra124_soctherm.c
>> index 13d7f4e3a3d7..04cb419dbabc 100644
>> --- a/drivers/thermal/tegra/tegra124_soctherm.c
>> +++ b/drivers/thermal/tegra/tegra124_soctherm.c
>> @@ -205,6 +205,14 @@ static const struct of_device_id tegra124_socth=
erm_of_match[] =3D {
>>  };
>>  MODULE_DEVICE_TABLE(of, tegra_soctherm_of_match);
>> =20
>> +#ifdef CONFIG_PM_SLEEP
>> +static SIMPLE_DEV_PM_OPS(tegra124_soctherm_pm,
>> +			 soctherm_suspend, soctherm_resume);
>> +#define TEGRA124_SOC_THERM_PM      (&tegra124_soctherm_pm)
>> +#else
>> +#define TEGRA124_SOC_THERM_PM      NULL
>> +#endif
>=20
> I wouldn't bother with the #ifdef, just always define the structure.

Ok, will remove them.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
