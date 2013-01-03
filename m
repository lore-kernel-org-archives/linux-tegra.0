From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix Kconfig warnings when !SMP
Date: Thu, 03 Jan 2013 09:50:53 -0700
Message-ID: <50E5B6ED.1040403@wwwdotorg.org>
References: <1357162455-24043-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357162455-24043-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 02:34 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Fix:
> 
> warning: (ARCH_TEGRA_2x_SOC) selects ARM_ERRATA_754327 which has unmet direct dependencies (CPU_V7 && SMP)
> warning: (ARCH_TEGRA_2x_SOC) selects ARM_ERRATA_742230 which has unmet direct dependencies (CPU_V7 && SMP)
> 
> by selecting options only if SMP.

Applied to Tegra's for-3.9/cleanup branch.
