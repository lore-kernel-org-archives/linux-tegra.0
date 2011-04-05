From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] ASoC: Tegra: Suspend/resume support
Date: Wed, 6 Apr 2011 08:14:41 +0900
Message-ID: <20110405231440.GA6775@opensource.wolfsonmicro.com>
References: <1302035256-26301-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1302035256-26301-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 05, 2011 at 02:27:36PM -0600, Stephen Warren wrote:

> +const struct dev_pm_ops harmony_pm_ops = {
> +	.suspend = snd_soc_suspend,
> +	.resume = snd_soc_resume,
> +	.poweroff = snd_soc_poweroff,
> +};

We should add an export for snd_soc_pm_ops too so that drivers like this
that can just use the default behaviour don't need to cut'n'paste the
code like this.
