From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: fix build error when THUMB2_KERNEL enabled
Date: Mon, 15 Apr 2013 16:51:28 -0600
Message-ID: <516C8470.5090007@wwwdotorg.org>
References: <1366029749-16476-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1366029749-16476-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/15/2013 06:42 AM, Joseph Lo wrote:
> This patch fix the build failure when CONFIG_THUBM2_KERNEL enabled. You
> clould see the error message below:
> 
> arch/arm/mach-tegra/sleep-tegra30.S:69: Error: shift must be constant --
> `orr r12,r12,r4,lsl r3'

I have forwarded the series to the arm-soc maintainers to be applied
there. Thanks.
