Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B49FC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 15:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC2061154
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Oct 2021 15:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhJSPdr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Oct 2021 11:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhJSPdq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Oct 2021 11:33:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62854C061749
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 08:31:33 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n7-20020a05600c4f8700b00323023159e1so3340444wmq.2
        for <linux-tegra@vger.kernel.org>; Tue, 19 Oct 2021 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hWPE/Y/ECpv7Nj8NIi2n9F0tYkWU75xKYRtFUZ6yu9s=;
        b=cXlmp7HR3xEDoFJWVos0V9Jwf9q4NPIIzfiDylFcxk4jSANGoVNmWY8OhtlMtn1ZRf
         jmcULs5B+rgkm9KmyKpFc+KQh+uTCu/G6xym7RP+EyjChNKrOYOTo2pQs8bpPryXSA49
         PhkQe3WiON7NbBNPvpiWYUGHQr2H8TBe1OEBPXHsjLgQv+VW4LEwVBHpPqm97NT3RMKT
         rXw1IHaPrxdibHGpIzN24IZxVYQZDTmKeNI5Uercj1qtVscydAgF+uz5RFiu0eLB8CJr
         m7FsjmdImme4i7w0zj1VePOBGg9DogBOQWQSkx4XuNcJ0MrJC0wgR4AgxbUQfTdPe27i
         GZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hWPE/Y/ECpv7Nj8NIi2n9F0tYkWU75xKYRtFUZ6yu9s=;
        b=e3GyNXU1Ql1obuTdxao6z1mmfCtRg4TkgaDoJKxVWIf7O/pyVlpTDo39egTH6XO5Bc
         yYUkKNm2vWB+S2XtF/tU6alLsYAz1rkMd0IeInQOwCCWgP31ZSuVC2eybOQYns2gF93w
         zBHmlzZDrINsGKF16+iIFiov1HxpzKb5ZHNiXkeY1EQF8lJNjI7R8jXMwyIACjC2lw+8
         kyWJPYC1gnIVxkK+RiCkSDwuKmDiSqFP3y/arTEMy65hJgGgyFgzA9n9yTZX2gGClqzC
         N9WguxWyyhFlNdCQT8kTyDSDFN+6sus9JiyjrdplwGPFgV6gXLkVHfEyGwV5m0zf38nH
         42LQ==
X-Gm-Message-State: AOAM531Y9ifGJnMtzpwfsP5oybgriOnk40U6btzD+DkuRFF5xNR4AEEC
        K57RLBMvK9C/GgIbVhSM86v5O9bP7mVxAw==
X-Google-Smtp-Source: ABdhPJwE++nuRUOafKF1FDx4c8fEJkumkcgktNXraYcUxFliyvGucR0udxGE/SIQDOsvk3Ceiioy2Q==
X-Received: by 2002:a7b:cf03:: with SMTP id l3mr6819075wmg.25.1634657491936;
        Tue, 19 Oct 2021 08:31:31 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id n9sm2650947wmq.6.2021.10.19.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:31:31 -0700 (PDT)
Date:   Tue, 19 Oct 2021 16:31:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 4/6] mfd: max77620: Use power off call chain API
Message-ID: <YW7k0SW73kcvyo2W@google.com>
References: <20211007060253.17049-1-digetx@gmail.com>
 <20211007060253.17049-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211007060253.17049-5-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021, Dmitry Osipenko wrote:

> Use new power off call chain API which allows multiple power off handlers
> to coexist. Nexus 7 Android tablet can be powered off using MAX77663 PMIC
> and using a special bootloader command. At first the bootloader option
> should be tried, it will have a higher priority than the PMIC.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/max77620.c       | 22 +++++++++++++++-------
>  include/linux/mfd/max77620.h |  2 ++
>  2 files changed, 17 insertions(+), 7 deletions(-)

I don't have a problem with the approach in general.

I guess it's up to the relevant maintainers to decide.

> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index fec2096474ad..ad40eed1f0c6 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -31,11 +31,10 @@
>  #include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> -static struct max77620_chip *max77620_scratch;
> -
>  static const struct resource gpio_resources[] = {
>  	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
>  };
> @@ -483,13 +482,17 @@ static int max77620_read_es_version(struct max77620_chip *chip)
>  	return ret;
>  }
>  
> -static void max77620_pm_power_off(void)
> +static int max77620_pm_power_off(struct notifier_block *nb,
> +				 unsigned long reboot_mode, void *data)
>  {
> -	struct max77620_chip *chip = max77620_scratch;
> +	struct max77620_chip *chip = container_of(nb, struct max77620_chip,
> +						  pm_off_nb);
>  
>  	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
>  			   MAX77620_ONOFFCNFG1_SFT_RST,
>  			   MAX77620_ONOFFCNFG1_SFT_RST);
> +
> +	return NOTIFY_DONE;
>  }
>  
>  static int max77620_probe(struct i2c_client *client,
> @@ -566,9 +569,14 @@ static int max77620_probe(struct i2c_client *client,
>  	}
>  
>  	pm_off = of_device_is_system_power_controller(client->dev.of_node);
> -	if (pm_off && !pm_power_off) {
> -		max77620_scratch = chip;
> -		pm_power_off = max77620_pm_power_off;
> +	if (pm_off) {
> +		chip->pm_off_nb.notifier_call = max77620_pm_power_off;
> +		chip->pm_off_nb.priority = 128;
> +
> +		ret = devm_register_poweroff_handler(chip->dev, &chip->pm_off_nb);
> +		if (ret < 0)
> +			dev_err(chip->dev,
> +				"Failed to register poweroff handler: %d\n", ret);
>  	}
>  
>  	return 0;
> diff --git a/include/linux/mfd/max77620.h b/include/linux/mfd/max77620.h
> index f552ef5b1100..99de4f8c9cbf 100644
> --- a/include/linux/mfd/max77620.h
> +++ b/include/linux/mfd/max77620.h
> @@ -8,6 +8,7 @@
>  #ifndef _MFD_MAX77620_H_
>  #define _MFD_MAX77620_H_
>  
> +#include <linux/notifier.h>
>  #include <linux/types.h>
>  
>  /* GLOBAL, PMIC, GPIO, FPS, ONOFFC, CID Registers */
> @@ -327,6 +328,7 @@ enum max77620_chip_id {
>  struct max77620_chip {
>  	struct device *dev;
>  	struct regmap *rmap;
> +	struct notifier_block pm_off_nb;
>  
>  	int chip_irq;
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
