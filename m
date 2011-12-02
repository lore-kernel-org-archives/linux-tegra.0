From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v3 1/6] ASoC: WM8903: Disallow all invalid gpio_cfg pdata
 values
Date: Fri, 2 Dec 2011 10:35:35 +0000
Message-ID: <20111202103535.GC8245@opensource.wolfsonmicro.com>
References: <1322772564-27343-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322772564-27343-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 01, 2011 at 01:49:19PM -0700, Stephen Warren wrote:
> The GPIO registers are 15 bits wide. Hence values, higher than 0x7fff are
> not legal GPIO register values. Modify the pdata.gpio_cfg handling code
> to reject all illegal values, not just WM8903_GPIO_NO_CONFIG (0x8000). This
> will allow the later use of 0xffffffff as an invalid value in future device
> tree bindings, meaning "don't touch this GPIO's configuration".

Applied, thanks.
