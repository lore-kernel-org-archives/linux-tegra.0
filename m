Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCC1C6379F
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 20:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BB3D20731
	for <linux-tegra@archiver.kernel.org>; Mon, 23 Nov 2020 20:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="eOu7W+qj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgKWUyU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 23 Nov 2020 15:54:20 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5296 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgKWUyT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Nov 2020 15:54:19 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fbc21810000>; Mon, 23 Nov 2020 12:54:25 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 20:54:19 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Nov 2020 20:54:19 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 00/91] 4.19.160-rc1 review
In-Reply-To: <20201123121809.285416732@linuxfoundation.org>
References: <20201123121809.285416732@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <a1026257d8624ef4935fa4aca05cdbe5@HQMAIL111.nvidia.com>
Date:   Mon, 23 Nov 2020 20:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606164865; bh=w614CUnnjZgNf4zocdNiUejUlHUjXSL1ZG2O6fHpQ3U=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=eOu7W+qjj4coJeJPZeZ8hP5ytoF8N/srZmsrxnNfPfIUO4Btzgz4t7CBQR4r5V977
         igVWwbkDioXnqJqSi9On9D9wv9cvUN+zINzzWDsSDgHcDhSPfy2Q/jaH6iCO0Xl73+
         XsQ94c2/AhLRfAaxGwIVf9AwPJWHYlMEEYo0VvmpI4dDWUbzoHVH/MAnxWipPfRz81
         DXbPE815hezj2WNfsnkQ39NcP2brgoMBzmpGrMaRXQgxFJCIz9ZcCvFycfvPDBPWdZ
         f8KVAg14M2uLWCu9ZXUDeFyYBMKvxesjorlnAcepI/59MjB6zfSsgmNVnX3LrHbero
         sDlq1OEqdW1Ng==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 23 Nov 2020 13:21:20 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.160 release.
> There are 91 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 25 Nov 2020 12:17:50 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.160-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    15 builds:	15 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	4.19.160-rc1-g6f94b70fe8f9
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
