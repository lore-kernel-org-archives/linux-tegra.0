From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Thu, 18 Jul 2013 11:00:09 -0600
Message-ID: <51E81F19.2070402@wwwdotorg.org>
References: <1374013147-4775-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374013147-4775-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/16/2013 04:19 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I'm planning to remove CONFIG_ARCH_TEGRA_*_SOC, leaving just ARCH_TEGRA.
> This will reduce the number of configurations that need to be supported
> by core Tegra code, e.g. CPU idle, hotplug. As a precursor, we need to
> update Kconfig for all Tegra drivers not to reference ARCH_TEGRA_*_SOC.

I'd like to defer actually applying this patch. There is some discussion
(in the thread for the equivalent ASoC patches) re: the best way to
handle the ARCH_TEGRA_*_SOC Kconfig options which might affect this
patch. Any review comment is still appreciated.
