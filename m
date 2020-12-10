Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84618C1B0E3
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 21:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4228323E25
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Dec 2020 21:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393923AbgLJVFn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Dec 2020 16:05:43 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16947 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393944AbgLJVFm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Dec 2020 16:05:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd28d740000>; Thu, 10 Dec 2020 13:04:52 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Dec
 2020 21:04:52 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Dec 2020 21:04:52 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.9 00/75] 5.9.14-rc1 review
In-Reply-To: <20201210142606.074509102@linuxfoundation.org>
References: <20201210142606.074509102@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <11690fcb20d24c01825bddeb0676b471@HQMAIL107.nvidia.com>
Date:   Thu, 10 Dec 2020 21:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607634292; bh=ZnVjnkhwVW99KTkkGLRm6xroyoe1JX8MR2NcHDIteZE=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=rYUy2ZtOLMcmJZCHqn2mOf/lCLJy0DEzt0PmfvEda+Yrg1Jbp+Q3114zhxpESzKgL
         dvS0oV8dUHCuS0mpl9GEV23uwiet68WWdMQBJMyAW+JCeGvfz856xznciOW3PDilth
         98SgDYG1j7hWiv9d+bBiJLTdl46qelxvPYj6gNgfuWouLCc1nNwQ7Rmo88PwA+mZPD
         8V1TLeIlksAt9DiKaA2Czx04bakk0hLWpv6uqC2B2HxLUvHgAiK6usJ2BMRBZ8S4+w
         UzCKhZtNL6GP6ZQzxuqzgQb+mLZraxUcfDPVPVxDrIaU5ReKqAYM//OV2GBtk45Avr
         /9ZqUDDFBmI3g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 10 Dec 2020 15:26:25 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.9.14 release.
> There are 75 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 12 Dec 2020 14:25:47 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.14-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.9.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.9:
    15 builds:	15 pass, 0 fail
    26 boots:	26 pass, 0 fail
    64 tests:	64 pass, 0 fail

Linux version:	5.9.14-rc1-g81beabff31a7
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
