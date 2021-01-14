Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05816C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 16:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B352F23B27
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Jan 2021 16:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbhANQLv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Jan 2021 11:11:51 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9936 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbhANQLu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Jan 2021 11:11:50 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60006d1d0001>; Thu, 14 Jan 2021 08:11:09 -0800
Received: from [10.26.73.78] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 16:11:04 +0000
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201218031703.3053753-1-saravanak@google.com>
 <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com>
 <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <17939709-f6f4-fa9c-836f-9779081c4087@nvidia.com>
Date:   Thu, 14 Jan 2021 16:11:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx9FAAa+gUOTJX76DGGOAE4g3cTbZhwNQ-pLioYzg=fTOw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610640669; bh=txmzy9eWPzuk4trDgylEZViEBSx3xBFY2jngASTAuzM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=dx4O2nwhtIq06qFs4Gry1FSAxJ4dAflblUKQUS8GnmLlW3fGJ7ozMfov1JhX8YCIG
         F+U4hB6U6VbzTteiDWfb3tMdhA5MwLcvK7s6x6NjoTGFEjUHfuZz1xiFHSkudDziJV
         dCMth+GKb5E+8322fGCH1ZSo7bW6Rh4dvEqtXfcH4h1APH5V/gb1W6qoWZbJHXB5aK
         9mkhTbTiL+jdVOXwILuA78M3APvedTJOSF/f6Nd1jCdfs9WivbAWcKOnRyG/gR4r3V
         b6D5RdYNPGcDF093mCGewmi/i/R4ogFcPPKeJ38dyzdWXyA2BLYQELJ2zt5scN2PDs
         3yckdfqwN9LrA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/01/2021 21:26, Saravana Kannan wrote:
> On Wed, Jan 13, 2021 at 3:30 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 18/12/2020 03:16, Saravana Kannan wrote:
>>> As discussed in LPC 2020, cyclic dependencies in firmware that couldn't
>>> be broken using logic was one of the last remaining reasons
>>> fw_devlink=on couldn't be set by default.
>>>
>>> This series changes fw_devlink so that when a cyclic dependency is found
>>> in firmware, the links between those devices fallback to permissive mode
>>> behavior. This way, the rest of the system still benefits from
>>> fw_devlink, but the ambiguous cases fallback to permissive mode.
>>>
>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
>>> only for systems with device tree firmware):
>>> * Significantly cuts down deferred probes.
>>> * Device probe is effectively attempted in graph order.
>>> * Makes it much easier to load drivers as modules without having to
>>>   worry about functional dependencies between modules (depmod is still
>>>   needed for symbol dependencies).
>>
>>
>> One issue we have come across with this is the of_mdio.c driver. On
>> Tegra194 Jetson Xavier I am seeing the following ...
>>
>> boot: logs: [       4.194791] WARNING KERN WARNING: CPU: 0 PID: 1 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/base/core.c:1189 device_links_driver_bound+0x240/0x260
>> boot: logs: [       4.207683] WARNING KERN Modules linked in:
>> boot: logs: [       4.210691] WARNING KERN CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3-next-20210112-gdf869cab4b35 #1
>> boot: logs: [       4.219221] WARNING KERN Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
>> boot: logs: [       4.225628] WARNING KERN pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
>> boot: logs: [       4.231542] WARNING KERN pc : device_links_driver_bound+0x240/0x260
>> boot: logs: [       4.236587] WARNING KERN lr : device_links_driver_bound+0xf8/0x260
>> boot: logs: [       4.241560] WARNING KERN sp : ffff800011f4b980
>> boot: logs: [       4.244819] WARNING KERN x29: ffff800011f4b980 x28: ffff00008208a0a0
>> boot: logs: [       4.250051] WARNING KERN x27: ffff00008208a080 x26: 00000000ffffffff
>> boot: logs: [       4.255271] WARNING KERN x25: 0000000000000003 x24: ffff800011b99000
>> boot: logs: [       4.260489] WARNING KERN x23: 0000000000000001 x22: ffff800011df14f0
>> boot: logs: [       4.265706] WARNING KERN x21: ffff800011f4b9f8 x20: ffff800011df1000
>> boot: logs: [       4.270934] WARNING KERN x19: ffff00008208a000 x18: 0000000000000005
>> boot: logs: [       4.276166] WARNING KERN x17: 0000000000000007 x16: 0000000000000001
>> boot: logs: [       4.281382] WARNING KERN x15: ffff000080030c90 x14: ffff0000805c9df8
>> boot: logs: [       4.286618] WARNING KERN x13: 0000000000000000 x12: ffff000080030c90
>> boot: logs: [       4.291847] WARNING KERN x11: ffff0000805c9da8 x10: 0000000000000040
>> boot: logs: [       4.297061] WARNING KERN x9 : ffff000080030c98 x8 : 0000000000000000
>> boot: logs: [       4.302291] WARNING KERN x7 : 0000000000000009 x6 : 0000000000000000
>> boot: logs: [       4.307509] WARNING KERN x5 : ffff000080100000 x4 : 0000000000000000
>> boot: logs: [       4.312739] WARNING KERN x3 : ffff800011df1e38 x2 : ffff000080908c10
>> boot: logs: [       4.317956] WARNING KERN x1 : 0000000000000001 x0 : ffff0000809ca400
>> boot: logs: [       4.323183] WARNING KERN Call trace:
>> boot: logs: [       4.325593] WARNING KERN  device_links_driver_bound+0x240/0x260
>> boot: logs: [       4.330301] WARNING KERN  driver_bound+0x70/0xd0
>> boot: logs: [       4.333740] WARNING KERN  device_bind_driver+0x50/0x60
>> boot: logs: [       4.337671] WARNING KERN  phy_attach_direct+0x258/0x2e0
>> boot: logs: [       4.341718] WARNING KERN  phylink_of_phy_connect+0x7c/0x140
>> boot: logs: [       4.346081] WARNING KERN  stmmac_open+0xb04/0xc70
>> boot: logs: [       4.349612] WARNING KERN  __dev_open+0xe0/0x190
>> boot: logs: [       4.352972] WARNING KERN  __dev_change_flags+0x16c/0x1b8
>> boot: logs: [       4.357081] WARNING KERN  dev_change_flags+0x20/0x60
>> boot: logs: [       4.360856] WARNING KERN  ip_auto_config+0x2a0/0xfe8
>> boot: logs: [       4.364633] WARNING KERN  do_one_initcall+0x58/0x1b8
>> boot: logs: [       4.368405] WARNING KERN  kernel_init_freeable+0x1ec/0x240
>> boot: logs: [       4.372698] WARNING KERN  kernel_init+0x10/0x110
>> boot: logs: [       4.376130] WARNING KERN  ret_from_fork+0x10/0x18
>>
>>
>> So looking at this change does this mean that the of_mdio needs to be
>> converted to a proper driver?
> 
> Sorry, there's not enough context in this log for me to tell how this
> is even related to of_mdio.c. My guess is this is related to network
> stack directly calling device_bind_driver() and not updating device
> link state correctly. See what device_links_check_suppliers() does in
> the normal path. I think I know which warning this is, but can you
> check your tree and tell me the code you see in
> drivers/base/core.c:1189 ?

Yes this is the warning shown here [0] and this is coming from
the 'Generic PHY stmmac-0:00' device.
 
> Also, can you give me a few more lines above and below this log and
> also explain why you think this is related to of_mdio.c? Where is the
> DT file for this board in case I need to look at it? And where is this
> phy node defined in DT?

[    4.179760] dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x50
[    4.186743] dwc-eth-dwmac 2490000.ethernet: 	DWMAC4/5
[    4.191755] dwc-eth-dwmac 2490000.ethernet: DMA HW capability register supported
[    4.199062] dwc-eth-dwmac 2490000.ethernet: RX Checksum Offload Engine supported
[    4.206379] dwc-eth-dwmac 2490000.ethernet: TX Checksum insertion supported
[    4.213247] dwc-eth-dwmac 2490000.ethernet: Wake-Up On Lan supported
[    4.219617] dwc-eth-dwmac 2490000.ethernet: TSO supported
[    4.224954] dwc-eth-dwmac 2490000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    4.232800] dwc-eth-dwmac 2490000.ethernet: device MAC address 4a:48:a7:a2:2e:d6
[    4.240115] dwc-eth-dwmac 2490000.ethernet: Enabled Flow TC (entries=8)
[    4.246638] dwc-eth-dwmac 2490000.ethernet: TSO feature enabled
[    4.252499] dwc-eth-dwmac 2490000.ethernet: SPH feature enabled
[    4.258383] dwc-eth-dwmac 2490000.ethernet: Using 40 bits DMA width
[    4.265058] libphy: stmmac: probed
[    4.269421] irq: IRQ63: trimming hierarchy from :bus@0:pmc@c360000
[    4.276957] platform 3610000.usb: probe deferral - supplier 3520000.padctl not ready
[    4.286759] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.295970] cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 1305000 KHz, changing to: 1344000 KHz
[    4.308146] cpufreq: cpufreq_online: CPU2: Running at unlisted initial frequency: 1306000 KHz, changing to: 1344000 KHz
[    4.320108] cpufreq: cpufreq_online: CPU4: Running at unlisted initial frequency: 1305000 KHz, changing to: 1344000 KHz
[    4.332191] cpufreq: cpufreq_online: CPU6: Running at unlisted initial frequency: 1305000 KHz, changing to: 1344000 KHz
[    4.349276] sdhci-tegra 3400000.mmc: Got CD GPIO
[    4.360405] mmc0: CQHCI version 5.10
[    4.363006] tegra-xusb 3610000.usb: Firmware timestamp: 2019-07-24 05:47:34 UTC
[    4.371278] tegra-xusb 3610000.usb: xHCI Host Controller
[    4.371298] tegra-xusb 3610000.usb: new USB bus registered, assigned bus number 1
[    4.371958] tegra-xusb 3610000.usb: hcc params 0x0184ff25 hci version 0x110 quirks 0x0000000000010810
[    4.372001] tegra-xusb 3610000.usb: irq 29, io mem 0x03610000
[    4.372522] hub 1-0:1.0: USB hub found
[    4.372546] hub 1-0:1.0: 4 ports detected
[    4.372887] tegra-xusb 3610000.usb: xHCI Host Controller
[    4.372894] tegra-xusb 3610000.usb: new USB bus registered, assigned bus number 2
[    4.372900] tegra-xusb 3610000.usb: Host supports USB 3.1 Enhanced SuperSpeed
[    4.373227] hub 2-0:1.0: USB hub found
[    4.373251] hub 2-0:1.0: 4 ports detected
[    4.376437] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.447782] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.457409] irq: IRQ64: trimming hierarchy from :bus@0:pmc@c360000
[    4.463735] irq: IRQ65: trimming hierarchy from :bus@0:interrupt-controller@3881000
[    4.471401] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    4.476701] mmc0: SDHCI controller on 3460000.mmc [3460000.mmc] using ADMA 64-bit
[    4.485440] irq: IRQ66: trimming hierarchy from :bus@0:pmc@c360000
[    4.486043] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.492120] mmc1: SDHCI controller on 3400000.mmc [3400000.mmc] using ADMA 64-bit
[    4.507063] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.514674] ------------[ cut here ]------------
[    4.524876] WARNING: CPU: 3 PID: 1 at /local/workdir/tegra/mlt-linux_next/kernel/drivers/base/core.c:1188 device_links_driver_bound+0x29c/0x2d8
[    4.537563] Modules linked in:
[    4.540602] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3-next-20210113-dirty #1
[    4.548545] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[    4.555019] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[    4.560938] pc : device_links_driver_bound+0x29c/0x2d8
[    4.566050] lr : device_links_driver_bound+0x29c/0x2d8
[    4.571171] sp : ffff800011f4b980
[    4.574467] x29: ffff800011f4b980 x28: ffff00008208a080 
[    4.579732] x27: ffff00008208a0a0 x26: ffff000080908c10 
[    4.585036] x25: ffff800011e4af73 x24: ffff800011b99000 
[    4.590347] x23: ffff800011df1428 x22: ffff800011f4b9f8 
[    4.595634] x21: ffff800011df1000 x20: ffff00008208a000 
[    4.600916] x19: ffff0000809ca400 x18: ffffffffffffffff 
[    4.606236] x17: 0000000000000007 x16: 0000000000000001 
[    4.611479] x15: 0000000000000613 x14: ffff800011f4b610 
[    4.616780] x13: 00000000ffffffea x12: ffff800011c0a320 
[    4.622027] x11: 0000000000000001 x10: 0000000000000001 
[    4.627304] x9 : 0000000000000003 x8 : ffff800011bb2378 
[    4.632589] x7 : ffff800011c0a378 x6 : c0000000ffffefff 
[    4.637831] x5 : 0000000000017fe8 x4 : 0000000000000000 
[    4.643124] x3 : 00000000ffffffff x2 : ffff800011bb22e8 
[    4.645339] mmc0: Command Queue Engine enabled
[    4.648397] x1 : a13f0a1c9773d600 x0 : 0000000000000000 
[    4.648414] Call trace:
[    4.648424]  device_links_driver_bound+0x29c/0x2d8
[    4.648446]  driver_bound+0x6c/0xf8
[    4.648455]  device_bind_driver+0x50/0x60
[    4.648462]  phy_attach_direct+0x258/0x2e0
[    4.648473]  phylink_of_phy_connect+0x7c/0x140
[    4.652967] mmc0: new HS200 MMC card at address 0001
[    4.658075]  stmmac_open+0xb04/0xc70
[    4.658093]  __dev_open+0xe0/0x190
[    4.658142]  __dev_change_flags+0x16c/0x1b8
[    4.665285]  dev_change_flags+0x20/0x60
[    4.665326]  ip_auto_config+0x2a0/0xfe8
[    4.665340]  do_one_initcall+0x58/0x1b8
[    4.672731]  kernel_init_freeable+0x1ec/0x240
[    4.672746]  kernel_init+0x10/0x110
[    4.716301]  ret_from_fork+0x10/0x18
[    4.719865] ---[ end trace 819cead1701ad8da ]---
[    4.724955] platform 31c0000.i2c: probe deferral - wait for supplier dpaux@155e0000
[    4.725143] mmcblk0: mmc0:0001 HBG4a2 29.1 GiB 
[    4.725260] dwc-eth-dwmac 2490000.ethernet eth0: PHY [stmmac-0:00] driver [Generic PHY] (irq=POLL)
[    4.726387] dwmac4: Master AXI performs any burst length
[    4.726410] dwc-eth-dwmac 2490000.ethernet eth0: No Safety Features support found
[    4.726840] dwc-eth-dwmac 2490000.ethernet eth0: IEEE 1588-2008 Advanced Timestamp supported
[    4.727011] dwc-eth-dwmac 2490000.ethernet eth0: registered PTP clock
[    4.737024] dwc-eth-dwmac 2490000.ethernet eth0: configuring for phy/rgmii-id link mode


The warning is occurring when device_bind_driver() is called in
phy_attach_direct() [1]. The device-tree ethernet node for this
board can be found here [2]. 

> If there's an easy way to convert it to a proper driver, that's always
> better than calling into driver core in a piecemeal fashion.

So this is a generic phy driver that has been around for quite some
time AFAICT. 
 
>> I would have thought that this will be
>> seen on several platforms.
> 
> I'm surprised you are seeing this issue only now. I'd have expected it
> to have happened even without this series.

We have automated testing that checks for new warnings with -next and
this is definitely new and the bisect points to this change.

Cheers
Jon 
 

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/base/core.c?h=next-20210112#n1189
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/net/phy/phy_device.c?h=next-20210112#n1357
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi?h=next-20210112#n31

-- 
nvpublic
