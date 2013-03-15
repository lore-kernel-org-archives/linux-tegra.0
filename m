From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] amba: tegra-ahb: Fix build error w/ PM_SLEEP w/o
 PM_RUNTIME
Date: Thu, 14 Mar 2013 23:23:38 -0600
Message-ID: <5142B05A.2070408@wwwdotorg.org>
References: <1363252089-4120-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363252089-4120-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/14/2013 03:08 AM, Hiroshi Doyu wrote:
> Make this depend on CONFIG_PM. This protection is necessary to not
> cause any build errors with any combination of PM features especially
> when supporting a new SoC where each PM features are being enabled
> one-by-one during its depelopment.

Looks fine to me.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I assume Russell will want this to go through his patch tracker.
