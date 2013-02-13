From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] clk: tegra: initialise parent of uart clocks
Date: Wed, 13 Feb 2013 12:32:56 +0530
Message-ID: <511B3AA0.7020403@nvidia.com>
References: <1360682279-23051-1-git-send-email-ldewangan@nvidia.com> <511A7FF1.1030009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <511A7FF1.1030009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 12 February 2013 11:16 PM, Stephen Warren wrote:
> On 02/12/2013 08:17 AM, Laxman Dewangan wrote:
>> Initialise the parent of UARTs to PLLP and disabling clock by
>> default.
> This patch wasn't tested, was it? Without the patch I just sent titled
> "ARM: tegra: remove clock-frequency properties from serial nodes", the
> UART clocks get turned off and the console breaks.

I tested this in next-20130212 where "clock-frequency" is there in 
tegra30.dtsi file.
If you remove this from dts file at all then it will not work as there 
is no execution path to call the clk_prepare_enable().

of_serial.c file:
         if (of_property_read_u32(np, "clock-frequency", &clk)) {

                 /* Get clk rate through clk driver if present */
                 info->clk = clk_get(&ofdev->dev, NULL);
                 if (IS_ERR(info->clk)) {
                         dev_warn(&ofdev->dev,
                                 "clk or clock-frequency not defined\n");
                         return PTR_ERR(info->clk);
                 }

                 clk_prepare_enable(info->clk);
                 clk = clk_get_rate(info->clk);
         }
