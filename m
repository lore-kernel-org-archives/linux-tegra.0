From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/9] spi: tegra20-sflash: move to generic dma DT binding
Date: Fri, 26 Jul 2013 13:36:11 -0600
Message-ID: <51F2CFAB.4000609@wwwdotorg.org>
References: <1374639002-16753-1-git-send-email-rizhao@nvidia.com> <1374639002-16753-6-git-send-email-rizhao@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374639002-16753-6-git-send-email-rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2013 10:09 PM, Richard Zhao wrote:
> update binding doc.

It may be worth mentioning here that the driver isn't updated since it
doesn't support DMA operation (yet?). A more complete patch description
would also be useful.
