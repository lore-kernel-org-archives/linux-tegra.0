Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737D3C433DB
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 05:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DB8064EE2
	for <linux-tegra@archiver.kernel.org>; Fri,  5 Feb 2021 05:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhBEFYY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 5 Feb 2021 00:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBEFYY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Feb 2021 00:24:24 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F04C0613D6;
        Thu,  4 Feb 2021 21:23:43 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id j11so2965166plt.11;
        Thu, 04 Feb 2021 21:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sfENSTnpSvaaqxS0nyqOketbMxXz6Eoy2Sb6irXF6Ww=;
        b=QpQYF0aU1rxGPUixZZamHAnkD9B21kAa/09eNDGJnYGTxHOwckNTo4aBK1egPOlLmX
         e0wnjFUq1j9MS7x0pL36qJgiPJkky+XwmQUktHLLKR5cK/xHJPcFn1wg2TX4xme62YhI
         5hUvGsm0OkVNrpLD+SjuQDoIxeqLnknV0MvGRAh8P7C8PbwJ7UQ2KHPhlCCmc0c7oIlE
         xmITs7GqMtTsaK4xAqdD1/pjml3GifmzQ9YfvFyBgy/0+Bc/VVCGmPxIuYcwM0i37udy
         HgyqdUwwERQoWIM1/F2rLg8Uq3ugCUJGMDm3vq5xp9eQepnhIY7aZlu5vnTiWQcXHV/O
         3Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sfENSTnpSvaaqxS0nyqOketbMxXz6Eoy2Sb6irXF6Ww=;
        b=EpBbQtU0A+jMeHKIG2fcuqOhCxIfoxnSPcq8ZHU/1SJxPBi+KW6cpQzEcsccIkhEn8
         GhIe2lphiY0tXPRXZqbPIg+rU5krfcqBaHtiOfLJrBOVsWIzTQ8seAAvaVY/A/flPf4O
         KtpQyZPkx4jywWni3u2OppPbD0qx6/pi83N/i9Jg1w7vcwFqCbjJ92ShXK2Vv+rNy96n
         f8vqItKllG1+qfOM2mPnlTaLv7jWYN8mLfC3/Q7nIHT2OMkypYxH5HEpk/J/TWYCXvnJ
         XX/++pNTl/RfMUAwfXa1Mz1mJ8S9zakXwJfUHpGqSJykh7SkfyhDKr3hdeHU9Zjw4Sak
         JY5g==
X-Gm-Message-State: AOAM532hxYvbUX7qdHLWwo8aF1tpDnTpcvWSXFg2AZUFkM5srEp/y3Vk
        qb+bvvCpWTdUjLN8f1zrxaM=
X-Google-Smtp-Source: ABdhPJyCHSZ3KR2xex3trBm5CIiMra/bpXGjzKbC+RDrfpbh/w8A2mGfeQjgetzChiucOyaDkDioyg==
X-Received: by 2002:a17:902:d886:b029:e1:7784:4db5 with SMTP id b6-20020a170902d886b02900e177844db5mr2612899plz.72.1612502623404;
        Thu, 04 Feb 2021 21:23:43 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z184sm4470833pfz.157.2021.02.04.21.23.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Feb 2021 21:23:42 -0800 (PST)
Date:   Thu, 4 Feb 2021 21:24:23 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     will@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com,
        joro@8bytes.org, kernel@collabora.com,
        Dmitry Osipenko <digetx@gmail.com>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
Message-ID: <20210205052422.GA11329@Asurada-Nvidia>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Guillaume,

On Thu, Feb 04, 2021 at 11:10:15AM +0000, Guillaume Tucker wrote:
> Hi Nicolin,
> 
> A regression was detected by kernelci.org in IGT's drm_read tests
> on mainline, it was first seen on 17th December 2020.  You can
> find some details here:
> 
>   https://kernelci.org/test/case/id/600b82dc1e3208f123d3dffc/

Thanks for reporting the issue. We did test on Tegra210 and Tegra30
yet not on Tegra124. I am wondering what could go wrong...

> Please let us know if you need any help debugging this issue or
> to try a fix on this platform.

Yes, I don't have any Tegra124 platform to run. It'd be very nice
if you can run some debugging patch (I can provide you) and a fix
after I root cause the issue.

Thanks
Nicolin
