From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/4] ARM: tegra: add CPU hot-plug and idle support
 for Tegra124
Date: Fri, 11 Oct 2013 12:39:28 -0600
Message-ID: <525845E0.5030601@wwwdotorg.org>
References: <1381485452-3561-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381485452-3561-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/11/2013 03:57 AM, Joseph Lo wrote:
> The CPU hot-plug and idle function for Tegra124 was identical to Tegra114,
> so we share the driver with it.
> 
> Note:
> This patch series depends on the patch series below.
> * [PATCH 0/5] Tegra124 clock support
> * [PATCH V2 0/6] ARM: tegra: basic support for Tegra124 SoC
> * [PATCH] ARM: tegra: add clock properties for devices of Tegra124

I have applied patches 2-4 to Tegra's for-3.13/soc branch.

I have not applied patch 1, since that's a clock driver change. Please
work with Mike and/or Peter to send that patch through the clock tree.
In general, if there aren't any compile-time or run-time dependencies
(for existing features, not new ones) between patches, patches for
different subsystems should be sent separately, rather than as a
combined series.

Note that "[PATCH] ARM: tegra: add clock properties for devices of
Tegra124" is not yet applied; I'm waiting for Peter's Tegra124 clock
series to be finalized before applying that. There's no compile-time
dependency here, and the patch only enables new features without
breaking existing ones, so there's no bisection issue here.
