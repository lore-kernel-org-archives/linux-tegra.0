From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] ASoC: Tegra: Suspend/resume support
Date: Wed, 6 Apr 2011 23:14:27 +0900
Message-ID: <20110406141425.GD2810@opensource.wolfsonmicro.com>
References: <1302053730-1658-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1302053730-1658-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 05, 2011 at 07:35:30PM -0600, Stephen Warren wrote:
> ASoC machine drivers that are their own platform_driver (as opposed to
> those using the soc-audio platform_driver) need to explicitly set up
> power-management operation callbacks.
> 
> To avoid cut/paste, snd_soc_pm_ops also needs to be exported.

Applied, thanks.
