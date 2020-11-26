Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C945AC56202
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Nov 2020 15:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73CC920665
	for <linux-tegra@archiver.kernel.org>; Thu, 26 Nov 2020 15:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUL+bBJ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391370AbgKZPbQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391368AbgKZPbP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Nov 2020 10:31:15 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCF7C0613D4;
        Thu, 26 Nov 2020 07:31:15 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id m6so2551634wrg.7;
        Thu, 26 Nov 2020 07:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=33G2Aw3cGR8fTdmd4bVmmACQpGg8i7XaRf6DP/2Dh78=;
        b=AUL+bBJ6+TTNvTF+WPlDhIWJ4eIPV0Z6KrcKw3WROMEB1ZzOjiR8zsJYJkckbx6ZH6
         GidcFOEa6f7yCyl362OmqDy2ODXEWyhpWcOfyVpt941+Mqc1jqOztOKITujqRC/lIeSH
         0H+Xi2poObhhMyWz5k24rx//wOUvGPLArrNrb0LAp/Lz/jxP2SPFUwQ6y3Q5/ywwRg0o
         8jCwtJOZhGqehpgDEf7CSztkw3glxvZ0O3uK/GFQfaRCfgQlCwxDBgYUKgFkgeSu3vVN
         kZM+umkM4pYgo/sS+E+0ACnhKR5R0HWRfP2r1NGWaaC25PlxqFSxK2e/jh7mPvBKuxY1
         eX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=33G2Aw3cGR8fTdmd4bVmmACQpGg8i7XaRf6DP/2Dh78=;
        b=scXEhjYAMQw652jNo50rf26S8/RnDygDBaL5buNANhgESw7qmfW8g93yJPCC8k9/AY
         tNaCoGqd4HiRfgP1DyuCiw4Quo/pflMslRK2tf3e5ZP/9/iWXqwHQhQ1QVVDR7jjfWAS
         Fny4HyTLNIZO/tzjzDlwgb/yj/f1ZhGYCwSR14jPfPrfut76NeU6uZmpe3nMYx86+qRp
         svkSk/QeYXqUSS6dkU7NhrT30T8ipuB25YsIcOmNdE/KKTLjYgZ2v1duDDcNdElO3j4u
         /HXsvjhfgl5rl59ntBkugD8ZjcS5YO9W1w90F/ORGnhLI/Iqkjsos1BSJ95J0yDluWuD
         MF4Q==
X-Gm-Message-State: AOAM53242+WPb5pEphxT4OIxToNxOHgRdjVHRlwKjc2T66pIXjkK7cYX
        5NeJu2k5dY2e75y1oc9neNZYRAQw0F4=
X-Google-Smtp-Source: ABdhPJx7eDLOL3dQjC1CQ45Mb8OE6ssDTX0Ve4IPHbTS77oNWkrSC2ZMgLVcmPPRG6yIkJNswknW2Q==
X-Received: by 2002:a5d:510d:: with SMTP id s13mr4494577wrt.380.1606404674237;
        Thu, 26 Nov 2020 07:31:14 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f18sm9410313wru.42.2020.11.26.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:31:12 -0800 (PST)
Date:   Thu, 26 Nov 2020 16:31:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     kishon@ti.com, vkoul@kernel.org, gregkh@linuxfoundation.org,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v1] phy: tegra: xusb: Fix usb_phy device driver field
Message-ID: <X7/KP/rnFkw329TY@ulmo>
References: <20201117083803.185209-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WN6ltYL4TufsTCLD"
Content-Disposition: inline
In-Reply-To: <20201117083803.185209-1-jckuo@nvidia.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--WN6ltYL4TufsTCLD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 04:38:03PM +0800, JC Kuo wrote:
> In commit "phy: tegra: xusb: Add usb-phy support", an OTG capable PHY
> device, such as phy-usb2.0 device of Jetson-TX1 platform, will be
> bound to the tegra-xusb-padctl driver by the following line in
> tegra_xusb_setup_usb_role_switch().
>=20
> 	port->usb_phy.dev->driver =3D port->padctl->dev->driver;
>=20
> With this, dev_pm_ops set of tegra-xusb-padctl driver will be invoked
> for the OTG capable PHY incorrectly as below logs show.
>=20
> This commit fixes the issue by assigning an empty driver to it.
>=20
> [  153.451108] tegra-xusb-padctl phy-usb2.0: > tegra_xusb_padctl_suspend_=
noirq(dev=3Dffff000080917000)
> [  153.460353] tegra-xusb-padctl phy-usb2.0:   driver: ffff8000114453e0 (=
tegra_xusb_padctl_driver)
> [  153.469245] tegra-xusb-padctl phy-usb2.0:   padctl: ffff0000829f6480
> [  153.475772] tegra-xusb-padctl phy-usb2.0:     soc: ef7bdd7fffffffff (0=
xef7bdd7fffffffff)
> [  153.484061] Unable to handle kernel paging request at virtual address =
007bdd800000004f
> [  153.492132] Mem abort info:
> [  153.495083]   ESR =3D 0x96000004
> [  153.498308]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [  153.503771]   SET =3D 0, FnV =3D 0
> [  153.506979]   EA =3D 0, S1PTW =3D 0
> [  153.510260] Data abort info:
> [  153.513200]   ISV =3D 0, ISS =3D 0x00000004
> [  153.517181]   CM =3D 0, WnR =3D 0
> [  153.520302] [007bdd800000004f] address between user and kernel address=
 ranges
> [  153.527600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  153.533231] Modules linked in: nouveau panel_simple tegra_video(C) teg=
ra_drm drm_ttm_helper videobuf2_dma_contig ttm videobuf2_memops cec videobu=
f2_v4l2 videobuf2_common drm_kms_helper v4l2_fwnode videodev drm mc snd_hda=
_codec_hdmi cdc_ether usbnet snd_hda_tegra r8152 crct10dif_ce snd_hda_codec=
 snd_hda_core tegra_xudc host1x lp855x_bl at24 ip_tables x_tables ipv6
> [  153.566417] CPU: 0 PID: 300 Comm: systemd-sleep Tainted: G         C  =
      5.10.0-rc3-next-20201113-00019-g5c064d5372b0-dirty #624
> [  153.578283] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> [  153.584281] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
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
>=20
> Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--WN6ltYL4TufsTCLD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+/yjwACgkQ3SOs138+
s6FarQ/+KLMzGhRAJyRksGyp5J4x7FtZ2ncbxEyy5Ckgbxo61m6El35NaXHt3GX2
ydIbmgBxtiP13+BYIc2GmvPltA54TeVR7SgRtJhU0gM6ZgRqrGt/ECRwaYQitWFq
51SercayKWitTB0darPan4evzo4JqJZl/hSjotNnR9HyqkanysSyzOPYSBmxnRR6
nXuSEh9OZVi8zYWwUIyibZa5vWxzLc7ocCQin9G0hAYwgvjYg4pW2Jz6zA63UDxu
U+oLdfFC6zALZSaDKEqCsGIoIa6IMQT/C6rLjLXKqTPeBCmw4lALfOMfSN4HPYTG
9iX7vCipTeA+hf/Ozw3Nz1S29QGs2P1f9Iy45Dt79snTuvL2LwDmheSpbubj9Ui+
ChkNVfAwRLWsAcaBUvvf8E5N3O13pXyfgaEfU/bH2QMuLCw0fgVGkTb4Y11XcM6c
9R/hldT3Np79+jrXGOtSsLbBNkwV3AkDYNtX+uScHCmRcy1YvR39dAi7NJkAu1W1
QG8GeIdDV0FyhRb15AXu3NTOGrnzdnoQ+vGxTZJ4AcjroFScGaNqb/xv35CKD4nj
HR+53WGZYVPSt6xCHSzcwYl7EjatTRDrMW0R3VEh/YvPIkgx894VuYwWbSPUQWkZ
m9eY2S/MVO+iLb2/Zw7+bhsED0ABWLIgQ4qy+nPjJD0kdLFtkMQ=
=ufTC
-----END PGP SIGNATURE-----

--WN6ltYL4TufsTCLD--
