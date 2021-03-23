Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974BAC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 736CF61983
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhCWPAq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhCWPAi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:00:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B080C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:00:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w37so27069657lfu.13
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=60EfMvM37qn0EhwNos9h/7fWqDVyOdNY4qBVAv1lRe0=;
        b=QugGOQXZYpg+gt9e/l75epoiRg+Y8Yph2FPX5l88o3OA7/aDJENvxzxRYgfD5HDefi
         6NnZv4lfoadqlbxFfHD5AN3058f0VzY9Uu4McLJvJvPN1cE1UEE/7K1ELMrJVHucEC9+
         0QRgCXZm7AG1giJmTYo8U/BRXlXgfVe1+YQwdS01AD1RbG53B4SJGX1lz0pDgnDZkyiF
         wEpFKn0z8/WcPg9cWrimuOKC6zWxjOQgREvz6hQ2lIR41tc55LooXB5atgLRL3aEl023
         ZfDhCTXRIZmqHC3Ljy46SMsHgbKjESsC3yY0MykSELhvcprAPRoD7IoXuz1fuMTcp6xR
         3EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=60EfMvM37qn0EhwNos9h/7fWqDVyOdNY4qBVAv1lRe0=;
        b=GuuIDvi5ClVOV00K4pDTjyy9OyibHGY9a36ZCxVc9WsR5D4McNDTfAaWEg+0ZqSXIX
         2JanTf2MpZSfhOiNnv4li55VofWS9w+z5K8LWVtt7n5DvPz+zxIpHlhGyqgZNgiWr73M
         IaD3mSMy85I8ZvrwSHWpKNTTShcXQwFhxgR0l4G9Zi4vSXhTXlbVT7hLDyxsKA3CNHGI
         hhppfZDB1bookSm3ZtyFFqdBibkQKInZPt820o1Kg+wOXXoSs42Irp+KqX7b0lA5Pskn
         s0JMaYBK6gKp61FlAa1gJGIE0AebfwxrsqEmdGBc7sy6bogHjKKOOlNecfOPMfUz5cTK
         PA/g==
X-Gm-Message-State: AOAM531IY/4Ka/z729KjEUDg4uE8gzWXQBAaUFK+545P9Vi0hGRXrkXJ
        HvjuwCvTir1ytaiHkIcCXSQ=
X-Google-Smtp-Source: ABdhPJyGBDep2PCcbA1WpB8VpiD3oIAD3OKKWLAGjP2y9Kat5HAthvWKJdyXuIYa01srFVx9vX4ZJA==
X-Received: by 2002:a19:3850:: with SMTP id d16mr2916590lfj.473.1616511635688;
        Tue, 23 Mar 2021 08:00:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id a26sm2290151ljm.107.2021.03.23.08.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 08:00:35 -0700 (PDT)
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
 <YFnsQNiLg/5I/qKA@orome.fritz.box>
 <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2c557b45-f78c-5f49-7f9f-e84edacd4a08@gmail.com>
Date:   Tue, 23 Mar 2021 18:00:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <494e3858-5b29-0b44-f2eb-7a7cc16ff325@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.03.2021 17:43, Mikko Perttunen пишет:
>>
>> FWIW, I would've been fine with stashing all of this into drm.c as well
>> since the rest of the UAPI is in that already. The churn in this patch
>> is reasonably small, but it would've been even less if this was just all
>> in drm.c.
> 
> I think we shouldn't have the uapi in drm.c -- it just makes the file a
> bit of a dumping ground. I think drm.c should have the code that relates
> to initialization and initial registration with DRM.

+1 drm.c is already very unmanageable / difficult to follow, it
absolutely must be split up.
