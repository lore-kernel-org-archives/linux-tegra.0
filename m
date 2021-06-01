Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DC3C47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 18:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A5B76136E
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 18:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhFAS4o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFAS4o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:56:44 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567D0C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 11:55:01 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e11so20625268ljn.13
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=90ZjmpEXNyf6E6e23qG/WrHrDClbChlpcWXXsKAb270=;
        b=hJ0YuaSMm1c6pVhRdHOADwKQnqbTevD6g+1117/zAzfX0iXL+Pn2gKTSQTyPBo3Efg
         Cbc2gyU1Si8NLDwkQwm7wtI6C3+Fb8FWmS6UX+WZ4WlwH5gwZ32R6wMo54RqhHvVfsFc
         A5PE7mPyDPqUSVDL8Mq/rxeD+OuQ/9TsNPm0k3OW5E8vw2belBLIJ49s/rTqyqGvgShH
         amVR5r1/UxVbPAWasqdH19XqT0Zi1lTPlAyd6Nxkz8yTJaItN7zdVXC2s+v1o0Pj9xpt
         QmB4msvPkvJblzQ33gOpY7iLuSDjo8fgimoiWWaW4Or1TMqYnVgzmgtlb/pLbyLQKD9/
         1Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=90ZjmpEXNyf6E6e23qG/WrHrDClbChlpcWXXsKAb270=;
        b=ASg5k7lQvfRCesiLhscOCvG3u7k/bx1yol5xdFi+8TUYk/Bv1yANfPdTphgXnDOZ0h
         NvUfNoj1alzFUXCfCWZCy2g1ND0sHfEpSgv9uhVxsnDyufp4hWsJKiRiATdmFnBAqZR4
         yFfHRdKo/ykc98kDs9HrQc6v/ithKr0FcYdMejNrcjJ1NGdpYybH9YwzhVlrYlBDa1cJ
         5qKEDPzjykO/1BjHcJvbTnc4G336EFwbvR+FFlsCIfaQC5dkiNN6WDs0SJQF6kdu2QQO
         mm2HsettLyLfxC7261lNIi2izJlCrW34ovJ576bkxlUDbbesSOJWI8JF/gc/ElbES3Xq
         RvsA==
X-Gm-Message-State: AOAM5320QTZC2K5m5BidFPobJgz8e39NHsZl/Fed+sLuXZgU2HKvG7cg
        rwJBUy13b22cL9nrjYT+3iUwMZgyL+Q=
X-Google-Smtp-Source: ABdhPJwGOq0qbPXOMQHa7gwaglUPXSROAsHk1XSbGqaqeLrDnFALTraWSCZ3KiWBagdVY1GOyKmZpA==
X-Received: by 2002:a05:651c:148:: with SMTP id c8mr11814813ljd.410.1622573699748;
        Tue, 01 Jun 2021 11:54:59 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id f10sm1198639ljp.8.2021.06.01.11.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 11:54:59 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] memory: tegra: Parameterize interrupt handler
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-8-thierry.reding@gmail.com>
 <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
Message-ID: <72d26cbc-e252-8629-e47e-c6b2d13d28f3@gmail.com>
Date:   Tue, 1 Jun 2021 21:54:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9ce2210f-538d-607a-10e4-802ab849deb5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 21:53, Dmitry Osipenko пишет:
> 01.06.2021 20:59, Thierry Reding пишет:
>> --- a/drivers/memory/tegra/mc.h
>> +++ b/drivers/memory/tegra/mc.h
>> @@ -135,9 +135,13 @@ extern const struct tegra_mc_soc tegra210_mc_soc;
>>      defined(CONFIG_ARCH_TEGRA_132_SOC) || \
>>      defined(CONFIG_ARCH_TEGRA_210_SOC)
>>  int tegra30_mc_probe(struct tegra_mc *mc);
>> +irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
> 
> tegra30_mc_handle_irq() doesn't need to be made global, it's defined and
> used only within mc.h.
> 

* I meant mc.c.
