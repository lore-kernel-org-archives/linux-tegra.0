Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1AFC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0876A208E4
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 21:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw2WXvXe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbgIJV7K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 17:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgIJV6x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 17:58:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED3EC061756
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:58:52 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so10224935ljd.1
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BPOKNfGndEgQTjDQnrhJJIKdjf1I0suM7pRGQu/Ou8U=;
        b=nw2WXvXeyz/rrFCkNo7vvTApdJuNQWjYZ3hZlgVZRnja+AjljAXICgiwYunAKfZhF2
         3drhy6UK3PzcquX2EtckYx9JaFwYN5Pl0x4IWxlGQvZ1kImzXy0fqibpHgeN5NbBaHjd
         VxtyyL8zMML/4jWP+npXbA1ZvkseFtfjiESfetbSvNTwaeegF6ywPWWkHlb0riQ420xy
         S8tJhJafRSi89pI+mcpraFr4Cg6UEbfibnpnHha5wj6U6oIQvtNkjIhDeGu4dcreVR1i
         6ij+LNuvWTZZmrjoTJHkM5Wsqe/3gWbekKxk+0YNUTyuHSBCDWZiAWZQGGsyjtBejBWF
         R71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BPOKNfGndEgQTjDQnrhJJIKdjf1I0suM7pRGQu/Ou8U=;
        b=Ytsz1sS132SxTm4ofpTHlJ5DI4tbox866Klczzt9VRIPDlHXRfimW9k8tDSm+7lsjz
         JgjMi/aKs6Bhezrso6wARf67fDNSL1Z24wpl3Zz1+fmIfrP9xllIbWJIX+Z0a/8ni5Wn
         235mnZhnBdoIAmu1r59AHGGUo5i6SW2yFH4fCpN/wWrYShSDNdjWhZO1Nfha+/2iyDSV
         /eoXryqRG9lmv1JZRJv3H2bpqBoi507R2rvPwtHBecaxEtRcSBzhOktNwj8p8CXvhrK5
         nR1jVL3xxXkdGH0zbu/gFnB4OE9rrNbj5I/jltolWWK1KMnxkQ+P4lFCHj+12lWFfFWa
         IUww==
X-Gm-Message-State: AOAM530uQcK/iPFyAYYV75V3QbebPijXcD1Th6JcMGDOgLOAtYNj2c0A
        AmI8+fasOQ8Dt9pZaDQ1NQk=
X-Google-Smtp-Source: ABdhPJxqfY1oHEqvUugiPogX+riSXuA+rGsfK7vSJX0OzVPvJRuesoH6Bn4Yua1zoUj/XCvU6g1lYQ==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr5440270ljk.85.1599775130886;
        Thu, 10 Sep 2020 14:58:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n62sm19167lfa.82.2020.09.10.14.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 14:58:50 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
 <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
 <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47edb3e3-fff1-fd1d-965c-f732d2c25bbd@gmail.com>
Date:   Fri, 11 Sep 2020 00:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:26, Mikko Perttunen пишет:
> On 9/9/20 4:24 AM, Dmitry Osipenko wrote:
>> 09.09.2020 04:13, Dmitry Osipenko пишет:
>> ...
>>> How many sync points would use an average job? Maybe it should be better
>>> to have the predefined array of sync points within the struct
>>> drm_tegra_channel_submit?
>>>
>>
>> The same question regarding the commands.
>>
>> Wouldn't it be a good idea to make both usrptr arrays of sync points and
>> commands optional by having a small fixed-size buffers within
>> drm_tegra_channel_submit? Then a majority of jobs would only need to
>> copy the gather data from userspace.
>>
> 
> Sure, I'll look into it. For syncpoints, it would be usually 1 but
> sometimes 2, so maybe make it 2. For commands, at least for downstream
> it would typically be 2 (one wait and one gather). Any opinion from
> grate-driver's point of view? Not sure if there is any recommendation
> regarding the max size of IOCTL data.

The Opentegra will need more than 2 commands. We'll need to take a look
at what are the min/max/average numbers of commands are used by
Opentegra since it combines multiple jobs into one and each job may have
several wait commands.
