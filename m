Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EED9C433ED
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 12:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73431610E7
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 12:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbhDIMz5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Apr 2021 08:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbhDIMz5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Apr 2021 08:55:57 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF13BC061760;
        Fri,  9 Apr 2021 05:55:43 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a1so6363777ljp.2;
        Fri, 09 Apr 2021 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z3wFYyzO04/nplltFnv9EO/HsXFohiYyEY626pT7Qy4=;
        b=N5IB0mR1anzwmgyEkin8MFYd382dilaOTkdDf6VE/2rpDe6d0ZysoE9kB8jS4+q0xd
         LF2D8V+5o6GHWlEvEP/CdfPGjzWqz7JAU/GV2dtNxJeNoMhWLurwp6wLT8HWLn7Aawyp
         B03xTraZmRE6YUiaIBjSetc1e/G48JEE07YH/V3iT6U9Sd7oYB0MfHt8bbM9soMdZrSf
         0pvkVvXu528gM2n0nb6jzgKMztZKLPrZN822mHmMNep4/dVCD6ZcEW2X/ibZir8NuBwW
         vXCByRcEy7pni3IOeVErQSny6Co1QrrMJ7bVIgerGokMhMkaN6FZiJ9WPbB5PZRuk6ie
         dmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z3wFYyzO04/nplltFnv9EO/HsXFohiYyEY626pT7Qy4=;
        b=F9leUh7xnrC8Q5GmO3VYFI9CdyQFszqNcTN7jg1SmGGp/6/eM3kFG+eKRble17Ynb5
         DjfMqaD9ZUfoqEGix6REcljIgAEVd6bLBzFiOwmvN3blH/k6tDJXfNVoUGZ+xzJcMCyZ
         VDMJ8SY5mamNWsNvx66nVGrWelaUn5KhQaSEGlvq9gpesI+m78EIH7mWCvdNsajE7Z9x
         DoLHK0a4nU/CFJbq3hjRBOq46s47PrBOzAIGF6GrRVxp6nL4X9JvUSPmA7bmHD1JXQiG
         chFYmT8LnEuwZCl3fcu60KYhxtKzLOzpVMlROdm8edbkqeI75AyIC1Qspwh6iKnWKgpT
         3Vww==
X-Gm-Message-State: AOAM533WylLk53LiGj6k4P8OoAyCZwfd28KkY7iI9gNnC2VgT4Stjpxg
        Q1DbqZIH57946KZxSlonc5cmU5a9vds=
X-Google-Smtp-Source: ABdhPJz185o6U1Q1rZo8rGSGiz0mC//A/ohSLg+d4znoLqHTwVSMCs3aWjc1dPVKJ2xmOIGZcaO7gg==
X-Received: by 2002:a2e:5417:: with SMTP id i23mr6189910ljb.112.1617972941990;
        Fri, 09 Apr 2021 05:55:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id 13sm258278lfz.40.2021.04.09.05.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 05:55:41 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <YG75urcXAb90Jj12@orome.fritz.box>
 <c4b42a3d-d260-9a69-4ee7-8ad586741f8c@gmail.com>
Message-ID: <7c1ebbf2-5d27-fa2a-3cae-bedab4c8e30a@gmail.com>
Date:   Fri, 9 Apr 2021 15:55:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c4b42a3d-d260-9a69-4ee7-8ad586741f8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.04.2021 17:07, Dmitry Osipenko пишет:
>> Whatever happened to the idea of creating identity mappings based on the
>> obscure tegra_fb_mem (or whatever it was called) command-line option? Is
>> that command-line not universally passed to the kernel from bootloaders
>> that initialize display?
> This is still a good idea! The command-line isn't universally passed
> just because it's up to a user to override the cmdline and then we get a
> hang (a very slow boot in reality) on T30 since display client takes out
> the whole memory bus with the constant SMMU faults. For example I don't
> have that cmdline option in my current setups.
> 

Thinking a bit more about the identity.. have you consulted with the
memory h/w people about whether it's always safe to enable ASID in a
middle of DMA request?
