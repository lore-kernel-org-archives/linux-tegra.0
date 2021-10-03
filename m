Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30112C433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 005CD61AFE
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbhJCBLq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 21:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbhJCBLq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 21:11:46 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C6CC0613EC;
        Sat,  2 Oct 2021 18:09:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g41so54632063lfv.1;
        Sat, 02 Oct 2021 18:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KL2m0atW+MByUv6kMnNyCu2PrRqSFhE88TBSkVne3g4=;
        b=ChvU3NevUHYp7Y8UvD1/YwslSDB0USOcafs2NG0qcs0FpxQuNdFGz1nVXMZWpNLhpz
         1ETJ9zEEj7fq1pZXwDLifCWR/uxcSA39Tsh1GxWAqsLP+MNIddW+/MDnzFqXomviuWsH
         NOpUhwL9sSTaCAeTqbWqoEXhq1wbT01JeUFDgKO+JKCHxDhm1YbLwPA79miL8tcLx4XQ
         6t3YbqavHseHzxD5lNX1lH2WgKpxpzb+gR3ixffWDGzRzv17itPMXW0Ukn2sDRHWp+qe
         cBeF9+NH8IZqgUq3+Rg7ApzjBncnM4Hq3fAEe1Jte/4UbBMhvdqDyx4G/sr5ZE9OOqRr
         IuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KL2m0atW+MByUv6kMnNyCu2PrRqSFhE88TBSkVne3g4=;
        b=WFgfSyx1DElWBKFfD9gsjZDo8LcXpzyxJH9FEIVJOjZgVxj7Rh5zOPN1pWi+gEdk0z
         xAL44BfMXjFIiVJR21uqnDy5ySVeEh8qUQ2DAd8H9I0UHSQBx6bLnCZdbtdtbSnh2djj
         N/7ccYUAn9Xgf8wkdIznXvLfNosd1LDsLCTvV9D9dbsloGXvlgZfC4g6LF9z+PDducsB
         c2TNrZl8Aqn0Z+49UHNglJbDroz4Z6H0aZk4J586JB+LVkomrQ4ED3D6m1wRQsHKignJ
         Quntozz7xr4uUb9GmcTF3Wbtc6w/BIzILgxGTbWkmaLFovFsq4ICTI2ktFuBB7frTBHW
         sbjw==
X-Gm-Message-State: AOAM5312Eji5gXEmkHHTtJg3xi1j+/hbx8sjAtth4gdJ02sQxWtEkkbf
        ktKTnuIAG/BLIdZHHb6WAGNdbZHkM9k=
X-Google-Smtp-Source: ABdhPJyWhowAQ6wydaGMvlQZlA4N9YwldP5r8sEgUQMxAi5EEVbL8nzqF95qboSgC/QiWNHvCUt+ig==
X-Received: by 2002:a05:6512:238b:: with SMTP id c11mr6305581lfv.321.1633223397122;
        Sat, 02 Oct 2021 18:09:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.googlemail.com with ESMTPSA id n22sm1087665lji.139.2021.10.02.18.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Oct 2021 18:09:56 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <95e4c23e-4700-ef7e-d8ae-17693b65e121@gmail.com>
Date:   Sun, 3 Oct 2021 04:09:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 19:32, Thierry Reding пишет:
> I've made corresponding changes in the proprietary bootloader, added a
> compatibility shim in U-Boot (which forwards information created by the
> proprietary bootloader to the kernel) and the attached patches to test
> this on Jetson TX1, Jetson TX2 and Jetson AGX Xavier.

Could you please tell what downstream kernel does for coping with the
identity mappings in conjunction with the original proprietary bootloader?

If there is some other method of passing mappings to kernel, could it be
supported by upstream? Putting burden on users to upgrade bootloader
feels a bit inconvenient.
