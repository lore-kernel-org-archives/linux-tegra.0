Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F1FC433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 07:55:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78E036109E
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 07:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbhD1H4H (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Apr 2021 03:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhD1H4G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Apr 2021 03:56:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDBEC061574;
        Wed, 28 Apr 2021 00:55:19 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y4so57482758lfl.10;
        Wed, 28 Apr 2021 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WX2C9K/rZGHrnBX7tVRG+YyxtUpYTpR2TMwA0fbv/YQ=;
        b=X7DecJEnfQCN6j7lFWalCGADJ5DMcXgZOXSrOWDhTGfeJAFrIaYhaK/OoOmXXb3viP
         nVVHfu0sp49azDATLr6KZN9vCOdPgrca4af4zjpQii73wn3ltXPiKVdYpxIRly1ZcUiJ
         6209Ec6GCFxIbLapSPvySt+E6FVC+skrW92D9KxTsKbUGUHdIKx7A1PVlZSHHqR4v14d
         HCQRmiePwL4Q6H6g6RQZQhi6J/PZV+mg7e3V6HovhHso/PUOM9LaM0QWVfiijYIagKqy
         szvfN2qhUWpdOLOBRxNOUZeHWrj7vdyuutZh6/zHLDr2tO7PGX+/AwU4Sgg+LWsly6Nn
         YmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WX2C9K/rZGHrnBX7tVRG+YyxtUpYTpR2TMwA0fbv/YQ=;
        b=n/zznj6GWw8ZnmTpTGuB4jhp7nJzmPOg6o4jPqMrMX0tu5KGs1v9z9sj2tYhlAH7WG
         kCdu+srdVdyN7y/rWyErDE8g4R53wuZMmenffBG3/qUHUHFGEYhOxB5d+05+59uwtkmj
         lwRdX1kcLqpubrc7qF17UJOGQeFbps7uPj77BIS9G95qn4cL6fwq16djQYHoQ9MJlu6c
         j+BMwj1fiUao1dhXiYoGpnDE+RhsFHQn5XugcCzlQll+5m9/QA0IwXyiv11P/+Z8SHKv
         pVCRRH/vnTBxTeN8ki8FHJLuwBcAcUfI23FngLfmsf/Pm8+npejCQRJwvf3DGp5bAe90
         LajQ==
X-Gm-Message-State: AOAM533U5pecIzq1CdyjLM8Q3Bk+JqhBADBP/IArDF5aFzUFuF1q9nF/
        nJ2gaGKPC/5p4lBKds4feAVEH0e+XfY=
X-Google-Smtp-Source: ABdhPJweelqtW2hogGjJZKd3oZnRCoIBKRJHLxWfIJ42VERqo76+YhHyMix7AffEADMEcwEHqohMxQ==
X-Received: by 2002:a19:7119:: with SMTP id m25mr7026270lfc.511.1619596518315;
        Wed, 28 Apr 2021 00:55:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id b6sm526314lff.15.2021.04.28.00.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 00:55:17 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <b6d323e1-2e90-b031-60a0-3460644ea7a0@gmail.com>
 <ea842576-8967-03b5-6d6c-9e655d11b46b@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8fb43dff-1fd8-3bbb-86e9-19fb3064ec54@gmail.com>
Date:   Wed, 28 Apr 2021 10:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea842576-8967-03b5-6d6c-9e655d11b46b@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.04.2021 08:57, Mikko Perttunen пишет:
> On 4/28/21 8:51 AM, Dmitry Osipenko wrote:
>> 23.04.2021 19:32, Thierry Reding пишет:
>>> Note that there will be no new releases of the bootloader for earlier
>>> devices, so adding support for these new DT bindings will not be
>>> practical. The bootloaders on those devices do pass information about
>>> the active framebuffer via the kernel command-line, so we may want to
>>> add code to create reserved regions in the IOMMU based on that.
>>
>> Since this change requires a bootloader update anyways, why it's not
>> possible to fix the bootloader properly, making it to stop all the DMA
>> activity before jumping into kernel?
>>
> 
> That is not desirable, as then we couldn't have seamless
> bootloader-kernel boot splash transition.

The seamless transition should be more complicated since it should
require to read out the hardware state in order to convert it into DRM
state + display panel needs to stay ON. It's a bit questionable whether
this is really needed, so far this is not achievable in mainline.

Nevertheless, it will be good to have an early simple-framebuffer, which
I realized only after sending out the message.
