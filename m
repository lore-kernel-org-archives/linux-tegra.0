Return-Path: <SRS0=jljd=BK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B319C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Jul 2020 12:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F045021744
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Jul 2020 12:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="B/9AMRxZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733226AbgGaMlK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Jul 2020 08:41:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1800 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733216AbgGaMlK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jul 2020 08:41:10 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2411080000>; Fri, 31 Jul 2020 05:39:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 05:41:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 05:41:10 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 12:41:09 +0000
Received: from [127.0.1.1] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 12:41:07 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.4 00/54] 4.4.232-rc1 review
In-Reply-To: <20200730074421.203879987@linuxfoundation.org>
References: <20200730074421.203879987@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <b72691657bdd46d49bee8ae26e4515af@HQMAIL101.nvidia.com>
Date:   Fri, 31 Jul 2020 12:41:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596199176; bh=9rjwq6uZ0CnxHnTuOG7z5ffik/6OXkY8z0IS7PSDi4o=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=B/9AMRxZo4dvRiFbagOdr0JSlVAp81JUFTqjL12D9gZcmkS2PenICmF8AE4UIiaTy
         ShwCRO4bqakEwGOgaccNQQ0wJneLHnH5JOw+VofuqbTJlF38VKmVSsLH0FYMGlsNfz
         O+BTmUmY5+pjNp8yyiVOHxoYRajowSJD/JnvJlx8+ruiVgVOIxoLtEjsd6Z7OGImKI
         NoAs+ijiMinu5W58Fk+ueGpnI2TDE9Wtx5VVyeqIp7eavboEIspAfmSt4xfjmd1O8j
         uIWUmXWqkZgPLN535cM4l+zSoIbaP9zcNye8Sv9mxq7U1DizwgTktpmHuzUauF77QO
         XxvsxxXNXUQig==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 30 Jul 2020 10:04:39 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.232 release.
> There are 54 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 01 Aug 2020 07:44:05 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.232-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    25 tests:	25 pass, 0 fail

Linux version:	4.4.232-rc1-g0ee6ef294be6
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Jon
