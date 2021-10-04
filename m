Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FB4C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:24:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1BD8610A8
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 21:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbhJDV0a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 17:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJDV03 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 17:26:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF06C061745;
        Mon,  4 Oct 2021 14:24:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so78033362lfv.4;
        Mon, 04 Oct 2021 14:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y6CKjic+MhbQXzMyBA7YrYpbPkbHTokGzRhmbnDC1pY=;
        b=qnUpsdJkrMJsH2AGyxKNQpbqdA0VYA2pVdw7TTLVcg2QMCSHirIQ+ibrjV9OZsFz48
         vG1lT3qWktk5AR7G9w35q30XNXQ5x54HosTa+iI4Q727zVTQnGEKz46V/z+gna8L7k9v
         FvaYBlbaA2vh84bGHd2xGwNWU5T7XsakcIlvtjrs5bLoOsblpKJ9Ns02GZQHIyuoSIvX
         GoHFb3jmmCwIwVJJWmxLvJJ98P+aLa0YU1w3BM36t5vcny5S8Qefe+/cm0TysjgRo7Ag
         K8UjBFCG+nrhkEO6cIt1d2JAs3bLz7XVK8GwFMU3HcGsBY+xZXbIN4mkGbmafAdDQFzc
         XAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y6CKjic+MhbQXzMyBA7YrYpbPkbHTokGzRhmbnDC1pY=;
        b=ctx/eu/9m77HAMdw43BqxoJJ0pNiFT2E4mmZetyK9Qd08vKBCxTriR9OcaH3KJWUAx
         4+kUh/AGgNXCuZaJcp+jH1b6DlWKS6Taw2gRkdbVIupQAaN93e4JQscqq38vcAJSjbpS
         +J6PPvCmQvr5HzKqEiqri1ZFHvpqWaDF6ZcwaNoc2+MgX+Zpwu/qSFz9WcRgwgzuK08J
         bmxLbAZzlAHLzLPYksD3hmECI6nw51dxhyDGxpKPnqmHKJg5gzQRATAqP+6t1iUQyo5Y
         ZTrf4T9NksJ2aDAFPZ8i2+FYXZtJrxjM4BhHI1W40tpa+s9aBRAFWtxVzC29ww+A9HSR
         PfYg==
X-Gm-Message-State: AOAM531zlmdgZGMVALhRBw53s0BGQrSNjWFVBjan9/Jop0w5rP0cavk1
        4jj0NVAuEQtJZNCP5rHvLPQ=
X-Google-Smtp-Source: ABdhPJzK69LA/qULZaH06vujyoxbpKODuoq/Rv0LBiW8dmbnx2FiTv4tCUpcbkXhYAzPq4Az2ZFrUQ==
X-Received: by 2002:a2e:6e19:: with SMTP id j25mr18066041ljc.360.1633382678495;
        Mon, 04 Oct 2021 14:24:38 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id d13sm1708555lfe.21.2021.10.04.14.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 14:24:38 -0700 (PDT)
Subject: Re: [PATCH v7 4/7] usb: phy: tegra: Support OTG mode programming
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        David Heidelberg <david@ixit.cz>
References: <20210912181718.1328-1-digetx@gmail.com>
 <20210912181718.1328-5-digetx@gmail.com>
 <29ae631d-cc8d-663e-3ce2-db00f3470365@gmail.com>
 <YVtslrGXStvdO2IS@orome.fritz.box>
 <94949858-6089-06df-1226-f7974a3ae6bf@gmail.com>
 <YVtwqLlG8+S9cooU@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <99040137-64dd-2895-a90e-7b4478e97bec@gmail.com>
Date:   Tue, 5 Oct 2021 00:24:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVtwqLlG8+S9cooU@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2021 00:22, Thierry Reding пишет:
> On Tue, Oct 05, 2021 at 12:13:48AM +0300, Dmitry Osipenko wrote:
>> 05.10.2021 00:05, Thierry Reding пишет:
>>> On Mon, Sep 27, 2021 at 07:36:52PM +0300, Dmitry Osipenko wrote:
>>>> 12.09.2021 21:17, Dmitry Osipenko пишет:
>>>>> Support programming USB PHY into OTG mode.
>>>>>
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  drivers/usb/phy/phy-tegra-usb.c   | 198 +++++++++++++++++++++++++++++-
>>>>>  include/linux/usb/tegra_usb_phy.h |   5 +
>>>>>  2 files changed, 198 insertions(+), 5 deletions(-)
>>>>
>>>> Greg / Felipe, could you please ack this patch to allow Thierry to take
>>>> this series via the Tegra tree? It depends on the soc/tegra patch of
>>>> this patchset.
>>>
>>> Looking at the series, I don't think this necessarily needs to go
>>> through the Tegra tree. Given that you have backwards-compatibility with
>>> older device trees, applying this separately to the USB tree should work
>>> fine. Once the soc/tegra and DT bits and the USB bits get combined they
>>> should enable the new functionality, but nothing should break if things
>>> are applied separately.
>>>
>>> If so, I can just pick up the rest and let Felipe or Greg pick this one
>>> up.
>>>
>>> Dmitry, can you confirm that this patch should be applicable separately?
>>> If so:
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>
>>
>> This PHY patch has this hunk:
>>
>> +	phy->pmc_regmap = dev_get_regmap(&pmc_pdev->dev, "usb_sleepwalk");
>> +	if (!phy->pmc_regmap)
>> +		return -EINVAL;
>>
>> If this patch and the DT patches will be applied before the soc/tegra
>> patch, then USB PHY driver will fail to probe.
> 
> I had missed that. I was assuming that this other hunk took care of the
> backwards-compatibility:
> 
> +       /* older device-trees don't have PMC regmap */
> +       if (!phy->pmc_regmap)
> +               return 0;
> 
> but that's rather pointless given your check above, right? Why not just
> return 0 instead and let the remaining code skip sleepwalk configuration
> if the regmap doesn't exist?

Because regmap must exists if node exists.
