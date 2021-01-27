Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE4C4332D
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB856146D
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhA0VjV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbhA0VgS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 16:36:18 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0710FC061786
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:35:19 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id q8so4742208lfm.10
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tQDe7yRUmKhAto8WrhSV9CEVL5HS+KA9x6e+wAuz/h4=;
        b=vFVSscQ0PNZE0lJfiHB24oYt7wFoclmi9hPaaKkEocP7ZrRGNIYhkpc3nz37cUp7wp
         isdx58x+AH8lAkM8rplbun08sIwaSDXKQBqJulfzGQ9Em2SO/cX7CYHYRk35yc53WnOO
         Q7GSBi4MR7gKySJ5D3LVrOKDCPDkH+d/b0+PfUS0h0MV0JTq39iuPTkG5J6snc4JPSBb
         0/ISNZL3iK2mqM/p2icU5tnszkn+WetvdxuyZjrJpYPIRWVJRdxLsekXw+iA3HHU3+ih
         Km5GQMX4qsheWVn3jwbHX0SgskpLGE7agfPbFMRxXEIcMs4PCC3OJJOxDvn/Q7TRQzY8
         pW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tQDe7yRUmKhAto8WrhSV9CEVL5HS+KA9x6e+wAuz/h4=;
        b=B1wl90bHpf3oCgHHqdjexk7sjphq1AVCy2LHoeT2NnTEmuDCaeL3GH/uYiJ2JzZzd8
         VQZ8Z/dZ7eQzs2KrtgWWLrPRH4hkma4k7582fXy3SgMgbjUyIIgw97s4BCFjHU0akCkf
         XabqepeY6okTPGGeTuwSvrwzK0uaimWPxnS4ZsHlP2DZ7CYCFAYyrM64RNSn3M4OeCLw
         OWOZ19zgf2QCpcqgeO0vgM0wcWOeh18Z5Mgp8+hpZ6NZec5U3WVw2k7VZIFcw3F+rlY5
         Q4jHr0Bie7gw6TIyzR0q5qcowxzxoWb8Fna3xVHGlJYTSmj5RshTpb2wRMXNOFnf5n5O
         uMcw==
X-Gm-Message-State: AOAM5333TZbj+1nmKJ2lGgsrU38G/75hR2kJcTY42fl4c65ffFUwZDBl
        O0/fKYTqONeBrmAeeDlLvSA=
X-Google-Smtp-Source: ABdhPJwvKuM9VGT8UPkeH/y+fiNWKXj3vYQKAoCkzkgX+1mV8tdal7fbDywNMvQPb/4rgVjAp/ZUgw==
X-Received: by 2002:a19:746:: with SMTP id 67mr5706808lfh.395.1611783317211;
        Wed, 27 Jan 2021 13:35:17 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id f19sm1007383ljn.111.2021.01.27.13.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 13:35:16 -0800 (PST)
Subject: Re: [PATCH v5 00/21] sync_file API is not very suitable for DRM
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c690b17d-7278-5d25-8316-671afd111e01@gmail.com>
Date:   Thu, 28 Jan 2021 00:35:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.01.2021 05:45, Mikko Perttunen пишет:
>> 4. Sync file shouldn't be needed for the part of DRM API which doesn't
>> interact with external non-DRM devices.  We should use DRM syncobj for
>> everything related to DRM, it's a superior API over sync file, it's
>> suitable for DRM scheduler.
> 
> Considering the issues with fileno limits, I suppose there is no other
> choice. Considering the recent NTSYNC proposal by Wine developers, maybe
> we should also have NTHANDLEs to get rid of restrictions of file
> descriptors.

It's odd to me that you trying to avoid the existing DRM API. This all
was solved in DRM long time ago and grate drivers have no problems with
using the DRM APIs. Even if something is really missing, then you should
add the missing features instead of re-inventing everything from scratch.

> DRM syncobjs may have some advantages over sync files, but
> also disadvantages. They cannot be poll()ed, so they cannot be combined
> with waits for other resources.

I'm not sure do you mean by "poll". Sync object supports polling very well.
