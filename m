Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691F5C48BE8
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Jun 2021 08:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4729F613AD
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Jun 2021 08:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhFNIaD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:30:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232630AbhFNIaD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Jun 2021 04:30:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6409661370;
        Mon, 14 Jun 2021 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623659281;
        bh=5WpXj+v2aZrwm0AM5cVGrmbOMJxn+umwHqzjnzUIOW4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDEUiIpyc9xO0ZpqFYG4H/3HF8smf0AYYgIQJXvKIXwIQkcgaCtSfEl4zsduMOFjV
         86DX2EHMA5SifWkqvKcnqjW10u4nXeUgfhOcZzsY5YhuVLnNJntstVmBjJGMe98oHt
         ul6LOMW0jHDwlMPToKEbDO1kfo73eI8T/qnIaWJ4=
Date:   Mon, 14 Jun 2021 10:27:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul linux-usb @ vger . kernel . org" <vkoul@kernel.org>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 2/2] usb: tegra: Changes for v5.14-rc1
Message-ID: <YMcS/yfYsotZN7Vx@kroah.com>
References: <20210611164037.3567270-1-thierry.reding@gmail.com>
 <20210611164037.3567270-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611164037.3567270-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 11, 2021 at 06:40:37PM +0200, Thierry Reding wrote:
> Hi Greg, Felipe,
> 
> The following changes since commit 1f9cab6cc20c6ed35c659aa25e282265275f0732:
> 
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra186 (2021-06-03 14:52:45 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.14-usb
> 
> for you to fetch changes up to 971ee247060d88dceb72428b5d203687312884f4:
> 
>   usb: xhci: tegra: Enable ELPG for runtime/system PM (2021-06-11 18:15:46 +0200)
> 
> This is a set of changes that was supposed to go into v5.13 but missed
> the window by just a couple of days. I've since taken this for a spin
> in linux-next through the Tegra tree and everything seems A-OK.
> 
> Note that this includes the contents of the first pull request in this
> set because of a build-time dependency. I'm assuming that all of this
> will go through Greg's USB tree, in which case there's no reason to pull
> in the first pull request since it's already included in this one.

I have pulled this into my tree now, thanks.

greg k-h
