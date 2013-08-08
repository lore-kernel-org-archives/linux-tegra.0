From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: unify Tegra's Kconfig a bit more
Date: Thu, 08 Aug 2013 11:48:34 -0600
Message-ID: <5203D9F2.9070401@wwwdotorg.org>
References: <1375907952-24746-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375907952-24746-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/07/2013 02:39 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Move all common select clauses from ARCH_TEGRA_*_SOC to ARCH_TEGRA to
> eliminate duplication. The USB-related selects all should have been
> common too, but were missing from Tegra114 previously. Move these to
> ARCH_TEGRA too. The latter fixes a build break when only Tegra114
> support was enabled, but not Tegra20 or Tegra30 support.

I've applied this to Tegra's for-3.12/soc branch.
