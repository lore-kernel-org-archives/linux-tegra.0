Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906C5C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Mar 2022 12:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236138AbiCRMT5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Mar 2022 08:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbiCRMT5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Mar 2022 08:19:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA59A11BCCE;
        Fri, 18 Mar 2022 05:18:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75AC261865;
        Fri, 18 Mar 2022 12:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C8AC340E8;
        Fri, 18 Mar 2022 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647605917;
        bh=Czcr+mQUS3cuNKMWS8HyZPAgBGf3Rkm5o7+mh+BVx0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wqBq07kMQLg1bFT3/ZW1+GzLBIuE8NP/nhk2530maHWbVxjHn5+xX0BfsEZCCjo0w
         bsCnNj7+k6zPnqJikKh8TF6yHze227pcQIq9etIjqI/SLb2mj74O0UGXMtVFzij1pe
         5EUaTFyGwbXID9qTWfemv114ey5kWbNagoJQU+xg=
Date:   Fri, 18 Mar 2022 12:56:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zhangqilong <zhangqilong3@huawei.com>
Cc:     mathias.nyman@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next] usb: xhci: tegra:Fix PM usage reference leak of
 tegra_xusb_unpowergate_partitions
Message-ID: <YjRzitp5BJmBpV18@kroah.com>
References: <20220315025614.2599576-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315025614.2599576-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 15, 2022 at 10:56:14AM +0800, zhangqilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
> Fixes:1a7426d25fa3 ("usb: xhci: tegra: Unlink power domain devices")

I do not see this commit id in any tree I know of.  Are you sure it is
correct?

thanks,

greg k-h
