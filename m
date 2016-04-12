From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/7] soc/tegra: pmc: Add new Tegra210 IO rails
Date: Tue, 12 Apr 2016 22:29:43 +0530
Message-ID: <570D297F.1080701@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-3-git-send-email-ldewangan@nvidia.com> <20160412152830.GB30211@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160412152830.GB30211-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 12 April 2016 08:58 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 12, 2016 at 08:26:42PM +0530, Laxman Dewangan wrote:
>> NVIDIA Tegra210 has extended the IO rails for new IO pads
>> and added some new IO rails on top of its previous SoC.
>>
>> Add all supported IO rails from Tegra210 to the Tegra PMC header.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   include/soc/tegra/pmc.h | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
>> index 07e332d..58fadc5 100644
>> --- a/include/soc/tegra/pmc.h
>> +++ b/include/soc/tegra/pmc.h
>> @@ -90,22 +90,36 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
>>   #define TEGRA_IO_RAIL_UART	14
>>   #define TEGRA_IO_RAIL_BB	15
>>   #define TEGRA_IO_RAIL_AUDIO	17
>> +#define TEGRA_IO_RAIL_USB3	18
>>   #define TEGRA_IO_RAIL_HSIC	19
>>   #define TEGRA_IO_RAIL_COMP	22
>> +#define TEGRA_IO_RAIL_DBG	25
>> +#define TEGRA_IO_RAIL_DBG_NONAO	26
>> +#define TEGRA_IO_RAIL_GPIO	27
>>   #define TEGRA_IO_RAIL_HDMI	28
>>   #define TEGRA_IO_RAIL_PEX_CNTRL	32
>>   #define TEGRA_IO_RAIL_SDMMC1	33
>>   #define TEGRA_IO_RAIL_SDMMC3	34
>>   #define TEGRA_IO_RAIL_SDMMC4	35
>> +#define TEGRA_IO_RAIL_EMMC	35
>>   #define TEGRA_IO_RAIL_CAM	36
>>   #define TEGRA_IO_RAIL_RES	37
>> +#define TEGRA_IO_RAIL_EMMC2	37
> We have a duplicate entry for 37 now. The _RES might have meant
> "reserved", in which case maybe just replace it with the new symbolic
> name?

OK, then make sense to replace RES with EMMC2.
