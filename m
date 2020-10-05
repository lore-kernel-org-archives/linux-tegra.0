Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0EEC4363D
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E93452078E
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pgk0M12g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgJEJiY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJEJiY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:38:24 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A415C0613CE;
        Mon,  5 Oct 2020 02:38:24 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y2so10015533lfy.10;
        Mon, 05 Oct 2020 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QsaBfZFa2dvXngI+qikBeYVIehcnUn/8wXHfmURCQEA=;
        b=Pgk0M12g2DtRJ1kAa1PGSelgbsxYQlS2lso0eKSxlD4N1cVf5e20H+glqExrxAqrUI
         9Nf6vAtoA4YEhEfnQnopMNWK72mArJ5RrpqbeYqVmC6P3cX5k744sYEV/PS5FqaLm7OA
         +wiU38Q3ioB+Hm6EiKqGBN9sGquqVgdGhu4XY7IEDQE6DZnfkat7Pt7hrcf+7xAJet9n
         MlATvl5Cj2DSe+EVz0BzED9ODORqqYSsjRWGTATd2sLePQt+qYY4A14HXi1mX07cXfrL
         umwgYoAWFk7Nm+x7gWS7G8Z2sS/3sxzTuNxWDEu1qQNknleKhir7JYA2xNJNWoXbxVID
         uCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QsaBfZFa2dvXngI+qikBeYVIehcnUn/8wXHfmURCQEA=;
        b=rtayqCpsNSgLmYo3+73qSPPETv/f50j7/AnN+qlne0qtDsVoCiAi8B5cxVtSi7nTtL
         c/nLuXje/xOMNe3KCy8MCFm1zMrt1eBGPd+cufqS/rtDh/FElTfVGmi1mvHfQNHCp/47
         96+/TApwJaUpUAEM/HAB739IOuE2Uh8DYSwWf+AoIBi3g0MOk2wBzH/7kmG0cLIX7s/K
         j5Wbx/ivX3p2uM8atdg2U3vUmRMSHXN0XTGX3YIB2MaFX09ra7P2R9ciW75oNXe6S+Ig
         WNqcNuYsaEjPubnC80QO/LYVX2D1b379pCbSJDImZ0VgUCAurBksbvHD5xx9YvVINsvM
         +YTw==
X-Gm-Message-State: AOAM531xAXWXtGVVKl2H4lLjtvYXjGYkWDR0Dvwas19V1UWVf9NZtWMi
        D6Xfks6+zg0vonc2UP/BrCLZGx3n8N4=
X-Google-Smtp-Source: ABdhPJw9nOUB2K6tl/E249a5ebviDASlcj91s9oVh68i6PWqDc7YsQuI0RDXL8DV8yyicewQ2Gaj0w==
X-Received: by 2002:ac2:4c88:: with SMTP id d8mr5071687lfl.428.1601890702324;
        Mon, 05 Oct 2020 02:38:22 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id n3sm2627012lfq.274.2020.10.05.02.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 02:38:21 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
 <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
 <20200930164707.GB3852280@ulmo>
 <35115ac1-fb25-7226-7b50-61193669e696@gmail.com>
 <20201001075811.GA3919720@ulmo>
 <4dbf5bcb-76af-53c5-31cf-880debbcebf3@gmail.com>
 <20201005091610.GC425362@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1adede6e-ecbd-eea4-bd40-4969cd8719cc@gmail.com>
Date:   Mon, 5 Oct 2020 12:38:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005091610.GC425362@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 12:16, Thierry Reding пишет:
...
>> I think you meant regmap in regards to protecting IO accesses, but this
>> is not what regmap is about if IO accesses are atomic by nature.
> 
> Then why is there regmap-mmio?

To protect programming sequences for example, actually that's the only
real use-case I saw in kernel drivers once. In our case there are no
sequences that require protection, at least I'm not aware about that.

>> Secondly, you're missing that tegra30-devfreq driver will also need to
>> perform the MC lookup [3] and then driver will no longer work for the
>> older DTs if phandle becomes mandatory because these DTs do not have the
>> MC phandle in the ACTMON node.
>>
>> [3]
>> https://github.com/grate-driver/linux/commit/441d19281f9b3428a4db1ecb3a02e1ec02a8ad7f
>>
>> So we will need the fall back for T30/124 as well.
> 
> No, we don't need the fallback because this is new functionality which
> can and should be gated on the existence of the new phandle. If there's
> no phandle then we have no choice but to use the old code to ensure old
> behaviour.

You just repeated what I was trying to say:)

Perhaps I spent a bit too much time touching that code to the point that
lost feeling that there is a need to clarify everything in details.
