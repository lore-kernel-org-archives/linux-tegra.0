Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F05CC6FD18
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Apr 2023 14:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbjDSOdG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjDSOdF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Apr 2023 10:33:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0169EE1
        for <linux-tegra@vger.kernel.org>; Wed, 19 Apr 2023 07:32:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id he13so22226109wmb.2
        for <linux-tegra@vger.kernel.org>; Wed, 19 Apr 2023 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914760; x=1684506760;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrJF8JCWqT51gG6Yojv1sYCui51lkUDIMOxbxH6Yq0A=;
        b=DfBzMIFXr+XVMZJtu2NlUEBFwS7Y8pVxbXFuYYJG0quP6d0tm5zxBit9Trj3P22f/D
         G97I/6JxkSr2tgMzV7engXd0YkCNEbPWh4muQbniGwDdkr2eKBzRby+e4TC4g3QBEJPr
         9tnIm/8LwI2geZEQ1aRWy8FbOoEam3HrQdEfQkKeOck196AcVAdIXpTemQWJd+DGFaDc
         OTn2JqwrtZQYeGUBPnG2aHuZFVARQ0pMF3cw0q7e1dPssXptwH4GUqahLomUSlA+9mQb
         gfrMzfSvYRSphwvwgi0GumbT5pPmYPWnq6rdNd5WIZj4XU3qpLK3dblOguwV+QFXPi6d
         yJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914760; x=1684506760;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrJF8JCWqT51gG6Yojv1sYCui51lkUDIMOxbxH6Yq0A=;
        b=YluM82h/Tb1Q78Tm+ANWcaodTaRqLhnmMIHM3Ne9ybtzo6zobbIbWQQvSuf32C/+Cc
         /eHlk7fcnAjPP1h9iT8enUJeOH1157uSIeqhLQ3xmUMPmzYwiJmFqnhLa51h6c29gs85
         2eZ2/vmdYz1Wja4cLKuVR5N+hUmK7qwlveEpAn+3Ts+Sj0QVHuSBuUQ0Ft9OF0h1eVwv
         VaopLPFOhNQSmGG1N8qCwYsPZOQtQEu5v4HA81DLro97BRcLBfToHcI0e66q7vqkTzSK
         YPiLicOXFVeEgtN7uVsNVvciiqUJaP+dqdlQ8J0GokUaYipeY+nXTkCe9C7rX0JSOKjz
         3n4g==
X-Gm-Message-State: AAQBX9fGRkyqxQvKAoHVGAEXG5Ia6F/SzaOt2Ms5zqd6LnQPcDqTJn42
        +nVso8FrbrM0k/TkdEjW6ErPiw==
X-Google-Smtp-Source: AKy350ZSF6ge7PhB6Xt7b5Y9QFQj982pW40ql6SqZL+CL3ssovF88jDryQeH1XdRaFzT1cT6WoDfhw==
X-Received: by 2002:a1c:ed19:0:b0:3f0:a0bb:58ef with SMTP id l25-20020a1ced19000000b003f0a0bb58efmr17074663wmh.25.1681914760379;
        Wed, 19 Apr 2023 07:32:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003f1738e64c0sm2432595wmq.20.2023.04.19.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:32:39 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:32:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     dipenp@nvidia.com
Cc:     linux-tegra@vger.kernel.org
Subject: [bug report] hte: Add Tegra HTE test driver
Message-ID: <53e53a09-6051-494b-80a3-a78d2874ae65@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello Dipen Patel,

The patch 9a75a7cd03c9: "hte: Add Tegra HTE test driver" from Apr 22,
2022, leads to the following Smatch static checker warning:

	drivers/hte/hte-tegra194-test.c:157 tegra_hte_test_probe()
	warn: missing error code 'ret'

drivers/hte/hte-tegra194-test.c
    102 static int tegra_hte_test_probe(struct platform_device *pdev)
    103 {
    104         int ret = 0;
    105         int i, cnt;
    106 
    107         dev_set_drvdata(&pdev->dev, &hte);
    108         hte.pdev = &pdev->dev;
    109 
    110         hte.gpio_out = gpiod_get(&pdev->dev, "out", 0);
    111         if (IS_ERR(hte.gpio_out)) {
    112                 dev_err(&pdev->dev, "failed to get gpio out\n");
    113                 ret = -EINVAL;

It might be better to preserve the error code:

	ret = PTR_ERR(hte.gpio_out);

I don't know if gpiod_get() can return -EPROBE_DEFER, but that's
an especially important error code to preserve.

    114                 goto out;
    115         }
    116 
    117         hte.gpio_in = gpiod_get(&pdev->dev, "in", 0);
    118         if (IS_ERR(hte.gpio_in)) {
    119                 dev_err(&pdev->dev, "failed to get gpio in\n");
    120                 ret = -EINVAL;
    121                 goto free_gpio_out;
    122         }
    123 
    124         ret = gpiod_direction_output(hte.gpio_out, 0);
    125         if (ret) {
    126                 dev_err(&pdev->dev, "failed to set output\n");
    127                 ret = -EINVAL;

Preserve the error code here as well?

    128                 goto free_gpio_in;
    129         }
    130 
    131         ret = gpiod_direction_input(hte.gpio_in);
    132         if (ret) {
    133                 dev_err(&pdev->dev, "failed to set input\n");
    134                 ret = -EINVAL;
    135                 goto free_gpio_in;
    136         }
    137 
    138         ret = gpiod_to_irq(hte.gpio_in);
    139         if (ret < 0) {
    140                 dev_err(&pdev->dev, "failed to map GPIO to IRQ: %d\n", ret);
    141                 ret = -ENXIO;
    142                 goto free_gpio_in;
    143         }
    144 
    145         hte.gpio_in_irq = ret;
    146         ret = request_irq(ret, tegra_hte_test_gpio_isr,
    147                           IRQF_TRIGGER_RISING,
    148                           "tegra_hte_gpio_test_isr", &hte);
    149         if (ret) {
    150                 dev_err(&pdev->dev, "failed to acquire IRQ\n");
    151                 ret = -ENXIO;
    152                 goto free_irq;
    153         }
    154 
    155         cnt = of_hte_req_count(hte.pdev);
    156         if (cnt < 0)
--> 157                 goto free_irq;

Needs a "ret = cnt;" on this error path otherwise it returns success.

    158 
    159         dev_info(&pdev->dev, "Total requested lines:%d\n", cnt);
    160 
    161         hte.desc = devm_kzalloc(hte.pdev, sizeof(*hte.desc) * cnt, GFP_KERNEL);
    162         if (!hte.desc) {
    163                 ret = -ENOMEM;
    164                 goto free_irq;
    165         }
    166 
    167         for (i = 0; i < cnt; i++) {
    168                 if (i == 0)
    169                         /*
    170                          * GPIO hte init, line_id and name will be parsed from
    171                          * the device tree node. The edge_flag is implicitly
    172                          * set by request_irq call. Only line_data is needed to be
    173                          * set.
    174                          */
    175                         hte_init_line_attr(&hte.desc[i], 0, 0, NULL,
    176                                            hte.gpio_in);
    177                 else
    178                         /*
    179                          * same comment as above except that IRQ does not need
    180                          * line data.
    181                          */
    182                         hte_init_line_attr(&hte.desc[i], 0, 0, NULL, NULL);
    183 
    184                 ret = hte_ts_get(hte.pdev, &hte.desc[i], i);
    185                 if (ret)
    186                         goto ts_put;

This is a very interesting thing because we're calling ts_put when
ts_get() failed...

    187 
    188                 ret = devm_hte_request_ts_ns(hte.pdev, &hte.desc[i],
    189                                              process_hw_ts, NULL,
    190                                              &hte.desc[i]);
    191                 if (ret) /* no need to ts_put, request API takes care */
    192                         goto free_irq;

The comment says that we don't call ts_put but then if the ts_get
fails on the next iteration through the loop, then we will.

    193         }
    194 
    195         timer_setup(&hte.timer, gpio_timer_cb, 0);
    196         mod_timer(&hte.timer, jiffies + msecs_to_jiffies(5000));
    197 
    198         return 0;
    199 
    200 ts_put:
    201         cnt = i;
    202         for (i = 0; i < cnt; i++)
    203                 hte_ts_put(&hte.desc[i]);
    204 free_irq:
    205         free_irq(hte.gpio_in_irq, &hte);
    206 free_gpio_in:
    207         gpiod_put(hte.gpio_in);
    208 free_gpio_out:
    209         gpiod_put(hte.gpio_out);
    210 out:
    211 
    212         return ret;
    213 }

regards,
dan carpenter
