Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93B2C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 713F8206CA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMFQfuv0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbgJBO6c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387893AbgJBO6c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:58:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487E7C0613D0;
        Fri,  2 Oct 2020 07:58:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z19so2234147lfr.4;
        Fri, 02 Oct 2020 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=POx9xNcyZ1bKEH/Nadf1rvAFo4+ruSQ7V+OZSsyFX6g=;
        b=TMFQfuv0Qh0lLdh0vVjIQO+fdxv6cHJnhKY7+CWPxva3rdoMWV89Fk+t2WRk98Qr+U
         p9hv7jTprDfzqtCTWDqp7ReSuhWBmV+JlhXeFboJPToOk8t0TA3NkgP7eKAh7cMh74QA
         Pp5oDp3WGUGSjjjBVClx3y96ZWnOEo3lX6oT0Q/HFpXnTIYQzKY6hc9n9xhgHOkzR++g
         DJmGig8VdFzKtK7MCgXugCSOwAJ46y0c3awG2DXdlsE4w+voPjrc8kah+brF30PMTCW3
         ZFUsjgSaO8iZSWk/Hcqje69IAASY/6YUtwiZMMYrD093WyKlRmICzFOPUZ8SlcN3KJjN
         +W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=POx9xNcyZ1bKEH/Nadf1rvAFo4+ruSQ7V+OZSsyFX6g=;
        b=b4wdenDt2rvr9ltSCiHHJ9e2/zfwUsIL3yuMF06beQJ2g/HGfEyzhiGmqNB1YRU47Q
         WcDp7YDIGStYq5D7wponY/MbdozXtdu+df4XeIYalAwv2tcfk6unYqQdUOHYcwuAav8g
         AexwovN6F6BsbREBFBCCY1+xzR8Z0xJrUAp69UhtB1M5GlaSYliTnBuLgshwDvfW2eIV
         E2lBfU7WL98vvYaJu7Ym6omzFzAhTZFP3ZUZvNwvxorhDGhFxGblBsHqKz8JaQqX3Po6
         fKFMiKl2KcYcVNrAidXBfsScSGLLg9K2vpGPu5gtuDMKe53+scRkxucNxGp3jRCMOnlC
         Lpbg==
X-Gm-Message-State: AOAM533L4fgbhvLSI6aCi3Ksz0ZLr/6ChTeP9/ACq1R5ULIVHP0I84rY
        2juOdqTJIVJpGLYzCqzHLKowXcAjCD4=
X-Google-Smtp-Source: ABdhPJzHqivXR66Y+JVSjJn+1N1gTJ4gMom+lfo9gaKUXgseuzuJh9AWZ1varuvAobqqGknypZgdYg==
X-Received: by 2002:a05:6512:3113:: with SMTP id n19mr1137596lfb.241.1601650710594;
        Fri, 02 Oct 2020 07:58:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id g23sm335325lfb.230.2020.10.02.07.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:58:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
Message-ID: <0f186339-1e49-4878-834e-11ae8bf140f2@gmail.com>
Date:   Fri, 2 Oct 2020 17:58:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c42f1f51-9fa5-6503-91aa-3809f1f27d0c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 17:22, Dmitry Osipenko пишет:
> 02.10.2020 09:08, Nicolin Chen пишет:
>> -static void tegra_smmu_release_device(struct device *dev)
>> -{
>> -	dev_iommu_priv_set(dev, NULL);
>> -}
>> +static void tegra_smmu_release_device(struct device *dev) {}
> 
> Please keep the braces as-is.
> 

I noticed that you borrowed this style from the sun50i-iommu driver, but
this is a bit unusual coding style for the c files. At least to me it's
unusual to see header-style function stub in a middle of c file. But
maybe it's just me.
