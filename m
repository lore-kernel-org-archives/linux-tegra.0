Return-Path: <SRS0=mUr2=ED=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5DBC56202
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4DF320704
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsDlWTxf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730661AbgJ1W0Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732288AbgJ1W0Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:26:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F448C0613CF;
        Wed, 28 Oct 2020 15:26:23 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id t20so1102441edr.11;
        Wed, 28 Oct 2020 15:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DFt3OsdRuEz3CXOLtAVxHXrZK5+IKIOLidQMqe1NacM=;
        b=JsDlWTxfzAuIg2nrxgAAaqdUyd+UeKHpmbYpAf5+6Cag2nEZBupfl0u8jvleNBW6xJ
         oVgeyeyCboCMPA0sVMsp6RUPF0xBCZOFF9cnWhOxYh0Lwo+19y8y/eSOoa4dfTA83iuE
         rOUduuUgo6IjDQNE+RttmeyNhPejU4hzaVSkMpHbMaaKgIv/K8ECX3G1mmHxJ0gmhk5M
         u/JQQDeIot++TKYYpbMJbywgT552zizhjWbfCDoKk7oet4sNb4iJxlM1iI3xr4O0wCiL
         VZYfhcsx6bBrDK4Lx3J4j5h+HetgwTSee1MYEZLmIoLikoykr0WtsJqHWzZ2Hkfg0gfm
         10GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DFt3OsdRuEz3CXOLtAVxHXrZK5+IKIOLidQMqe1NacM=;
        b=ZRdSZPwefNyY/46zBZdD4KFY+p+Tg7YsfilP+tNGAzJLDRHRoKRhTjGwxEqXtuZsPX
         Uzm2DMqtAWwLYwdyHYp1b6TOdGDtmIXH+3xA3Eq7r5uufOAWBGz7306mfWdSqOM/yTBA
         REbPs1eS/bIvQIXfvxerd8Posz4mtrlPSnGWKF8vJtTrGPuOsgOC/aceb/xCaLSAofyR
         GRNFa20abh0kQYA/Agj8QU2bHeXW5etKmh11VCqHKfrtNgryGfiWM2Z5lIRg/nN9fBVo
         N6g+6lGpLtCjXD+ALF7yWxeaTLaVew5WRKAtATXhg3FBJOzXHrktYE3EwwD2g6szxOQG
         fiSg==
X-Gm-Message-State: AOAM532v+VZTRjz30RmIWB5Nv/yV1JxbpOqOoCGZd+/aCCGDy7ziuBEW
        jzReGT2ye29QoGfYtsMhOAou1mxNL/w=
X-Google-Smtp-Source: ABdhPJzLDPFfkFNWRJSCu21o/qzBa6227icsqhYSbn8/HpDZ+nrlhJvtmoj9iehd/PZp9PNOe1wCZg==
X-Received: by 2002:a50:ef12:: with SMTP id m18mr8774172eds.313.1603903534856;
        Wed, 28 Oct 2020 09:45:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w22sm104171edu.15.2020.10.28.09.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 09:45:33 -0700 (PDT)
Date:   Wed, 28 Oct 2020 17:45:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        JC Kuo <jckuo@nvidia.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Fix dangling pointer on probe failure
Message-ID: <20201028164531.GA252854@ulmo>
References: <20201013095820.311376-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20201013095820.311376-1-maz@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:58:20AM +0100, Marc Zyngier wrote:
> If, for some reason, the xusb PHY fails to probe, it leaves
> a dangling pointer attached to the platform device structure.
>=20
> This would normally be harmless, but the Tegra XHCI driver then
> goes and extract that pointer from the PHY device. Things go
> downhill from there:
>=20
>     8.752082] [004d554e5145533c] address between user and kernel address =
ranges
> [    8.752085] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    8.752088] Modules linked in: max77620_regulator(E+) xhci_tegra(E+) s=
dhci_tegra(E+) xhci_hcd(E) sdhci_pltfm(E) cqhci(E) fixed(E) usbcore(E) scsi=
_mod(E) sdhci(E) host1x(E+)
> [    8.752103] CPU: 4 PID: 158 Comm: systemd-udevd Tainted: G S      W   =
E     5.9.0-rc7-00298-gf6337624c4fe #1980
> [    8.752105] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
> [    8.752108] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=3D--)
> [    8.752115] pc : kobject_put+0x1c/0x21c
> [    8.752120] lr : put_device+0x20/0x30
> [    8.752121] sp : ffffffc012eb3840
> [    8.752122] x29: ffffffc012eb3840 x28: ffffffc010e82638
> [    8.752125] x27: ffffffc008d56440 x26: 0000000000000000
> [    8.752128] x25: ffffff81eb508200 x24: 0000000000000000
> [    8.752130] x23: ffffff81eb538800 x22: 0000000000000000
> [    8.752132] x21: 00000000fffffdfb x20: ffffff81eb538810
> [    8.752134] x19: 3d4d554e51455300 x18: 0000000000000020
> [    8.752136] x17: ffffffc008d00270 x16: ffffffc008d00c94
> [    8.752138] x15: 0000000000000004 x14: ffffff81ebd4ae90
> [    8.752140] x13: 0000000000000000 x12: ffffff81eb86a4e8
> [    8.752142] x11: ffffff81eb86a480 x10: ffffff81eb862fea
> [    8.752144] x9 : ffffffc01055fb28 x8 : ffffff81eb86a4a8
> [    8.752146] x7 : 0000000000000001 x6 : 0000000000000001
> [    8.752148] x5 : ffffff81dff8bc38 x4 : 0000000000000000
> [    8.752150] x3 : 0000000000000001 x2 : 0000000000000001
> [    8.752152] x1 : 0000000000000002 x0 : 3d4d554e51455300
> [    8.752155] Call trace:
> [    8.752157]  kobject_put+0x1c/0x21c
> [    8.752160]  put_device+0x20/0x30
> [    8.752164]  tegra_xusb_padctl_put+0x24/0x3c
> [    8.752170]  tegra_xusb_probe+0x8b0/0xd10 [xhci_tegra]
> [    8.752174]  platform_drv_probe+0x60/0xb4
> [    8.752176]  really_probe+0xf0/0x504
> [    8.752179]  driver_probe_device+0x100/0x170
> [    8.752181]  device_driver_attach+0xcc/0xd4
> [    8.752183]  __driver_attach+0xb0/0x17c
> [    8.752185]  bus_for_each_dev+0x7c/0xd4
> [    8.752187]  driver_attach+0x30/0x3c
> [    8.752189]  bus_add_driver+0x154/0x250
> [    8.752191]  driver_register+0x84/0x140
> [    8.752193]  __platform_driver_register+0x54/0x60
> [    8.752197]  tegra_xusb_init+0x40/0x1000 [xhci_tegra]
> [    8.752201]  do_one_initcall+0x54/0x2d0
> [    8.752205]  do_init_module+0x68/0x29c
> [    8.752207]  load_module+0x2178/0x26c0
> [    8.752209]  __do_sys_finit_module+0xb0/0x120
> [    8.752211]  __arm64_sys_finit_module+0x2c/0x40
> [    8.752215]  el0_svc_common.constprop.0+0x80/0x240
> [    8.752218]  do_el0_svc+0x30/0xa0
> [    8.752220]  el0_svc+0x18/0x50
> [    8.752223]  el0_sync_handler+0x90/0x318
> [    8.752225]  el0_sync+0x158/0x180
> [    8.752230] Code: a9bd7bfd 910003fd a90153f3 aa0003f3 (3940f000)
> [    8.752232] ---[ end trace 90f6c89d62d85ff5 ]---
>=20
> Reset the pointer on probe failure fixes the issue.
>=20
> Fixes: 53d2a715c2403 ("phy: Add Tegra XUSB pad controller support")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/phy/tegra/xusb.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index de4a46fe1763..ad88d74c1884 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1242,6 +1242,7 @@ static int tegra_xusb_padctl_probe(struct platform_=
device *pdev)
>  reset:
>  	reset_control_assert(padctl->rst);
>  remove:
> +	platform_set_drvdata(pdev, NULL);
>  	soc->ops->remove(padctl);
>  	return err;
>  }

Sorry, I had missed this before. Why is this necessary? The driver core
already does dev_set_drvdata(dev, NULL) on failure, which is the same as
your platform_set_drvdata() here.

I suppose one possible explanation would be if for some reason we end up
here in the error cleanup path but with err =3D=3D 0.

Do you have more information on when this happens so that I can repro
and investigate? Alternatively, if you've still got this set up, can you
do a quick test to see if "err" is indeed a negative error code when we
get here?

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+ZoCcACgkQ3SOs138+
s6FewhAAjHyWUxUTrWwxoY+I9rdfNymvaMtSJt34EoRsABbllyMzBbUoG2v9Kxbc
qjZJoCb8ZfENweLAQ+O1DidDXEeu2/dpMh1stNkfhAIW0pY7g2kcsQXP8lqLK8fR
u9gp2lgWZ8nzTV9rW0FEvNMZgZZGVQUJ27BEoI2JsG1+u4OZZ1RQO5JUfX9xcefa
KWL+NFW+Pg8hWV8McfZXy9yfJ+Lo65IQS4q4I9zjjicUjS+pRy6RCfS6uFW8moeG
wVr0Fuj5Ixy9//wYqmbvi9tRGLdc3FFk7ZB26Cauya4povqbMp8n0zBBaJsdosru
wEL3c4gy8Gjagch2ntOYCF+ib2ySlUKZjWwXWsdlZo48fHi+fw7ujfnqUxJupZ4s
LwI+uyPhoxzw70qd31IV3btRYYWf/bCsVvvoA8o5yLWBCDCmBnUKYuOe62/jWDb2
8EUcmxmWPVhF+3ZyQLxFiGjIveKqscBnd/uR7p/Rbmf+SDFUpovGWfZdnaxOKijq
Wfdse8clRBF/55ESyELXwFfy2MQJqcENdjMOGIyURCL1S0AF9l86tbYJ7JmI+Mk7
mEi0gnwAUQYvaf5wgBxVoF0a/AIzfNQ4YtsNPK5Y40uDMRR6+W7mMFbnvEjYMcRw
2JkqTgK5lQpfTbiBE+WWikubNwnLbDOU+glMXtfEvh++8wU6RDk=
=1snv
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
