From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable Tegra RTC as default for Tegra124
Date: Fri, 11 Oct 2013 09:59:36 -0600
Message-ID: <52582068.5060809@wwwdotorg.org>
References: <1381485425-3354-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381485425-3354-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/11/2013 03:57 AM, Joseph Lo wrote:
> This patch makes the Tegra RTC enabled as default for Tegra124 platform.

I've applied this to Tegra's for-3.13/dt branch.

> Note:
> This patch was based on the patch "ARM: tegra: add clock properties for
> devices of Tegra124" that already queued in linux-tegra.

That patch has been posted, but not queued. I can't queue it until
Peter's clock series is finalized, since it depends on that.
