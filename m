From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Port Tegra to generic clk framework
Date: Fri, 6 Jul 2012 20:05:59 +0530
Message-ID: <4FF6F7CF.9000405@nvidia.com>
References: <1341482120-3317-1-git-send-email-pgaikwad@nvidia.com> <4FF5E1C3.6070309@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF5E1C3.6070309-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "mturquette-l0cyMroinI0@public.gmane.org" <mturquette-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 06 July 2012 12:19 AM, Stephen Warren wrote:
> On 07/05/2012 03:55 AM, Prashant Gaikwad wrote:
>> This patch set ports Tegra clock code to generic clock framework.
<snip>
> (The one slight difference between the 2 branches I tested is that AC100
> and Trimslice booted using DT passed in next-20120705 but failed only in
> Tegra's for-next. Otherwise, all results were identical)
>
> I'll try to investigate what the issues are since I imagine you don't
> have access to these boards. But, I probably won't be able to fix this
> until I return from vacation.

Stephen,

Can you please try removing "late_initcall(clk_disable_unused);" from 
drivers/clk/clk.c?
It will keep unused clocks enabled. If it works then there should not be 
any regression in this patch series but need to enable some board 
specific clock.

> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
