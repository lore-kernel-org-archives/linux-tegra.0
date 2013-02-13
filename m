From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] clk: tegra: initialise parent of uart clocks
Date: Wed, 13 Feb 2013 09:34:52 -0700
Message-ID: <511BC0AC.2010101@wwwdotorg.org>
References: <1360682279-23051-1-git-send-email-ldewangan@nvidia.com> <511A7FF1.1030009@wwwdotorg.org> <511B3AA0.7020403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511B3AA0.7020403-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/13/2013 12:02 AM, Laxman Dewangan wrote:
> On Tuesday 12 February 2013 11:16 PM, Stephen Warren wrote:
>> On 02/12/2013 08:17 AM, Laxman Dewangan wrote:
>>> Initialise the parent of UARTs to PLLP and disabling clock by
>>> default.
>>
>> This patch wasn't tested, was it? Without the patch I just sent titled
>> "ARM: tegra: remove clock-frequency properties from serial nodes", the
>> UART clocks get turned off and the console breaks.
> 
> I tested this in next-20130212 where "clock-frequency" is there in
> tegra30.dtsi file.

I tested on Cardhu/Tegra30 (I'd previously only tested on
Harmony/Tegra20), and I see the exact same problem; the clock core turns
off the UART clock and the system hangs.

Are you sure you don't have any other local patches that somehow keep
the UART clock on (e.g. disabling clk_disable_unused, calling clk_get()
on the UART clock somewhere else, have the Tegra HS UART driver enabled
on the console port for testing which perhaps does an unconditional
clk_get). Are you sure you're testing with U-Boot rather than our binary
bootloader; who knows what kind of voodoo that does to clocks.

Note: I tested: a merge of arm-soc/for-next and Tegra's for-next branch,
with my patch to remove the clock-frequency properties reverted, plus a
fix for the boot crash ("clockevents: fix generic broadcast for
FEAT_C3STOP").

> If you remove this from dts file at all then it will not work as there
> is no execution path to call the clk_prepare_enable().
> 
> of_serial.c file:
>         if (of_property_read_u32(np, "clock-frequency", &clk)) {

That returns 0 if the property is present (so doesn't get/enable the
clock), and an error code if the property is missing (so does get/enable
the clock).

> 
>                 /* Get clk rate through clk driver if present */
>                 info->clk = clk_get(&ofdev->dev, NULL);
>                 if (IS_ERR(info->clk)) {
>                         dev_warn(&ofdev->dev,
>                                 "clk or clock-frequency not defined\n");
>                         return PTR_ERR(info->clk);
>                 }
> 
>                 clk_prepare_enable(info->clk);
>                 clk = clk_get_rate(info->clk);
>         }
