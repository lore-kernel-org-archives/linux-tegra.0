Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E50C7EE23
	for <linux-tegra@archiver.kernel.org>; Mon, 29 May 2023 19:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjE2TSt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 May 2023 15:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjE2TSt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 May 2023 15:18:49 -0400
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD33BCD
        for <linux-tegra@vger.kernel.org>; Mon, 29 May 2023 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=/l6Mg+b7EV4jY8x9miIBhVcWtjESBETdVoWxoFEeAkc=;
        b=LeWJ62Ais/TfMdLjk0WYkuXZzax4iD4BrnE7sSau5wCKsHKRhnZN+zg85cT9kGHq4Y/UTMbSJ/GJq
         u8jNF4U4EedArMWNsmFjKkMkRB7KYlwpwf6vn2xCvSSZp7AR3N/xWyoNDbANeom9faDjz97e2i+mbR
         dGY0+8QE6gyK49Xm24bQuAdV8tFSUQg/zix3zpWcXiXYNPJK5BYl1Xsevo+IDCMIIiKBaVFMlFUTEf
         7XNlBUGHCdhfkdkTnSQe9MUPN++PbC1gY/TzDrg5UQJ4hfKTaswNz2tLZdrf1+vvGsRt2BTE0vUEUo
         T3S1yDxoMpoJXELiRbkj4ygmiv7CD1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=/l6Mg+b7EV4jY8x9miIBhVcWtjESBETdVoWxoFEeAkc=;
        b=EQYlVyX671ncuU52K4e3wUOWPuZLsB7f7qnw/CUh34TTTsTtDQapNrVpQya0JaMBtmjMXqRzvoZbc
         MII6VFLBg==
X-HalOne-ID: 7aa65568-fe55-11ed-8ac4-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay6 (Halon) with ESMTPSA
        id 7aa65568-fe55-11ed-8ac4-6f01c1d0a443;
        Mon, 29 May 2023 19:17:42 +0000 (UTC)
Date:   Mon, 29 May 2023 21:17:41 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 01/13] fbdev: Add Kconfig options to select different
 fb_ops helpers
Message-ID: <20230529191741.GA1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-2-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thomas,

On Wed, May 24, 2023 at 11:21:38AM +0200, Thomas Zimmermann wrote:
> Many fbdev drivers use the same set of fb_ops helpers. Add Kconfig
> options to select them at once. This will help with making DRM's
> fbdev emulation code more modular, but can also be used to simplify
> fbdev's driver configs.
> 
> v3:
> 	* fix select statement (Jingfeng)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
I like these, thanks.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
