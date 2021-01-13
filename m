Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BB6C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 11:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7CBA233ED
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Jan 2021 11:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbhAMLbF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:31:05 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:19817 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbhAMLbD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Jan 2021 06:31:03 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffed9ce0003>; Wed, 13 Jan 2021 03:30:22 -0800
Received: from [10.26.73.78] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Jan
 2021 11:30:19 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 0/5] Enable fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
CC:     <kernel-team@android.com>, <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201218031703.3053753-1-saravanak@google.com>
Message-ID: <56f7d032-ba5a-a8c7-23de-2969d98c527e@nvidia.com>
Date:   Wed, 13 Jan 2021 11:30:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218031703.3053753-1-saravanak@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610537422; bh=8q813kBduZYotJ8SLu7NnJIbwB0nC2Gj803ai7R2W6E=;
        h=From:Subject:To:CC:References:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=K0TdJBpyrzEvvdKqu8Dne8VBvPTa2/Sf3XCNB/q137JdQJhAE3cnCBzbtYqBwXKMo
         vLJZCoptXeFqwFrB5JI/bnUua3QZvz9b1dtawEtAh2YiPpOq1kFsxj+i3vkUmz/Na4
         XqV2AwOLHfRRy2coFfN9wtTQnra3HliFtny3gQpLfViQkEVuoATAV76a1ciwwAOF6U
         kcnlbVKeSjbEXm90SJe2ZbX5kbc3gfQREMNMQZT9vcXF7JtLwtwQKibza65Y46Lhbv
         Y/N7XmMvifpi/OFCXW0778aJTN86fz2Cgt7KQZD0KeReuzBL7jjTKpSYosiXaY/40w
         a5EK9csw6LcBQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/12/2020 03:16, Saravana Kannan wrote:
> As discussed in LPC 2020, cyclic dependencies in firmware that couldn't
> be broken using logic was one of the last remaining reasons
> fw_devlink=on couldn't be set by default.
> 
> This series changes fw_devlink so that when a cyclic dependency is found
> in firmware, the links between those devices fallback to permissive mode
> behavior. This way, the rest of the system still benefits from
> fw_devlink, but the ambiguous cases fallback to permissive mode.
> 
> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> only for systems with device tree firmware):
> * Significantly cuts down deferred probes.
> * Device probe is effectively attempted in graph order.
> * Makes it much easier to load drivers as modules without having to
>   worry about functional dependencies between modules (depmod is still
>   needed for symbol dependencies).


One issue we have come across with this is the of_mdio.c driver. On
Tegra194 Jetson Xavier I am seeing the following ...

boot: logs: [       4.194791] WARNING KERN WARNING: CPU: 0 PID: 1 at /dvs/git/dirty/git-master_l4t-upstream/kernel/drivers/base/core.c:1189 device_links_driver_bound+0x240/0x260
boot: logs: [       4.207683] WARNING KERN Modules linked in:
boot: logs: [       4.210691] WARNING KERN CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3-next-20210112-gdf869cab4b35 #1
boot: logs: [       4.219221] WARNING KERN Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
boot: logs: [       4.225628] WARNING KERN pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
boot: logs: [       4.231542] WARNING KERN pc : device_links_driver_bound+0x240/0x260
boot: logs: [       4.236587] WARNING KERN lr : device_links_driver_bound+0xf8/0x260
boot: logs: [       4.241560] WARNING KERN sp : ffff800011f4b980
boot: logs: [       4.244819] WARNING KERN x29: ffff800011f4b980 x28: ffff00008208a0a0
boot: logs: [       4.250051] WARNING KERN x27: ffff00008208a080 x26: 00000000ffffffff
boot: logs: [       4.255271] WARNING KERN x25: 0000000000000003 x24: ffff800011b99000
boot: logs: [       4.260489] WARNING KERN x23: 0000000000000001 x22: ffff800011df14f0
boot: logs: [       4.265706] WARNING KERN x21: ffff800011f4b9f8 x20: ffff800011df1000
boot: logs: [       4.270934] WARNING KERN x19: ffff00008208a000 x18: 0000000000000005
boot: logs: [       4.276166] WARNING KERN x17: 0000000000000007 x16: 0000000000000001
boot: logs: [       4.281382] WARNING KERN x15: ffff000080030c90 x14: ffff0000805c9df8
boot: logs: [       4.286618] WARNING KERN x13: 0000000000000000 x12: ffff000080030c90
boot: logs: [       4.291847] WARNING KERN x11: ffff0000805c9da8 x10: 0000000000000040
boot: logs: [       4.297061] WARNING KERN x9 : ffff000080030c98 x8 : 0000000000000000
boot: logs: [       4.302291] WARNING KERN x7 : 0000000000000009 x6 : 0000000000000000
boot: logs: [       4.307509] WARNING KERN x5 : ffff000080100000 x4 : 0000000000000000
boot: logs: [       4.312739] WARNING KERN x3 : ffff800011df1e38 x2 : ffff000080908c10
boot: logs: [       4.317956] WARNING KERN x1 : 0000000000000001 x0 : ffff0000809ca400
boot: logs: [       4.323183] WARNING KERN Call trace:
boot: logs: [       4.325593] WARNING KERN  device_links_driver_bound+0x240/0x260
boot: logs: [       4.330301] WARNING KERN  driver_bound+0x70/0xd0
boot: logs: [       4.333740] WARNING KERN  device_bind_driver+0x50/0x60
boot: logs: [       4.337671] WARNING KERN  phy_attach_direct+0x258/0x2e0
boot: logs: [       4.341718] WARNING KERN  phylink_of_phy_connect+0x7c/0x140
boot: logs: [       4.346081] WARNING KERN  stmmac_open+0xb04/0xc70
boot: logs: [       4.349612] WARNING KERN  __dev_open+0xe0/0x190
boot: logs: [       4.352972] WARNING KERN  __dev_change_flags+0x16c/0x1b8
boot: logs: [       4.357081] WARNING KERN  dev_change_flags+0x20/0x60
boot: logs: [       4.360856] WARNING KERN  ip_auto_config+0x2a0/0xfe8
boot: logs: [       4.364633] WARNING KERN  do_one_initcall+0x58/0x1b8
boot: logs: [       4.368405] WARNING KERN  kernel_init_freeable+0x1ec/0x240
boot: logs: [       4.372698] WARNING KERN  kernel_init+0x10/0x110
boot: logs: [       4.376130] WARNING KERN  ret_from_fork+0x10/0x18


So looking at this change does this mean that the of_mdio needs to be
converted to a proper driver? I would have thought that this will be
seen on several platforms.

Cheers
Jon

-- 
nvpublic
