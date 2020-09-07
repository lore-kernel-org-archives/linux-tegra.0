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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73FC43461
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57ABA2145D
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Sep 2020 19:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="UodgoEny"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728834AbgIGTaw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Sep 2020 15:30:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9273 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgIGTav (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Sep 2020 15:30:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f568a370000>; Mon, 07 Sep 2020 12:29:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Sep 2020 12:30:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Sep 2020 12:30:49 -0700
Received: from [10.26.73.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 19:30:48 +0000
Subject: Re: [PATCH 5/9] soc/tegra: fuse: Extract tegra_get_platform()
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-6-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <51bf8b18-495e-5675-3feb-4ba5bcae4cdc@nvidia.com>
Date:   Mon, 7 Sep 2020 20:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716141856.544718-6-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599506999; bh=9C+JD0AF55GBbjW1rT2wVVNXWeMOPHXb/T9PiTFUe1Q=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UodgoEny+kvOFwY9UvN1d+CC7xA36RB8ZIduCf881PhlNmMQ4berBJpubBwnEfH5F
         oz8Jxdj8h978P1n9D3xVlcKnao3EaP5weawYbiCIQz9TPL4r+1+viJWHRRhuJrPMi7
         SP886e6VldRdBgzly425DE36GIdgH/MTViyWoVuMb8rnoGHfsEjSD0dbLa8tG3liaC
         X4WIjcG79j9iaamU4c2cPXiq5xm2e6XYdakeyb1sTbcdi/Wr3zsA9T8Uf3cL5lDBC4
         M3h+30uUABEPm4jMZhvkjsom/UtHKUKIntT+Nk40E4MTIMGyZBcFm5sjQWMwxu2Pup
         j7qRhl0i8xpiA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 15:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This function extracts the PRE_SI_PLATFORM field from the HIDREV
> register and can be used to determine which platform the kernel runs on
> (silicon, simulation, ...). Note that while only Tegra194 and later
> define this field, it should be safe to call this on prior generations
> as well since this field should read as 0, indicating silicon.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c    | 2 +-
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 5 +++++
>  include/soc/tegra/fuse.h               | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index d1f8dd0289e6..7e6b6ee59120 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -336,7 +336,7 @@ static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
>  	 * platform type is silicon and all other non-zero values indicate
>  	 * the type of simulation platform is being used.
>  	 */
> -	return sprintf(buf, "%d\n", (tegra_read_chipid() >> 20) & 0xf);
> +	return sprintf(buf, "%d\n", tegra_get_platform());
>  }
>  
>  static DEVICE_ATTR_RO(platform);
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 3cdd69d1bd4d..89f1479b4d0e 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -47,6 +47,11 @@ u8 tegra_get_minor_rev(void)
>  	return (tegra_read_chipid() >> 16) & 0xf;
>  }
>  
> +u8 tegra_get_platform(void)
> +{
> +	return (tegra_read_chipid() >> 20) & 0xf;
> +}
> +
>  u32 tegra_read_straps(void)
>  {
>  	WARN(!chipid, "Tegra ABP MISC not yet available\n");
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index 1097feca41ed..214908fc5581 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -23,6 +23,7 @@
>  
>  u32 tegra_read_chipid(void);
>  u8 tegra_get_chip_id(void);
> +u8 tegra_get_platform(void);
>  
>  enum tegra_revision {
>  	TEGRA_REVISION_UNKNOWN = 0,
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
