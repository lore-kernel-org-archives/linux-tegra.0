Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F18C433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Mar 2021 22:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0BAF6146B
	for <linux-tegra@archiver.kernel.org>; Sat, 13 Mar 2021 22:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbhCMWzB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 13 Mar 2021 17:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhCMWyS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 13 Mar 2021 17:54:18 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B5BC061574;
        Sat, 13 Mar 2021 14:54:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so12485591pjq.5;
        Sat, 13 Mar 2021 14:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZeQpfKGikM556gB312kKuWrZWMdYA+ch/LZuyQT8OHk=;
        b=Id27IwZD3Ma6UhBAhLw0/YI2T2aivdYncTisogUPgE8BfvcVqm0Bu1tHUIlkVa65Dd
         EFbZOcNYK9EA7iVE4NuajCxa18r0Yra2Q6r4ufGugGCbx6AregeCKThvgJUyzM1sSxo3
         Ean/kUTHHtm5mRmZ4vekDBycT+u3r2Nya2UMgYJWQNnmCbkgwTRFpYqXXu1sW1rsTmb+
         8Gm983leCcS/FvwiH1coThkX5LLWCiIAGdlDfw46l8w7Pdez9YtCekixZyG4oSI/HqnE
         zQZDzZb42wQBvSbWoPnlCdOJS0kytfU6plIHZ+R6Y7laK1nUKB3joVZ1C3mhc+bqdVF1
         CVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZeQpfKGikM556gB312kKuWrZWMdYA+ch/LZuyQT8OHk=;
        b=Qxyg+IG90z3VEAV7/UXpl962D0wArVi2Khh3nBTVG9bnjvk0ikO8sA/uPjAE42/RIm
         jSdZEORCazOkYq3/hIFEQAfWn1hP44YCcemamEHqn7Hpl+cESvAgtUjwjGlyk5M7V+dF
         Jgxd9uYFJ0hbWxlonft8QExckXlfJGRrlearO18BwBqiMH8UBX2kPISv+wHo7OqA1iNf
         ura9GaCpjVZwrXVuAYfibOYVgOKUdHcqL/V4LDvRJLW4v4DuxUq/4ERjXaH7F79Zop3B
         RU0QqYbaOwPPuDhurItI0Tq9/vsyGYPujxWeayW/6Ge+PeeyZON/U57hRZvEcYiY+147
         DyNw==
X-Gm-Message-State: AOAM531KmNREhy8oWBcCdEA7J3xBoRU80zJFN6NIq63eagwjU/KlLFVT
        XxlM0kA8cZPuRo3fjVkzyCejkShfS/YwFA==
X-Google-Smtp-Source: ABdhPJxR84SoyhWXQcST6ZnPVDKAV8GImHbNh21zVWQYvUvEVGxbpfSU7ZSLBVBEzhDd7SLl2iE2Jg==
X-Received: by 2002:a17:902:6bca:b029:e2:c5d6:973e with SMTP id m10-20020a1709026bcab02900e2c5d6973emr4890259plt.40.1615676055681;
        Sat, 13 Mar 2021 14:54:15 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id n9sm5865620pjq.38.2021.03.13.14.54.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 14:54:15 -0800 (PST)
Date:   Sat, 13 Mar 2021 14:52:00 -0800
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] iommu/tegra-smmu: Make tegra_smmu_probe_device() to
 handle all IOMMU phandles
Message-ID: <20210313225159.GA11402@Asurada-Nvidia>
References: <20210312155439.18477-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312155439.18477-1-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Mar 12, 2021 at 06:54:39PM +0300, Dmitry Osipenko wrote:
> The tegra_smmu_probe_device() handles only the first IOMMU device-tree
> phandle, skipping the rest. Devices like 3D module on Tegra30 have
> multiple IOMMU phandles, one for each h/w block, and thus, only one
> IOMMU phandle is added to fwspec for the 3D module, breaking GPU.
> Previously this problem was masked by tegra_smmu_attach_dev() which
> didn't use the fwspec, but parsed the DT by itself. The previous commit
> to tegra-smmu driver partially reverted changes that caused problems for
> T124 and now we have tegra_smmu_attach_dev() that uses the fwspec and
> the old-buggy variant of tegra_smmu_probe_device() which skips secondary
> IOMMUs.
> 
> Make tegra_smmu_probe_device() not to skip the secondary IOMMUs. This
> fixes a partially attached IOMMU of the 3D module on Tegra30 and now GPU
> works properly once again.
> 
> Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
