Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD30FC433E2
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:34:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F40C20EDD
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 02:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1vfvgtx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgIICea (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 22:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgIICe3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 22:34:29 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CD1C061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 19:34:28 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so1449129ljj.12
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 19:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4v8thHze86+0fQkgmgDPrca03PKESMYxAe79p6ykY10=;
        b=L1vfvgtxXWe9GvH71WbGE8LiHvfYySKBvAXSskIS1QFJd5mk5RoQmbAUtRoJHevcHc
         BkkKfIpTH0L+fSD+QBUlNn4JDcvWrWZRSX3SyMqMAxlcdm7LQ5yueayqecUcPfPDZm1W
         4a5E3n5rekkfozc/SrqcXBqoWgXTLigx4oLCXXKyV85YX1ewNOlvaNsASesu/i/3sc/D
         st35+8pWcyu5cV53IpWHzcQjWvj0cLA40jVuUZd+Dqb0zGq1DLujqapcVRJLy7X+wDI+
         7VDjdf0DDrMQH2cU4nE32/2LU+DnpnnKU+fcinUuWiEk7MXaOGMSZsE2e02M59quXA51
         T5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4v8thHze86+0fQkgmgDPrca03PKESMYxAe79p6ykY10=;
        b=OyUpTTmbdNXOz236QgVpskKM3I+oP/3wr8togGgNwHzix88YllE3AwmrfFV2xWHDDz
         lLRC4rWdAEpw9zvt+x8FrMMA9+Z79A+JyGu5DwmsX0/XKtty9N/5IuJhKVjYfj9ZgLpH
         +t41swkQ3ugAu0UD4ytl5IztaLZQxkh2vKF0UelEjT+SnDlvgTrl0GAJthqwzNo59yDC
         qoQc/apFypOdIb0rUeLxMvlGo9MUIfKbJ0e05romZ88dnQLFhobEQohLtCDEo6iKRPU1
         7BCRQRWrYlzzuqJA+/i/aMjOOzU4ymzBDJlHq7J/wjCzgce8jBmGY8R3BqlBGdfOT5en
         0SOA==
X-Gm-Message-State: AOAM5300qqiJETsE2HrkIabq5aSIJ62nBTTR8qmcaBXMZxQ8enV4twEq
        nIdHRD0LNCiePSYPikiua+c=
X-Google-Smtp-Source: ABdhPJyQ8O978j2BwXDtCsACjFVSOajxdytGB0n+ocxSnjDn15DvNx79kBZlLpVe0c/5KixBSv6KTA==
X-Received: by 2002:a05:651c:1af:: with SMTP id c15mr711349ljn.347.1599618866404;
        Tue, 08 Sep 2020 19:34:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id k10sm358043lja.112.2020.09.08.19.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 19:34:25 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Message-ID: <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
Date:   Wed, 9 Sep 2020 05:34:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 05:10, Dmitry Osipenko пишет:
> 05.09.2020 13:34, Mikko Perttunen пишет:
>> +	job->timeout = min(args->timeout_us / 1000, 10000U);
>> +	if (job->timeout == 0)
>> +		job->timeout = 1;
> 
> clamp()
> 

Does it make sense to have timeout in microseconds?
