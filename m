Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258FAC77B72
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Apr 2023 06:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbjDTGnc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Apr 2023 02:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjDTGnb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Apr 2023 02:43:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FBD1FE4;
        Wed, 19 Apr 2023 23:43:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 930FB61C00;
        Thu, 20 Apr 2023 06:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6067C433D2;
        Thu, 20 Apr 2023 06:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681973009;
        bh=QvyofU4jJrOv/LND4GOXatYNGg2XL7j40PJ0jc/vGn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lufp0kxudV+138bhm7a5/DdYa8SSR7Ube6k+0Dx6RybT+7pf6tVrllf+lSL8i8vMs
         BsMJeQofBgtRlU28zThArhLHfZpJasu9D48Z0Lo777GUHq3ApUbHD42NNwK+1QG94S
         9VG8qm3ZxgKVMGVh/o5nR3cRdVQy9BU4i0JVSHRE=
Date:   Thu, 20 Apr 2023 08:43:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: tegra-xudc: Fix crash in vbus_draw
Message-ID: <2023042003-rentable-kitchen-ebbd@gregkh>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
 <ZC59VDIEYzbR1YKF@orome>
 <de55706b-f632-b921-a6f8-dc107601977a@nvidia.com>
 <ZC60SvlnC7GXnjoW@orome>
 <e49aa102-5737-fd13-29d6-4515d733fb7c@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e49aa102-5737-fd13-29d6-4515d733fb7c@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 19, 2023 at 10:53:42PM +0100, Jon Hunter wrote:
> Hi Greg,
> 
> On 06/04/2023 13:00, Thierry Reding wrote:
> > On Thu, Apr 06, 2023 at 10:35:15AM +0100, Jon Hunter wrote:
> > > 
> > > On 06/04/2023 09:05, Thierry Reding wrote:
> > > > On Wed, Apr 05, 2023 at 07:18:53PM +0100, Jon Hunter wrote:
> > > > > Commit ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> > > > > populated the vbus_draw callback for the Tegra XUDC driver. The function
> > > > > tegra_xudc_gadget_vbus_draw(), that was added by this commit, assumes
> > > > > that the pointer 'curr_usbphy' has been initialised, which is not always
> > > > > the case because this is only initialised when the USB role is updated.
> > > > > Fix this crash, by checking that the 'curr_usbphy' is valid before
> > > > > dereferencing.
> > > > > 
> > > > > Fixes: ac82b56bda5f ("usb: gadget: tegra-xudc: Add vbus_draw support")
> > > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > > ---
> > > > >    drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> > > > > index 2b71b33725f1..5bccd64847ff 100644
> > > > > --- a/drivers/usb/gadget/udc/tegra-xudc.c
> > > > > +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> > > > > @@ -2167,7 +2167,7 @@ static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
> > > > >    	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
> > > > > -	if (xudc->curr_usbphy->chg_type == SDP_TYPE)
> > > > > +	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type == SDP_TYPE)
> > > > >    		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
> > > > >    	return ret;
> > > > 
> > > > Looking at tegra_xudc_probe(), that calls tegra_xudc_update_data_role()
> > > > for all PHYs, so shouldn't that be enough to get curr_usbphy set? Or is
> > > > there perhaps a race between ->vbus_draw() and the data role update? Is
> > > > ->vbus_draw() perhaps called as part of usb_add_gadget_udc()? Should we
> > > > reorder those to make sure the role is properly updated before the
> > > > gadget is registered?
> > > 
> > > Yes it does call it, but it still does not set the curr_usbphy. If you look
> > > at the function it may not set it.
> > > 
> > > In the backtrace I saw, which was happening on reboot, it was in the
> > > unregister of the gadget ...
> > > 
> > > [ 1102.047896] Call trace:
> > > [ 1102.050402]  0xffffde9fd18c0878
> > > [ 1102.053602]  usb_gadget_vbus_draw+0x28/0x50
> > > [ 1102.057879]  composite_disconnect+0x1c/0x40 [libcomposite]
> > > [ 1102.063509]  usb_get_function_instance+0x1808/0x27b0 [libcomposite]
> > > [ 1102.069935]  usb_gadget_disconnect+0x64/0xa0
> > > [ 1102.074304]  usb_gadget_remove_driver+0x2c/0xc0
> > > [ 1102.078942]  usb_gadget_unregister_driver+0x70/0xf0
> > > [ 1102.083927]  usb_get_function_instance+0x2774/0x27b0 [libcomposite]
> > > [ 1102.090339]  unregister_gadget_item+0x280/0x470 [libcomposite]
> > > [ 1102.096314]  configfs_write_iter+0xc4/0x120
> > > [ 1102.100609]  new_sync_write+0xe8/0x190
> > > [ 1102.104461]  vfs_write+0x234/0x380
> > > [ 1102.107938]  ksys_write+0x6c/0x100
> > > [ 1102.111417]  __arm64_sys_write+0x1c/0x30
> > > [ 1102.115427]  invoke_syscall.constprop.0+0x4c/0xe0
> > > [ 1102.120245]  do_el0_svc+0x50/0x150
> > > [ 1102.123723]  el0_svc+0x28/0xc0
> > > [ 1102.126854]  el0t_64_sync_handler+0xb0/0xc0
> > > [ 1102.131138]  el0t_64_sync+0x1a0/0x1a4
> > > [ 1102.134889] Code: 910003fd a90153f3 f94ce413 f100027f (b9409a60)
> > > [ 1102.141139] ---[ end trace cdf6612bd43fcbf2 ]---
> > 
> > Alright. There are a lot of cases where we can run into this and it all
> > looks a little complicated, so I think it would be good to unwind this
> > at some point. But I can't think of an easy way to do that, so for a fix
> > this looks good:
> > 
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> OK for pick this up v6.4?

It's in my queue, which is big, I'm at a conference this week but will
try to get to it today on the train ride...

greg k-h
