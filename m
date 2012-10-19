From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra: move debug-macro.S to include/debug
Date: Fri, 19 Oct 2012 10:40:29 -0600
Message-ID: <5081827D.9060906@wwwdotorg.org>
References: <1350328024-30485-1-git-send-email-swarren@wwwdotorg.org> <1350328024-30485-3-git-send-email-swarren@wwwdotorg.org> <507EC303.1080000@gmail.com> <507EDB37.1060102@wwwdotorg.org> <507F1F31.2060503@wwwdotorg.org> <5080088C.9090607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5080088C.9090607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/18/2012 07:47 AM, Rob Herring wrote:
...
> Here is what I mentioned previously. This removes the static mapping from 
> the platforms. This is untested and probably breaks on different DEBUG_LL 
> options. For now, platforms call debug_ll_io_init, but once all platforms 
> are converted, this can be called from devicemaps_init.

> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c

> +void __init debug_ll_io_init(void)
> +{
> +	struct map_desc map;
> +
> +	if (!IS_ENABLED(CONFIG_DEBUG_LL))
> +		return;
> +
> +	debug_ll_addr(&map.pfn, &map.virtual);
> +	map.pfn = __phys_to_pfn(map.pfn);
> +	map.length = PAGE_SIZE;
> +	map.type = MT_DEVICE;
> +	create_mapping(&map);
> +}

OK, so I just call this new function from Tegra's tegra_map_common_io().
That looks pretty neat. I'll give it a try.
