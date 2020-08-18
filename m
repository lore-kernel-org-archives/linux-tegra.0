Return-Path: <SRS0=fNvp=B4=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFDFC433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Aug 2020 05:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA38020786
	for <linux-tegra@archiver.kernel.org>; Tue, 18 Aug 2020 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597729799;
	bh=a0lLWzGCnUkYwpwPuDSChXcYwVgQLa97w9Zac8SeYL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=khVbkrEZVrJy4/aYjO2CvHjlxOLDcVnFznau4oiTXohkpAj4PKVaWhsHLQqqLk/sN
	 JloVLk5L5qu0Gr8qvNod21JIvZ3s86t0QoOx4XAzLSudLIlWWcmsXeVPb6RWryvwXq
	 G4xYrbLVoL+ytKZIA7EGJCtldcEXLnlD+bfVlecI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgHRFt7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 Aug 2020 01:49:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgHRFt7 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Aug 2020 01:49:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41E7F20738;
        Tue, 18 Aug 2020 05:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597729798;
        bh=a0lLWzGCnUkYwpwPuDSChXcYwVgQLa97w9Zac8SeYL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mG1cKW6vVDHhqAb2euca3fasOwiGIwDP52oQfnWKNpfSe2vGrv5BGuPDt3CQZda+o
         K26DVTjoy6UwwyA58ngIue8wNJN8+/FuW/DA1zCeLIIYzjWsleZmHLwktclEd2kq/e
         WPFKmlyWw+t+pllwIfJ6jY81ckX/qHRQNlNGT01M=
Date:   Tue, 18 Aug 2020 07:49:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.8 000/464] 5.8.2-rc1 review
Message-ID: <20200818054955.GA1741937@kroah.com>
References: <20200817143833.737102804@linuxfoundation.org>
 <f865d474bc8248228a23673edf84f6be@HQMAIL105.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f865d474bc8248228a23673edf84f6be@HQMAIL105.nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Aug 17, 2020 at 08:55:57PM +0000, Jon Hunter wrote:
> On Mon, 17 Aug 2020 17:09:13 +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.8.2 release.
> > There are 464 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Wed, 19 Aug 2020 14:36:49 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.8.2-rc1.gz
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
>     11 builds:	11 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     60 tests:	60 pass, 0 fail
> 
> Linux version:	5.8.2-rc1-gd74026bb5bef
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04

Thanks for testing all of these and letting me know.

greg k-h
