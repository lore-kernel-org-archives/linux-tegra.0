Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BF0C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ABA820936
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVU2FOFa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgIICKU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 22:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIICKP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 22:10:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45100C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 19:10:14 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s205so1429827lja.7
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tP0EvdXLQDT1u4Oa2B1LXz0mUeG/WbkRnEleGiHXzQw=;
        b=RVU2FOFaReOtwAtWP0k69UtFuDntfBSxvLwX8B5Hl9VX9ORgJWFXoKhb0iIYGB2Xpz
         Z/+2R5GNOJCR1QB+kpIb6n/IruUSVtLy3HtXNxMvpGeGoiFhHwrAAtI+0cnfp6nsxApd
         xQJrinGkmpwi5Yv8IfPeUeKjfb+gcHbM42nqh3If/1CvoxFRDX7pCOYLnFluVULsas/7
         Ey35ernp2Mrt17wCkfFo5ye1sv4epQTIkpa6nW9eNJ10NxfGrvz6sbDR7UdxkCx9vk6O
         EGOfstujkCIYcKtWHrBr6OPTzlFyXEL/XejSgMqbjC7nHpAAB46kXv0b50wyGFagY1Va
         Dx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tP0EvdXLQDT1u4Oa2B1LXz0mUeG/WbkRnEleGiHXzQw=;
        b=csGvDTfsI91a3q3s8cr/ZcAwznayfBwBzhG4x7tpC9+STC3n7RDP10ZQEycYOHWBww
         y7V9Ta1xKzThehZXT8bbikcZEJmkK/9hwM8K1oMs7CGgtMb5oCqehOYA5gK8iFzVXoUQ
         T0bTikkJlNideJUROvkxNV7RY4clHHzE+cQtiQRoc9kWZ9Ih5ZNlqeCfP2I2rV7JcZhP
         7zLNmEZNnebSMmAwtOUcUPm8TWkOwZz50LngLkYAMHfImin0t0438Szuvgyy+kWKV5sg
         smxswW23uy7bpieq0vLIzGW1ST11cM++V0gkPm+m70H05mW4XvUxdnWV8A2V9+RLv+4p
         CaKg==
X-Gm-Message-State: AOAM533Iga2VhooSlfJaLKW/brrYFLHd//ZMLVmSfZOUTb3RWkeJUgvd
        C+tz+aGVlXRIz2GcmgysZ4Q=
X-Google-Smtp-Source: ABdhPJzoGp5l3+BFEiKfqk35E1OzS/wVLUORtJx81f9KCmrYTldvzL/ZmKrKlMsJkRaW3UbSmUj8PA==
X-Received: by 2002:a2e:8e31:: with SMTP id r17mr708571ljk.5.1599617412385;
        Tue, 08 Sep 2020 19:10:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q22sm250685lfp.40.2020.09.08.19.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 19:10:11 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Date:   Wed, 9 Sep 2020 05:10:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-18-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.09.2020 13:34, Mikko Perttunen пишет:
> +	job->timeout = min(args->timeout_us / 1000, 10000U);
> +	if (job->timeout == 0)
> +		job->timeout = 1;

clamp()
