Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D873C64E69
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 19:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 360D4241A7
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 19:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="cBcgUh+b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKQTJb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Nov 2020 14:09:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19320 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgKQTJb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 14:09:31 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb41ff50000>; Tue, 17 Nov 2020 11:09:41 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 19:09:30 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Nov 2020 19:09:30 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.9 000/255] 5.9.9-rc1 review
In-Reply-To: <20201117122138.925150709@linuxfoundation.org>
References: <20201117122138.925150709@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <f75bf0e521f0445dbe73fa5c5174b883@HQMAIL107.nvidia.com>
Date:   Tue, 17 Nov 2020 19:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605640181; bh=PbVcj/TZ4K/7lZL+3gO388+LVyLK1fjV4Rczv5fSmE8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=cBcgUh+bPJi1hXg/+Q5EL3sebmWXtheMIrVM+Zc/G1RborM5MhS6SS620wvR+hQr+
         zUOnZYEUeAhfOSz0l3B1GZGTM/TmDD1CFqHujIkCZIelkJVYtCXBzaEVKraXZucwBt
         MLYtCPIkaii0AXldXfXU+Qu+O/WRnW2mOxlFzTdbpQepdw2mxW/cFcZrdvcfojuDO7
         YWilEx6kYwYgPLptOZkTd9cYEYFEYODgA+Df30hcnJ5FjqpVJe6yesdCoekirfsyyy
         Hy3tAtIfcO27IcvnIn1Zi4/q5nV3NZCX1krysQBdnHDtPERVVBQ26qlL3FBSSoDCpD
         1VSHGc+Dn58/g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 17 Nov 2020 14:02:20 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.9.9 release.
> There are 255 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Nov 2020 12:20:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.9-rc1.gz
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

Linux version:	5.9.9-rc1-gfb1622495321
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
