Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C54C433DB
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 21:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE63E64F6C
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Feb 2021 21:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhBCVnL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhBCVnI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Feb 2021 16:43:08 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9D3C061573;
        Wed,  3 Feb 2021 13:42:28 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id y14so829345ljn.8;
        Wed, 03 Feb 2021 13:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kGfWwvJGFe5MnbxnWxw8m85yVGSi7i3eo7HdmO414+I=;
        b=Jt3eshR6Cb65RBKKS7bJSkJwBKNbwaWYZF1yG6Unr1PpsgtzzIDhAOryZkRSpwlIas
         N46UmYuQOQmqKeoPISXsdrMfTPyEWVkG+J1BPCIN98mg8dy688bOCCzoJoysTzCizx78
         /O6GW5L5LNbCviwy3iJNCfMijC1iN58ouqMnlFtdK2IKBFk3QY6oOPvl+ZokSCoDu0Ta
         fY3QWrAwtTMdI/UzjgoLKQKhvpSSo5v9oPjILTGTshJMcWauQ01ivqgSLyIfqo+tkq8Y
         HFH4SxhaUjKINuYKX7MuSloUQxUB8uTUkelfNKFSNMbdn+ClxpW3Tz2eqiSsK0CrmIZO
         uOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kGfWwvJGFe5MnbxnWxw8m85yVGSi7i3eo7HdmO414+I=;
        b=FBAEGJfc8k7WyZQk2i88jS84YletZDG0yyd/+zaK/bHJ481ATQprQE30HnHmnXWc06
         0VzRePcSPwEtazVACCm4EiLp2KlfqPhoqqIyFHV7aWGNycc4gKSJgB27IhhUIkB5JYhg
         S7oGe3LIT5hYD2wff2pOvvlXXvIrKCqIZtoKKw6E7Y15gAtoiRsfmmyIFnNsCX2qnZrx
         JQqhsV4HM5xtp/+Zgi9EMt9WCQdiW05UeNcVfAINfEw/StTvprwiuD0tLkxEod2Fp7Kg
         QIDFey8gXoxnZIr1aYEhz1Alp/xNrsvhzkMu2trAkANPMSg4wErZnrEWpFRG9LIfv8ay
         zYBg==
X-Gm-Message-State: AOAM533eqeOJnKcis9Tnj8dona8leMQQ4DVwWoFL28oGX9xY+V3k4DfV
        Ua7Yi8ldHC1yiOiIw2mNo7UTDSZulls=
X-Google-Smtp-Source: ABdhPJwM9zMCbOUxbaZ2qjIu4vzLHjQlv3PhkGbm1yCJZzlYIfR2HUYhnjIfNGnWeZEdg8F7YgY8Iw==
X-Received: by 2002:a2e:b17c:: with SMTP id a28mr2794523ljm.189.1612388546509;
        Wed, 03 Feb 2021 13:42:26 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id a16sm382539lji.52.2021.02.03.13.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 13:42:25 -0800 (PST)
Subject: Re: [PATCH v1 0/2] ASoC: tegra: Add RT5631 machine driver
To:     Jon Hunter <jonathanh@nvidia.com>, Ion Agorria <AG0RRIA@yahoo.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210131184101.651486-1-AG0RRIA.ref@yahoo.com>
 <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9874e27-8d5c-c784-ee16-5e7b2607b058@gmail.com>
Date:   Thu, 4 Feb 2021 00:42:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <82a3375e-6105-875c-3332-33fcf2c0f785@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.02.2021 16:23, Jon Hunter пишет:
> 
> On 31/01/2021 18:40, Ion Agorria wrote:
>> From: Ion Agorria <ion@agorria.com>
>>
>> Adds support for Tegra SoC devices with RT5631 sound codec.
>> Playback to speakers, headphones and internal mic recording works.
>>
>> This driver is used for ASUS Transformer TF201, TF700T and others
>> Tegra based devices containing RT5631.
>>
>> Svyatoslav Ryhel (2):
>>   ASoC: dt-bindings: tegra: Add binding for RT5631
>>   ASoC: tegra: Add RT5631 machine driver
>>
>>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 +++++++++
>>  sound/soc/tegra/Kconfig                       |   8 +
>>  sound/soc/tegra/Makefile                      |   2 +
>>  sound/soc/tegra/tegra_rt5631.c                | 261 ++++++++++++++++++
>>  4 files changed, 405 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
>>  create mode 100644 sound/soc/tegra/tegra_rt5631.c
> 
> 
> I don't see any user of this driver included. Any reason why?

They should come a bit later. The TF201/300T device-trees should be in a
good state already, we just need to finalize them for upstream and send out.

IIUC, the audio codec and dock station drivers are the most noticeable
missing parts in upsteam kernel. Ion and Svyatoslav should be able to
clarify the state of the devices in a more details.
