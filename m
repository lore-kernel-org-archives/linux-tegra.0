Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FB2C00A89
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA3AA221FA
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604573560;
	bh=55+dmYNSA4RJNAuski7QzZJVEG3oCdkANHEesZBTeIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=M/zNM/fATLkTWJBo0RhkDqRN7ZIcgw6HK0t5GwPObLm0RP5vYMjKweVk1IM6v7yp9
	 GllITtKO73ufr45SkVL0gAoc4pZ/IXAl6jlwiiuafMOCBXiWbI7xfpljsNr0eMCCTA
	 rPKALMxpc3b37vVvWVbfeTUe3ovWqDxpy0ic2jbc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgKEKwk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:52:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:46374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEKwk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 5 Nov 2020 05:52:40 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49AA321734;
        Thu,  5 Nov 2020 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604573559;
        bh=55+dmYNSA4RJNAuski7QzZJVEG3oCdkANHEesZBTeIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l8KAnzVVBHxSqrPJRo+K6WXIk62igcBMBy4re5IgHbsWN5F4zWu3rLREO0YSeAq2H
         RFfKEwKCVumuIU7XEKPeeVoYkjVg39tTbA1V/iX1AVYgOVVsZs4hK7xXOXc5isf2FA
         bBvvHGCQ1Z2gC4IOAntSCpwHylawoTRpBCnxFx/s=
Date:   Thu, 5 Nov 2020 11:53:28 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.9 000/391] 5.9.4-rc1 review
Message-ID: <20201105105328.GB4038994@kroah.com>
References: <20201103203348.153465465@linuxfoundation.org>
 <4796280b881e4246a6ad2ae268744c37@HQMAIL105.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4796280b881e4246a6ad2ae268744c37@HQMAIL105.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 04, 2020 at 09:03:46AM +0000, Jon Hunter wrote:
> On Tue, 03 Nov 2020 21:30:51 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.9.4 release.
> > There are 391 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Thu, 05 Nov 2020 20:29:58 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.4-rc1.gz
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
>     61 tests:	61 pass, 0 fail
> 
> Linux version:	5.9.4-rc1-g53574a4c558e
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Great, thanks for testing and letting me know.

greg k-h
