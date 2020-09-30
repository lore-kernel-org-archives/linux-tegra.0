Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C083C4727E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DE472076B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1T+AylV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbgI3Q3Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Q3Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:29:16 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5ACC061755;
        Wed, 30 Sep 2020 09:29:15 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id q8so2909059lfb.6;
        Wed, 30 Sep 2020 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EzyR/YDvIXijh7swdghsNAKpiZabsqY73hYX4hLjUIE=;
        b=T1T+AylV3LaBdXGum8XogqJ5vyJFo3xWcikbcOxdE0TLIX6SqttUe4NyGt/ld4prn9
         8wTS1+lPzoSyQqJVYd+HqpB4JBxQ/ICiaxplsEHSaXOXT8mqHyamcwo0JfwEFU+FQDci
         sQ4TznKGY+WOj2jETSBczukppjIvT4m1nI1rQvL6Aa2knn5Q+6WO3mVFHZjY44MINvOU
         w6ERL8FnhVgRkkG53TqEECvrTxdyPO5GSbpjZAoeRKhoR8HlxsqVeh+01ZvFTeFHmArJ
         ljFohIBGkNZk8M12rb3XcqY4dxULnZEiR1M4R/STY3QS8sfvB6BgZRi4/IFeWNOb90uj
         uW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EzyR/YDvIXijh7swdghsNAKpiZabsqY73hYX4hLjUIE=;
        b=leeXdyTdIrRFl6/DuP2w8Y+4n7oIKfVAXaZ/7cS5NdoFnkOX8Gfdquktvo7upCKwBs
         88Y3vMPWHT0dy1KsKZmzfG+badffM7xphugF11ypIp8VQcOD5o+HgBGuiPThlcGVBaPN
         FO63aV/E7dsP2VqB53Tx64b30lVKMBnmvpG8/VrB4bQHsz73+pRJs00Y49lyFIWK71mQ
         4lvV8qOaOhDA23jypeL5Cm3z7XC7k0ZnVF2au/391oeP8oWQfL2Tb/wudkyTd3XambHm
         pcLey8arperDOl5GhtS+3PF9Q6COWwNl6cWKChyV4DgWPSh5GpKSF2PMzST8XIKLZHyy
         akkA==
X-Gm-Message-State: AOAM532/rV9Ownm/AjCZz//B1XShIYegCJRNErn0/eYrCSAPHM60aOTi
        9DGN/a62S5ts20U14FQ8mzBSGOqDnVI=
X-Google-Smtp-Source: ABdhPJy/XbDWHR4hfmk8+U5h3ZueC5w/GyTS/H7hzhmzAV+DwLsuai3Wmfi3eX7rtx5fxS75BHBHTw==
X-Received: by 2002:ac2:489b:: with SMTP id x27mr1242052lfc.242.1601483353973;
        Wed, 30 Sep 2020 09:29:13 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m1sm245883lfr.32.2020.09.30.09.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 09:29:13 -0700 (PDT)
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
 <20200930161033.GE3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <36946786-38c5-54d4-07f5-2407c39aa01c@gmail.com>
Date:   Wed, 30 Sep 2020 19:29:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930161033.GE3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
>> Secondly, I'm already about to use the new tegra_get_memory_controller()
>> API for all the T20/30/124/210 EMC and devfreq drivers.
> 
> Also, this really proves the point I was trying to make about how this
> is going to proliferate...

Sorry, I'm probably totally missing yours point.. "what" exactly will
proliferate?
