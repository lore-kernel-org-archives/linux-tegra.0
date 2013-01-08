From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 2/9] HACK: ARM: tegra: Use CLK_IGNORE_UNUSED for Tegra 114
 SoC
Date: Tue, 08 Jan 2013 15:52:49 -0700
Message-ID: <50ECA341.5020106@wwwdotorg.org>
References: <1357649263-1098-1-git-send-email-hdoyu@nvidia.com> <1357649263-1098-3-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357649263-1098-3-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/08/2013 05:47 AM, Hiroshi Doyu wrote:
> Use CLK_IGNORE_UNUSED for the Tegra 114 SoC to ensure
> clk_disable_unused() is not called. Otherwise the system will die,
> because the usecount of the clocks is incorrect. This patch will be
> reverted once the Tegra 114 clocks are implemented.

> diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c

Just as an FYI, I'll almost certainly apply Prashant's common clock
conversion before this series, so this patch will need some rework to be
applied on top of that.
