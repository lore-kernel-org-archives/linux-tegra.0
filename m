Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B991C4727D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 08:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5554720795
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 08:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJF9tlE8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgJEIOb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgJEIOb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 04:14:31 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31AAC0613CE;
        Mon,  5 Oct 2020 01:14:30 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so9768295lfl.5;
        Mon, 05 Oct 2020 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j5XN9V3BvyveRl6mO6Y9d7mYUzGE03RcVJt79XhJ7IQ=;
        b=KJF9tlE8rf+w1UQmusIv1x7UZEK1DkFtHevrVRo772QLFCCOk5Wcd3cpAMhbRW2oR2
         jowUHm4Ktm8vyMkgH/I5glKWfEcIbqzoaluMw7LnzSFosIoUBD+Dzsj6ICKmeJ2Lck72
         xILnA7r2Bwo0gIJg/bThuTorUqyRDXdb59CBQwBx/ORhomckfMbHTX5EBmk2+Wqxz4Ub
         aUu9RhcGQYW5agpuVGc+Q9kx0KNqpleaw2YycJCUEVxtCJGRhlw4TufvTFwUxb7Zvr62
         68AooIdDyRtFyQYIDKQLTd43GOaSzI0QNgHD1OGiIW9szRzL88BjQz3D9lzNXeE63rKs
         1yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j5XN9V3BvyveRl6mO6Y9d7mYUzGE03RcVJt79XhJ7IQ=;
        b=ofIPpIHizje+w63zE6+tUcJEmZZtn3tjLPtbGIwnhoQvAGzRoZ1efB0reZ9zSGfJ3k
         +1UPX8vTzipAOHNZYhCbztnJKS7+afVvxIEy4mwOdZtBHMuDPp6AED2OCUmjZmEVXaAG
         RCeKrA8A81GWa4UDrqym/e1HUQrgyEsdmATYgpKijzFaxT02rPEuLqhDu6RulBWq4n+m
         t2Cyhd2Cvd+VnakgFWleoqNPHKUzmmd1l1Oo9jWUwWJBpPxYdwZ3y21jj15wvzWjxhmb
         rGWvWz4UOpvfeJViLWSiIPVT1Ywg7oxlzpEb8FAZfAl1tAvRCAxAgWDeOjrovrGkXK2G
         9+7Q==
X-Gm-Message-State: AOAM532Z1iV3aNCQblkeTF6/4uiQDfNiyN0c+F/+lI9JASzdviSSyXve
        8qBGiEecIiFhm0XHX3Td7EnqlHabBcE=
X-Google-Smtp-Source: ABdhPJzemIzFCplJkXyIIB0ijx9JVIz3iQi1oUYyAHp4PAE0N6jP7Kqk1pDCb29mXjAqgLfFHYGpZQ==
X-Received: by 2002:a19:c355:: with SMTP id t82mr5617098lff.251.1601885668987;
        Mon, 05 Oct 2020 01:14:28 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id q24sm2605472lfo.149.2020.10.05.01.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 01:14:28 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia> <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
 <20201005071338.GA425362@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b1a3ee6-d556-4172-3314-0c852d3c6916@gmail.com>
Date:   Mon, 5 Oct 2020 11:14:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005071338.GA425362@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 10:13, Thierry Reding пишет:
...
> Have you also seen that sun50i-iommu does look up the SMMU from a
> phandle using of_find_device_by_node()? So I think you've shown yourself
> that even "modern" drivers avoid global pointers and look up via
> phandle.

I have no problem with the lookup by phandle and I'm all for it. It's
now apparent to me that you completely missed my point, but that should
be my fault that I haven't conveyed it properly from the start. I just
wanted to avoid the incompatible DT changes which could break older DTs
+ I simply wanted to improve the older code without introducing new
features, that's it.

Anyways, after yours comments I started to look at how the interconnect
patches could be improved and found new things, like that OPPs now
support ICC and that EMC has a working EMC_STAT, I also discovered
syscon and simple-mfd. This means that we won't need the global pointers
at all neither for SMMU, nor for interconnect, nor for EMC drivers :)
