Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8418EC4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6767B61038
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 06:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhHLGw4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 02:52:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231225AbhHLGwz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 02:52:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A984E6101E;
        Thu, 12 Aug 2021 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628751149;
        bh=bqEWfOZN0xk2EuCTwKF5niW1R0IpEsX+S8gvv0lSuj8=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=DNwW1miNAufE67B8umgctZbFiTe682bcNz+tC4NrKz96H814QyIeeBnsNeDPEdkaM
         Kv+xBMuxFGpgwkUSJFjtIbRwNvrmpx+RLkrB9B7O8jZGD1mb1dbTJ/yJUmvZHfY3AC
         fhDSkGduLPDkILCAd5Ustdcl4RoKlYCeCtAT8v9p6QCvWzXdzldPICLHFA1DyEDwW6
         tNs/8EmS515RgP6y1tZxihRez6uVNtw8ZVmJ7GmNd39ewHy/rFcUd2EyRpPu7PpXKI
         lZA9wrEq9mVTKBHoA2L6c/BpuJ7gcPgqc/KX0Z8vX2I7VUq3R+v4oHG9SBP3FCypa6
         r0UvV5EmhUNXw==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-4-git-send-email-chunfeng.yun@mediatek.com>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Al Cooper <alcooperx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 4/6] usb: gadget: tegra-xudc: fix the wrong mult value
 for HS isoc or intr
Date:   Thu, 12 Aug 2021 09:51:52 +0300
In-reply-to: <1628739182-30089-4-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87k0kryx20.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
> of endpoint descriptor, not includes bit[12:11] anymore, so use
> usb_endpoint_maxp_mult() instead.
> Meanwhile no need AND 0x7ff when get maxp, remove it.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index a54d1cef17db..40a7417e7ae4 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -1610,7 +1610,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
>  	u16 maxpacket, maxburst = 0, esit = 0;
>  	u32 val;
>  
> -	maxpacket = usb_endpoint_maxp(desc) & 0x7ff;
> +	maxpacket = usb_endpoint_maxp(desc);
>  	if (xudc->gadget.speed == USB_SPEED_SUPER) {
>  		if (!usb_endpoint_xfer_control(desc))
>  			maxburst = comp_desc->bMaxBurst;
> @@ -1621,7 +1621,7 @@ static void tegra_xudc_ep_context_setup(struct tegra_xudc_ep *ep)
>  		   (usb_endpoint_xfer_int(desc) ||
>  		    usb_endpoint_xfer_isoc(desc))) {
>  		if (xudc->gadget.speed == USB_SPEED_HIGH) {
> -			maxburst = (usb_endpoint_maxp(desc) >> 11) & 0x3;
> +			maxburst = usb_endpoint_maxp_mult(desc) - 1;

this looks like a bug fix. Before this change, maxburst was always 0,
right?

In any case:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
