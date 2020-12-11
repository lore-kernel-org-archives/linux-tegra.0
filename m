Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F543C4361B
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 15:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E43D822D74
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 15:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436917AbgLKPAZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Dec 2020 10:00:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:58332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406445AbgLKO7g (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Dec 2020 09:59:36 -0500
Date:   Fri, 11 Dec 2020 15:23:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607696551;
        bh=iYTNuqr7BxsqNih90HgmmoD1eN6twbxAv/TFeWrlry4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=wM3zXNCet9abuHqGKLYsRmdlcispTx23/oCgpTlM7sqvoEdouleS5yDxEXf/GR7b2
         Jd1b7vpPm6RhONbZABJP+OqNXGx6lI14VJmLiKO9VVQS9FV/gJ5zn/SNKXfehkn/Y8
         PnOJ+ZB8KliowOGrSuwYlQ+g9wvnQ3UtieWBSvkg=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.9 00/75] 5.9.14-rc1 review
Message-ID: <X9OA63ldYHLqqOIY@kroah.com>
References: <20201210142606.074509102@linuxfoundation.org>
 <11690fcb20d24c01825bddeb0676b471@HQMAIL107.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11690fcb20d24c01825bddeb0676b471@HQMAIL107.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 10, 2020 at 09:04:52PM +0000, Jon Hunter wrote:
> On Thu, 10 Dec 2020 15:26:25 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.9.14 release.
> > There are 75 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat, 12 Dec 2020 14:25:47 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.14-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.9.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.9:
>     15 builds:	15 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     64 tests:	64 pass, 0 fail
> 
> Linux version:	5.9.14-rc1-g81beabff31a7
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing them all!

greg k-h
