From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Mon, 7 Mar 2016 16:45:16 +0800
Message-ID: <56DD3F9C.3000700@nvidia.com>
References: <1456739480-3304-1-git-send-email-wni@nvidia.com> <20160307083842.GC31189@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160307083842.GC31189-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B403=E6=9C=8807=E6=97=A5 16:38, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Feb 29, 2016 at 05:51:20PM +0800, Wei Ni wrote:
>> The sign bit of temperature readback is bit 0, not bit 1.
>> Change to BIT(0) to fix it.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/thermal/tegra_soctherm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegr=
a_soctherm.c
>> index 74ea5765938b..136975220c92 100644
>> --- a/drivers/thermal/tegra_soctherm.c
>> +++ b/drivers/thermal/tegra_soctherm.c
>> @@ -57,7 +57,7 @@
>>  #define READBACK_VALUE_MASK			0xff00
>>  #define READBACK_VALUE_SHIFT			8
>>  #define READBACK_ADD_HALF			BIT(7)
>> -#define READBACK_NEGATE				BIT(1)
>> +#define READBACK_NEGATE				BIT(0)
>=20
> I haven't found this documented anywhere. The register documentation
> indicates that the SOC_THERM_TSENSOR_TEMP1 and SOC_THERM_TSENSOR_TEMP=
2
> registers are in some kind of "temp readback format", but I can't fin=
d
> any specification of that format. Can you point me at the source for
> this information and file an internal bug report so that we can get
> the documentation updated?

Sure, I will do it.
Thanks for your comment.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
