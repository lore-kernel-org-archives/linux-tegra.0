From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: regulator: tps6586x: add PFM/PWM options on SMs
Date: Fri, 15 Apr 2011 18:13:33 -0700
Message-ID: <1FC56210173BB445BD77F608D6FB8D032A144AA0E4@HQMAIL03.nvidia.com>
References: <1302818393-19067-1-git-send-email-yelin@nvidia.com>
 <20110415093052.GC23466@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110415093052.GC23466-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Mark Brown' <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org" <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xin Xie <xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark,

Thanks for the feedback. I will look into to use the REGULATOR_MODE_FAST mode.

-----Original Message-----
From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Mark Brown
Sent: Friday, April 15, 2011 2:31 AM
To: Yen.Lin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org; mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org; lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Xin Xie; Yen Lin
Subject: Re: [PATCH] ARM: regulator: tps6586x: add PFM/PWM options on SMs

On Thu, Apr 14, 2011 at 02:59:53PM -0700, Yen.Lin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote:

> TPS6586x SM0, SM1 and SM2 port have 2 power switching modes:
>     - PWM only, or
>     - PMW-PFM auto mode

> Some of TPS6586x have voltage spike in PFM-to-FWM transition which can 
> lockup the CPU if choose PWM-PFM auto mode.

> This patch enables such mode selection on SMs ports from the board 
> level power configuration file.

This is just the regular regulator mode API - forced PWM mode would map onto _FAST.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
