Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D97DC433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 19:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2354322CE3
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 19:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="OYFWe1J3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgHETwz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:52:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14231 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgHETwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 15:52:49 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2b0e030000>; Wed, 05 Aug 2020 12:52:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 12:52:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Aug 2020 12:52:48 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 19:52:48 +0000
Received: from [127.0.1.1] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 19:52:40 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.7 0/6] 5.7.14-rc1 review
In-Reply-To: <20200805153506.978105994@linuxfoundation.org>
References: <20200805153506.978105994@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <440f4b49e2aa48b78d5880f3a31b00c3@HQMAIL107.nvidia.com>
Date:   Wed, 5 Aug 2020 19:52:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596657155; bh=hh+zZVXHnmYWoCkVpx2fsOopK9Kg1W/5RT0T2XpsFNg=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=OYFWe1J3brt3N/ENJiPZ7IFzpl1Nns48F/MWj02S9a2j8VI0YuwjHSSZIZKDFqy0l
         XZ4aE88noEsNXYD2sHzJY+JDmKR3cvD9YWWG7rnG9D1JVrPlunQDdildnc2gsLTkOu
         8SnHvvrNhpCUO4K16e5ps02yx7AJaRCCQcztiDmaB9XQUf1Oy+7rVxJan/lWkfrsjq
         BgqbcTvh6KR/RmCQEKRDBijvxnbiX3lcMpUCjQ0N0RJJ2owz12JQxGrC7iqc0APczt
         B9OSIRsudrPen+zVwmX0teDNj+4iiJd+jOP4ZCvj2F72dUAZ1ElDnyCqGW8+guveFz
         6lDRw3Lq3cdiQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 05 Aug 2020 17:52:27 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.14 release.
> There are 6 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 07 Aug 2020 15:34:53 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.14-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.7:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.7.14-rc1-g3bd8d605f0dc
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Jon
