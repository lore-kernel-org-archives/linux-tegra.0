Return-Path: <SRS0=19fU=CZ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AC7C433E2
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 08:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EF8C206BE
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Sep 2020 08:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YnjMbtdc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgIPIRl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:17:41 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18487 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgIPIRh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 04:17:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f61ca130000>; Wed, 16 Sep 2020 01:17:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 16 Sep 2020 01:17:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 16 Sep 2020 01:17:37 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 16 Sep
 2020 08:17:36 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 16 Sep 2020 08:17:36 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <pavel@denx.de>, <stable@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.8 000/177] 5.8.10-rc1 review
In-Reply-To: <20200915140653.610388773@linuxfoundation.org>
References: <20200915140653.610388773@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <4784c765af9d4be98276fb717f77d756@HQMAIL105.nvidia.com>
Date:   Wed, 16 Sep 2020 08:17:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600244244; bh=Exg2Y1NRIO4GLRqHAzGnxDtPmc5H1dI5vPo8hZiUTiw=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=YnjMbtdctND+xCSBjgdt9kbQomfndcUC5CDy4XDq03VfWSPQzZCrrcPiwaIGn+Lce
         Tg9AVLeet9bIQv4ETgE1YshBzwNzfExu+NR9YXxWFBjDHbzGhSYoaKBQHaz0PZjCed
         HAGq1wN13VQeF5J4o3Wf1UtSRigHYBmt08FtRnrgban+nGh4+w1rXdeXCTIUghfHg3
         oSVncJPV0mcP/DruOdODebJHOO9m6nVkk7ICxNewrGSE/puZVaO4GF429qeyMvAU4n
         2KL89ZOcnEoEAzuX0mAKQQU3m4FH8M7Yp8GP5adQUhOIV6w478hI3tkj1Iwnt6jlfL
         3Tm9vsnH7SRYQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 15 Sep 2020 16:11:11 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.8.10 release.
> There are 177 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 17 Sep 2020 14:06:12 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.8.10-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.8.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.8:
    14 builds:	14 pass, 0 fail
    26 boots:	26 pass, 0 fail
    60 tests:	60 pass, 0 fail

Linux version:	5.8.10-rc1-g337aafeeb4cd
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
