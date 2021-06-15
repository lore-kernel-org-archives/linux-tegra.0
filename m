Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896BCC48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 10:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6365E61446
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 10:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhFOKFi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 06:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhFOKFi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 06:05:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4D9C061767
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 03:03:32 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c5so17613614wrq.9
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KRA5JEo2f5eHwlGrBe+x1mvEfYhwDU4OUZncstnbx6M=;
        b=abmrGACQlQt5ZE+gApEShYt+RvKsyhEfHJfi5/vT9I3RDbrTqQzmrzTOkQPnsUni7U
         SzTFW7k7Vqv1fM3wfudlLmKmInuXzgUSrB39C8A+sKFdNR5KYvT9Rtik5Oau0y3aTfZy
         Mi+akzTENmyInfIMYQi7J+oITLgpkxVU8Wqbi5ixtXTky6kMVqnOuirimUH2PRPZBctc
         IElKBN1eVyo1Yq94sHzpeibE3VGjXfXlBO3eEU3qFCvAZYROE1bUyC3ccz6XT8cuYNOP
         mkJ464ru+HtEY6R6eU7nFXJyILxUoYN9HVgfWqZxVqSFCpTajJOQyMubzMqQbCv2hA+w
         py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRA5JEo2f5eHwlGrBe+x1mvEfYhwDU4OUZncstnbx6M=;
        b=I66dHzBPzUH3tP88eV9GYhdqJVXxwXPAgPaA1Pn24utGxpWUd2ZvydrBZ6JnFw39V7
         XeAcPSHQS71+j9gSXd7H8mXry9qASeClyUtWlPJhjjMMLuSXF/jVMw5lEuhzLKSFteZj
         yJ1yWQ05Nj7BlkMyuMvGUnNZ6ggl27s+Ur6iVPYR/D2CvPW3EkUCVCXOPRMxWAnC20jZ
         /hvMo1oEPX400bbFHItwFagnasN8438Ml/5xgaVXnP+b5woDXHy0E2yIpTrdmvaSsDjG
         l+FxCw8cshUsD03ko/VIniILEVdcEAEcRMww/YCmb/vQh/B1FL93lgZAjus3R6/0/gDP
         iCBw==
X-Gm-Message-State: AOAM533YUiv18iiL5mKwn2JQ9w3k5xs1dO58HjcsMRGX85SAELqFASZB
        3q2/A6ujPg9q1DfXN1JS61BwfQ==
X-Google-Smtp-Source: ABdhPJxoM9gzPk3IB6/C7ha95cVkrtf3v1G/EmnZeUdJkwy9lR4zpVjozuDW7tuCcTy/nn30hvq6vA==
X-Received: by 2002:a5d:6208:: with SMTP id y8mr16865170wru.119.1623751410645;
        Tue, 15 Jun 2021 03:03:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:613a:6939:5f7f:dceb? ([2a01:e34:ed2f:f020:613a:6939:5f7f:dceb])
        by smtp.googlemail.com with ESMTPSA id j131sm1785395wma.40.2021.06.15.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 03:03:30 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] thermal/drivers/tegra: Add driver for Tegra30
 thermal sensor
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <20210529170955.32574-1-digetx@gmail.com>
 <20210529170955.32574-5-digetx@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6f2b6290-095a-bd39-c160-1616a0ff89b1@linaro.org>
Date:   Tue, 15 Jun 2021 12:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529170955.32574-5-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


[Cc Viresh]

On 29/05/2021 19:09, Dmitry Osipenko wrote:
> All NVIDIA Tegra30 SoCs have a two-channel on-chip sensor unit which
> monitors temperature and voltage of the SoC. Sensors control CPU frequency
> throttling, which is activated by hardware once preprogrammed temperature
> level is breached, they also send signal to Power Management controller to
> perform emergency shutdown on a critical overheat of the SoC die. Add
> driver for the Tegra30 TSENSOR module, exposing it as a thermal sensor
> and a cooling device.

IMO it does not make sense to expose the hardware throttling mechanism
as a cooling device because it is not usable anywhere from the thermal
framework.

Moreover, that will collide with the thermal / cpufreq framework
mitigation (hardware sets the frequency but the software thinks the freq
is different), right ?

The hardware limiter should let know the cpufreq framework about the
frequency change.

	https://lkml.org/lkml/2021/6/8/1792

May be post the sensor without the hw limiter for now and address that
in a separate series ?

  -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
