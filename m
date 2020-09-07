Return-Path: <SRS0=rvI8=CQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E202C43461
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E05ED2151B
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="nJEgAsMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgIGTjk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Sep 2020 15:39:40 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8320 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgIGTjk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:39:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568c6d0000>; Mon, 07 Sep 2020 12:39:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:39:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:39:38 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:39:37 +0000
Subject: Re: [PATCH 7/9] soc/tegra: fuse: Add Tegra234 support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-8-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6ce08a40-24ec-7fec-efdf-652f220430e9@nvidia.com>
Date:   Mon, 7 Sep 2020 20:39:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-8-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599507565; bh=irbQhR1/l7PqaEG7hcPcWO+4Azuji93vy4gwc+Fdomc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=nJEgAsMfi10DQg+ZiSjQk1Q6Wbohyz4Z0YVSkkuKXb02jlu6t0ngnmJO0fE+2X9ns
         21yxlbv2AA6HQ4THo3g3EokDZBatKz9gglnbLm4nSIGipIXeaJEzE2sHhFy/lbN/Jx
         DUX15B/OnnOZoNRpT9LNvTy8yckKQRIHeI1erAx5aWQbkBEFNxZb3HLWejAuN1Ff8J
         Cxy9w/XOLe0Hpta9m8bCNWHxMLKEfxbZlDBm5MX9FNpe7JrCAcbNywsfVlwk25s/jd
         wPzPYu9AFFIYHGQaRb8cIKCw6tM0+0akrre0Rx1DUfk4fbbKCR3xXMU3r46oDwtu6H
         VYe5xpRWJ2SmQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add support for FUSE block found on the Tegra234 SoC, which is largely
> similar to the IP found on previous generations.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c    |  6 +++++-
>  drivers/soc/tegra/fuse/fuse-tegra30.c  | 30 ++++++++++++++++++++++++++
>  drivers/soc/tegra/fuse/fuse.h          | 10 ++++++++-
>  drivers/soc/tegra/fuse/tegra-apbmisc.c |  1 +
>  include/soc/tegra/fuse.h               |  1 +
>  5 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 7e6b6ee59120..94b60a692b51 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -49,6 +49,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
>  };
>  
>  static const struct of_device_id tegra_fuse_match[] = {
> +#ifdef CONFIG_ARCH_TEGRA_234_SOC
> +	{ .compatible = "nvidia,tegra234-efuse", .data = &tegra234_fuse_soc },
> +#endif
>  #ifdef CONFIG_ARCH_TEGRA_194_SOC
>  	{ .compatible = "nvidia,tegra194-efuse", .data = &tegra194_fuse_soc },
>  #endif
> @@ -326,7 +329,8 @@ const struct attribute_group tegra_soc_attr_group = {
>  	.attrs = tegra_soc_attr,
>  };
>  
> -#ifdef CONFIG_ARCH_TEGRA_194_SOC
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>  static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
> index 85accef41fa1..9ea7f0168457 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra30.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
> @@ -356,3 +356,33 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
>  	.soc_attr_group = &tegra194_soc_attr_group,
>  };
>  #endif
> +
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +static const struct nvmem_cell_lookup tegra234_fuse_lookups[] = {
> +	{
> +		.nvmem_name = "fuse",
> +		.cell_name = "xusb-pad-calibration",
> +		.dev_id = "3520000.padctl",
> +		.con_id = "calibration",
> +	}, {
> +		.nvmem_name = "fuse",
> +		.cell_name = "xusb-pad-calibration-ext",
> +		.dev_id = "3520000.padctl",
> +		.con_id = "calibration-ext",
> +	},
> +};
> +
> +static const struct tegra_fuse_info tegra234_fuse_info = {
> +	.read = tegra30_fuse_read,
> +	.size = 0x300,
> +	.spare = 0x280,
> +};
> +
> +const struct tegra_fuse_soc tegra234_fuse_soc = {
> +	.init = tegra30_fuse_init,
> +	.info = &tegra234_fuse_info,
> +	.lookups = tegra234_fuse_lookups,
> +	.num_lookups = ARRAY_SIZE(tegra234_fuse_lookups),
> +	.soc_attr_group = &tegra194_soc_attr_group,
> +};
> +#endif
> diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
> index 9d4fc315a007..e057a58e2060 100644
> --- a/drivers/soc/tegra/fuse/fuse.h
> +++ b/drivers/soc/tegra/fuse/fuse.h
> @@ -115,9 +115,17 @@ extern const struct tegra_fuse_soc tegra210_fuse_soc;
>  extern const struct tegra_fuse_soc tegra186_fuse_soc;
>  #endif
>  
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
> +extern const struct attribute_group tegra194_soc_attr_group;
> +#endif
> +
>  #ifdef CONFIG_ARCH_TEGRA_194_SOC
>  extern const struct tegra_fuse_soc tegra194_fuse_soc;
> -extern const struct attribute_group tegra194_soc_attr_group;
> +#endif
> +
> +#ifdef CONFIG_ARCH_TEGRA_234_SOC
> +extern const struct tegra_fuse_soc tegra234_fuse_soc;
>  #endif
>  
>  #endif
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index be6b7fc169ca..6aeac5ea2d70 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -56,6 +56,7 @@ bool tegra_is_silicon(void)
>  {
>  	switch (tegra_get_chip_id()) {
>  	case TEGRA194:
> +	case TEGRA234:
>  		if (tegra_get_platform() == 0)
>  			return true;
>  
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index a9db917a1d06..c702bd2911bc 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -14,6 +14,7 @@
>  #define TEGRA210	0x21
>  #define TEGRA186	0x18
>  #define TEGRA194	0x19
> +#define TEGRA234	0x23
>  
>  #define TEGRA_FUSE_SKU_CALIB_0	0xf0
>  #define TEGRA30_FUSE_SATA_CALIB	0x124
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
