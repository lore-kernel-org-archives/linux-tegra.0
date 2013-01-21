From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra114: cpuidle: add ARM_CPUIDLE_WFI_STATE support
Date: Mon, 21 Jan 2013 10:18:46 -0700
Message-ID: <50FD7876.4010306@wwwdotorg.org>
References: <1358761746-13118-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358761746-13118-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2013 02:49 AM, Joseph Lo wrote:
> Adding the generic ARM_CPUIDLE_WFI_STATE support for Tegra114.

This of course depends on Hiroshi's Tegra114 patches, right; you should
explicitly point out any dependencies when posting patches.

The code changes look reasonable, but of course I'll hold off applying
it until the Tegra114 support is checked in.
