From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Sat, 24 Nov 2012 09:09:11 +0200
Message-ID: <50B07297.3090001@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com> <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121123234527.GE21555-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 01:45, Thierry Reding wrote:
> I think I remember a discussion about this back when we designed the DT
> bindings. The result I seem to remember was that since syncpoints can be
> arbitrarily assigned they wouldn't have to be statically allocated at
> compile time.
> Instead we could just have them allocated when a host1x client registers
> with host1x. Or have each client request its required syncpoints
> explicitly. The latter would make it trivial to associate a label with
> it.

True. I didn't yet have time to implement dynamic allocation and I
didn't want to wait for that to get the code out. I'll try to find time
for that.

> 
>> +
>> +static struct host1x_device_info host1x_info = {
>> +	.nb_channels	= 8,
>> +	.nb_pts		= 32,
>> +	.nb_mlocks	= 16,
>> +	.nb_bases	= 8,
>> +	.syncpt_names	= host1x_syncpt_names,
>> +	.client_managed	= NVSYNCPTS_CLIENT_MANAGED,
>> +};
>> +
>> +static struct nvhost_device_data tegra_host1x_info = {
>> +	.clocks = { {"host1x", UINT_MAX} },
>> +	NVHOST_MODULE_NO_POWERGATE_IDS,
>> +	.private_data = &host1x_info,
>> +};
>> +
>> +static struct nvhost_device_data tegra_gr2d_info = {
>> +	.index		= 2,
>> +	.syncpts	= BIT(NVSYNCPT_2D_0) | BIT(NVSYNCPT_2D_1),
>> +	.clocks		= { {"gr2d", UINT_MAX, true}, {"epp", UINT_MAX, true} },
>> +	NVHOST_MODULE_NO_POWERGATE_IDS,
>> +	.clockgate_delay = 0,
>> +	.serialize	= true,
>> +};
> 
> Again, this doesn't seem like it should be statically configured in the
> board data.

The host1x specifics (number of channels, pts etc) are description of
hardware, so they could go to a device tree binding.

The allocation of sync points is a software policy that could be handled
by the driver.

Clocks are waiting for the general discussion about clock bindings in
device trees, but that data is SoC specific, so that's why I've put that
in board data.

Clock gating policy is software feature that could be in driver.

>> diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
>> index 7f049ac..3314e50 100644
>> --- a/arch/arm/mach-tegra/tegra20_clocks_data.c
>> +++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
>> @@ -1041,10 +1041,10 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
>>  	CLK_DUPLICATE("usbd",	"utmip-pad",	NULL),
>>  	CLK_DUPLICATE("usbd",	"tegra-ehci.0",	NULL),
>>  	CLK_DUPLICATE("usbd",	"tegra-otg",	NULL),
>> -	CLK_DUPLICATE("2d",	"tegra_grhost",	"gr2d"),
>> -	CLK_DUPLICATE("3d",	"tegra_grhost",	"gr3d"),
>> -	CLK_DUPLICATE("epp",	"tegra_grhost",	"epp"),
>> -	CLK_DUPLICATE("mpe",	"tegra_grhost",	"mpe"),
>> +	CLK_DUPLICATE("2d",	NULL,		"gr2d"),
>> +	CLK_DUPLICATE("3d",	NULL,		"gr3d"),
>> +	CLK_DUPLICATE("epp",	NULL,		"epp"),
>> +	CLK_DUPLICATE("mpe",	NULL,		"mpe"),
> 
> Are these actually required here?

I think we had problems in driver acquiring the clocks without this
(mismatch of driver), but I could retry. The old bindings assumed that
driver would be called "tegra_grhost", but that's not the case.

Terje
