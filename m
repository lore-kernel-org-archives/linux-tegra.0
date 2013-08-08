From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: t114 dalmore: add dt entry for nct1008
Date: Thu, 8 Aug 2013 10:36:25 +0800
Message-ID: <52030429.7010400@nvidia.com>
References: <1375858358-15070-1-git-send-email-wni@nvidia.com> <1375858358-15070-3-git-send-email-wni@nvidia.com> <52026FEE.9070003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52026FEE.9070003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org" <lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/08/2013 12:03 AM, Stephen Warren wrote:
> On 08/07/2013 12:52 AM, Wei Ni wrote:
>> Enable thermal sensor nct1008 for t114 dalmore.
> 
> Wei, I assume this patch doesn't depend on any of the other LM90-related
> patches you've sent; I can simply apply it right away?

In my [PATCH 1/2], I add codes to get the vdd regulator and enable it,
so if without it, the lm90 can't work properly on Dalmore, although it
can be loaded.
I think it's better to wait my fist patch applied.

> 
> Is the LM90 DT binding fully documented somewhere, including the
> vdd-supply property?

No LM90 DT binding document yet, I will add it in my next version.

> 
