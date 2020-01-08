From: Gregory CLEMENT <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 13/13] mailbox: armada-37xx-rwtm: convert to
 devm_platform_ioremap_resource
Date: Wed, 08 Jan 2020 10:43:04 +0100
Message-ID: <87imlmb7x3.fsf@FE-laptop>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-13-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20191228183538.26189-13-tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nsaenzjulienne-l3A5Bk7waGM@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Yangtao Li <tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Yangtao Li,

> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied on mvebu/drivers

Thanks,

Gregory

> ---
>  drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> index 19f086716dc5..02b7b28e6969 100644
> --- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> +++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
> @@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
>  static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  {
>  	struct a37xx_mbox *mbox;
> -	struct resource *regs;
>  	struct mbox_chan *chans;
>  	int ret;
>  
> @@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
>  	if (!chans)
>  		return -ENOMEM;
>  
> -	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
> +	mbox->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mbox->base)) {
>  		dev_err(&pdev->dev, "ioremap failed\n");
>  		return PTR_ERR(mbox->base);
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
