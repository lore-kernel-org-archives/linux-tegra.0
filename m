Return-Path: <SRS0=69DC=C7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA64C4363D
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 06:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71EC223A32
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 06:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YndjtCdC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgIVGqx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Sep 2020 02:46:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18216 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728278AbgIVGqx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Sep 2020 02:46:53 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f699d7f0000>; Mon, 21 Sep 2020 23:45:19 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 06:46:52 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 22 Sep 2020 06:46:52 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <pavel@denx.de>, <stable@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 00/49] 4.19.147-rc1 review
In-Reply-To: <20200921162034.660953761@linuxfoundation.org>
References: <20200921162034.660953761@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <179f740de39b45a2a785643febcf9dac@HQMAIL111.nvidia.com>
Date:   Tue, 22 Sep 2020 06:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600757119; bh=816KtrnpyWdnlqYk7hXKJKOYUNY99FBovdJlG/1J/Yo=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=YndjtCdCYsRSDvPRB15NSjU1TnWkpy3TBuHbgQuH5jsJ37tZgL9x1ke8Xtnh7jgTz
         kuEyN86AnKJD9vZphIFfTUFkfjEpINcgoB9jKDcO6FNJRLm2g7fEG/WeZWA7LwRbux
         h5/z5w0W4w/Z0gjZNCuXYLo/DIWtHwOPLic0Q0hV9IJcf5Aee9X0h/5QnnxtXRX19X
         eO4KdCFkp4P/HtHEDnpZJWFlsd/hmAKlJxWMa1ORnqNllDGmc8Kyy8+5Lao/PVWyXz
         nBajJQ8KJCBNvMH4HHdhmfv3R+ZJScWlfH6vj/Fg5I8IOgcGwZZdTr2nWqgB3zZy2U
         otWiCiD3WDUGQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 21 Sep 2020 18:27:44 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.147 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 23 Sep 2020 16:20:12 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.147-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    14 builds:	14 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	4.19.147-rc1-g20031549a4cc
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
