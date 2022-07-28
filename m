Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8B7C04A68
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jul 2022 08:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbiG1I4Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234672AbiG1I4Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jul 2022 04:56:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7499F56B91;
        Thu, 28 Jul 2022 01:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02F7D61C21;
        Thu, 28 Jul 2022 08:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0622C433D6;
        Thu, 28 Jul 2022 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658998582;
        bh=ugMfMQoHM45Be3z6trPnwYRL1JLhfjGfWJJCVOFWlV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WLVpdRU+iZb/CdplYzS2W+O6h9GeixYNKFJkIxO0Q7B80yMywY2rV8aK3nULno6yz
         B1YJjxfF4/3N0RCMX//2M9SrmvbysR0XThltnIR8OGT9W+yufwDzFtUBnKb1T8LElr
         MIN4tYoTiX0tbvVr+hV5OJq6IEUI+Z3ygDTSjE2Q=
Date:   Thu, 28 Jul 2022 10:56:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jim Lin <jilin@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH] xhci: tegra: USB2 pad power controls
Message-ID: <YuJPMz4GMz9IwPXk@kroah.com>
References: <20220727105314.14681-1-jilin@nvidia.com>
 <YuEaOGP/AaUKimFg@kroah.com>
 <IA1PR12MB66038FF5370F31870ED62BA9C0969@IA1PR12MB6603.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR12MB66038FF5370F31870ED62BA9C0969@IA1PR12MB6603.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Jul 28, 2022 at 08:39:42AM +0000, Jim Lin wrote:
> Thanks for review, will follow up and then resend.

Also note that html emails are rejected by the mailing lists.  Please
fix up your email client so that you can participate in the kernel
development process.

thanks,

greg k-h
