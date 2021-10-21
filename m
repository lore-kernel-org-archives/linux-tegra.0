Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AD0C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD91604DA
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 21:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhJUV5y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 17:57:54 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:8121 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232021AbhJUV5x (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 17:57:53 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Hb1WD08yCz6R;
        Thu, 21 Oct 2021 23:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1634853336; bh=6csxCuz1kr9C+uMndLSTwSrGXfiVLf7UG+RAN5kMi18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZNLBtizdfizXmbnqRgyLuWVFJqh4sVO+KGwEmv64Cbgc4TuRtMyUuB4XffFLsKsNH
         cAq/rgWguqUErt3+nlha6LSQnDI+8FmyuBwmNErt3L+GOCpOzqkk7YkQznZikVHV/d
         DKDY09d2+kDgnDsCDYdCS0q6nGyJNielShyP05UZlnhfmQ8Omr0+alVbb1Kk0bnhwI
         Z5+/i0rj+FHVGI56fDYO+P5FPRKP7DxSPZ06KNRgbADjTgayBATPE0OKdMzAdYWyyS
         PzcSAPZs+aeB4Sub8MOTEAabVSxOAvq75jlyDYJbBWRB0soc4dpPem/c9bIVIDyyay
         dX2usiqf37C4g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Thu, 21 Oct 2021 23:55:34 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] soc/tegra: fuse: Fix bitwise vs. logical OR warning
Message-ID: <YXHh1lVCzVnyTiZv@qmqm.qmqm.pl>
References: <20211021214500.2388146-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021214500.2388146-1-nathan@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 21, 2021 at 02:45:00PM -0700, Nathan Chancellor wrote:
[...]
> --- a/drivers/soc/tegra/fuse/speedo-tegra20.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
> @@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>  
>  	val = 0;
>  	for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
> -		reg = tegra_fuse_read_spare(i) |
> +		reg = tegra_fuse_read_spare(i) ||
>  			tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
>  		val = (val << 1) | (reg & 0x1);
>  	}
> @@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>  
>  	val = 0;
>  	for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
> -		reg = tegra_fuse_read_spare(i) |
> +		reg = tegra_fuse_read_spare(i) ||
>  			tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
>  		val = (val << 1) | (reg & 0x1);
>  	}

It does seem correct, but nevertheless the code looks suspicious. reg is
already masked with 0x1 as far as I can tell, and there are other places
which depend on this (like speedo-tegra210.c). Guessing from the use of
tegra_fuse_read_spare() I would recommend changing its return type as it
is returing a bit value, not necessarily semantically a boolean.

Best Regards
Micha³ Miros³aw
