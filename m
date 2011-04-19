From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: select MACH_WANT_SND_SOC_TEGRA_WM8903
Date: Tue, 19 Apr 2011 09:07:10 +0100
Message-ID: <20110419080710.GB16357@opensource.wolfsonmicro.com>
References: <1303184412-3494-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1303184412-3494-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 18, 2011 at 09:40:12PM -0600, Stephen Warren wrote:
> CONFIG_SND_SOC_TEGRA_WM8903 is useful for many Tegra boards. To avoid the
> ASoC tegra/Kconfig enumerating them all, instead have the Tegra machine
> Kconfig select MACH_WANT_SND_SOC_TEGRA_WM8903 where appropriate, and have
> SND_SOC_TEGRA_WM8903 depend on this.

Usually this is _HAS_ not _WANT_.
