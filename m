Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD1C388F7
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDC142137B
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 16:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyeS1LLD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgKMQpG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Nov 2020 11:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgKMQpG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Nov 2020 11:45:06 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741FBC0613D1;
        Fri, 13 Nov 2020 08:45:04 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id s13so9038339wmh.4;
        Fri, 13 Nov 2020 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w3tTeimsV7KGyYQSPfv9SeS1lBQXGPjuqYfC+5XH5KI=;
        b=iyeS1LLDqzvM9Nzps8PD90IxAbzzRzoR5CT+0pS0zuFTgHzaUu+KZrjWfP8nf4S2Bi
         l9/eAFV507IbALmpVOnFWchGR8VYr/wLxxj2BHQ1b1ZBrPfLIkMobEJUvpsR6S2ejCRq
         yAaxzYIJSZ5PxuqY/fBLLVkNyre0ALqD6d14ykDgOQXV7Tn6f242FYVjMkDsnHhJHQaJ
         VifX4MHW3wVNXpVCbcOv6qHz1SSxO1rlZhV/golqJO3ifOOxrnnMBrBK1s94P1SnxHVt
         lDL5LgyNH3nP7YuwfJDBN1cYQ4PQ80pKsX8y+uZq0kFS2YLEhPUM5fQ59/n4gxa9CLmP
         oC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w3tTeimsV7KGyYQSPfv9SeS1lBQXGPjuqYfC+5XH5KI=;
        b=VL7qENfLSQVRgMABPl1GQNZwHgN9Tpk58iSBzcVz0ljiQnnjukTgoP9SdKSHt4Lq3h
         2eD+4Zrzwqg0XI2JGM7Ch3AEjeo1RaV5E/CDsgCVJyZG5xs+Gry7wnOuJY9mH/7lLIez
         zBq49yNuJteSL6jhruMnufzNNVpBXHhNXn8hizHv0Q7JWySn4eyEGO40Dn9MVeiQOUJ+
         CjCUdoUpk0l2q3EGz3uwkd6I3vrQMxYbhypfuJot6Yt1I3DzS++3oqazlnjyPTOpkpv2
         HfCe7S84CYBGuzOOnmwV6ib0BOI8LmpmS9fjbhJcuKED0qGUW1A351fWETz6jaKZt0ZN
         UlQw==
X-Gm-Message-State: AOAM531g0uCkHnU3X+PFTl78nV6ZedfQeZ5QTINA8j46nBYjeRpc0tH9
        AD90mI/V/LP+FsbXShVVPlY=
X-Google-Smtp-Source: ABdhPJz5G5ud1mfgz5CSN1RmYNnQ+Xy235w4dA9chcJ0UI8urW/wzporWQvrWq5O71L2s5nPFnI6JQ==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr419285wme.73.1605285898183;
        Fri, 13 Nov 2020 08:44:58 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c6sm12442041wrh.74.2020.11.13.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 08:44:56 -0800 (PST)
Date:   Fri, 13 Nov 2020 17:44:55 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v4 00/16] Tegra XHCI controller ELPG support
Message-ID: <20201113164455.GG1408970@ulmo>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Content-Disposition: inline
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 09:07:10PM +0800, JC Kuo wrote:
> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> state for power saving when all of the connected USB devices are in
> suspended state. This patch series includes clk, phy and pmc changes
> that are required for properly place controller in ELPG and bring
> controller out of ELPG.
>=20
> JC Kuo (16):
>   clk: tegra: Add PLLE HW power sequencer control
>   clk: tegra: Don't enable PLLE HW sequencer at init
>   phy: tegra: xusb: Move usb3 port init for Tegra210
>   phy: tegra: xusb: tegra210: Do not reset UPHY PLL
>   phy: tegra: xusb: Rearrange UPHY init on Tegra210
>   phy: tegra: xusb: Add Tegra210 lane_iddq operation
>   phy: tegra: xusb: Add sleepwalk and suspend/resume
>   soc/tegra: pmc: Provide USB sleepwalk register map
>   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
>   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
>   phy: tegra: xusb: Tegra210 host mode VBUS control
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
>   arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq
>   usb: host: xhci-tegra: Unlink power domain devices
>   xhci: tegra: Enable ELPG for runtime/system PM
>=20
>  .../phy/nvidia,tegra124-xusb-padctl.txt       |    1 +
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi      |    1 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |    1 +
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi      |    2 +
>  drivers/clk/tegra/clk-pll.c                   |   12 -
>  drivers/clk/tegra/clk-tegra210.c              |   53 +-
>  drivers/phy/tegra/xusb-tegra186.c             |  558 ++++-
>  drivers/phy/tegra/xusb-tegra210.c             | 1889 +++++++++++++----
>  drivers/phy/tegra/xusb.c                      |   92 +-
>  drivers/phy/tegra/xusb.h                      |   22 +-
>  drivers/soc/tegra/pmc.c                       |   94 +
>  drivers/usb/host/xhci-tegra.c                 |  610 ++++--
>  include/linux/clk/tegra.h                     |    4 +-
>  include/linux/phy/tegra/xusb.h                |   10 +-
>  14 files changed, 2785 insertions(+), 564 deletions(-)

I've been testing this, but I keep seeing the following oops on suspend
on a Jetson TX1:

[  153.451108] tegra-xusb-padctl phy-usb2.0: > tegra_xusb_padctl_suspend_no=
irq(dev=3Dffff000080917000)
[  153.460353] tegra-xusb-padctl phy-usb2.0:   driver: ffff8000114453e0 (te=
gra_xusb_padctl_driver)
[  153.469245] tegra-xusb-padctl phy-usb2.0:   padctl: ffff0000829f6480
[  153.475772] tegra-xusb-padctl phy-usb2.0:     soc: ef7bdd7fffffffff (0xe=
f7bdd7fffffffff)
[  153.484061] Unable to handle kernel paging request at virtual address 00=
7bdd800000004f
[  153.492132] Mem abort info:
[  153.495083]   ESR =3D 0x96000004
[  153.498308]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  153.503771]   SET =3D 0, FnV =3D 0
[  153.506979]   EA =3D 0, S1PTW =3D 0
[  153.510260] Data abort info:
[  153.513200]   ISV =3D 0, ISS =3D 0x00000004
[  153.517181]   CM =3D 0, WnR =3D 0
[  153.520302] [007bdd800000004f] address between user and kernel address r=
anges
[  153.527600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  153.533231] Modules linked in: nouveau panel_simple tegra_video(C) tegra=
_drm drm_ttm_helper videobuf2_dma_contig ttm videobuf2_memops cec videobuf2=
_v4l2 videobuf2_common drm_kms_helper v4l2_fwnode videodev drm mc snd_hda_c=
odec_hdmi cdc_ether usbnet snd_hda_tegra r8152 crct10dif_ce snd_hda_codec s=
nd_hda_core tegra_xudc host1x lp855x_bl at24 ip_tables x_tables ipv6
[  153.566417] CPU: 0 PID: 300 Comm: systemd-sleep Tainted: G         C    =
    5.10.0-rc3-next-20201113-00019-g5c064d5372b0-dirty #624
[  153.578283] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[  153.584281] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
[  153.590381] pc : tegra_xusb_padctl_suspend_noirq+0x88/0x100
[  153.596016] lr : tegra_xusb_padctl_suspend_noirq+0x80/0x100
[  153.601632] sp : ffff8000120dbb60
[  153.604999] x29: ffff8000120dbb60 x28: ffff000080a1df00
[  153.610430] x27: 0000000000000002 x26: ffff8000106f8540
[  153.615858] x25: ffff8000113ac4a4 x24: ffff80001148c198
[  153.621277] x23: ffff800010c4538c x22: 0000000000000002
[  153.626692] x21: ffff800010ccde80 x20: ffff0000829f6480
[  153.632107] x19: ffff000080917000 x18: 0000000000000030
[  153.637521] x17: 0000000000000000 x16: 0000000000000000
[  153.642933] x15: ffff000080a1e380 x14: 74636461702d6273
[  153.648346] x13: ffff8000113ad058 x12: 0000000000000f39
[  153.653759] x11: 0000000000000513 x10: ffff800011405058
[  153.659176] x9 : 00000000fffff000 x8 : ffff8000113ad058
[  153.664590] x7 : ffff800011405058 x6 : 0000000000000000
[  153.670002] x5 : 0000000000000000 x4 : ffff0000fe908bc0
[  153.675414] x3 : ffff0000fe910228 x2 : 162ef67e0581e700
[  153.680826] x1 : 162ef67e0581e700 x0 : ef7bdd7fffffffff
[  153.686241] Call trace:
[  153.688769]  tegra_xusb_padctl_suspend_noirq+0x88/0x100
[  153.694077]  __device_suspend_noirq+0x68/0x1cc
[  153.698594]  dpm_noirq_suspend_devices+0x10c/0x1d0
[  153.703456]  dpm_suspend_noirq+0x28/0xa0
[  153.707461]  suspend_devices_and_enter+0x234/0x4bc
[  153.712314]  pm_suspend+0x1e4/0x270
[  153.715868]  state_store+0x8c/0x110
[  153.719440]  kobj_attr_store+0x1c/0x30
[  153.723259]  sysfs_kf_write+0x4c/0x7c
[  153.726981]  kernfs_fop_write+0x124/0x240
[  153.731065]  vfs_write+0xe4/0x204
[  153.734449]  ksys_write+0x6c/0x100
[  153.737925]  __arm64_sys_write+0x20/0x30
[  153.741931]  el0_svc_common.constprop.0+0x78/0x1a0
[  153.746789]  do_el0_svc+0x24/0x90
[  153.750181]  el0_sync_handler+0x254/0x260
[  153.754251]  el0_sync+0x174/0x180
[  153.757663] Code: aa0303e2 94000f64 f9405680 b40000e0 (f9402803)
[  153.763826] ---[ end trace 81543a3394cb409d ]---

Note that I've added a bit of debug information there to show what's
going on. See how tegra_xusb_padctl_suspend_noirq() is being called for
the phy-usb2.0 device? That's one of the PHYs that's being created for
the USB2 lanes. Sometimes I do see that padctl->soc ends up being NULL
for that device and in that case the function just aborts early and then
tegra_xusb_padctl_suspend_noirq() will get called again for the padctl
device and succeed.

I can't explain what's happening here. tegra_xusb_padctl_driver never
binds to the phy-usb2.0 device, so I don't understand how it could end
up suspending the device with that set of dev_pm_ops. Perhaps this is
some weird type of corruption somewhere?

Thierry

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+uuAcACgkQ3SOs138+
s6HhJRAAhIzGiht64leNoRXPprKnW6lHKN1r2ajglsfVhD33Vz6ZN7y7Lj4o0vBo
5KzmMKHASLMs6sCtpCH/8lIsvyh2r78gUg7wAam2XxkEOFbcMJHGXQAwXcwwPZCc
BjqOULXVOSS4aXpuZN/0KeMmZE3DJ4k7WJ6VuNzfs9zVK9Hain7JKmIILZFQN/V+
+cUThQtOt11R8f/Bc2Z99sunlJhaH7SXt4mU8jZVTACOh9Z47bQYqAa79VpoFzoC
PAT1fLqNTDUez30psdqQT/vbbx85OP7dZNJroFhU4m9b/rWXO3dnnTEZ8+Sjq9gk
KGd1OtJoE4bvhsC0nepyQkOoISP8qZQlqeteDXWSjAEgKskfbz+c1B0DdXHpyXUb
6kKl3NR5FTWX4P4dF5VNwZlnDfc7rqtKdzSbPRMUQCGo9PvHht9pjriu+Cv8Rc6+
7+1IqMH2SA2ylFZ0I8/BI5qwrayEKJH9fOEZ9GXCeaTqN96gBnlJMhUZsTdFMUjy
3uquBOOVOkhUMw1tkdyOYdJ6g9kFZgcZvNSQdoUgBNxf5FxGOcMZWGPq+jtLWtLB
HG8/w3xMqVqQbNskrdCTpkQJyoej7IvI/rSOtxEmYX8FsEkUwLZENS5NOfnQ8lWL
4+s3PoH2Buu3Q+W7iojUkHVO+k7sjpjhNBtJvIIuJfPJz7lqKSg=
=OrSO
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--
