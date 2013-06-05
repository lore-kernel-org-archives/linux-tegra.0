From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: remove the ifdef of ARCH SoC in the tegra_resume
Date: Wed, 05 Jun 2013 11:44:24 -0600
Message-ID: <51AF78F8.8040609@wwwdotorg.org>
References: <1370247004-31846-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370247004-31846-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/03/2013 02:10 AM, Joseph Lo wrote:
> Removing the ifdef of ARCH_TEGRA_SoC in the tegra_resume function. Because
> we always build with all Tegra SoCs support and had a runtime chip
> detection code there. And we expect most of the chips would need the code
> in the future.
> 
> We also fix a typo of a macro name that cause a build error.

Applied to Tegra's for-3.11/soc, with re-written commit description.
