Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B877EC2BA57
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889336023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442244AbhCCDbu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:50 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5289 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349618AbhCBSI5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 13:08:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603e6b850003>; Tue, 02 Mar 2021 08:44:53 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 16:44:52 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 16:44:52 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <jonathanh@nvidia.com>, <f.fainelli@gmail.com>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.9 000/135] 4.9.259-rc2 review
In-Reply-To: <20210302122224.437443882@linuxfoundation.org>
References: <20210302122224.437443882@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <129f6e0fa5044d57a4d313800e561d30@HQMAIL111.nvidia.com>
Date:   Tue, 2 Mar 2021 16:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614703493; bh=b11B/caSEEJDDC4qQCCSnQlf/I2qS7UZG3EHL0s5N3w=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=cykcIqfX+3j9h3KVek1DRxpUoaTQObi4K/yzs7E4AqDqKwapdSa+9UGPw1nCLA97u
         iTHK8Q/zlXgxOEjv+R0bCj0sDLZIhJfql7tWd+VPlfHGfvgzQk1VTOSsu7pOnWv718
         mOfiuMQSSxuRKSKMD0qzr9vF23Sodyay1TzgcYCv8vE4ePM1XvjjLwlFaGxCS10JOn
         NN1xLC6btcbxEzC42qN540K6InJ4NgO3rryew2CvxKlbtY1Zcqa4xLa4acoKrV+YgI
         DwN3MvujdfQfJogKrZYh6H8WPskwiaEWTomNrraVfcwzocXwKZNRT2VGOBXadgC7HJ
         YqhMv14nr4/Mg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 02 Mar 2021 13:26:32 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.259 release.
> There are 135 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 04 Mar 2021 12:22:00 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.259-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    30 tests:	30 pass, 0 fail

Linux version:	4.9.259-rc2-g5fde7b797e1e
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
