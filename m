Return-Path: <SRS0=aXVp=B3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F21C433E1
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Aug 2020 20:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7A3A2065D
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Aug 2020 20:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Vd9ENPRb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHQU4D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Aug 2020 16:56:03 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14524 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQU4B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Aug 2020 16:56:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3aeea70000>; Mon, 17 Aug 2020 13:55:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Aug 2020 13:56:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Aug 2020 13:56:00 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Aug
 2020 20:56:00 +0000
Received: from [127.0.1.1] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 17 Aug 2020 20:55:57 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.8 000/464] 5.8.2-rc1 review
In-Reply-To: <20200817143833.737102804@linuxfoundation.org>
References: <20200817143833.737102804@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <f865d474bc8248228a23673edf84f6be@HQMAIL105.nvidia.com>
Date:   Mon, 17 Aug 2020 20:55:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597697703; bh=ON2fCnVjXZfuCB2uSBI5S1WQwRBl6/Wajk0dMCBSs3E=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=Vd9ENPRbAjI98Vda6VUuQyhh4vCfQh1UrAc5BUJlTx6//YcelMWTehNr0e59zGdAD
         qczH3e+jBL84kzi0r/wkOWAKFWPb+kQPQmhfEbeGIf/D4fc9dwHZ3MfYzpQ1n9HgPf
         MHH6eXNEMLXAzGPqIQytIJxPd6yfS6tTp3ibCxgRT9FLHgkL+e3IAFme92VbGA+D3g
         xf+IhvfkL51vcDMxAeBjukOZSJRj52JxjdkuHki1KOCBXMj7nJOJXDwhdFuMa1tJZ1
         oCjxcek/Gob+7pe2v1uSeuukPi4a/ivIHkhrmhok1lIX8hGsaf5IeTQJD/yYQgDh7N
         CRD/cDWQGHgjg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 17 Aug 2020 17:09:13 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.8.2 release.
> There are 464 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 19 Aug 2020 14:36:49 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.8.2-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.8.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.8:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    60 tests:	60 pass, 0 fail

Linux version:	5.8.2-rc1-gd74026bb5bef
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Jon
