Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47049C433E6
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 17:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A58164E0F
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 17:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhCQRVv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhCQRU3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 13:20:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E7EC06175F;
        Wed, 17 Mar 2021 10:20:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a198so83898lfd.7;
        Wed, 17 Mar 2021 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NFi1kFhrUTgn5FvPk8wh5i9n6BvR2USVpUn/9xflTkk=;
        b=OoZX2tiIQyHFy7a/jirVKoULGhIrjwPvuvQYgCktz4ZesxRQIDzLxjYERGMvcaXbl7
         ryx5JZPNhEiujaONPvnTEyRdEh2Ng2lheMKTZRstYdQVPM/2jB3HUccjYkZXVPtkuvCL
         EqfZCMS7EewunrhZM9O7vYe+c200rM1v8egLvPZN2bAYMqGlTxg7Asacma/8LAFUbrts
         IOGgi9jIHiCuEn5jWEstEXVelAIqOj77bkrhQkwwnuj3vQ3N6xqO/u/DKvCK3iEs3TeY
         NKspi5cJRrgqwvKgXLBFsQnrkviRb9cN8vW0kJjjPSRkzLj5itjRAq50N/XjuEgvfjLd
         Zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NFi1kFhrUTgn5FvPk8wh5i9n6BvR2USVpUn/9xflTkk=;
        b=Rxx6u42TXi2atrCvsWOxN9DRcnQGoPOa0vtj8FzkifIJHj7pJn7h+tjHuxVfSgb/0H
         xVmDHOiVEawAGnYM9dfHPpzNIRBWU7RYZbiDjyI3JSl3ycUxYQgTqdO9EYE5MSGtKGdq
         TSlrW6ZOTZT6Pxx9XfyTDN1zh0WFhxmoj2FHnA0ZxPB9Xe2nBkz5WyaG2kQBxFbSIEjN
         9fvCKC8SjWeLe6weoaqfAH9ObisT2KbzeSsVETA8qTz912wAdettsE7d3ufJt3OS8v7I
         wgh353TesubwD4yVXnH1uR1BlWgHNuian2ZPG+dwCT0oQu5uyffi87UrRze3qTsosJJU
         t5AA==
X-Gm-Message-State: AOAM531xlKFpWcLYcso0sTB1ZUT/4cnXBi9B6Xhki0j+X7fFX56bPywb
        f9UTMBElCiq7+oPY2XHjuX6OXlhxeg4=
X-Google-Smtp-Source: ABdhPJxMJd14k9yjtgxRwNLmMWFGlgc0PX7nuLmBb8FfvmGKIWsxLnOUuuJIpmAAfPUbW+HjT4CY2A==
X-Received: by 2002:a05:6512:108e:: with SMTP id j14mr2741412lfg.364.1616001611659;
        Wed, 17 Mar 2021 10:20:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id v2sm3576654ljg.89.2021.03.17.10.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:20:11 -0700 (PDT)
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314154459.15375-1-digetx@gmail.com>
Message-ID: <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
Date:   Wed, 17 Mar 2021 20:20:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.03.2021 18:44, Dmitry Osipenko пишет:
> Hi,
> 
> This series adds missing hardware reset controls to I2S and AC97 drivers,
> corrects runtime PM usage and drivers probe/remove order. Currently drivers
> happen to work properly because reset is implicitly deasserted by tegra-clk
> driver, but clk driver shouldn't touch the resets and we need to fix it
> because this breaks other Tegra drivers. Previously we fixed the resets of
> the AHUB and HDMI codec drivers, but turned out that we missed the I2C and
> AC97 drivers.
> 
> Thanks to Paul Fertser for testing the pending clk patches and finding
> that audio got broken on Tegra20 AC100 netbook because of the missing I2S
> reset.
....
> Dmitry Osipenko (16):
>   ASoC: tegra20: ac97: Add reset control
>   ASoC: tegra20: i2s: Add reset control
>   ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
>   ASoC: tegra30: ahub: Switch to use reset-bulk API
>   ASoC: tegra20: spdif: Correct driver removal order
>   ASoC: tegra20: spdif: Remove handing of disabled runtime PM
>   ASoC: tegra20: i2s: Add system level suspend-resume callbacks
>   ASoC: tegra20: i2s: Correct driver removal order
>   ASoC: tegra20: i2s: Use devm_clk_get()
>   ASoC: tegra20: i2s: Remove handing of disabled runtime PM
>   ASoC: tegra30: i2s: Correct driver removal order
>   ASoC: tegra30: i2s: Use devm_clk_get()
>   ASoC: tegra30: i2s: Remove handing of disabled runtime PM
>   ASoC: tegra30: ahub: Reset global variable
>   ASoC: tegra30: ahub: Correct suspend-resume callbacks
>   ASoC: tegra30: ahub: Remove handing of disabled runtime PM
> 
> Philipp Zabel (1):
>   reset: Add reset_control_bulk API

Mark / Takashi, I may try to split up this series into two or three
smaller patchsets and then the reset/ patch from Philipp Zabel could be
merged by Philipp himself. I primarily want to have the audio resets
fixed and the reset API extended with reset_control_bulk in 5.13 because
this will unblock other patches. Please let me know what you prefer more.
