Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E94C433E6
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Dec 2020 10:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C5A221F8
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Dec 2020 10:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgL3K4p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Dec 2020 05:56:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:57790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgL3K4p (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Dec 2020 05:56:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA5FF2220B;
        Wed, 30 Dec 2020 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609325765;
        bh=7w+KeWwxr+D3vekgLkJEw4EReupFrhV2WCVfLW/RQ6s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qWjGRDkI4L3KYycf4XFWGUZAOuU6ODyNmXdVVtw5uEr0dZrxar/7oKTi5UOvL6VZl
         71hqOuFaPvGgWmYhEj8HjkvpOWQirUzMZpKrR5aCLOjDo8c4XgX6YJS3LxaKaMhoeg
         aTzAGp+aZwRCWpuymmqKa1VDOIUwlqd+4GVcbDd4=
Date:   Wed, 30 Dec 2020 11:57:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.10 000/716] 5.10.4-rc2 review
Message-ID: <X+xdHOqcm8x8T6cx@kroah.com>
References: <20201229103832.108495696@linuxfoundation.org>
 <b3f2179f84e84ceca97ddc8126e716e2@HQMAIL105.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3f2179f84e84ceca97ddc8126e716e2@HQMAIL105.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 29, 2020 at 04:07:24PM +0000, Jon Hunter wrote:
> On Tue, 29 Dec 2020 11:52:58 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.10.4 release.
> > There are 716 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Thu, 31 Dec 2020 10:36:33 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.4-rc2.gz
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
> Linux version:	5.10.4-rc2-g5069132d06b7
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing and letting me know.

greg k-h
