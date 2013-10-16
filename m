From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] spi/tegra20-slink: Crude refactoring to use core
 message parsing
Date: Wed, 16 Oct 2013 15:41:51 -0600
Message-ID: <525F081F.1080601@wwwdotorg.org>
References: <1381957255-24344-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381957255-24344-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 03:00 PM, Mark Brown wrote:
> From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This is a half done conversion with minimal code reorganisation provided
> for bisection purposes. A further patch will move the first transfer
> preparation into tegra_slink_prepare_message().

> diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c

> -static int tegra_slink_transfer_one_message(struct spi_master *master,
> -			struct spi_message *msg)
...
> -		msg->actual_length += xfer->len;
> -		if (xfer->cs_change && xfer->delay_usecs) {
> -			tegra_slink_writel(tspi, tspi->def_command_reg,
> -					SLINK_COMMAND);
> -			udelay(xfer->delay_usecs);
> -		}

That chunk didn't seem to end up anywhere else. Is that expected?
