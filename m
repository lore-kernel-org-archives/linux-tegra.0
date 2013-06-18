From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] tegrarcm: Add SPI flash support to tegra114 miniloader
Date: Mon, 17 Jun 2013 21:57:27 -0600
Message-ID: <51BFDAA7.1080106@wwwdotorg.org>
References: <1371525987-2799-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525987-2799-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/17/2013 09:26 PM, Allen Martin wrote:
> Update tegra114 miniloader file with a version that supports boot from
> SPI flash.  The previous version would hang if the board was
> configured to boot from SPI.

Out of curiosity, why does it hang? I thought the miniloader would only
interpret the SDRAM portion of the BCT, and hence the boot flash
configuration would have no effect on it at all. Does it also enable
whatever boot flash is in the BCT too?

Either way, I guess I have no problem with the patch, so,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
