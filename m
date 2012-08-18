From: Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 1/1] driver-core: Shut up dev_dbg_reatelimited() without
 DEBUG
Date: Sat, 18 Aug 2012 03:11:56 +0300
Message-ID: <502EDDCC.200@iki.fi>
References: <20120817.090416.563933713934615530.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120817.090416.563933713934615530.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <htl10-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 09:04 AM, Hiroshi Doyu wrote:
> dev_dbg_reatelimited() without DEBUG printed "217078 callbacks
> suppressed". This shouldn't print anything without DEBUG.
>
> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reported-by: Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
> ---
>   include/linux/device.h |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index eb945e1..d4dc26e 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -962,9 +962,13 @@ do {									\
>   	dev_level_ratelimited(dev_notice, dev, fmt, ##__VA_ARGS__)
>   #define dev_info_ratelimited(dev, fmt, ...)				\
>   	dev_level_ratelimited(dev_info, dev, fmt, ##__VA_ARGS__)
> +#if defined(DEBUG)
>   #define dev_dbg_ratelimited(dev, fmt, ...)				\
>   	dev_level_ratelimited(dev_dbg, dev, fmt, ##__VA_ARGS__)
> -
> +#else
> +#define dev_dbg_ratelimited(dev, fmt, ...)			\
> +	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#endif
>   /*
>    * Stupid hackaround for existing uses of non-printk uses dev_info
>    *
>

NACK. I don't think that's correct behavior. After that patch it kills 
all output of dev_dbg_ratelimited(). If I use dynamic debugs and order 
debugs, I expect to see debugs as earlier.

I did test module in order to demonstrate problem. Here it is:
http://git.linuxtv.org/anttip/media_tree.git/shortlog/refs/heads/dev_dbg_ratelimited

There is also file named: test_results.txt
It contains 4 test cases:
1) without that patch & without module dynamic debug
2) without that patch & module dynamic debug ordered
3) with that patch & without module dynamic debug
4) with that patch & module dynamic debug ordered

regards
Antti

-- 
http://palosaari.fi/
