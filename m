Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CF1C2D0A8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 493AC2074A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 05:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5GCeSEp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgI3FL4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 01:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI3FLz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 01:11:55 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3A2C061755;
        Tue, 29 Sep 2020 22:11:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so452612ljk.8;
        Tue, 29 Sep 2020 22:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rLwBsch1+w3pmAWJFs5DtFDJyLpowZ0+c2NUgy8bnXs=;
        b=m5GCeSEprGiDpHfi1VS3q22QiyOE2gFVXY3X32Hm2ec83A0n6RZ00T7c+/qFGIMHwY
         x+Puym/28gNgogutmTqBX4rkB4UjmJzUVIXE15Sbrn2sqTD+URXqGHKDRpJgF61y2ppg
         041DnlHDm90GsKWEBv4kYAlbaIHy581CdsGbgx2g1TTA027Ic4WwXaakvEoQsL5Qqian
         amomBfKWeKKRr5oj84PKUryv3ZTNWo9LnopBpeW596Vfp+7Y6KHApGZ/T9XqT4uh8D69
         XUtQChvpjIThUM04sA+tJ6HLWfsa844JL2KEeq+GkjD3WtBKNQohQsfbc4aBCjOPrJYy
         VnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rLwBsch1+w3pmAWJFs5DtFDJyLpowZ0+c2NUgy8bnXs=;
        b=FoQRxq9lZrIFG27/8Xy1HV6EVfiishA5GcMIATOWNOBYBIvdWSE6lEyeHRifzMLasA
         N8wz6i8B2sCgXuHlJmjZ+lAdwOmkmSNp8P6tTz/2evlSLZ1JbQI4Uj6SX5l6CQXpUSr3
         fuck6Eaj/ymBFdKflVIGmAxvdwfBnE4WMz2Pf7HK2CiYR5J71NGC7kQy40Ndivxk6VNs
         UW7uhAzhvo8NFKIIlyIL+Te/WMHix/YEjmyDUrKOvR6BbOmcb073exQcamS5VkytMzVn
         K3C+dlsMep+xAIAe0LI++QRax7G/mZJDxFOeJLVlkGwXsoMxpRrzJHn02/uGcNBRvSgy
         B1oQ==
X-Gm-Message-State: AOAM53399LevYnguD/qBhbgPFNMnNQ0vERtn22R3eOPFINi84+q0D3Cc
        GOOCUY3rk2Sn9EqOECo0rpn1dU0unwM=
X-Google-Smtp-Source: ABdhPJxWyMn8thmjGkZ8EmMO0wqHrJQj8NxdwNWM0AxXfLfuVFFIm63GXwGeOiyAEd98d86t10qEng==
X-Received: by 2002:a05:651c:1397:: with SMTP id k23mr341636ljb.263.1601442713758;
        Tue, 29 Sep 2020 22:11:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u23sm48284ljl.86.2020.09.29.22.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 22:11:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
Date:   Wed, 30 Sep 2020 08:11:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930003013.31289-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 03:30, Nicolin Chen пишет:
> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> +	if (IS_ERR_OR_NULL(mc))

tegra_get_memory_controller() doesn't return NULL.

> +		return ERR_PTR(-EPROBE_DEFER);

