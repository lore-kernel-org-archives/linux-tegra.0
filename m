Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1514BC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 01:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D834364F90
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 01:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhCLBLt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Mar 2021 20:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhCLBLX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Mar 2021 20:11:23 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14625C061574;
        Thu, 11 Mar 2021 17:11:23 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id a188so746486pfb.4;
        Thu, 11 Mar 2021 17:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=len8ZpvjuLF/FJGoc7IvEqOQjvRf/2jHb7o5ovnWmEI=;
        b=VisY3iSkscvWgpDn9InykUTNJSqpd+5PEB9RDK8qU/cV5JXrhZLQgvTHV80u4OMogQ
         iYJNEdilkcSrlBWmsYTdKmiEWzQBOK3oSjNE/XeUjyeRuzhGnPdZCSUOHcUlNgJZCp8B
         tTU1eqKkMltcOC10Vlef5D2k4gRwypgSIlV+mRQMdWM0V9MzHIOcWZf2bOt1y9Z8mlcH
         M4gz+KkX/8UEJILzgjAO7o9Wo8uN8eQS+KFopw3brYhT4SVr9ZvWXs8FtETolyqmoJyv
         Ysl6PLbcUzG/Mquczw24TwSDsIrjjenhQtU5ROzsp+uuYNYKcQBdobaJ5uS3BNo05K1i
         4+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=len8ZpvjuLF/FJGoc7IvEqOQjvRf/2jHb7o5ovnWmEI=;
        b=XCEP58d2FTcoi5f2MMbuXRuX0yakInFBBSjniZW2r/F82LUw2DER1aExWDJxPo9hVN
         kPCQYS14hhtvA/DZBkDS3/sh3ipIAIYuRYYMM+3AuxQLIbcts6vGsNYkKJAsoCuJcF+O
         khFOUhz3mbddyve2H9EWYKddRA8AWWZH+RS2MYpwrK29TBSjc04Cik0rAxR+Wx3E4kA3
         4UtFb4BmGXnyCQ0PagQTqhN+ch9IRwtk+zxbzTfcyU0sqzZrEuTHwYXwWqT8Ew4L2oSs
         5w8ludWn2iCiYqMvOpbZLOOPShnj6Agl48Hh+oSIf8k9AIoPPJTSIA/TRZ6RlsvVU5FM
         nd2w==
X-Gm-Message-State: AOAM530SQCK0x6jAA6ofL+aFB3iBk+hife5UVjg5aKs59OVZZ2CJreaV
        A1sjvi8D5+y6D97xDLGwsoo=
X-Google-Smtp-Source: ABdhPJx81FiGrnhRgApowT9b1Q87JlXpg2kXtZZjr3VUxxMP549Ef3hYqOaKF0CQbxNxYSArH25++w==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr9364010pgb.110.1615511482601;
        Thu, 11 Mar 2021 17:11:22 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id iq6sm272746pjb.31.2021.03.11.17.11.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 17:11:22 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:09:05 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210312010905.GA29926@Asurada-Nvidia>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <a8a7a0af-895f-9d79-410d-5dd03ebbd6dd@gmail.com>
 <7714f272-3862-84ac-306d-86363a1c4880@gmail.com>
 <20210310221707.GB10431@Asurada-Nvidia>
 <8c2f5d94-8835-9994-21aa-660df29d383c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c2f5d94-8835-9994-21aa-660df29d383c@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 11, 2021 at 03:06:25PM +0300, Dmitry Osipenko wrote:
> 11.03.2021 01:17, Nicolin Chen пишет:
> > On Wed, Mar 10, 2021 at 11:22:57PM +0300, Dmitry Osipenko wrote:
> >> 10.03.2021 22:13, Dmitry Osipenko пишет:
> >>> I found that this patch introduced a serious regression on Tegra30 using
> >>> today's linux-next. Tegra30 has two 3d h/w blocks connected in SLI and
> >>> only one of the blocks is now attached to IOMMU domain, meaning that GPU
> >>> is unusable now. All 3d, 2d and display devices share the same "DRM"
> >>> group on Tegra30.
> >>>
> >>> Nicolin, please let me know if have any suggestions. I may take a closer
> >>> look a day later, for now I'll just revert this patch locally. Thanks in
> >>> advance.
> >>>
> >>
> >> Actually, this was easy to fix:
> >>
> >> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> >> index 97eb62f667d2..639d5ceab60b 100644
> >> --- a/drivers/iommu/tegra-smmu.c
> >> +++ b/drivers/iommu/tegra-smmu.c
> >> @@ -853,8 +853,6 @@ static struct iommu_device
> >> *tegra_smmu_probe_device(struct device *dev)
> >>
> >>  			if (err < 0)
> >>  				return ERR_PTR(err);
> >> -
> >> -			break;
> > 
> > Hmm..I don't understand why this "break" causes problems on Tegra30.
> > The older versions that used _find()+configure() had it also, e.g.:
> > https://elixir.bootlin.com/linux/v5.9.16/source/drivers/iommu/tegra-smmu.c#L760
> > 
> > Dmitry, do you have any idea?
> > 
> 
> The older variant of tegra_smmu_attach_dev() didn't use fwspec [1], that
> makes the difference. In other words, the older variant of
> tegra_smmu_probe_device() was already buggy, but the bug was masked by
> the tegra_smmu_attach_dev() that didn't use the fwspec.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.10.22/source/drivers/iommu/tegra-smmu.c#L476

Hmm...would you mind submitting a fix from your side? I think it'd
be more appropriate to do so, as you can definitely write a better
commit message than I can for this bug.

Thanks!
