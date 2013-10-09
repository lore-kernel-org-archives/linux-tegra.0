From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: tegra124: add suspend/resume function for tegra_cpu_car_ops
Date: Wed, 09 Oct 2013 17:12:19 -0600
Message-ID: <5255E2D3.3040808@wwwdotorg.org>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com> <1381310411-11391-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 03:20 AM, Joseph Lo wrote:
> Adding suspend/resume function for tegra_cpu_car_ops. We only save and
> restore the setting of the clock of CoreSight. Other clocks still need
> to be taken care by clock driver.

This series also mixes drivers/clk and arch/arm/mach-tegra changes. It
looks like there's no build-time dependency though, since this just
implements some extra hooks in tegra_cpu_car_ops, so I assume again this
clk patch will go through Mike's tree, and the rest of the patches
through the Tegra tree.

In the future, if there aren't any dependencies, it's best just to send
the two sets of changes separately.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
(although it'd be nice to have Peter review it too)
