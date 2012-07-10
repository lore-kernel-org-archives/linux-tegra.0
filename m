From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: seaboard: add regulators
Date: Tue, 10 Jul 2012 17:29:06 +0530
Message-ID: <4FFC190A.2040800@nvidia.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org> <4FE80413.6070001@nvidia.com> <4FE87FE3.1080608@wwwdotorg.org> <4FE882A5.3080504@nvidia.com> <20120625222646.GB30406@opensource.wolfsonmicro.com> <4FE8EFC4.3090509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE8EFC4.3090509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,
I require  your input on supporting the vin-supply for tps6586x.

On Tuesday 26 June 2012 04:39 AM, Stephen Warren wrote:
> On 06/25/2012 04:26 PM, Mark Brown wrote:
>>
>> More specifically, all the supplies for a device (including those
>> that happen to be inputs for regulators) should be specified in
>> exactly the same fashion.  This makes the binding more regular and
>> means that users can just go through the schematic adding the
>> mappings without worrying about what what the supply happens to
>> be.
> Just making sure I parsed that right. I think what you're saying is
> that the device itself should represent its input pins, e.g.:
>
> tps6586x {
>      vin-ldo01-supply =<&some_regulator>;
>      vin-ldo23-supply =<...>;
>      vin-ldo4-supply =<...>;
>      vin-ldo678-supply =<...>;
>      vin-ldo9-supply =<...>;
> :::::::::::
> };

Looked tps6586x-regulator driver and it has the platform data which is 
regulator_init_data.
So for adding the vin-supply similar to what we have in fixed or 
tps6591x regulator to pass through the desc.supply_name, we are not 
having option here in platform data which can work for DT and non-DT case.

So if still want to have the DT and non-DT case similar, we can add one 
tps6586x_regulator_platform_data as

struct tps6586x_regulator_platform_data
{
     const char *input_supply;
     struct regulator_init_data *reg_init_data;
}

and then pass this when registering the regulator.

Or,
second option is to support the input supply name for DT case through 
desc.supply_name and for non-DT let it be there through regulator_init_data.

Please let me know your opinion.

Thanks,
Laxman
