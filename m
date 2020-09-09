Return-Path: <SRS0=dOwp=CS=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63412C43461
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 07:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D72B21741
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Sep 2020 07:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="LLhbOeZu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIIHEB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Sep 2020 03:04:01 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1048 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgIIHDt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Sep 2020 03:03:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f587e1a0004>; Wed, 09 Sep 2020 00:02:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 09 Sep 2020 00:03:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 09 Sep 2020 00:03:41 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 07:03:41 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 9 Sep 2020 07:03:41 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 000/129] 5.4.64-rc1 review
In-Reply-To: <20200908152229.689878733@linuxfoundation.org>
References: <20200908152229.689878733@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <eadf7da653a5478db79984fca131448c@HQMAIL101.nvidia.com>
Date:   Wed, 9 Sep 2020 07:03:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599634970; bh=XnH5xYW/dOfRmrhUTIs030P8uuiQ5Ggr4xzfGeEOaCw=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=LLhbOeZuQGKRxXp1GWfigE53tjIgcUO1A2qdBVij3CLXvfZMYp0TbbCz14N31xt8V
         Dhhh/YvCSGlhAQJKRYpknqrGYyXrS9TEKmDqTAS6wVq5878Tsmg8W1+J8aTOfMuRn8
         w3lfM/0DOdFreFjZUybe0Qmi2YR2NzO3VZnhcsakpZgeNUsCyjyyRnE11F9xlj3eYM
         cxUtcIeEErW5EqxbECD8aTp8lBCBCWJTWuzUTn62k8uh0lgXl68gnqEAMjSGdr0lYm
         AyAUP0m5qqlkTZEYXh8sTnTFd9rSOoNxKifGNCceXY0tfYj2V0de+SEeTjLJE5WNPE
         AP5ZrLQVqWz/A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 08 Sep 2020 17:24:01 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.64 release.
> There are 129 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 10 Sep 2020 15:21:57 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.64-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.4:
    14 builds:	14 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.4.64-rc1-gbe965cc6b079
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
