Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4136FC2D0E4
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 06:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89C320756
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Nov 2020 06:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="dtSwXK3c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgKQGOi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Nov 2020 01:14:38 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16269 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQGOi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 01:14:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb36a570000>; Mon, 16 Nov 2020 22:14:47 -0800
Received: from [10.19.109.31] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 06:14:34 +0000
Subject: Re: [PATCH v4 00/16] Tegra XHCI controller ELPG support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
 <20201113164455.GG1408970@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <9b64c181-1c5b-f6bd-d9db-03e30b4479a5@nvidia.com>
Date:   Tue, 17 Nov 2020 14:14:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113164455.GG1408970@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605593687; bh=QZtXCGM+q2rMWr9GD4knohnZaY8gE+YhOGU4SliD8f8=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=dtSwXK3cExvCd5/vTA9KS9ceZHJWqbCCJa4ZWUTa4B2WYCKvBD0pGUhZh+XOpkEbw
         XKsJ53r5QU1m9ySB+upTh02wQdd/2JgtB73483lcdBDjcfLPWLQA+iBZL8idK7zl/g
         NqULrQGmwqok51Ojg7ggUzHnig3pMVECDQGtZhWmnuM/z3QGOLWWk3E0eAyRfid3DP
         m0621WgNKcA72Ip8dpyq+eyWzutgpO7Ks7ALYf8/K/06CFYV2gYsOkLL8L1WTm/84B
         iPHlBIfBsvgIBGtO0Mq1VaGNSaNTnDxWWhp+1INzj4aH4K6fAgYlxbRQU3Zv9151Pi
         /9+IOMtJO5qvQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 11/14/20 12:44 AM, Thierry Reding wrote:
> On Fri, Oct 16, 2020 at 09:07:10PM +0800, JC Kuo wrote:
>> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
>> state for power saving when all of the connected USB devices are in
>> suspended state. This patch series includes clk, phy and pmc changes
>> that are required for properly place controller in ELPG and bring
>> controller out of ELPG.
>>
>> JC Kuo (16):
>>   clk: tegra: Add PLLE HW power sequencer control
>>   clk: tegra: Don't enable PLLE HW sequencer at init
>>   phy: tegra: xusb: Move usb3 port init for Tegra210
>>   phy: tegra: xusb: tegra210: Do not reset UPHY PLL
>>   phy: tegra: xusb: Rearrange UPHY init on Tegra210
>>   phy: tegra: xusb: Add Tegra210 lane_iddq operation
>>   phy: tegra: xusb: Add sleepwalk and suspend/resume
>>   soc/tegra: pmc: Provide USB sleepwalk register map
>>   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
>>   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
>>   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
>>   phy: tegra: xusb: Tegra210 host mode VBUS control
>>   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
>>   arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq
>>   usb: host: xhci-tegra: Unlink power domain devices
>>   xhci: tegra: Enable ELPG for runtime/system PM
>>
>>  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |    1 +
>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |    1 +
>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    2 +
>>  drivers/clk/tegra/clk-pll.c                   |   12 -
>>  drivers/clk/tegra/clk-tegra210.c              |   53 +-
>>  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
>>  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
>>  drivers/phy/tegra/xusb.c                      |   92 +-
>>  drivers/phy/tegra/xusb.h                      |   22 +-
>>  drivers/soc/tegra/pmc.c                       |   94 +
>>  drivers/usb/host/xhci-tegra.c                 |  610 ++++--
>>  include/linux/clk/tegra.h                     |    4 +-
>>  include/linux/phy/tegra/xusb.h                |   10 +-
>>  14 files changed, 2785 insertions(+), 564 deletions(-)
> 
> I've been testing this, but I keep seeing the following oops on suspend
> on a Jetson TX1:
> 
> [  153.451108] tegra-xusb-padctl phy-usb2.0: > tegra_xusb_padctl_suspend_noirq(dev=ffff000080917000)
> [  153.460353] tegra-xusb-padctl phy-usb2.0:   driver: ffff8000114453e0 (tegra_xusb_padctl_driver)
> [  153.469245] tegra-xusb-padctl phy-usb2.0:   padctl: ffff0000829f6480
> [  153.475772] tegra-xusb-padctl phy-usb2.0:     soc: ef7bdd7fffffffff (0xef7bdd7fffffffff)
> [  153.484061] Unable to handle kernel paging request at virtual address 007bdd800000004f
> [  153.492132] Mem abort info:
> [  153.495083]   ESR = 0x96000004
> [  153.498308]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  153.503771]   SET = 0, FnV = 0
> [  153.506979]   EA = 0, S1PTW = 0
> [  153.510260] Data abort info:
> [  153.513200]   ISV = 0, ISS = 0x00000004
> [  153.517181]   CM = 0, WnR = 0
> [  153.520302] [007bdd800000004f] address between user and kernel address ranges
> [  153.527600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  153.533231] Modules linked in: nouveau panel_simple tegra_video(C) tegra_drm drm_ttm_helper videobuf2_dma_contig ttm videobuf2_memops cec videobuf2_v4l2 videobuf2_common drm_kms_helper v4l2_fwnode videodev drm mc snd_hda_codec_hdmi cdc_ether usbnet snd_hda_tegra r8152 crct10dif_ce snd_hda_codec snd_hda_core tegra_xudc host1x lp855x_bl at24 ip_tables x_tables ipv6
> [  153.566417] CPU: 0 PID: 300 Comm: systemd-sleep Tainted: G         C        5.10.0-rc3-next-20201113-00019-g5c064d5372b0-dirty #624
> [  153.578283] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> [  153.584281] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
> [  153.590381] pc : tegra_xusb_padctl_suspend_noirq+0x88/0x100
> [  153.596016] lr : tegra_xusb_padctl_suspend_noirq+0x80/0x100
> [  153.601632] sp : ffff8000120dbb60
> [  153.604999] x29: ffff8000120dbb60 x28: ffff000080a1df00
> [  153.610430] x27: 0000000000000002 x26: ffff8000106f8540
> [  153.615858] x25: ffff8000113ac4a4 x24: ffff80001148c198
> [  153.621277] x23: ffff800010c4538c x22: 0000000000000002
> [  153.626692] x21: ffff800010ccde80 x20: ffff0000829f6480
> [  153.632107] x19: ffff000080917000 x18: 0000000000000030
> [  153.637521] x17: 0000000000000000 x16: 0000000000000000
> [  153.642933] x15: ffff000080a1e380 x14: 74636461702d6273
> [  153.648346] x13: ffff8000113ad058 x12: 0000000000000f39
> [  153.653759] x11: 0000000000000513 x10: ffff800011405058
> [  153.659176] x9 : 00000000fffff000 x8 : ffff8000113ad058
> [  153.664590] x7 : ffff800011405058 x6 : 0000000000000000
> [  153.670002] x5 : 0000000000000000 x4 : ffff0000fe908bc0
> [  153.675414] x3 : ffff0000fe910228 x2 : 162ef67e0581e700
> [  153.680826] x1 : 162ef67e0581e700 x0 : ef7bdd7fffffffff
> [  153.686241] Call trace:
> [  153.688769]  tegra_xusb_padctl_suspend_noirq+0x88/0x100
> [  153.694077]  __device_suspend_noirq+0x68/0x1cc
> [  153.698594]  dpm_noirq_suspend_devices+0x10c/0x1d0
> [  153.703456]  dpm_suspend_noirq+0x28/0xa0
> [  153.707461]  suspend_devices_and_enter+0x234/0x4bc
> [  153.712314]  pm_suspend+0x1e4/0x270
> [  153.715868]  state_store+0x8c/0x110
> [  153.719440]  kobj_attr_store+0x1c/0x30
> [  153.723259]  sysfs_kf_write+0x4c/0x7c
> [  153.726981]  kernfs_fop_write+0x124/0x240
> [  153.731065]  vfs_write+0xe4/0x204
> [  153.734449]  ksys_write+0x6c/0x100
> [  153.737925]  __arm64_sys_write+0x20/0x30
> [  153.741931]  el0_svc_common.constprop.0+0x78/0x1a0
> [  153.746789]  do_el0_svc+0x24/0x90
> [  153.750181]  el0_sync_handler+0x254/0x260
> [  153.754251]  el0_sync+0x174/0x180
> [  153.757663] Code: aa0303e2 94000f64 f9405680 b40000e0 (f9402803)
> [  153.763826] ---[ end trace 81543a3394cb409d ]---
> 
> Note that I've added a bit of debug information there to show what's
> going on. See how tegra_xusb_padctl_suspend_noirq() is being called for
> the phy-usb2.0 device? That's one of the PHYs that's being created for
> the USB2 lanes. Sometimes I do see that padctl->soc ends up being NULL
> for that device and in that case the function just aborts early and then
> tegra_xusb_padctl_suspend_noirq() will get called again for the padctl
> device and succeed.
> 
> I can't explain what's happening here. tegra_xusb_padctl_driver never
> binds to the phy-usb2.0 device, so I don't understand how it could end
> up suspending the device with that set of dev_pm_ops. Perhaps this is
> some weird type of corruption somewhere?
> 
> Thierry
> 

Hi Thierry,
I figured out that phy-usb2.0 device is bound to tegra-xusb-padctl driver by
those two lines in tegra_xusb_setup_usb_role_switch()

	port->usb_phy.dev = &lane->pad->lanes[port->index]->dev;
	port->usb_phy.dev->driver = port->padctl->dev->driver;

Instead of assigning lane (phy) device to 'struct usb_phy', I think it should be
the port device (port->dev) since the 'usb-role-switch' capability belongs to
port device.

	port->usb_phy.dev = &port->dev;

I will submit a patch and ask for your review.

Thanks,
JC
