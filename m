Return-Path: <SRS0=inwd=CC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8168C433E1
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 10:17:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79BDE20738
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Aug 2020 10:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="grd5XCTO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgHXKRL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Aug 2020 06:17:11 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:10265 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgHXKRD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 06:17:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f43938b0002>; Mon, 24 Aug 2020 03:16:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 03:16:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 24 Aug 2020 03:16:57 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 10:16:57 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Aug 2020 10:16:57 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 00/71] 4.19.142-rc1 review
In-Reply-To: <20200824082355.848475917@linuxfoundation.org>
References: <20200824082355.848475917@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <3200be331b244451913ec9e6613ea093@HQMAIL105.nvidia.com>
Date:   Mon, 24 Aug 2020 10:16:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598264203; bh=a/DiYkrVOJ9KQLR3kNBWFACl7loYJROtyxWk7l4Mz5E=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=grd5XCTOzJDHSIVs9sHsitSV++FyqvoDeCBJuhu8Nejg6EMUIGZ1herH3dFefsKDH
         wY0JMoAfkGIgW04pJhzbL7XuJGZpsyypzSkAKMxOPaukWfJm/edtz9aFEpWHJUtA8f
         ZLql+HCHbtSuRlVf4fvf4M/CHKgzpdusdJ4FBJhyHU5BngTwIcmt7KiVIJ0xUpULMW
         IdzasEAY4UhS3fpy1VCo40MnBrlO6exuPYzoNhxSO/3nC1nRAkqxasjk4ppWqJQqjZ
         51ge91LkY6pwRMd4B5uvX6JSwyhdIIlQSY1DrkmW0LU9cSTIPCPqNqLe6wP2Zj7eDX
         jnui9Mtdt5lwg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 Aug 2020 10:30:51 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.142 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 26 Aug 2020 08:23:34 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.142-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    11 builds:	11 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	4.19.142-rc1-g62187e309cc4
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
