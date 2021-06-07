Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC94C47082
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F183611AD
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 13:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFGNpq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Jun 2021 09:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhFGNpq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Jun 2021 09:45:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329BDC061766;
        Mon,  7 Jun 2021 06:43:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so26340988lfc.9;
        Mon, 07 Jun 2021 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rynHUKkZxa9A3eifUq0bL9Bb8E1MCzJOU3IrW4Ec2FU=;
        b=LacjciDdo4wka9zD7voFzPUR82dM5PzMM0NZ5BxttPO/sUbqXPamx1iouUOYz4Tmpe
         DDuxlXggx/QRGDCVmQS5tpR9tUNUOKgZBYU6rDEATObQyPSYoZveDV2qi4X5Ku2o8OXl
         uYN2loj+iNA+c0dXqwVo4jxNdMV5kmKVsi/SysnRlyU/BAB1BzjSo34oZae8UuJ8SpOk
         c5HL2knyjMIFg1hz6C+h3AmBY8ojjZqxBa0rJyw1mmBhhgh3eSvIdus1Fjo0G+q4XCsF
         fwm/63RI2xWy7azD9ofGsX3b31qPRlqQLqR2GDLy2xhi/ZV2HGgS57xihQwPK8ivHgJh
         xJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rynHUKkZxa9A3eifUq0bL9Bb8E1MCzJOU3IrW4Ec2FU=;
        b=KDVQSgVvaqEivE4FX3dmqAS3NRbjgqJh2GX7IIMUyA0pSZe0cMFbeA5ivrBj5VcunB
         x8YUzTlHwkNJL95eBA/iwDiV46rGJd+u/gmWYdEvlP8wZbqpuUBIys9s3/L7n9BG9hXy
         wY1oZfJuZ/tXHdMXBxaj7cf8pfNX//F2uwY7P+XtazqIufYIPf+y00FbqNejySW3hPsG
         IexgL7Per7Lgyg48UcxwrEWnX23BdY9b3u+a5kV4cevcejqDQ+0rjGaE8dBQAy3KcgI0
         6Adv1YB0Kb3l+wgm3Mjlmj9tYY9RMzTxgQQAceyGI81KVjgqB4bN6EA6gLwUX3QkRTDb
         tH2w==
X-Gm-Message-State: AOAM5310epx5+NZPP7NXBYJ99nOjHW/MiE/Dg+Slj1IPW+x/GvfIckN+
        +DL64xEOGklSRePMRJG5QFQ=
X-Google-Smtp-Source: ABdhPJyDwH/ieMafTpVARxdLcSZ+RnNvA0YYGm4SAkSzAvrqqjqfXefJKxYrqLAJBdQlMBAOpedH9g==
X-Received: by 2002:ac2:519a:: with SMTP id u26mr12017189lfi.639.1623073433632;
        Mon, 07 Jun 2021 06:43:53 -0700 (PDT)
Received: from [192.168.2.145] (94-29-1-103.dynamic.spd-mgts.ru. [94.29.1.103])
        by smtp.googlemail.com with ESMTPSA id h18sm799067lfe.206.2021.06.07.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:43:53 -0700 (PDT)
Subject: Re: [PATCH v6 0/4] Unify NVIDIA Tegra ASoC machine drivers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
Message-ID: <09a8bd07-d816-038c-8722-82bf0f3cc983@gmail.com>
Date:   Mon, 7 Jun 2021 16:43:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.05.2021 18:46, Dmitry Osipenko пишет:
> This series squashes all the ASoC machine drivers into a single one,
> this change was suggested by Jon Hunter. It also sets driver_name and
> components string of each card, allowing userspace alsa-lib to find
> UCMs at predictable path.
> 
> Changelog:
> 
> v6: - Fixed missed configuration of AC97 clock rate for the WM9712 codec
>       in the unified driver.
> 
>     - Added new patch that removes now obsolete "utils" helpers and moves
>       code into the unified driver.
> 
>         ASoC: tegra: Squash utils into common machine driver

Jon, please feel free to give yours ack if v6 patches are good to you.
