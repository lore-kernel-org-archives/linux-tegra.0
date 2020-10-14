Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EDEC433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 09:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 008ED20BED
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602669390;
	bh=ArdEYEPSrfYQJ7LMYgSAMwiBf6SrTBuQ7WCExj3/izo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PdCTHKlwImSp18irr5qKcyGv8G/wty+IP7pobP0Q2lmanNRvMY/CoS3GwLqoRmHc0
	 ui5KbNlWo46FURX+DnNbDW0TQqV34H17aIuaTQfYUZefZtAYPek8uYXDo4qQE5Flx9
	 Z5rmfC3Ad3cRUd45n39DNubVi9hAJFIHksxtmmNU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgJNJ43 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:56:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:56220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgJNJ43 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 05:56:29 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0FFE207C3;
        Wed, 14 Oct 2020 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602669387;
        bh=ArdEYEPSrfYQJ7LMYgSAMwiBf6SrTBuQ7WCExj3/izo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xrYEKpLND8NpYca+YsiIVX3saJMzIXAlDepcILoeYAStLRzUBmboRDNeoLSPMpgTa
         Mzo5OgJNorwIo0ECrihIWSk3DzIlRK10DQ1TrzEM/Uq1R4/P1B8nU92hmQS6U/ix4T
         JivgJC0wF9dKqAcKRVtQtzO7k2E0dELBGUW2OyoE=
Date:   Wed, 14 Oct 2020 11:57:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org,
        pavel@denx.de, stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.8 000/124] 5.8.15-rc1 review
Message-ID: <20201014095702.GB3599360@kroah.com>
References: <20201012133146.834528783@linuxfoundation.org>
 <a4e7bd965ed842e8b6e9564abc2c4ffc@HQMAIL105.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4e7bd965ed842e8b6e9564abc2c4ffc@HQMAIL105.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 12, 2020 at 06:27:49PM +0000, Jon Hunter wrote:
> On Mon, 12 Oct 2020 15:30:04 +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.8.15 release.
> > There are 124 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed, 14 Oct 2020 13:31:22 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.8.15-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.8.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.8:
>     15 builds:	15 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     60 tests:	60 pass, 0 fail
> 
> Linux version:	5.8.15-rc1-gf4ed6fb8f168
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing all of these and letting me know.

greg k-h
