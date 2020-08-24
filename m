Return-Path: <SRS0=inwd=CC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BD1C433E5
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 18:09:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B39220738
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 18:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="DpIvJC9z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgHXSJM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Aug 2020 14:09:12 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18663 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbgHXSJD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 14:09:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4402300003>; Mon, 24 Aug 2020 11:08:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 11:09:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 11:09:02 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 18:09:02 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Aug 2020 18:09:02 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 000/109] 5.4.61-rc2 review
In-Reply-To: <20200824164737.830839404@linuxfoundation.org>
References: <20200824164737.830839404@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <e99644a0afd94f6ca9fdde5b60565adc@HQMAIL105.nvidia.com>
Date:   Mon, 24 Aug 2020 18:09:02 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598292528; bh=TaC0OTFgU0X6yYN7xZhmHRkXl99SkoUNTxrPWGpgXYg=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=DpIvJC9zNRAbb5M+xW7UA+57r6t2WWUYv3EzqE7hRVLucHLMRVGfkUXCqsFNnU37v
         KMnYd9Tr5ax5Bl7XOzvuDmTvaMlPOjbodP344uWJB1lkjBS03STbX3ktgzXhTOVDh7
         shqP/TjqdKBNsSG5OIhm6xhymuhP8qeg67agjg/AfGz4aKN5P2dANYEEMGyrFV/0bw
         J3IA0wgSBdv1QuGl2uUj3aRG1oVzu5dhbGAcxFrMwhbX5zeSXcAQOKtthwtlnkbfY/
         hdssxAuOM4hw4TBd+Cpp5mAH+33ZQHGpEnYDJKYAdctmKkh7YOS45AuJJVQ/usrXpj
         /wtHMMe7ApJyA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 Aug 2020 18:48:46 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.61 release.
> There are 109 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 26 Aug 2020 16:47:07 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.61-rc2.gz
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

Linux version:	5.4.61-rc2-gd3dbec480949
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
