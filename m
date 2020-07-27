Return-Path: <SRS0=ucTN=BG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9437C433EA
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Jul 2020 14:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FDAB20719
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Jul 2020 14:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="gElEtOy+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgG0Oqi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Jul 2020 10:46:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4095 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgG0Oqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jul 2020 10:46:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1ee8730002>; Mon, 27 Jul 2020 07:45:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 07:46:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 07:46:37 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 14:46:36 +0000
Received: from [192.168.22.23] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 27 Jul 2020 14:46:34 +0000
From:   Thierry Reding <treding@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 000/138] 5.4.54-rc1 review
In-Reply-To: <20200727134925.228313570@linuxfoundation.org>
References: <20200727134925.228313570@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <3691e600778a4141abf15dae058f2d14@HQMAIL105.nvidia.com>
Date:   Mon, 27 Jul 2020 14:46:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595861107; bh=eJtxZTBHCO4uodmZQIC2v88r7TMdFB4VijSmLXiyYqQ=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=gElEtOy+6wqoR0B7TVKpdz4r7ubkktrj10WYY4xtdYQqnFvlFk3R6ZnEIuqiFamxI
         q1ktAGs/wMb0lloXJAm4A093dl812uzJHUQf5C4tHC+MCqfSJze9j5GgseYYxaT28f
         PEULMCnxNMMprgQSckEAGyMKEuU3aNQ3f723cJbMkzpg/iogdwd7D2rpKMhk0OCIjH
         uSX8aYiHbH0y5p4OS6QJCSvwBcu8YTJc5zum4WHl/5e7pxphwu79UEazyw5648R5ET
         egoF0IsRLQRe6gfx+UMm/OQZ9+vhonoe24yLYds/vt/8o23dmXNwuAvX3pretBSRR6
         ygFqihunjvByA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 27 Jul 2020 16:03:15 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.54 release.
> There are 138 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 29 Jul 2020 13:48:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.54-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.4:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.4.54-rc1-ga41a538926d2
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Thierry
