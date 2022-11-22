Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE727C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Nov 2022 16:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbiKVQH6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Nov 2022 11:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiKVQH5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Nov 2022 11:07:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DEB4AF2A;
        Tue, 22 Nov 2022 08:07:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5F20B81BE8;
        Tue, 22 Nov 2022 16:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE8EC433D6;
        Tue, 22 Nov 2022 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669133273;
        bh=9d709dY27e9sKclMchjHuvqwPGttUZYMm9Spd9lti9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A5KY8IuePGA9asotPaACLp34JRBmK2B7AAP9OE8pWdL2/7aBDQYScnqLQghEXx6YB
         gHOH9OP1kJj7U46pZTixFjPyDjgvKDabw26Ax6rUGl4OjTn1ntawUcdqHAvJ9fQ4T5
         1K8gTY+XmPgXHzonLqWpMZJ0sORsipciU5k+6e0s=
Date:   Tue, 22 Nov 2022 17:07:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        vkoul@kernel.org, treding@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org, waynec@nvidia.com,
        Sing-Han Chen <singhanc@nvidia.com>
Subject: Re: [PATCH V4 5/6] usb: host: xhci-tegra: Add Tegra234 XHCI support
Message-ID: <Y3zz1YHu1643ppuS@kroah.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-6-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118154006.173082-6-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 18, 2022 at 03:40:05PM +0000, Jon Hunter wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
> 
> This change adds Tegra234 XUSB host mode controller support.
> 
> In Tegra234, some of the registers have moved to bar2 space.
> The new soc variable has_bar2 indicates the chip with bar2
> area. This patch adds new reg helper to let the driver reuse
> the same code for those chips with bar2 support.
> 
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

This is should be much slower with the additional redirection.  Is it
noticable on this hardware platform with, and without this change?  Or
is the hardware slow enough that it doesn't even show up as a speed
decrease?

thanks,

greg k-h
