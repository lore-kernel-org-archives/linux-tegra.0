Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0E4C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 06:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8A006103A
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 06:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhHLGwB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 02:52:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230147AbhHLGwB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 02:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5125A60EFE;
        Thu, 12 Aug 2021 06:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628751096;
        bh=+JN6XMwjpttxBsTsht8aKrjrIm/lywJ7yWkXDLsRnqA=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=gDq9oKukKEbWu4mDHhPPopboWr4s0z5Dt70T61olO67EFlTIhHJeKn28sEE/+3W2h
         e6SrnZGbHnM/GANWf79dpb2RCCPqChKO5b9gMflmxRRJfbrLDeZb6y326injJRzSBp
         SXXb+UK8dec2x7Lj6/ZbwW0d3LfVrnjjO+hbrTPHQhB2slPbZ/gDbC7L+I+vRH9FVc
         WpW7Yp/NxKMDSfx3wtPlyIhI9HStbrW3dKkMQ0Z45SObvl6nIyBAHgCzxUtdyAbWVG
         IHt1jpwsOgdDXSU02CAF2oApzkBqm45e5dKxA6FrOM+DtzeKoYqq3waEFGSGPuk7bM
         RG3YJGOj/MkGQ==
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
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
Subject: Re: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Date:   Thu, 12 Aug 2021 09:51:03 +0300
In-reply-to: <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
Message-ID: <87mtpnyx3g.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Chunfeng Yun <chunfeng.yun@mediatek.com> writes:

> usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
> of endpoint descriptor, not include bit[12:11] anymore, so use
> usb_endpoint_maxp_mult() instead.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/cdns3/cdnsp-mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
> index a47948a1623f..ad9aee3f1e39 100644
> --- a/drivers/usb/cdns3/cdnsp-mem.c
> +++ b/drivers/usb/cdns3/cdnsp-mem.c
> @@ -882,7 +882,7 @@ static u32 cdnsp_get_endpoint_max_burst(struct usb_gadget *g,
>  	if (g->speed == USB_SPEED_HIGH &&
>  	    (usb_endpoint_xfer_isoc(pep->endpoint.desc) ||
>  	     usb_endpoint_xfer_int(pep->endpoint.desc)))
> -		return (usb_endpoint_maxp(pep->endpoint.desc) & 0x1800) >> 11;
> +		return usb_endpoint_maxp_mult(pep->endpoint.desc) - 1;

this looks like a bugfix. Do we need to Cc stable here?

In any case:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
