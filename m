From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/4] host1x: mipi: Add new parent clock for mipi calibration
Date: Thu, 7 Aug 2014 10:15:42 -0400
Message-ID: <CAOw6vbKiECG8w6V3zvnr5Z4r4WuRsq556gtspAnM7Drj=A8m8A@mail.gmail.com>
References: <1407391907-19488-1-git-send-email-seanpaul@chromium.org>
 <1407391907-19488-2-git-send-email-seanpaul@chromium.org> <20140807081127.GD18359@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140807081127.GD18359@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 7, 2014 at 4:11 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Aug 07, 2014 at 02:11:44AM -0400, Sean Paul wrote:
>> This patch adds a new parent clock to enable/disable the 72MHz
>> clock required for mipi calibration.
>
> s/mipi/MIPI/ please. Also this doesn't explain why this change is
> necessary. Doesn't MIPI D-PHY calibration work without this patch? It
> sure does for me.

Hi Thierry,
Thanks for the prompt reviews.

It doesn't work for me on T132 without this additional clock. It seems
the source for mipi-cal has changed between T124 & T132 from PLL_OUT3
to CLK72MHZ, so that could be why it's working for you and not for me.

>
> Furthermore you say 72 MHz clock, but the below uses PLL_P_OUT3 as the
> parent in the example, yet PLL_P_OUT3 runs at 102 MHz on all of my
> systems. What 72 MHz clock are you referring to?
>

This was just a bogus assumption on my part that PLL_P_OUT3 was to be
programmed to 72MHz on pre-T132 setups.

> Also can this parent clock ever be anything other than PLL_P_OUT3? If
> not it would probably be better to set that statically in the clock
> initialization tables.

I'm not entirely certain how I'd set CLK72MHZ statically in the init
tables, could you elaborate? I can get it to work by re-parenting
mipi-cal to clk72mhz, however I'm not sure if that would break other
platforms.

My initial thought was to add a compatible = "nvidia,tegra132-mipi",
which then would require the parent to be present in the dt.

>
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index 9882ea1..4dd91fd 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -80,7 +80,8 @@ static const struct module {
>>  struct tegra_mipi {
>>       void __iomem *regs;
>>       struct mutex lock;
>> -     struct clk *clk;
>> +     struct clk *clk_parent;
>> +     struct clk *clk_mipi_cal;
>
> I don't think the clk -> clk_mipi_cal rename is warranted here.

Will do.

Sean

>
> Thierry
