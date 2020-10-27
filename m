Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34CBC388F9
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 19:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90209206D4
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 19:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fT1sI8aR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829385AbgJ0TG1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 15:06:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34600 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1829380AbgJ0TG1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 15:06:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id z2so3794724lfr.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2020 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uRlQdiPyqIVACGreVVac0hKZ/L2Mx9OoeKVoaCDbckg=;
        b=fT1sI8aRh8els2lSjB9NG56qsDXOHqjgvZG7jl84B70XsY250lA/ZZPDcJ26Bvvhmm
         D5v5gI4oPi5F64q3s4D2cKexvgU65i0WJDQfMTZGkf3vpLECRzjUAVKauIjYb2jK5s4n
         bLBTmTXdjirfJkg/ZjIFCDrIPxfnvnWZpTvRpnZTf3iEQrF2sA7PdTArfG/wssbYfOpw
         ubpA+QMgHnjSfXpfjDgMmQ50uSxfE53dIROzDWsvXeUBRW4rrTy6jkz2JMYTANeDnCP8
         qIPUvENvvF+2e1uOyJZLaxlOM0Wx+IlQWCFc/wmm45Fsn7h9szRbJUnrpD1WsyF44OjK
         zl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uRlQdiPyqIVACGreVVac0hKZ/L2Mx9OoeKVoaCDbckg=;
        b=VzccyCoBEeEjaAqbAcQdZdopMVG/zAGtjR+QTKWAiI34WRcwe1mJjvWAV9n+VSIWMz
         TTx+733FDVNOoeph6LC9RQ4YWbyXxL2QhVCCvUuByQEf9bu1IT0e7bifMgjbG+nKxp4q
         RJHMf33W8uCUdL1RByV7PVR7dkVYj7Ek/dz337n4RyvDGpF5/aiSuEOhu6ImsaN/dPHL
         LQXDGPf5myTw/4PmxC85CzjkNbuYd9l2DcJKfwwZlCeurJFXbOjroLDw6OjEEKLgu9gQ
         fs5hiUSTS6A+XT1TqJWvcoswQ6LPOXn2A9/VKgR5hwPSVvsLKYSim19k0COpz0X9mKkE
         1etQ==
X-Gm-Message-State: AOAM531JqJx0EOG0F4Wys6U/8Sz7LQ+NhZ5FAj8Mssltd3ZPOi7aUCZb
        kfH8bvGQXcO9h609A771034=
X-Google-Smtp-Source: ABdhPJz0gCcf3UTaYDzzfTa9qKTX+r+Wgg+YztUN4gkGYgxnE2DHSDGASimrfrCREtxkJ0y8oOCpzg==
X-Received: by 2002:a05:6512:3691:: with SMTP id d17mr1275642lfs.243.1603825585246;
        Tue, 27 Oct 2020 12:06:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.googlemail.com with ESMTPSA id a17sm283239ljp.129.2020.10.27.12.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 12:06:24 -0700 (PDT)
Subject: Re: [PATCH v3 19/20] drm/tegra: Implement new UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
 <20201007171238.1795964-20-mperttunen@nvidia.com>
 <dd13ec2c-1e01-ca61-656c-b23b156b100f@gmail.com>
 <b33a5084-7dc3-a865-2f36-274ecebf2ee7@kapsi.fi>
 <1f3267a9-37b4-2cff-08a2-2ca7c905ce01@gmail.com>
 <6a7b4d4e-8d4a-416e-9789-45282b44bce5@kapsi.fi>
 <48f5bbac-3955-c227-dbe1-d987b4ec5bd0@gmail.com>
 <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e8afd710-de37-f1c5-f61c-ed97c07370bf@gmail.com>
Date:   Tue, 27 Oct 2020 22:06:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <414b4943-265d-3735-c115-d54469018d8c@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.10.2020 12:11, Mikko Perttunen пишет:
>>
>> The first patches should be the ones that are relevant to the existing
>> userspace code, like support for the waits.
> 
> Can you elaborate what you mean by this?

All features that don't have an immediate real use-case should be placed
later in the series because we may defer merging of those patches until
we will see userspace that uses those features since we can't really
decide whether these are decisions that we won't regret later on, only
practical application can confirm the correctness.

>> Partial mappings should be a separate feature because it's a
>> questionable feature that needs to be proved by a real userspace first.
>> Maybe it would be even better to drop it for the starter, to ease
>> reviewing.
> 
> Considering that the "no-op" support for it (map the whole buffer but
> just keep track of the starting offset) is only a couple of lines, I'd
> like to keep it in.

There is no tracking in the current code which prevents the duplicated
mappings, will we need to care about it? This a bit too questionable
feature for now, IMO. I'd like to see it as a separate patch.

...
>> I'd like to see the DRM_SCHED and syncobj support. I can help you with
>> it if it's out of yours scope for now.
>>
> 
> I already wrote some code for syncobj I can probably pull in. Regarding
> DRM_SCHED, help is accepted. However, we should keep using the hardware
> scheduler, and considering it's a bigger piece of work, let's not block
> this series on it.

I'd like to see all the custom IOCTLs to be deprecated and replaced with
the generic DRM API wherever possible. Hence, I think it should be a
mandatory features that we need to focus on. The current WIP userspace
already uses and relies on DRM_SCHED.
