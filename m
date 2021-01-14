Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7647EC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 08:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B536239EF
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 08:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbhANIgw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 03:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbhANIgv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 03:36:51 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAE6C061575
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 00:36:11 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o13so6899853lfr.3
        for <linux-tegra@vger.kernel.org>; Thu, 14 Jan 2021 00:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gGqP5AIlQ/3sPKWxFqWQSGbJK/2glJGRflSBF6MEnRc=;
        b=OCT4NYM8fLFCM9pB68jDrPrghf91OtMDdLivY4BqywVH7zLSP36IpMtwX843hHQsMk
         67sz3lDa6ZKjLFIJgTfhiRw0LIIkmcdeGKEri3FHC4zz9YptKgQJ+adAnAsSeg/UhAMO
         eOdHpvpPQwP+D4DbTEkz9bZelsuFoBz2U4G4q3t/snAMyaADWz03atIgSgWPYxzxZLHj
         sovEzyMnfhndnmSah+M3jeY3cCaLAfpv9pBT+s1Tnl5CLcUSiyN3Cxv+uXWYkrIhoO7f
         WSh+8hnBYLDUHCKsfgFkfFdkreZORwMXPFdV0LMCwcxBOxt0mE1hjgpTAzSKG5zdQaOo
         2dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gGqP5AIlQ/3sPKWxFqWQSGbJK/2glJGRflSBF6MEnRc=;
        b=Eh3GP9kCH8ASWaROpMdS8kqzYEeMtFCdigvZ4rhUpEAfzKgs0ixqjC7NfVvXurUDqC
         aNEu7BlHez9iaaA7d85uet/LuRKoVNMPePSRJwl1Xp/TsBJyoE7VhlerFNKvnlQzXrm3
         wICveZJ6gn0wslLKzBk2LbiPeSaet3FWzIemrW95rkXDkkS4W8AE8fQTSpqDpIFp7RiP
         AGff6N0AQNK1B/2uUsJwBDbcuZnv3TcfDAN+nANArXkYbGKRN8mnc3jve1HFERalbTsZ
         uhdnDRD1BxGyqdK3OZCKL4w4zl5JBXGrLrKsTCbsREeIVwJUeafLNhnUOpYol5oiilZ2
         NVUw==
X-Gm-Message-State: AOAM5320UK1feY3K4XVgs60/CfC2KWj+1rdpRxZCUigwHFSTkSwHk4pT
        5JmFu+CY+kHZ41OCqIroTVBvxK0Tgpg=
X-Google-Smtp-Source: ABdhPJwmfwmxCHtQP5uj2Dslrj7H8TPJyiQE/qZDLgHCvvSKou4Mo0p+9Z1JMFSmEkic+tY2+WGSYQ==
X-Received: by 2002:a19:c504:: with SMTP id w4mr2803552lfe.288.1610613369720;
        Thu, 14 Jan 2021 00:36:09 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y9sm387492ljm.94.2021.01.14.00.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 00:36:09 -0800 (PST)
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
Date:   Thu, 14 Jan 2021 11:36:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.01.2021 21:56, Mikko Perttunen пишет:
> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
>> 11.01.2021 16:00, Mikko Perttunen пишет:
>>> +struct drm_tegra_submit_buf {
>>> +    /**
>>> +     * @mapping_id: [in]
>>> +     *
>>> +     * Identifier of the mapping to use in the submission.
>>> +     */
>>> +    __u32 mapping_id;
>>
>> I'm now in process of trying out the UAPI using grate drivers and this
>> becomes the first obstacle.
>>
>> Looks like this is not going to work well for older Tegra SoCs, in
>> particular for T20, which has a small GART.
>>
>> Given that the usefulness of the partial mapping feature is very
>> questionable until it will be proven with a real userspace, we should
>> start with a dynamic mappings that are done at a time of job submission.
>>
>> DRM already should have everything necessary for creating and managing
>> caches of mappings, grate kernel driver has been using drm_mm_scan for a
>> long time now for that.
>>
>> It should be fine to support the static mapping feature, but it should
>> be done separately with the drm_mm integration, IMO.
>>
>> What do think?
>>
> 
> Can you elaborate on the requirements to be able to use GART? Are there
> any other reasons this would not work on older chips?

We have all DRM devices in a single address space on T30+, hence having
duplicated mappings for each device should be a bit wasteful.

> I think we should keep CHANNEL_MAP and mapping_ids, but if e.g. for GART
> we cannot do mapping immediately at CHANNEL_MAP time, we can just treat
> it as a "registration" call for the GEM object - potentially no-op like
> direct physical addressing is. We can then do whatever is needed at
> submit time. This way we can have the best of both worlds.

I have some thoughts now, but nothing concrete yet. Maybe we will need
to create a per-SoC ops for MM.

I'll finish with trying what we currently have to see what else is
missing and then we will decide what to do about it.

> Note that partial mappings are already not present in this version of
> the UAPI.

Oh, right :) I haven't got closely to this part of reviewing yet.
