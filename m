From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] ASoC: Tegra: Implement SPDIF CPU DAI
Date: Sat, 2 Jul 2011 12:16:07 -0700
Message-ID: <20110702191607.GA10505@opensource.wolfsonmicro.com>
References: <1309550175-30551-1-git-send-email-swarren@nvidia.com>
 <1309550175-30551-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1309550175-30551-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 01, 2011 at 01:56:15PM -0600, Stephen Warren wrote:

> +struct snd_soc_dai_driver tegra_spdif_dai = {
> +	.name = DRV_NAME ".0",

This looks wrong - what's with the .0?  If there can be only one device
there should be no number, if there can be multiple devices hard coding
is bad karma.  Either way the number should come from the instantiation.
