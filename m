From: Joe Perches <golf@perches.com>
Subject: Re: [RESEND PATCH 1/6] ARM: config: multi_v5: enable dynamic debug
Date: Tue, 14 Aug 2018 07:16:29 -0700
Message-ID: <9461e62248cc7c1b5585004ff8cf7268b823e29c.camel@perches.com>
References: <20180814140612.12554-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814140612.12554-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Joel Stanley <joel@jms.id.au>, Russell King <linux@armlinux.org.uk>, Boris Brezillon <boris.brezillon@bootlin.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2018-08-14 at 16:06 +0200, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Dynamic debug is really helpful.

It's useful, but perhaps not appropriate.

Most arm configs are for small resource constrained systems.
dynamic_debug adds a lot of additional text and a fair amount of data.


> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  arch/arm/configs/multi_v5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
> index 318b76fa26d1..b302ac68d587 100644
> --- a/arch/arm/configs/multi_v5_defconfig
> +++ b/arch/arm/configs/multi_v5_defconfig
> @@ -275,6 +275,7 @@ CONFIG_NLS_CODEPAGE_850=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_ISO8859_2=y
>  CONFIG_NLS_UTF8=y
> +CONFIG_DYNAMIC_DEBUG=y
>  CONFIG_DEBUG_INFO=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_MAGIC_SYSRQ=y
