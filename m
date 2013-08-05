From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra30: Don't wait for PLL_U lock bit
Date: Mon, 5 Aug 2013 12:08:55 +0530
Message-ID: <51FF487F.6000007@nvidia.com>
References: <1375292551-7933-1-git-send-email-ttynkkynen@nvidia.com> <1375292551-7933-2-git-send-email-ttynkkynen@nvidia.com> <51F97BEA.7040006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51F97BEA.7040006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 01 August 2013 02:34 AM, Stephen Warren wrote:
> On 07/31/2013 11:42 AM, Tuomas Tynkkynen wrote:
>> The lock bit on PLL_U does not seem to be working correctly and
>> sometimes never gets set when waiting for the PLL to come up.
>> Remove the TEGRA_PLL_USE_LOCK flag to use a constant delay.
> Peter, Prashant,
>
> I think you said that the lock bits should work on Tegra30 (albeit they
> don't on Tegra20)? Can you remind me if the do/don't?
>
> If Peter and Prashant are OK with this patch, feel free to take my ack.

Hi Tuomas,

Sorry for the delayed response. Please make sure that avdd_usb_pll 
regulator is enabled before enabling PLLU and utmip parameters are 
configured properly.
If this this regulator is not enabled then you will get this kind of 
timeout when enabling PLLU.

Thanks,
Prashant

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
