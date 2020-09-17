Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD9AC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 15:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85FF92220D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 15:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3yPYEzc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgIQPCk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 11:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbgIQPCc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 11:02:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B405AC06174A;
        Thu, 17 Sep 2020 08:02:29 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id q8so2535206lfb.6;
        Thu, 17 Sep 2020 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fNGJcc/2UfIVs8mbBxVK/VFNj4D7nz0HCrf2fMGXSIw=;
        b=c3yPYEzcgE6WEkQG/+eUuv7eyZ/zXffo7yYj9Q3BHrRpxwV016wGSF2beNFXZxQKm9
         W9bm8ywz3D898Gb/qSQcfQJsGymz6/8L/63GPOphIF8LfGxnTSA8+/OsIfv2JnZE6KtB
         xABo8aFMyjY+SLsU/+kBPZtg6IwE/sh7T/VvvgmvKuJ5VUHfaX2GGqhRKFyvKn63f5wc
         YM6G7RhjEqEWFhG43M/31EZ3rDgGiMvXy6tQ+UQpVW8d5E8y4HN02D4b0tWP+xNiFBMg
         +c7alrqp7eusvWL2nSeH/BVy+lUbrYRH+aFIhvwV4VJisf2WLwoVdFBq0SizOaNzYT80
         gOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fNGJcc/2UfIVs8mbBxVK/VFNj4D7nz0HCrf2fMGXSIw=;
        b=n3fbnga0a1W9IOPSegFoKglfu/07Dqog1UvrtJbk8FnV/35gOgR7pGqK0qfmbz77E3
         TeUM84Ou5OEYZ65pU0IwgRZRbD01eKhue9bsGrJ3nxr4kklA064pDlUf/d0PcvwO7s+a
         BS2GkKcRoWiJTy+4X8Dn1bTp44ywm3lYDwUQSS97UC0k1iWUGFILA8T6rAyxYQGbjurv
         WRGeL5WJV0E9aUtukyXlAN35WqG9PAeoVA/pZBoVTZoOo86eYXFe5tEZ5nljsTCO/hrj
         a0gbYO9yBDz4KX2JXF6cFKbQ3hNHiF6p7axd38VZRv4Zcys4su0Fz4kdBFNb0TyeEO57
         TldQ==
X-Gm-Message-State: AOAM532uvX8ziDkP44JBVzIecEKpf1smTnzyFhMjvs6BHwemb8CKTp4X
        d9FbPR4Ksnnhtsj+td5lZtZ3iWZjx7M=
X-Google-Smtp-Source: ABdhPJy9SHzJXK5t+K+Qr57CIq/n1rJX3Ku4eK9onEpBoXTxJIYvVAMfq0uBkC7ghUuGL1cjHtMLuA==
X-Received: by 2002:a19:50d:: with SMTP id 13mr8435113lff.500.1600354948063;
        Thu, 17 Sep 2020 08:02:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id s14sm6177917ljh.98.2020.09.17.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:02:27 -0700 (PDT)
Subject: Re: [PATCH v7 14/34] i2c: tegra: Clean up probe function
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-15-digetx@gmail.com> <20200917123755.GO3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7d2803c3-b25e-da62-5e55-fca8e550fcda@gmail.com>
Date:   Thu, 17 Sep 2020 18:02:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917123755.GO3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.09.2020 15:37, Thierry Reding пишет:
...
>> +	/* interrupt will be enabled during of transfer time */
>> +	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
                                           ^^^^^^^^^^^^

>> +	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
>> +			       IRQF_NO_SUSPEND, dev_name(&pdev->dev),
>> +			       i2c_dev);
>> +	if (ret)
>> +		return ret;
> 
> Is it safe to install the interrupt handler at this point? What if,
> perhaps because some bootloader didn't properly quiesce the I2C
> controller, an interrupt triggers immediately after this?

This is why we're using the IRQ_NOAUTOEN flag above :)
