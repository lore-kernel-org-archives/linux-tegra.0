Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBCCC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 19:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1895223123
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 19:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbhALTSi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:18:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:45064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbhALTSi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 14:18:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 606AC23107;
        Tue, 12 Jan 2021 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610479077;
        bh=rTKVhURbMFiw8oj0oLgl8BtIUJHrAR/1ehjGAgt81tk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UGUZGbY7z8eMUye/byu9DMeSDomHWiJgyz+tfzRjKXN/x4a506pNlVBlaXmobNeli
         6EhC10V6bAo/tGH3BYho79FL7muy3x3Vs7IUx/Qptn0nEQVkI8sgnYZm3FB9KfxA3a
         +Zr0bA2/WCio53VOrBQHeer7h7wMM+Ly0KfxxUY4=
Date:   Tue, 12 Jan 2021 20:19:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.10 000/144] 5.10.7-rc2 review
Message-ID: <X/32KpVk2Q+ymfAD@kroah.com>
References: <20210111161510.602817176@linuxfoundation.org>
 <003040e4e8514aec86f56badabcea893@HQMAIL111.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003040e4e8514aec86f56badabcea893@HQMAIL111.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 11, 2021 at 07:19:25PM +0000, Jon Hunter wrote:
> On Mon, 11 Jan 2021 17:15:35 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.10.7 release.
> > There are 144 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed, 13 Jan 2021 16:14:43 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.7-rc2.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.10:
>     12 builds:	12 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     64 tests:	64 pass, 0 fail
> 
> Linux version:	5.10.7-rc2-g0ea94a3ff7f8
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing all of these and letting me know.

greg k-h
