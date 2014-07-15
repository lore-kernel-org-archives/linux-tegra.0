From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] clk: tegra: Add Tegra132 ccplex clocks
Date: Tue, 15 Jul 2014 16:40:17 -0400
Message-ID: <53C591B1.4080302@nvidia.com>
References: <1405437890-6468-1-git-send-email-pdeschrijver@nvidia.com> <1405437890-6468-7-git-send-email-pdeschrijver@nvidia.com> <53C5908C.5000009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C5908C.5000009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 7/15/2014 4:35 PM, Rhyland Klein wrote:
> On 7/15/2014 11:24 AM, Peter De Schrijver wrote:
>> Add support for the ccplex clocks in Tegra132.
>>
>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/Makefile |    2 ++
>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
>> index f7dfb72..4231865 100644
>> --- a/drivers/clk/tegra/Makefile
>> +++ b/drivers/clk/tegra/Makefile
>> @@ -15,3 +15,5 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>> +obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.c
>> +obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra132-ccplex.c

Also, shouldn't both these be .o not .c ?

-rhyland

>>
> 
> This doesn't seem to actually add the clk-tegra132-ccplex.c file.
> 
> -rhyland
> 


-- 
nvpublic
