From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: make use of
 devm_platform_ioremap_resource
Date: Mon, 9 Sep 2019 20:14:50 +0200 (CEST)
Message-ID: <alpine.OSX.2.21.1909092010430.4245@macbook-pro.fritz.box>
References: <1567935662-8006-1-git-send-email-hariprasad.kelam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567935662-8006-1-git-send-email-hariprasad.kelam@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Hariprased,

On Sun, 8 Sep 2019, hariprasad@MISSING_DOMAIN wrote:
                              ^^^^^^^^^^^^^^^^^^
something is wrong with your git mail config...

> From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
>
> fix below issue reported by coccicheck
> drivers/staging//nvec/nvec.c:794:1-5: WARNING: Use
> devm_platform_ioremap_resource for base
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>

Acked-by: Marc Dietrich <marvin24@gmx.de>

Thanks!

Marc

> ---
> drivers/staging/nvec/nvec.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 1cbd7b7..360ec04 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -767,7 +767,6 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> 	struct device *dev = &pdev->dev;
> 	struct nvec_chip *nvec;
> 	struct nvec_msg *msg;
> -	struct resource *res;
> 	void __iomem *base;
> 	char	get_firmware_version[] = { NVEC_CNTL, GET_FIRMWARE_VERSION },
> 		unmute_speakers[] = { NVEC_OEM0, 0x10, 0x59, 0x95 },
> @@ -790,8 +789,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
> 		return -ENODEV;
> 	}
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> 	if (IS_ERR(base))
> 		return PTR_ERR(base);
>
> -- 
> 2.7.4
>
>
