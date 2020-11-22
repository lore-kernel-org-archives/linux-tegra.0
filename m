Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D93C63777
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 09:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C879C2084C
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 09:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ukBwq3Q2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgKVJRc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 22 Nov 2020 04:17:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgKVJRa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Nov 2020 04:17:30 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CFAC20781;
        Sun, 22 Nov 2020 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606036650;
        bh=0fjwz/87IWFcPkUtv9AEkvsqGvLA0RmokhjscNICNa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ukBwq3Q2g9d9ZXJwZYHmVdsJXLp+xg7oqKA4FbYgA9MjqcMSe+bsZViHs99ntko8u
         gIItMlkdxu8wGu3H+em3B5Q2w/bVyXh9+x5gJG1ClwMn80UQKrAL6jLb9T6qpueul9
         KtDAU2dCMsrHYSZt66YiZHIPdBC5P4a+3Dbwe12c=
Date:   Sun, 22 Nov 2020 10:18:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.9 00/14] 5.9.10-rc1 review
Message-ID: <X7os0av+1QJ+1m6i@kroah.com>
References: <20201120104541.168007611@linuxfoundation.org>
 <4308b4d79929454a8efd424f43f3b8e3@HQMAIL109.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4308b4d79929454a8efd424f43f3b8e3@HQMAIL109.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 20, 2020 at 04:56:34PM +0000, Jon Hunter wrote:
> On Fri, 20 Nov 2020 12:03:38 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.9.10 release.
> > There are 14 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sun, 22 Nov 2020 10:45:32 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.10-rc1.gz
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
> Linux version:	5.9.10-rc1-g861b379f0883
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing all of these and letting me know.

gre gk-
