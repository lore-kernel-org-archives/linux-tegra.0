Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C0CC2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 19:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45E7324248
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 19:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Y0EsE0UJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgKQTJ3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Nov 2020 14:09:29 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17746 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKQTJ2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 14:09:28 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb41fdf0000>; Tue, 17 Nov 2020 11:09:19 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 19:09:27 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Nov 2020 19:09:27 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.9 00/78] 4.9.244-rc1 review
In-Reply-To: <20201117122109.116890262@linuxfoundation.org>
References: <20201117122109.116890262@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <53fd93a4b43c4a98bc4c58aaa3a9db66@HQMAIL105.nvidia.com>
Date:   Tue, 17 Nov 2020 19:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605640159; bh=XSGu9FATugKXz3xZwQARXNSlRBBeHS18acXzst+qnPU=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=Y0EsE0UJ8PkgTGpkqJxo7ivCWhL7bzmHNIsrrVZZINCrqr5gY9aGkimrEtFPfJeF+
         395TF74qrPY5oJom6YtC2+FccNCt6JcrtRQOQ7QmNYAo5Et2Y2ot4WeqUKAuNzKMeN
         oPQWGtlaB1x28z/2ZsstMpIQcgKUNEdijVZ75AoY2ABSMvwSJ1kieaUpoeO0YW7AKI
         B21STa/HNHQbO/8tEwssLoGl3Fcy/3LaqeIIkqB5plgAWm3aF60saMbmwX0tiYy7/i
         NhP08yiVD15pEREFyQuyXJKVFcNp9tZlSJns0AZkDnAsikrNQG5rHfKanZpK+4NAm9
         pYd9C7IJcbLLA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 17 Nov 2020 14:04:26 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.244 release.
> There are 78 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 19 Nov 2020 12:20:51 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.244-rc1.gz
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
    10 boots:	10 pass, 0 fail
    16 tests:	16 pass, 0 fail

Linux version:	4.9.244-rc1-gd3e70b39d31a
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
