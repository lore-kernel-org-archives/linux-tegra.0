From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v3 2/6] ASoC: WM8903: Create default platform data
 structure
Date: Fri, 2 Dec 2011 00:29:40 +0000
Message-ID: <20111202002939.GB31903@opensource.wolfsonmicro.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
 <1322772564-27343-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322772564-27343-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 01, 2011 at 01:49:20PM -0700, Stephen Warren wrote:

> +	/* Default platform data, for use if none is supplied */
> +	defpdata.irq_active_low = false;
> +	defpdata.micdet_cfg = 0;
> +	defpdata.micdet_delay = 0;

No need to set things to zero (or just memset the structure).

> +	defpdata.gpio_base = -1;
> +	for (i = 0; i < ARRAY_SIZE(defpdata.gpio_cfg); i++)
> +		defpdata.gpio_cfg[i] = 0xffffffff;

These should come after we've taken the copy, checking to see if there'a
anything there before overwriting.
