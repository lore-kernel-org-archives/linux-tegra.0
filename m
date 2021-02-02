Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF188C433DB
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 15:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E86B64F5E
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Feb 2021 15:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235578AbhBBP2T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Feb 2021 10:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbhBBP0T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Feb 2021 10:26:19 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7E5C06174A;
        Tue,  2 Feb 2021 07:25:38 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id f2so24396194ljp.11;
        Tue, 02 Feb 2021 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1BFhguJtknsgKZxynMp8586vauMG7FnrvbgtjYyZdro=;
        b=Vv94kslTjxOHCof/KEF/LoLKR4nL5ltWMvPcoQIXsSRavJWqtYBiP4QkJfugy6ZSHw
         QF/4EXVfa3lenAfwmQje7P49RcR1YghY0PCAU//9kv0OcVTFjTz+s6MTZsuDvoxeNQBg
         VhJHmLc35E4FARCFj1km/HlUqEq5qSdKlViFF05bIHJYnduqZRrIF/W9XUC7LvaYe2wg
         H1qPnPgPgF1ij8aDO/c1c+3R7ZGttCyFlLtxcYJiYN+c2/hWbqX0cqLcTFyW4c+9bQO4
         8eoNEKdfAyzCfqpFKMhgFKZr15lZL86pIdGoUv/Neqjn/opYp+dRlJF99YQ2/8WOcbaG
         28Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1BFhguJtknsgKZxynMp8586vauMG7FnrvbgtjYyZdro=;
        b=MX491ZNuDqCJiwhs4ej73LOSS70us4LxE7dV3l0lP+v/rNS9Kq9rCeMxv9/lbL+Di9
         JBo/myvnZX71wz98MDaeFO0wILBty29wsEI+SnJ0FUOFbkikQkMCpVq9Yn/+Fe34NBZJ
         vFWbvzj0NutK84HA1lwE4wqzN3N0iO/IuRn6uDPxjFbd12VETLSM3XbFIShhcRiSzkTr
         s36Cnrn50rtZxS3Va31vplsJphqCiwXp9KmJvsl+FFLytYwdVOiIalcLKEAnGjyEeauX
         UD2hYva12yiZ1FImZ/XlGeMnF1VCLSuFSLFB/zweY0Ngdp7aLASKFYAvgc452Jidldq/
         xxdA==
X-Gm-Message-State: AOAM531qBClaNqm/5jKQ/5jpsSk7LFToPk8GnSV86zOjLhxSxuzaT9LH
        X2R3YVTMCsZva6DtPi/8QEpqq+ekjUg=
X-Google-Smtp-Source: ABdhPJy9CrYxZnEFUlb+AY6IJgJ2nx7yfz9iiAllAC8BTXE/k9hwCGANIk8LURd2z3PsTK23pF1mFg==
X-Received: by 2002:a2e:7c16:: with SMTP id x22mr13561352ljc.46.1612279536183;
        Tue, 02 Feb 2021 07:25:36 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id s19sm2604205ljg.43.2021.02.02.07.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 07:25:35 -0800 (PST)
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
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
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
 <20210131184101.651486-3-AG0RRIA@yahoo.com>
 <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8d0bc6f3-45ce-565d-d80f-b50fb75e7c55@gmail.com>
Date:   Tue, 2 Feb 2021 18:25:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <7f4eb8f7-215e-ab3d-fcef-9243037cf246@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.02.2021 16:22, Jon Hunter пишет:
> So this is very similar to tegra_rt5677, is it not possible to support
> both codecs with the same machine driver?

These codecs require individual configurations and those
"../codecs/rt5631.h" and  "../codecs/rt5677.h" aren't compatible at a
quick glance.

The tegra_rt5677 also uses outdated GPIO API and etc. Hence the new
driver should be a better base anyways.

Overall it shouldn't worth time and effort trying to squeeze these
drivers into a single one, IMO.
