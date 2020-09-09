Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFEC43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 01:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 548D7216C4
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 01:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFZws4PE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIIBYd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Sep 2020 21:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIIBYc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Sep 2020 21:24:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FACC061573
        for <linux-tegra@vger.kernel.org>; Tue,  8 Sep 2020 18:24:32 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x77so711523lfa.0
        for <linux-tegra@vger.kernel.org>; Tue, 08 Sep 2020 18:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LzY8j6+lp2zxW8tZ2fUBBIsqMnRRZb5OpOzz/ZscZ90=;
        b=mFZws4PEWoArF556jKoP2YkvyUiWbADRhRGk6TzsTbg8+s33lW9+43k+q1e1fPQUWi
         41Cwyv58cJVuKxF8WUHsxXNt+32fpRuNg8gFwQYZXH3Mm1bysWDcXqjHOmHIGrFc+uMK
         WgWsGwz14zBQLkruMlSpCczMOFqrceNQs5rnX5KkMwfz0lzjMBU5KjFyH1rmhz38uqCT
         ePn7SiAQ5LtP7l1UeWvajniaxYSRiN85Ukn455V6ASlI7L/SNSpZx99yRS0//6ld32et
         y+956CePhLB9Q7ytb92gffiQYqoOnoCkbpwBpYrenpF0T5Ycj4ilMUYxb0hfbw9tZodz
         wPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LzY8j6+lp2zxW8tZ2fUBBIsqMnRRZb5OpOzz/ZscZ90=;
        b=jEP9zQAe/1i8Ly8XHdme1oSUvjVKTxG0Hgyynh0bmKM4NeqdfBPBgdXYB17Fvakqgu
         xJVxfhESDY21azBDWiiFHMHy2flioL6yDZvzzc8Nx05AUl9+t7wHDiXu5C++/bg8DjSW
         8RxWgOqmirD9mUdSyf2tmqKJvD/UjaOcByMtwhZzIHjz+By/BmV6birhx00edI7dI8x5
         Lq+UPFW/kCrFXTAeAKyZ04WWuo3GvYazqMGbf/MoZtSnEpJqM5rMqo6MbHbVEZwz8DID
         Mx+P4r9f61aMU45UoqO63GCETFYWh9ypz9V80++gmVjbcDMx/0qPr6wMqbUZLDyh7aQg
         HGOA==
X-Gm-Message-State: AOAM5300K+KRcb45wbenQaTlVes0vmVl5A170MZXz/nxdzfe50rzhN/s
        opXXVfOKzXYiD+MIRWCXi+4=
X-Google-Smtp-Source: ABdhPJwSplnh5KzBASjpDLr6JT5ph7pfEeWTFBfjb3K7VNWuo2PGN1cYQg6SizaXUDa/oCvV2jUC0A==
X-Received: by 2002:ac2:4355:: with SMTP id o21mr755419lfl.210.1599614670500;
        Tue, 08 Sep 2020 18:24:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id s4sm324335lja.124.2020.09.08.18.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 18:24:29 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Message-ID: <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
Date:   Wed, 9 Sep 2020 04:24:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 04:13, Dmitry Osipenko пишет:
...
> How many sync points would use an average job? Maybe it should be better
> to have the predefined array of sync points within the struct
> drm_tegra_channel_submit?
> 

The same question regarding the commands.

Wouldn't it be a good idea to make both usrptr arrays of sync points and
commands optional by having a small fixed-size buffers within
drm_tegra_channel_submit? Then a majority of jobs would only need to
copy the gather data from userspace.
