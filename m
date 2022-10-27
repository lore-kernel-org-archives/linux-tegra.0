Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1BBFA3740
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 13:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiJ0N6j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 09:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbiJ0N6h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 09:58:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BED1863DE;
        Thu, 27 Oct 2022 06:58:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1CDEB82658;
        Thu, 27 Oct 2022 13:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49094C433C1;
        Thu, 27 Oct 2022 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666879112;
        bh=p/73twk9R2nYXS4NPWD+dOhgjE0MNSO9+qBfLbzNX2U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tTyaUQvHYuRhtK3D2Zfq+jkzkVLoNj/Ah/1rhZWDPrfgLUk/Y7s4bW9wOPn55W3TK
         xpyS0B0+w+CfdBkFS4ZUiO3WDLQ2H+oH9DOeOJigOJ2q/BtugY4w/pnTZcu9sa8Z6x
         le4SStA8fscKfiMbp9zi4Rg3sn/nWV6kUvcacfPU=
Date:   Thu, 27 Oct 2022 15:58:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jim Lin <jilin@nvidia.com>
Cc:     mathias.nyman@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 1/3] xhci: hub: export symbol on xhci_hub_control
Message-ID: <Y1qOhjOXM4sQW+a/@kroah.com>
References: <20221027133127.27592-1-jilin@nvidia.com>
 <20221027133127.27592-2-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027133127.27592-2-jilin@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 27, 2022 at 09:31:25PM +0800, Jim Lin wrote:
> Add EXPORT_SYMBOL_GPL on xhci_hub_control() for other driver module
> to invoke and avoid linking error.

What other driver module?

There is no user here :(

confused,

greg k-h
