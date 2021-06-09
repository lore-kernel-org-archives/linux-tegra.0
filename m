Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D455AC48BCD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 12:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B27A56124C
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 12:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhFIMK3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:10:29 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:41712 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhFIMK2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 08:10:28 -0400
Received: by mail-lf1-f53.google.com with SMTP id j20so8330541lfe.8;
        Wed, 09 Jun 2021 05:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S8n0jQRFElQLEp8hvxDm0SO8rf3gl/kuZnGhnAjKgQU=;
        b=KK2chBW66zdf8R49oD5I+CR26o91hvjM99NwaPRpvez8WF9WaEWG8q/LogToiilZlK
         QYSKe90AXXs6oa43vYY5g2V49ZxVT5l3XGZPtIf0PJkwfOpyZjYvcEPygjyAUt6BX6sd
         unXSkrb5QaJRkDo+nT00edrhAqNNzX5ZCNY8vRFbjat2lISZInmh+r+WdYU1KDnnM9ag
         SuKSslVZrXWykIeqt/CxQf0GjFszT1DdLu1oMmc8mBaDPD4uJ3IlL+++Yhan8ycYDDpr
         xqMzYDEBBfColLC/tRBn8HptdnoIPiaroBrsilIGm6qL4FjDHNBQV2sYdjU8nqI1UMnI
         By6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S8n0jQRFElQLEp8hvxDm0SO8rf3gl/kuZnGhnAjKgQU=;
        b=QGzQlPac8LbfGjDbz3a0R5cbXKOt6wqdYklLBMsdS2gXWcE3zKtCDeVAbU71c5lD3K
         /4/0R0hTx60NPx4hW4vPMtLlPbamOY0Z7EhQxnJaYlEFcteCK1BN1yHwPErX7/chKZMz
         f6FAPk30WEKkbo/xiTmEiRtQIIW73CrqGO4xWHaKRWHvY5pUD89s+pS6s15jNgat2dPZ
         JiihzL2fZXypPFgfa6nDZyx6hovIh3BHULa67XGb58d5Nyb+ezttVMoEBCAMyewH1cJz
         RihNF7HXM39AtsgjCbB0eDjeQYGLJanFeUJbpcLzHBt3GlcAuq/tC0t9nl+g6VAwHYee
         2G+w==
X-Gm-Message-State: AOAM530ycjicxUJZlLzpeW4qeX6hdBHSJH9qNMIe7FDRy83UArBJMqdv
        6WVZK/ZG8rp56XrkJgBus9/yT+GfLZE=
X-Google-Smtp-Source: ABdhPJxf6x+u2R513tmhJJ1RQsO2yFImXGuTHk2KF2irZ2hgTRjlSBSK4VWXKPUKlLhEUj3NMbbZ3g==
X-Received: by 2002:a05:6512:507:: with SMTP id o7mr3112088lfb.453.1623240452794;
        Wed, 09 Jun 2021 05:07:32 -0700 (PDT)
Received: from [192.168.2.145] (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.googlemail.com with ESMTPSA id l12sm375174lfk.10.2021.06.09.05.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:07:32 -0700 (PDT)
Subject: Re: [PATCH v1] usb: chipidea: tegra: Delay PHY suspending
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Peter Chen <peter.chen@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210609120404.3991-1-digetx@gmail.com>
Message-ID: <d476a149-1b97-9762-fbc7-5ba41f72523b@gmail.com>
Date:   Wed, 9 Jun 2021 15:07:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609120404.3991-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.06.2021 15:04, Dmitry Osipenko пишет:
> The ChipIdea driver enters into suspend immediately after seeing a
> VBUS disconnection. Some devices need an extra delay after losing
> VBUS, otherwise VBUS may be floating, preventing the PHY's suspending
> by the VBUS detection sensors. This problem was found on Tegra30 Asus
> Transformer TF700T tablet device, where the USB PHY wakes up immediately
> from suspend because VBUS sensor continues to detect VBUS as active after
> disconnection. A minimum delay of 20ms is needed in order to fix this
> issue, hence add 25ms delay before suspending the PHY.
> 
> Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 60361141ac04..d1359b76a0e8 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -255,6 +256,13 @@ static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
>  
>  static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
>  {
> +	/*
> +	 * Give hardware time to settle down after VBUS disconnection,
> +	 * otherwise PHY may wake up from suspend immediately.
> +	 */
> +	if (enable)
> +		msleep(25);
> +
>  	/*
>  	 * Touching any register which belongs to AHB clock domain will
>  	 * hang CPU if USB controller is put into low power mode because
> 

I missed that Peter's email address changed. Making this reply to the
new address for visibility.
