Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9BCC1B0D9
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 15:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45D272370D
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Dec 2020 15:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgLGPEr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Dec 2020 10:04:47 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8107 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgLGPEr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Dec 2020 10:04:47 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fce44670000>; Mon, 07 Dec 2020 07:04:07 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Dec
 2020 15:04:07 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 7 Dec 2020 15:04:07 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.9 00/46] 5.9.13-rc1 review
In-Reply-To: <20201206111556.455533723@linuxfoundation.org>
References: <20201206111556.455533723@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <c2df6c0f5b0249f781ba3f08bb98ec95@HQMAIL101.nvidia.com>
Date:   Mon, 7 Dec 2020 15:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607353447; bh=mGGu3044exJX36R3+t8MOX4OSRupUnrp1N+tEtt4B70=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=fYhMUuS0eos0rKjRQrKB2UOXdSZkERcAzd1ukffX93V5EYQ2LYx74Y4afFWj9ydQ7
         zvYiTuHN6Wd/yJAvU0y4CkVdrfxMAxCRpRllL5zsMQiBESqBKIfioNd5kyt3pQop/5
         eOjuTZz/7Vn+p0UgawTJ+YS73TzdYeEgBwofSUuMiu92tF3ApNMx40Q1vwdGxM7NSh
         uPA2rrAo3KCaKD7fMfje9Qwu8LHILuj/YYTWQc2QqXGxUkt3Gty7wuNX+CfBAcOJOY
         j+62uymT4aLIHu0bsPDHzUEuGGUVL9ReqTUSlEHQdxHLxmOQkPnlw+bAr1zvTCLqLl
         3ljt19i6tT/DQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 06 Dec 2020 12:17:08 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.9.13 release.
> There are 46 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Tue, 08 Dec 2020 11:15:42 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.13-rc1.gz
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

Linux version:	5.9.13-rc1-g1372e1af58d4
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
