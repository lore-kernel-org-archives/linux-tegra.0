Return-Path: <SRS0=aXVp=B3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B80C433E1
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Aug 2020 20:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 948862065D
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Aug 2020 20:54:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="l/jZvnAb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHQUyz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Aug 2020 16:54:55 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14384 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgHQUyy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Aug 2020 16:54:54 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3aee650002>; Mon, 17 Aug 2020 13:53:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Aug 2020 13:54:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Aug 2020 13:54:54 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Aug
 2020 20:54:54 +0000
Received: from [127.0.1.1] (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 17 Aug 2020 20:54:51 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 000/270] 5.4.59-rc1 review
In-Reply-To: <20200817143755.807583758@linuxfoundation.org>
References: <20200817143755.807583758@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <4ae9f7f4a2014e609587ff125fb7a4aa@HQMAIL105.nvidia.com>
Date:   Mon, 17 Aug 2020 20:54:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597697637; bh=yOSSmMX+PxKYNLe13sSsvs2QXl9i88QH9GNg+EqfOFE=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=l/jZvnAbgTjfF5xTaB2AXlvxr9p2nk5g5lk2pf1Qwj2NhlPJZjDMFe8foHj03vw/D
         6PzjS7lwdm+fo4i+IhwmfAYGXZ19lOaIQw7j+s/ZSBgdoFgubWTUEBxlAxBY2EW5N1
         wRFeiRFhsJi96iKm01yrX12lLv3X1rLjri+CobzIa0cFCxP07DVmxEi+PK53DAP5KV
         8FnIS/GiEsx3v90pCHO430jgxry2qd/pqHiFnBwtoAZhAR/Re8Bmr3BuVvJ/UKVY8o
         AFQBuZNDXTYmLIPjx2XaanCgl3I8oOt6VVDuHMxV+QaV2zqaCPBCRE6rbs/+TKjb7A
         bHS9JdhAv2Ddg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 17 Aug 2020 17:13:21 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.59 release.
> There are 270 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 19 Aug 2020 14:36:49 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.59-rc1.gz
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

Linux version:	5.4.59-rc1-g6982f544144f
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Jon
