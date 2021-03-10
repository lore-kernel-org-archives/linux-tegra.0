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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58F9C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 22:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B49DA64FB9
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 22:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbhCJWTu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 17:19:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbhCJWTX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 17:19:23 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE184C061574;
        Wed, 10 Mar 2021 14:19:23 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id g4so12336658pgj.0;
        Wed, 10 Mar 2021 14:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=E86sp18F5ikuV/UL0w2a0I3kcFs8CycFV8c4Ty6/Z+c=;
        b=ia/Zj9LAVFb8I28l8N8lom02TthJY1cl4qOeRv6IGghY6RIuzROssWdgQVdM7VDJ6w
         pkdWWXAWMrctdIDwnKZ7knp9SbRZimD82zY3wvGSwZV28765yRGrHCKlx00Nm3KLP6+I
         PWVcy56Upi1PY2QzmdoUxJkcGoyHFkviDYvUFBsYovZkVINr4q/SuMyZeNOIYVcg2bcY
         v+q4ByklnjMzT7CHiEm02v99cAduL/PB8SnCDY8k5nnePz5sd6Q6trObkOatD4IEMGpF
         b8FwlUiIyDttX9uu75GcXxx9KxTLuOSs+qbVgMtTDnmhKd8hBfRx+Gs1zpXVgaoLsHne
         CdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=E86sp18F5ikuV/UL0w2a0I3kcFs8CycFV8c4Ty6/Z+c=;
        b=YJly1qlGAiPY5q0sZv0AijyT4o8xlfC4kv28TuqbYzt6GerYVdoOQgPo4sRHbNqaTl
         6NM08OMSXG/m+Y/rsdnc4zf4PIRILacE9TrhQ1ATG2Qco0nenOqDjQ7WNVhaJ1O/qDdz
         8j7piPckwfv0p3+zFzHp2D5BcQQNI8WI+MAyma6fsmV66jlw1Kf9N92w2VhXxnDUkKYf
         RiIkdgbrdzw4tAHNjX2gJubELM8rcv/X8gRylXWqo4EpSw610w2U4o0x5BWZkXZgOMop
         2AqDp+8IRKLs5kWQmlE/6ZJSsQ1dLccJkxVPtY+2BB/vu8deEGtGN3z2tq8fYafwbAxi
         0KvQ==
X-Gm-Message-State: AOAM5336xy0Ns5zDBtWG0Yp/CxNRM3+n2lPO4TLGy9coWo7O+8gNNc8F
        MY8YhNcsiWXbGOOslnKbq5E=
X-Google-Smtp-Source: ABdhPJw6xkncCkhOlZRPyeExcrrV/AKaFEqpDfYJc3/FYXqYmxJtQ5lSAXZkyIXQKeUcS31g3+4EMA==
X-Received: by 2002:a63:74d:: with SMTP id 74mr4536077pgh.316.1615414763327;
        Wed, 10 Mar 2021 14:19:23 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id g21sm477675pfk.30.2021.03.10.14.19.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 14:19:23 -0800 (PST)
Date:   Wed, 10 Mar 2021 14:17:07 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
Message-ID: <20210310221707.GB10431@Asurada-Nvidia>
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <a8a7a0af-895f-9d79-410d-5dd03ebbd6dd@gmail.com>
 <7714f272-3862-84ac-306d-86363a1c4880@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7714f272-3862-84ac-306d-86363a1c4880@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Mar 10, 2021 at 11:22:57PM +0300, Dmitry Osipenko wrote:
> 10.03.2021 22:13, Dmitry Osipenko пишет:
> > I found that this patch introduced a serious regression on Tegra30 using
> > today's linux-next. Tegra30 has two 3d h/w blocks connected in SLI and
> > only one of the blocks is now attached to IOMMU domain, meaning that GPU
> > is unusable now. All 3d, 2d and display devices share the same "DRM"
> > group on Tegra30.
> > 
> > Nicolin, please let me know if have any suggestions. I may take a closer
> > look a day later, for now I'll just revert this patch locally. Thanks in
> > advance.
> > 
> 
> Actually, this was easy to fix:
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 97eb62f667d2..639d5ceab60b 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -853,8 +853,6 @@ static struct iommu_device
> *tegra_smmu_probe_device(struct device *dev)
> 
>  			if (err < 0)
>  				return ERR_PTR(err);
> -
> -			break;

Hmm..I don't understand why this "break" causes problems on Tegra30.
The older versions that used _find()+configure() had it also, e.g.:
https://elixir.bootlin.com/linux/v5.9.16/source/drivers/iommu/tegra-smmu.c#L760

Dmitry, do you have any idea?
