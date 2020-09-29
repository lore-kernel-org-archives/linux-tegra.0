Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA084C4346E
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C6D20BED
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 04:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEr1kq2U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgI2EGm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 00:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI2EGl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 00:06:41 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18264C061755;
        Mon, 28 Sep 2020 21:06:41 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so2842709ljm.3;
        Mon, 28 Sep 2020 21:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8YsXwgo3KPHwWcfe1EqRif6k6a8lufSqL4k1+GmC9Iw=;
        b=OEr1kq2UweWPHFgI55L5tGm1VUAj9zkJkt+i/OPT+VVHA2UQ1CgP9k9YrXcCA3L0jO
         uTnqUmj7mkEb8FYPmMTSF0Epy/R+kq9D8L1Z4hqVpxkCHU9tcGUWRTothsLwUf/VV0fc
         hX7P6xJX6prz8QTvT0vv6eEIE9B1D/wGfLCTDtiL+PBsOuJ1iLNPhM420SxF1Yl668nF
         4ip8gNOJBYZ3+RrhgY1B1ak4X99rctj3Fh49y/11xd6q7OETNR8swvaK9OKsy3lINd4F
         5c7EBEYI3CFagkY1v1DZG4rcLat7a5POPH48T/Air8R+8ESbwx/2Qx+1FeKqDnYgoju9
         0aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8YsXwgo3KPHwWcfe1EqRif6k6a8lufSqL4k1+GmC9Iw=;
        b=kuHi4daiue1Fz/GOrwXbmVZStmt+fGdRkRHy+BnyU4dFkx0FcqU1Nwlt7BrJgaE8eW
         MyiGpZJSIzyRIZ1QKVTpz0xSaCvVrcdiU7q2m4lfRnpClrUxY7bJzD0vKkohYxva/x1g
         /cHFuEFpLnVqARtf1UekZlXss9GsYgJrwsDJRAJJLBDf9kLMproar703kGLWtl0WRhyF
         CUSmwHMbqfbzgKeS4S9g9LV7GN7Oq1o6q2WSjt5r8eOJkzuIXZY69EkG9hVWhjMycWJv
         hJIxwWsgzs4wQICYcwaVpdST/lAWzOak6+4lomLjcksMyzuA+tfYhpRGWYfn0pyLhOS/
         hz8w==
X-Gm-Message-State: AOAM531zglM2j1XGN9milX4G4rUsgck7Z7vFVT9l75ebt2/Op8LFM2zr
        u5KlDxtFx6+OpfoGt4SgbIWgbRrWZIY=
X-Google-Smtp-Source: ABdhPJyQLKj57i7w5GaEn2Bz+SyKQPTqLHYtcRtXOkRuB6jh/iUfg2yXdzy4Vga6s0sT9Qa8nFo0gQ==
X-Received: by 2002:a05:651c:543:: with SMTP id q3mr490972ljp.6.1601352398288;
        Mon, 28 Sep 2020 21:06:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id p21sm3081470lfo.194.2020.09.28.21.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 21:06:37 -0700 (PDT)
Subject: Re: [PATCH 3/5] iommu/tegra-smmu: Use iommu_fwspec in
 .probe_/.attach_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@vger.kernel.org, krzk@kernel.org,
        jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-4-nicoleotsuka@gmail.com>
 <20200928075212.GF2837573@ulmo> <20200928221829.GB15720@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a38018a-3f95-74da-6dc1-270efc26a8fb@gmail.com>
Date:   Tue, 29 Sep 2020 07:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928221829.GB15720@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>> As I mentioned in another reply, I think tegra_smmu_find() should be all
>> you need in this case.
> 
> This function is used by .probe_device() where its dev pointer is
> an SMMU client. IIUC, tegra_smmu_find() needs np pointer of "mc".
> For a PCI device that doesn't have a DT node with iommus property,
> not sure how we can use tegra_smmu_find().

Perhaps you could get np from struct pci_dev.bus?
