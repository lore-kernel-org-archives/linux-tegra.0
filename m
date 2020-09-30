Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA0AC4727F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94B5220754
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601457691;
	bh=WW8CAJWhJonVz80Z15S+f0UfVSWGlcSR9+MnjppwNVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=p/0dVb2pl/CihFHZVrC0NzriK1/SWMBEEqlkW11yy/9OV5SrqZg5I72918zkrfoYl
	 aplNIuakevUuEbsLcb7uKfthnDnwsCEmIKe+46Rlo/C/vVsctVAPlnN3k0sta/1cAu
	 QwUNtLsrCv9GjHmSgUYs71QSBp18RNe2hRUWS8HM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgI3JVb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:21:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727746AbgI3JV3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 05:21:29 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 687812075F;
        Wed, 30 Sep 2020 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601457688;
        bh=WW8CAJWhJonVz80Z15S+f0UfVSWGlcSR9+MnjppwNVE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D7bKfqTk7NZn7bGGx6g9rjABSHMAKQj8oaGfnwaAOaVdGURo/0X//nj2bfySKoahv
         kph+bbsNd6Ye+z9WtfBlwFUsWND1paKZ8FSYVDWv3xww1riXcp1E24Cqbn7nHQSkXL
         1wKpyifb4znNf9O6wr+4d81oz24PuWbz//k+ptlQ=
Received: by mail-ej1-f47.google.com with SMTP id u21so1777658eja.2;
        Wed, 30 Sep 2020 02:21:28 -0700 (PDT)
X-Gm-Message-State: AOAM531VUCLa24aurGD0LoZCUeFk1Fw0qz9/DFNdAI93tdD8+VWpYyxn
        sbC5CbatMMrBwvBFr1uHTiw2c5XRTVugLovzDEc=
X-Google-Smtp-Source: ABdhPJwdsZCPxNB8K7fSYTzc0yeFM/DWRSchSPzmJTZ1As6HEIyDEhVNDE4TT6Npkvzia8J28AdVSPLx8On9VyKD0u8=
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr1789347ejd.119.1601457686869;
 Wed, 30 Sep 2020 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200930084258.25493-1-nicoleotsuka@gmail.com> <20200930084258.25493-3-nicoleotsuka@gmail.com>
In-Reply-To: <20200930084258.25493-3-nicoleotsuka@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 30 Sep 2020 11:21:14 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeF8D0A6PGVbi_7RedO-DFd70sjGcJOjx-gCJ7Cd8k0YQ@mail.gmail.com>
Message-ID: <CAJKOXPeF8D0A6PGVbi_7RedO-DFd70sjGcJOjx-gCJ7Cd8k0YQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 30 Sep 2020 at 10:48, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Previously the driver relies on bus_set_iommu() in .probe() to call
> in .probe_device() function so each client can poll iommus property
> in DTB to configure fwspec via tegra_smmu_configure(). According to
> the comments in .probe(), this is a bit of a hack. And this doesn't
> work for a client that doesn't exist in DTB, PCI device for example.
>
> Actually when a device/client gets probed, the of_iommu_configure()
> will call in .probe_device() function again, with a prepared fwspec
> from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> in tegra-smmu driver.
>
> Additionally, as a new helper devm_tegra_get_memory_controller() is
> introduced, there's no need to poll the iommus property in order to
> get mc->smmu pointers or SWGROUP id.
>
> This patch reworks .probe_device() and .attach_dev() by doing:
> 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> 4) Also dropping the hack in .probe() that's no longer needed.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>
> Changelog
> v2->v3
>  * Used devm_tegra_get_memory_controller() to get mc pointer
>  * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
> v1->v2
>  * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
>    with tegra_get_memory_controller call.
>  * Dropped the hack in tegra_smmu_probe().
>
>  drivers/iommu/tegra-smmu.c | 144 ++++++++++---------------------------
>  1 file changed, 36 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 6a3ecc334481..636dc3b89545 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -61,6 +61,8 @@ struct tegra_smmu_as {
>         u32 attr;
>  };
>
> +static const struct iommu_ops tegra_smmu_ops;

I cannot find in this patch where this is assigned.

Best regards,
Krzysztof
