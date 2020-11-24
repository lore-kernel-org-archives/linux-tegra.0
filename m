Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03458C2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 23:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D8E12076E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Nov 2020 23:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2hhMGNs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731233AbgKXXFR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Nov 2020 18:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731049AbgKXXFR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Nov 2020 18:05:17 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5ADC0613D6;
        Tue, 24 Nov 2020 15:05:16 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 142so234561ljj.10;
        Tue, 24 Nov 2020 15:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/KXHKT0QjGfRLZidy5/lA4rIw7B1CrKKa5AQMFx5E+o=;
        b=q2hhMGNsiRjmWE7ShOd1r2snZc9B66vAR/fONn6y58IpmTyCv8+hAiUnLmSKpnSTPd
         L8MAXgH6aNO/aLpS8wUiBCcuwG8jcZLxnsGMva4aUqNDjauM84UrjES/+o2f9MFJCO96
         61TTbyYBeD7KSNW8+0tu9c5FttT4YCwCbGFb94pCA3g4DO21TM14wpXV+v5zYKDhaNY6
         JUhdiElC+at3f7FowROvZZkgBSv5i0ps5FlHl+kTP0wrgPlDwF19qLX6QoCnqQj/ZCJt
         aAd3i9VLuoEADwTg79dLch3n2v26MltCBktsMz0/UapVncQPDTK/b2htk4hQx8DIwZ55
         1IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KXHKT0QjGfRLZidy5/lA4rIw7B1CrKKa5AQMFx5E+o=;
        b=Mi7/3aEVr/Egd/aJ5B39OqWOCQdBDgM36mMSK/r7bmrul0Qi3XCLZw0o8eHELhm4+p
         YGj4CK7hzCpKYbNrL6irPhFy48/tsjS0azQhrkF+sT551eTWBLC+c/VO0aElJEACDA/o
         WM26KCfpOQ78H6OZw8p671LMpFhkCrg0Z7hpmErNuOKcNCMUwXyom7evhSrVZ4IGszEl
         7s7BmIdq0IGJwO8OxiqzPJhlUVIYXfd8+JFLIZwEsvKBdi9e4Www78HcbAxkgnfBOtwv
         L8Pisk7I4007UsNLzaz+2LNaYfWgVd609ge7+vhr7DL7xR03cAPwx0C9PG/7+TZiAOmd
         wXBQ==
X-Gm-Message-State: AOAM532niqlQkhJpYwzu46qbtm2y2mayvzioajRxzNzkH73qab5KJB9Z
        ePGymfO4j+JrJTnsAL2sL0y28geh354=
X-Google-Smtp-Source: ABdhPJxpAqvUllZt+d+tRTNX9DTlqmrNB7dPwsBxupne7kCCr9F7wicJekI5L3d60wRQnhoZ4CbtHw==
X-Received: by 2002:a2e:878c:: with SMTP id n12mr211314lji.319.1606259115126;
        Tue, 24 Nov 2020 15:05:15 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id 141sm40313lfi.102.2020.11.24.15.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 15:05:14 -0800 (PST)
Subject: Re: [PATCH RESEND 0/5] iommu/tegra-smmu: Some pending reviewed
 changes
To:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, Will Deacon <will@kernel.org>
References: <20201111222129.15736-1-nicoleotsuka@gmail.com>
 <20201124212100.GA32108@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <68237d7c-12f7-3053-2e79-75b7e95f0af3@gmail.com>
Date:   Wed, 25 Nov 2020 02:05:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201124212100.GA32108@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.11.2020 00:21, Nicolin Chen пишет:
> Hi Joerg,
> 
> These five patches were acked by Thierry and acked-n-tested by
> Dmitry a while ago. Would it be possible for you to apply them?
> 
> Thanks!

Hi,

You probably should try to ping Will Deacon.

https://lkml.org/lkml/2020/11/17/243
