Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED4AC47420
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85AD820759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6vRBFSX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730882AbgI3PWr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgI3PWk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:22:40 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C62C061755;
        Wed, 30 Sep 2020 08:22:40 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id q8so2637900lfb.6;
        Wed, 30 Sep 2020 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xiKtvmX9hgv/pe1MEDHvp0vtG2v3tm61VnhmZJEUzgA=;
        b=O6vRBFSX3jndnk1it+JCHmJDlt2UGbZJFM87KbD//vjyUO1Gqd0QsDWolxBbJHJVWv
         dZxGx1d9loJYYkjmYRnGpN0pgd16yXmWJMitqoOwFHEzyrJhYla9YZamUHwWEsq0kMCo
         siv4g9jHw5HwSkYLM9WkQtI3hSFax0w4eQikWB1vEsEy1ctY6uUzfKa62jB7bSQw29oK
         Za3gTE1EgEUQGY5vFqL9fL1fZT87rrVdqXIn4xiWzylKISR+o7Kh3qND/bISNxZsDUd0
         bpBzEqub5VTzDLy9xKdkSHU/6iIMjSQyMtrg0QCcC9u90kgcwAYgcNhZeE7jygyXK/kn
         5v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xiKtvmX9hgv/pe1MEDHvp0vtG2v3tm61VnhmZJEUzgA=;
        b=ragWH/rYeV8Rq36sI3cGTWc/AFB6tCkjUJkk237WZDQ2JoW0sXRaOZcLfe5fyUHOu9
         9zld/EmjcfO+JY0s1nAH3XX5fx7hOLKuOpkdXeXaYTeGdkdnr2sfK0HYpSUGD4NYzxv6
         JY2Mg9acWA3asQfF1nSwBC+ih2zLa1jpaHMz/vkew07T8sKb0MvoQpyP3PHTn03apTGb
         QmrjbYFeizb4YeFX0iWKd1kVNXLejn4FhjMDI1G5HN+y+qJuWVNmmNBuy/WXwaPaqS87
         PdvuzNGZ/4RHC2z5NGtyDX2H/cpU1AAuTfcLfpJXTiGHS+HzAV+XtcNS15+uH3NsSRtU
         OSpg==
X-Gm-Message-State: AOAM531Gs+n+/Gn5hkcpK5FgpSZRRWDSx+Pyr7uBMAiZoI/f2Dx6X9nb
        4r8DBzTUyEIuZlA3M5aRXdAfrLWg3Fk=
X-Google-Smtp-Source: ABdhPJxnHzVE51GwnQB935ZA5ZgN3Z3BCeImMKqCMFWf3vkc7rfyplw5W15mZV5ZQcbbs8opUY+h9w==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr972224lfl.496.1601479358712;
        Wed, 30 Sep 2020 08:22:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 80sm226170lff.61.2020.09.30.08.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 08:22:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <f9712d4c-8497-ca84-0d8a-d33eb6abc513@gmail.com>
 <CAJKOXPfbCRDY7TUZ4HXphrd6boWYEKb_DMOxth3ucPTB2UCUtw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <257958e0-8359-4296-9653-ba821b39d813@gmail.com>
Date:   Wed, 30 Sep 2020 18:22:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPfbCRDY7TUZ4HXphrd6boWYEKb_DMOxth3ucPTB2UCUtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 17:45, Krzysztof Kozlowski пишет:
> On Wed, 30 Sep 2020 at 16:41, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> ...
>>> +struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
>>> +{
>>> +     struct platform_device *pdev;
>>> +     struct device_node *np;
>>> +     struct tegra_mc *mc;
>>> +     int err;
>>> +
>>> +     np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
>>> +     if (!np)
>>> +             return ERR_PTR(-ENOENT);
>>> +
>>> +     pdev = of_find_device_by_node(np);
>>> +     of_node_put(np);
>>> +     if (!pdev)
>>> +             return ERR_PTR(-ENODEV);
>>> +
>>> +     mc = platform_get_drvdata(pdev);
>>> +     if (!mc) {
>>> +             put_device(mc->dev);
>>
>> This should be put_device(&pdev->dev). Please always be careful while
>> copying someones else code :)
> 
> Good catch. I guess devm_add_action_or_reset() would also work... or
> running Smatch on new code. Smatch should point it out.

The devm_add_action_or_reset() shouldn't help much in this particular
case because it's too early for the devm_add_action here.

Having an explicit put_device() in all error code paths also helps with
improving readability of the code a tad, IMO.

Smatch indeed should catch this bug, but Smatch usually isn't a part of
the developers workflow. More often Smatch is a part of maintainers
workflow, hence such problems usually are getting caught before patches
are applied.
