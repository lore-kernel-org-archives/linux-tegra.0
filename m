Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718E1C433E9
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 18:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 493E664F4B
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 18:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhCOSxp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 14:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbhCOSxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 14:53:13 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC569C06174A;
        Mon, 15 Mar 2021 11:53:12 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a1so17507272ljp.2;
        Mon, 15 Mar 2021 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v2HjbGIhGvuWN/p4wjJ96KHLGD4o/ABRVFbl69eEBO8=;
        b=K198jd8GCrMhGQV9zHTqbNijO9zf7hECliU2GYTo/l1yBT48UGhVAoSMrAYZOdidSR
         xL9r3gSdZzY62O/15Jac0+puQ0X4IIdemWdotS5KqAyzXnVFVpyHJDTrEJTNRteemBIh
         cnIFpJzmNnfaOaU2OevoS6zWzDFL20smLwAojHiU4RppLAcatpcpyWrov06OJZPXGrV8
         WkYTND0+aNAxRbUantlOmxsS+ZHgfValm+k5J/rzAxXkO0eEaUrqZsuYiOi0/04vNmKi
         aS6V/tdU0TRbkt4v6vJpR0drVnH04yp3UC6+TB16K6aFlWX0JH0NJLL+1ofkmuXquoiB
         w0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2HjbGIhGvuWN/p4wjJ96KHLGD4o/ABRVFbl69eEBO8=;
        b=Rr91BYgj+UZX7Qabz0hA73pbyzD9pyzBNEnfe71cbzGkcS9A7V1p14y+22S+Oimdqs
         LI9Ji+rfTSf7U6DJ9BkG4SLmfJXxaXg/AzwRwxK2bcVWlKv/BlM24vXQT68l1tS5d0d9
         BI3ohLalz/iGAKtYXAodnwzMs6HW8OFb/myKISEkXJa5GY62BKQwltCnpugQnZ43dOPz
         FrZryfEazpgOTTzamfxJEs3GrzJ1oiNhxAwLpzxLmu1siy4Id43CloUn41SOJcd/yjcg
         iUTEgqaQuaIt+EqxiBKvwFI2V9crCMEhLLhCHlcbhBeCspzyiR80MIDSefQVufqmrZv4
         1wTg==
X-Gm-Message-State: AOAM5300Cic5XMuD9mkLP6eu7cJ8zBAuQLXOcyTLyUCNFySZGPcEbFft
        KuoDHion9f3a6fqJksIvVJVMU2zxt0U=
X-Google-Smtp-Source: ABdhPJy6jYga547W+kZ7ssngsB7IOF5Ki+SxAtWST/8lNgbHXrv8fNeEegpch9MQwzZE9m7KN0eocw==
X-Received: by 2002:a05:651c:339:: with SMTP id b25mr263022ljp.406.1615834391036;
        Mon, 15 Mar 2021 11:53:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id f9sm2764475lft.242.2021.03.15.11.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 11:53:10 -0700 (PDT)
Subject: Re: [PATCH v4] iommu/tegra-smmu: Add pagetable mappings to debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        thierry.reding@gmail.com, will@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210315033504.23937-1-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c57a805a-cf14-1d78-ae2a-dfce4f643db1@gmail.com>
Date:   Mon, 15 Mar 2021 21:53:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315033504.23937-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.03.2021 06:35, Nicolin Chen пишет:
> This patch dumps all active mapping entries from pagetable
> to a debugfs directory named "mappings".
> 
> Ataching an example:

Attaching

> 
> SWGROUP: hc
> ASID: 0
> reg: 0x250
> PTB_ASID: 0xe0080004
> as->pd_dma: 0x80004000
> {
>         [1023] 0xf008000b (1)
>         {
>                 PTE RANGE      | ATTR | PHYS               | IOVA               | SIZE
>                 [#1023, #1023] | 0x5  | 0x0000000111a8d000 | 0x00000000fffff000 | 0x1000
>         }
> }
> Total PDE count: 1
> Total PTE count: 1
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

Good to me, thanks.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

> +	for (pd_index = 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt_page;
> +		u32 *addr;
> +		unsigned int i;

Unimportant nit: I'd keep lines arranged by length for consistency with
the rest of the code.

...
> +	group_debug = devm_kcalloc(dev, soc->num_swgroups, sizeof(*group_debug), GFP_KERNEL);

Another nit: this is a long line, I'd split it into two lines to keep
coding style consistent and to improve readability for those who have a
side-by-side code viewing setup.
