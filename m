From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 00/11] ARM: tegra114: add support for system suspend
Date: Fri, 19 Jul 2013 10:54:31 -0600
Message-ID: <51E96F47.5080206@wwwdotorg.org>
References: <1372845047-25147-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372845047-25147-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/03/2013 03:50 AM, Joseph Lo wrote:
> This series introduce system suspend function for Tegra114 and depend on
> the series of "ARM: tegra114: cpuidle: add power down state".
> 
> Verified on Seaboard, Cardhu and Dalmore and with THUMB2_KERNEL as well.

Patches 1-9 applied to Tegra's for-3.12/soc branch. Patch 10 dropped
since Laxman's patch was more complete. Patch 11 applied to Tegra's
for-3.12/dt branch.
