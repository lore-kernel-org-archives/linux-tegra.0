From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Remove p2371-2180 (Jetson TX1)
 support
Date: Fri, 14 Apr 2017 11:08:48 +0200
Message-ID: <1492160928.26844.1.camel@lynxeye.de>
References: <20170413185845.2193-1-swarren@wwwdotorg.org>
         <20170413185845.2193-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413185845.2193-2-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Am Donnerstag, den 13.04.2017, 12:58 -0600 schrieb Stephen Warren:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> All flashing and early boot operations for Jetson TX1 rely on
> NVIDIA's
> L4T software release.

Not really related to this patch, but this feels like a serious step
backwards in terms of openness of the Tegra platform. It's one of the
reasons why I'm not doing much with my Jetson TX1.

There seems to be some information about the T210 bootflow, but all the
tools required to produce the correct flash layout and get things onto
the board are closed source.

I guess there aren't any plans to change that in the future, right?

Regards,
Lucas
