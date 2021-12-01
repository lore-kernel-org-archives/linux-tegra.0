Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C814C433EF
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Dec 2021 19:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239282AbhLATR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Dec 2021 14:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhLATR3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Dec 2021 14:17:29 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D464BC061748
        for <linux-tegra@vger.kernel.org>; Wed,  1 Dec 2021 11:14:07 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id p8so36676705ljo.5
        for <linux-tegra@vger.kernel.org>; Wed, 01 Dec 2021 11:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t9UXuE7pmTJqbZ1DYXXgK8yUxbQURiseZ9SOK7HAF24=;
        b=NhFkd7oP89FbCE3YUvPutO/5vurvYrECdm5g3aDX32z71QEAV0IYSXvq3fXoUoh8I2
         9ea2Hc32p5PVZycTRsxpH7rnfOQwhMShzsAFWmBBReyGLSgqxiVqZFbmn65He44naSCh
         2HDqk/NpSWPumn2EU4NWj22VnOfQlyWuj6p2u0/ZuB5k0cJwT+XN5tkH523v5IwpGB+l
         gJRbxcUfULh6RX7e7L0DRPfBHdEJOKq5s1eMilXlFzw3GhmRXTbd5VjZvG2PlN0Q4SVO
         Jn3UQVZy0nUcT/QrnDYiSUcf2MyEhB1rb+br7GgVUVqO5tuv/J+7dE3e0j31tiFj9/Sh
         0nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t9UXuE7pmTJqbZ1DYXXgK8yUxbQURiseZ9SOK7HAF24=;
        b=qVsmzvaOaHSMlk7k4/tbnYCBkrNsj/gaj7QzfuUdkn9yw06ujyge2gXpbpqNDsoOkR
         90zFF9Zq0OSWxlEw17Hq7JKYAM9F5XANjdoR/C4DX9HQOCqxR/d0AEF9uhcaSI/KhEJi
         kPUOyIGODlHmLH2wVrC1kc8Q8VohlM1K3NokOlO6xHxOUwfb/DiOdgMK2iddbv69K8+d
         8PQI/6IXFsFCX0uv6Va63YUcFJHhabMqASdrNMnEyShuEvcXdVtnRtqWBWLAAVeyxDCc
         CckterfgjtFv3O9wPil3KZpzHZCN1ogoPCzYfS8j6p9WBrxEHcvkmIFsHlLXvJOpESMo
         Ax+Q==
X-Gm-Message-State: AOAM5336uBjK/g8JZtl3293z7uzYltJ642yvVxjzVwQRQNToqRFkrKcB
        24wom9x6mNCW4BM1VngkO3gnOstKCnM=
X-Google-Smtp-Source: ABdhPJw4q0T/+p3KaGbL6D7hT8uxdme4fcQeRtLdOI7Hu9Wm3KeMchf5VVeNi4fy8DH/6kIgmjXEPg==
X-Received: by 2002:a2e:bf26:: with SMTP id c38mr7317128ljr.523.1638386046057;
        Wed, 01 Dec 2021 11:14:06 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id r5sm73619lji.132.2021.12.01.11.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 11:14:05 -0800 (PST)
Subject: Re: [PATCH V3] soc/tegra: pmc: Add reboot notifier
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211130114406.110021-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8ffa44a0-4963-4a77-77d3-391cb769bb4b@gmail.com>
Date:   Wed, 1 Dec 2021 22:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130114406.110021-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.11.2021 14:44, Jon Hunter пишет:
> The Tegra PMC driver implements a restart handler that supports Tegra
> specific reboot commands such as placing the device into 'recovery' mode
> in order to reprogram the platform. This is accomplished by setting the
> appropriate bit in the PMC scratch0 register prior to rebooting the
> platform.
> 
> For Tegra platforms that support PSCI or EFI, the default Tegra restart
> handler is not called and the PSCI or EFI restart handler is called
> instead. Hence, for Tegra platforms that support PSCI or EFI, the Tegra
> specific reboot commands do not currently work. Fix this by moving the
> code that programs the PMC scratch0 register into a separate reboot
> notifier that will always be called on reboot.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V2:
> - Don't call tegra_pmc_program_reboot_reason() a 2nd time from the
>   restart notifier.
> 
> Changes since V1:
> - Don't change the behaviour for writing scratch0 register when the
>   notifier is called.
> 
>  drivers/soc/tegra/pmc.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
