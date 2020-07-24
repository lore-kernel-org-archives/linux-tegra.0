Return-Path: <SRS0=jT6+=BD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F489C433E1
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0660320748
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jul 2020 08:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRZaX5df"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGXIOd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jul 2020 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgGXIOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jul 2020 04:14:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9A8C0619D3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 01:14:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j20so4656032pfe.5
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+3Btf3RUan5JaJp4OaRNcP9LO0uESKbVyLB3jgnOn5U=;
        b=WRZaX5dfjm3ToASG0+NF+KvXNvDS2zXlg8ks99AuIWPF0bYLQy7Pv98WM6nDZL2ucR
         KiIy+PCa0YCN9uW2j9tJyzzhltzFiCwpbIXItqmR6rZZZAPTXew9RllBF/xv2oq7uOiO
         gvbyYNlbGBpbepVennIYVgxCppeKljtzqtFmVZDiAaEgaCuRCJR+qK13yS2pjgSCJS53
         948AZGtYBAWZ7oEGxnkwJ/N2vaVN0GQnPGyXLKfo7qRdBfY0UMNmaUhA/3//a/8xFsn6
         dgRdtQUsHrW4lScFuNLWdhUdqLFT6EO9yFH5VdJfAOxmpdxxX8/6glBYHpq1MtVqcOlA
         9LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+3Btf3RUan5JaJp4OaRNcP9LO0uESKbVyLB3jgnOn5U=;
        b=cifDlkciIo74FsbjH9u30+0BWM43rdTNUtagGCsgBc+Y67FM4zJ430zDNJucQuNifP
         jcCwlhX6FOWHjfKs+/z4Rq6Ug6h0SQ+ThfBSaVIFnyXxkTPcHoAh8R4s0HHAEtIWSuFO
         KBpy5i9jJuWWGRcTpY+pynmihgQAghUSienodvhDroaiI0eO+YmB/4GB55tHq0FiAZ9N
         gLtsJ6VJjckQf/1Yqb7s0XcfozExo474QgejRypx5zAK6HEmtRYP1Z8RwT5CApuRumsZ
         WUNtAOzX+O2010iu1ICf7v9fDMaGYF0klcB4VVl2eHsXZXn6FwORhK8VVBrVT5y3NHLL
         K69w==
X-Gm-Message-State: AOAM5304WPFkM2Mi4CMKKzjJWlj07SBXfzQR8X9qNMDNvcqxMjKNzDUh
        YzQwFR29o0A+Q4H3ciW3yUjm2T9lGGU=
X-Google-Smtp-Source: ABdhPJyYEf7F4n2HKBk9oBatX7j13h0QPU0g1qBJufcj1zx68AQELo1ToVZESgNRlhWxcXOwtfvRGQ==
X-Received: by 2002:a63:7802:: with SMTP id t2mr7717982pgc.421.1595578472908;
        Fri, 24 Jul 2020 01:14:32 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id q14sm5439829pgk.86.2020.07.24.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 01:14:32 -0700 (PDT)
Subject: Re: [PATCH v3] staging: nvec: change usage of slave to secondary
To:     marvin24@gmx.de, gregkh@linuxfoundation.org, p.zabel@pengutronix.de
Cc:     ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
 <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
From:   Rohit Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <ac0f2bb4-7fa1-26a8-a43b-2db427188d4e@gmail.com>
Date:   Fri, 24 Jul 2020 13:44:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24/07/20 10:06 am, Rohit K Bharadwaj wrote:
> changed usage of slave (deprecated) to secondary
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> ---
> v3: change patch subject, add version history
> v2: add changelog text in body of mail
> v1: fix style issues by changing usage of slave to secondary
> 
>  drivers/staging/nvec/nvec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 360ec0407740..5d7b66719a39 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> -static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> +static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
>  {
>  	u32 val;
>  
> @@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
> +static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
>  {
>  	disable_irq(nvec->irq);
>  	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> @@ -784,7 +784,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, nvec);
>  	nvec->dev = dev;
>  
> -	if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) {
> +	if (of_property_read_u32(dev->of_node, "secondary-addr", &nvec->i2c_addr)) {
>  		dev_err(dev, "no i2c address specified");
>  		return -ENODEV;
>  	}
> @@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	}
>  	disable_irq(nvec->irq);
>  
> -	tegra_init_i2c_slave(nvec);
> +	tegra_init_i2c_secondary(nvec);
>  
>  	/* enable event reporting */
>  	nvec_toggle_global_events(nvec, true);
> @@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
>  	if (!err)
>  		nvec_msg_free(nvec, msg);
>  
> -	nvec_disable_i2c_slave(nvec);
> +	nvec_disable_i2c_secondary(nvec);
>  
>  	return 0;
>  }
> @@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
>  	struct nvec_chip *nvec = dev_get_drvdata(dev);
>  
>  	dev_dbg(nvec->dev, "resuming\n");
> -	tegra_init_i2c_slave(nvec);
> +	tegra_init_i2c_secondary(nvec);
>  	nvec_toggle_global_events(nvec, true);
>  
>  	return 0;
> 
Dear All, this message was not delivered to marvin24@gmx.de, I'm getting that The response from the remote server was:
554 gmx.net (mxgmx016) Nemesis ESMTP Service not available No SMTP service Reject due to policy restrictions, 

I'm really sorry if I'm wasting your time by these trivial problems, thanks a lot for your time, could you please let me know whether I have to resend the patch again or is the patch fine currently and can be accepted into the linux kernel tree?
