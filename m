Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53540C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1E6A2075F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXjsNbxQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730357AbgI3VYa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgI3VY3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 17:24:29 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4D6C061755;
        Wed, 30 Sep 2020 14:24:29 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so2831069ljd.10;
        Wed, 30 Sep 2020 14:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w7o/225bpCqBg7FmoWrj/SlNuFA9GxGFAjODbwr8ThA=;
        b=eXjsNbxQqWC5CCwUu0puomcGEldKCcKmI8va7D2gUg851zg1BA+c3zkKJ0dBQVbi3p
         qD0rvTyXPPz7eq/yxfyje4zD07KO9hAgoEfoLXjglZrjSBupeQz4EN5gLGAHzNPvqrnm
         ONdhWJPmxCBO2Ii+nIcHV5UHiX9/1TqLY+/Tt9Z4kEAFmxRnqlk/gmeHZIVClgLeUxPR
         b0tmypFPj17AJ74vzTIOhBY88as2kCPAtfXpOwncrW4QfyzigcM00eTRfksMwOwz8tgf
         MNCdpU6lzZiM9CqX1X4Sb1MTKvuJ+9O2Em351/8knDMKj5uSJJMHu/tVv49rFv/mmAao
         RBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w7o/225bpCqBg7FmoWrj/SlNuFA9GxGFAjODbwr8ThA=;
        b=B3jSqLAvAmySVlK/HdcX3T0fc/xVLpgGNlSttW1EEDbJ5VuSlAFdw45XesRVJpACIH
         U8HhRjT7/Zw9bsmXDRuZOdHzjSlhvq3L9NmHkgsc0B7XHJAsfkbUpOt8drCJ32oVEYNQ
         sQow5IQpLcXOchNe2Wvz+dIQE4cbONQ0mAhHjGAzNBy8/bXNGEQ/IvELxDKIM9T9i9bO
         FSSB9RbzLgZT3wcqwsNmRlEohWGXjepy4qfuXT1VXzht0SOEkzMwNEpovmTx5TiU2h3S
         LE6ExoivtCFTW8A9YPNo1s6aNQJWmzJ/Jvj9haOFIrDSrxJRlC2GXf7ttIizotJe5L7Q
         O1+A==
X-Gm-Message-State: AOAM533chLsIuogN83jhRDFxE3aI9b8tZ0LOtlPsNOqaqNKgPi2s2ftl
        worcIl19KiD2uQF2nxtY3Jd43/Mt2Zk=
X-Google-Smtp-Source: ABdhPJxazgKnQ5JAOpCi1Vg2QPdUoElCCe0hJ/hGbfuYkEhuKGv1ohTnGFJKhfl79I++iT+FqdRVTg==
X-Received: by 2002:a2e:880d:: with SMTP id x13mr1482497ljh.20.1601501067211;
        Wed, 30 Sep 2020 14:24:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n3sm315733lfq.274.2020.09.30.14.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 14:24:26 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
Date:   Thu, 1 Oct 2020 00:24:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930203618.GC2110@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>> It looks to me like the only reason why you need this new global API is
>> because PCI devices may not have a device tree node with a phandle to
>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>> root complex has an iommus property, right? In that case, can't we
>> simply do something like this:
>>
>> 	if (dev_is_pci(dev))
>> 		np = find_host_bridge(dev)->of_node;
>> 	else
>> 		np = dev->of_node;
>>
>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
>> sure that exists.
>>
>> Once we have that we can still iterate over the iommus property and do
>> not need to rely on this global variable.
> 
> I agree that it'd work. But I was hoping to simplify the code
> here if it's possible. Looks like we have an argument on this
> so I will choose to go with your suggestion above for now.

This patch removed more lines than were added. If this will be opposite
for the Thierry's suggestion, then it's probably not a great suggestion.
