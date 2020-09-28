Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28BEC2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8390321D7F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:11:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTJVR/ni"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgI1NLX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgI1NLW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:11:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1FCC061755;
        Mon, 28 Sep 2020 06:11:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d4so1051112wmd.5;
        Mon, 28 Sep 2020 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WQZPexYXBpyFwG7TZTmkzMMZvFQ3t4RrXBF1D3lD+JU=;
        b=XTJVR/nieLTXrZTBnUvDmqvKg4WlWCTyqYKLhKwkFKg9ixpO9K4lc+DV/A0MQdZdte
         dq3wzE3CO0KXSUEtpsXVLWaL6Xs0UQas/qVIuz+3ABiMfoFqXFpyAp4A4uim09+9hoCq
         jxEQz/qAoghwFNnBkUmg6U4otJ92BimWup0NEGw1G1GfSzm/65Z7FCBR/AiDjWre9A1U
         SpJGBrAY6wHkIPeMoGJsMFmwAJabJ377Bfhb3sCEfnEouKOWrm9PSr/fKRQJvE34kINQ
         cNE4TIVwLs75ZPR63+IKejOMmRPagSa97/kyugWg65sxf0BWrgKSYMOcyMOzrCN3s32m
         n6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WQZPexYXBpyFwG7TZTmkzMMZvFQ3t4RrXBF1D3lD+JU=;
        b=S1DiQ8bcqU+uLfEQkB+6ycENQGn1e3WRpK5Yfy8kWJuiMaDz9gFXVA72oXQg4wdpNm
         9yiyUwgRndIJA1K5H0jGHwxpHi7L9m6/FBXY/Kon3KVx3cZ8CuS0F1H98Z8/q54XVMdg
         ntRIh5UdI58TGnD+rZO7JiFJWYOE3o9V4CVi2YhiVpfU/SuChalvH+LKGwwwxlY/iRxp
         vL9+WO2pTfwbfmheOEV6CQhrnb1RloBt+KRqntwvB7+BKLZaCI1NeADJHeDK6/Ceqa7Q
         GXIkOR2jNGgEihSi0x6gJvUV37uBkjp6lFNAsXpMSc6sHKUvr9jtOk6uHKGw1sntEwcX
         mNpg==
X-Gm-Message-State: AOAM530FHz1Xc/JDdBOnjzvLdO9ZycgJkaR2bZD/wiDqo+e8Nkt6IHSJ
        J07NV6f2cArf4/mkqy5BhxE=
X-Google-Smtp-Source: ABdhPJwB3qf+Bdr/hILnrhNEUkebYD2m/UIgX7PH6LkDixGeRcXlqFKHX6xDPSSEeu8RuM3Dkoj0Hg==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr1599943wmc.151.1601298681141;
        Mon, 28 Sep 2020 06:11:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j10sm1514722wrn.2.2020.09.28.06.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:11:19 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:11:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 07/15] phy: tegra: xusb: Add sleepwalk and
 suspend/resume
Message-ID: <20200928131117.GH3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-8-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rn7IEEq3VEzCw+ji"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-8-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Rn7IEEq3VEzCw+ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:33PM +0800, JC Kuo wrote:
> This commit adds sleepwalk/wake and suspend/resume interfaces
> to Tegra XUSB PHY driver.
>=20
> Tegra XUSB host controller driver makes use of sleepwalk functions
> to enable/disable sleepwalk circuit which is in always-on partition
> and can respond to USB resume signals when controller is not powered.
> Sleepwalk can be enabled/disabled for any USB UPHY individually.
>=20
>   - tegra_xusb_padctl_enable_phy_sleepwalk()
>   - tegra_xusb_padctl_disable_phy_sleepwalk()
>=20
> Tegra XUSB host controller driver makes use of wake functions to
> enable/disable/query wake circuit which is in always-on partition
> can wake system up when USB resume happens.
> Wake circuit can be enabled/disabled for any USB PHY individually.
>=20
>   - tegra_xusb_padctl_enable_phy_wake()
>   - tegra_xusb_padctl_disable_phy_wake()
>   - tegra_xusb_padctl_remote_wake_detected()
>=20
> This commit also adds two system suspend stubs that can be used to
> save and restore XUSB PADCTL context during system suspend and
> resume.
>   - tegra_xusb_padctl_suspend_noirq()
>   - tegra_xusb_padctl_resume_noirq()
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    commit message improvement, no change in code
>=20
>  drivers/phy/tegra/xusb.c       | 73 ++++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h       |  9 +++++
>  include/linux/phy/tegra/xusb.h |  8 ++++
>  3 files changed, 90 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--Rn7IEEq3VEzCw+ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x4PUACgkQ3SOs138+
s6HlqQ//TTLzQ7edqS4oKEoHXltz3xKpDVJr2qBU9GJlkfxCN0QjpijdnIso4RfH
v45Of3Qt8yHhQbTEvRvGVqDfvtiSKjNsW+NxgPb9LAfFE53VltNQjuZL4VTDVfCy
uiL8+zNuQCgT5p208NXdy9AmYhiJy20ZDVPBsE/XtY77PrNadzpMOjooybvqIhFi
v1tdqPLXAvaj7c3bh9APCwvVO4RY+f3id1M5O79hiAsh/9RqwLnaKpR5UDVFcr3l
nIKt+HpjIZnIkRMkpbel+7IJdDxFGXEAON0b/nhcALOVq9eXBAxv6rY7RqFwuoCd
f/IMfu52mc5XgOPsDVD2KpYZZniOsCvf2aRYl3fT83V7k1Bm9kcHAmqwNy3HvdPW
LPUx6ixE6AzepMg2CE/d56oBTrl3kN3siLeqgdzVqxoDMxXIdnVoKj0KS8ZAmqYe
K4NVPHv4onQGssIsX7xTXf4i4J3WNDXES0XWFR2D1JuwELd9aTlqMZuFTxjEMRcC
9hQusQxvapzowpNIDbN9qqADXEufqoO/9IumxwZMAfk4b+CjuQBcctNO4uPtyBt0
/9skkv/51qXQkzzADkC38RwV6gjdE2efX3g0POw6eckgVjWXf0zjzaOUCl53PfKJ
AJzy53n6f+2WVFn1K99kmeLzd+wV2weX+2n4e0d71KawTser2Fo=
=Pa00
-----END PGP SIGNATURE-----

--Rn7IEEq3VEzCw+ji--
