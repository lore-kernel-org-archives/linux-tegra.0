Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BECC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8599620759
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 15:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6IOemkM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgI3PxL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 11:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgI3PxK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:53:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B869AC061755;
        Wed, 30 Sep 2020 08:53:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y2so2740561lfy.10;
        Wed, 30 Sep 2020 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mUwr9+gr81AndshD5M4T6IEzStnM7KASijNGjOtwSAU=;
        b=k6IOemkMPjMAZCxLD1plzkMzJIDp4Dnbg88BPVOkT0Jd9tE3Hf1TfMM79+G4iVJf8t
         3oOavS4iHLKxRFGGnZI9RpRynmzN26ZPwAlE3nydZsbI3hMEvp6NX2rNaBZn3VRsa58p
         iSLO/n4TUXOuQ+Q6pHmP8dPCJfkcON+2yS9XIVsv6OTx5Xwfb51ADZfzKIFNLjMXNgC8
         AeBcMQchDka68QuNwVvQWQpBipsP6dKOIm/7LPvGjKQKV4hPgP3+J1nOpGwa9ZUU2MN8
         6qI2/zlVKVlVu83ML9EAiwvKAfxeoUhAdlMEO2v/Oivo4Dtil/zOe/dpNQ0e67qkPjcG
         uiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mUwr9+gr81AndshD5M4T6IEzStnM7KASijNGjOtwSAU=;
        b=ETk/ROtEa0KwAaeolnZtJlgeCJuOiPRquaHIPWOzpoQyZg7S/BBHQttuWFllWNMtV9
         ajHXT66OGHrS72rW0zIaJaDW50euhQ+/iHiMUKTk9j5QjrKsL0u+foIkIt7JccfGctez
         /C9GJzxTwbZ44PwWkfWhyZ15mXBmPsi15p0GfaKrv/q9wKQ3SlMCg8eQ7skbprYyD5IW
         yzsF5B0LefMUyc8FS0jOtoO2+C+QRATOtQL9Tid37NHRAN9Ihb4JLPrVywp0OpbtCeXH
         k014wJSgZxUrLCFPrarhPdt9kpBMEXVDdr9vxFI01+zbPTBG+XUVZgqV73A6L28CDsj9
         Z66w==
X-Gm-Message-State: AOAM531eHoilNbWKC6aORnBdpMYbV6K532icF8h1S5JOmgJ5v+JSsqQF
        isaiXfFZK1yUkrt9d+8bhk2tvcFKwTI=
X-Google-Smtp-Source: ABdhPJyynUROFkkXXDxzOL7zf+zV1pt1xWJJ4N7Stf4816L1rkJCjSAR2Qo9oTxetc+foSv+CBeNiQ==
X-Received: by 2002:a19:f50e:: with SMTP id j14mr1183122lfb.426.1601481188014;
        Wed, 30 Sep 2020 08:53:08 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id g26sm191627ljl.116.2020.09.30.08.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 08:53:07 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
Date:   Wed, 30 Sep 2020 18:53:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930152320.GA3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 18:23, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> Multiple Tegra drivers need to retrieve Memory Controller and hence there
>> is quite some duplication of the retrieval code among the drivers. Let's
>> add a new common helper for the retrieval of the MC.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
>> ---
>>
>> Changelog
>> v2->v3:
>>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
>> v1->v2:
>>  * N/A
>>
>>  drivers/memory/tegra/mc.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
>>  2 files changed, 56 insertions(+)
> 
> Let's not add this helper, please. If a device needs a reference to the
> memory controller, it should have a phandle to the memory controller in
> device tree so that it can be looked up explicitly.
> 
> Adding this helper is officially sanctioning that it's okay not to have
> that reference and that's a bad idea.

And please explain why it's a bad idea, I don't see anything bad here at
all.
