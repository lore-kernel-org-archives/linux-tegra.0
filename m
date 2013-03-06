From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: don't unlock MMIO access to DBGLAR
Date: Wed, 06 Mar 2013 13:42:21 -0700
Message-ID: <5137AA2D.6000401@wwwdotorg.org>
References: <1361268973-14584-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361268973-14584-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/19/2013 03:16 AM, Joseph Lo wrote:
> There is no need to unlock MMIO access to the DBGLAR all the time. Doing
> so may even cause problems if a SW bug causes writes to that MMIO region.
> 
> Cortex-A15 processors do not support the CP14 register write the code
> currently uses to unlock the DBGLAR; the instruction throws an undefined
> instruction exceptions. This prevents tegra_secondary_startup() from
> executing on Tegra114, and hence prevents SMP.
> 
> Remove the code that unlocks this access.

I have applied this to Tegra's for-3.10/fixes branch.
