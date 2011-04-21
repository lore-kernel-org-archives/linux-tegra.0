From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Tegra: select MACH_HAS_SND_SOC_TEGRA_WM8903
Date: Thu, 21 Apr 2011 11:58:20 +0100
Message-ID: <20110421105819.GC11788@opensource.wolfsonmicro.com>
References: <1303229881-9054-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303229881-9054-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2011 at 10:18:01AM -0600, Stephen Warren wrote:
> CONFIG_SND_SOC_TEGRA_WM8903 is useful for many Tegra boards. To avoid the
> ASoC tegra/Kconfig enumerating them all, instead have the Tegra machine
> Kconfig select MACH_HAS_SND_SOC_TEGRA_WM8903 where appropriate, and have
> SND_SOC_TEGRA_WM8903 depend on this.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Mark, this will need to be applied to your tegra branch so it can get
> merged into both trees. Thanks.

I'm fairly sure it's not been generated against that branch - it doesn't
apply since the branch doesn't have the rename of the board driver.
I've fixed this up but please be more careful.
