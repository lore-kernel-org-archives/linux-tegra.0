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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32249C4741F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:09:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDC5821D7F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNXAGWlf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgI1NI4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1NIz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:08:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75476C061755;
        Mon, 28 Sep 2020 06:08:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w5so1253343wrp.8;
        Mon, 28 Sep 2020 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nOPCbtpqgtnY4q9MU+tBngQWc0zGdIdrFUQVT0XwMnc=;
        b=PNXAGWlfrLIwYmKX7uB9DdP2i6YwxpSHwY/h2+K7/bKTIkW5Taq5ZYDKck/kK6Q+Vy
         RK8xixXhcG62JBokojeJ0BwjfL+QZzB+zTQdOeOELafkW0IiLuo3lW0G1UY9HXMAXGcQ
         kNViHnUiok0uKWS4thy6Cj8ytgaq1NFYplKXFJpwklo75k5dL0ifVix1cWy3Nq8W2FP/
         7YrwPNhdUSgZcnppGXxlPe3JTPW/skoVE2LmTXOvRwIHy/J26m8du+kLcEjVoGH65dtJ
         7013cU/NFUZlXp0zWhoMtfUGOVwFqXOEFYTyNgEWtpCu/ijvLTvrbxAvSs1TLTQS9p1b
         RwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nOPCbtpqgtnY4q9MU+tBngQWc0zGdIdrFUQVT0XwMnc=;
        b=ThVRVaVIbEsDsUtjTfCzjvcrhIlTyRGrWNjvoBLCyxdqLnImDfqwQkuZmpL2jEFzfy
         vUlj4nxTdoJLEymsYsE6cBp62lwpNZ5de3Q98VrwhbnIIFWI/lrHxBglCkEKMLySAdQ3
         WbOpNXOtS0f0FdAfcIDAd6hFguMbsEtivM+SLOs6gXQ3cK8oJH6aKIvQaoS84w+MlOCl
         WXvudgWC5MmlxkAPbDv4S9qPfYIlEwrPAc1a8JeLrNMv+7tDXIvU9HXcjOcUOzncLOx6
         sYjdSga3l+0vjCj2vkkCPxzPNQj+deKpPI/l13zb6Wb2z9eYGPCr+c7sCoK/g6yUML8k
         5ieQ==
X-Gm-Message-State: AOAM532hBbzL+O+m2E4uVyhdpqpmsBT1UMML3uvBeIZRm+sp3NeI2hTk
        tQaSwYWkEzsOfNa2IKqg39I=
X-Google-Smtp-Source: ABdhPJy7janYixmQSDCn0tIUz1ypKEhJKOUw0PNZ9o+5Pl2RABP+3KpTW9eWVNI1Y7kpV1u/9T16Zw==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr1750114wrc.360.1601298534158;
        Mon, 28 Sep 2020 06:08:54 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i11sm1497443wre.32.2020.09.28.06.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:08:52 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:08:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 05/15] phy: tegra: xusb: Rearrange UPHY init on
 Tegra210
Message-ID: <20200928130849.GF3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-6-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pgaa2uWPnPrfixyx"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-6-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Pgaa2uWPnPrfixyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:31PM +0800, JC Kuo wrote:
> This commit is a preparation for enabling XUSB SC7 support.
> It rearranges Tegra210 XUSB PADCTL UPHY initialization sequence,
> for the following reasons:
>=20
> 1. PLLE hardware power sequencer has to be enabled only after both
>    PEX UPHY PLL and SATA UPHY PLL are initialized.
>    tegra210_uphy_init() -> tegra210_pex_uphy_enable()
>                         -> tegra210_sata_uphy_enable()
>                         -> tegra210_plle_hw_sequence_start()
>                         -> tegra210_aux_mux_lp0_clamp_disable()
>=20
> 2. At cold boot and SC7 exit, the following bits must be cleared after
>    PEX/SATA lanes are out of IDDQ (IDDQ_DISABLE=3D1).
>    a. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN,
>    b. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY
>    c. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN
>=20
>    tegra210_pex_uphy_enable() and tegra210_sata_uphy_enable() are in
>    charge of bringing lanes out of IDDQ, and then AUX_MUX_LP0_* bits
>    will be cleared by tegra210_aux_mux_lp0_clamp_disable().
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    make separate changes
>    use "unsigned int" instead "int" type for PHY index
>    add blank line for better readability
>   =20
>  drivers/phy/tegra/xusb-tegra210.c | 203 +++++++++++++++---------------
>  drivers/phy/tegra/xusb.h          |   4 +-
>  2 files changed, 102 insertions(+), 105 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Pgaa2uWPnPrfixyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x4GEACgkQ3SOs138+
s6GhchAAkPMKilPY4JMW/bvt3MBYK7A1MMaVtO9dLUY52mM1qF9Kfd7gb27GvgOx
8xsT7a6ckgaydc/Mv0Ll/Q0TOm9RTvYSZQYV+I7EXtZYcgujfeR5c1bORiOZZWxc
QIgv+DN7wGcrTf82Z8Tg/eIugt2WPlILY+kmPYDxEF+J3PnH6WufUAIR8osArhhP
pCjZ+5ZrAttBUNJM2tvErCaYHDauxDFN3r6sQqMbo8VchpTh6jW8+nuENaScTHNk
99r3WrJjO3nCVqLWqmQPl4uqg0L+f3VlG6akuGSX8ZeOOqUz+J/MmFsvuTO+j//K
w820awaV8c9TCy14itTtIhQnPG/xybXexZP0lLrKyVpJZdJEonkFjgOe/zt4PeHz
SjEgrzDjc3sdkcK7Dr2QZdQmxYXpK/GcFm/dAMUWXUzhEP+g3Wg5/5Trdpk23cBI
pO/rr2huNIERpsgxRETCom2+SvVI9UYktYEXu78lhgAtSPU6Y3+hJLKLP0XgGFMN
c6Wiwe8GK4AO8KlAB+/iKdhcOn8/dIuc3CZBqndUCURvhnK6D37Fjzyca89i0rzP
DLvKCfuSckh78ZJeg6qkGMzAcEQgVOBCBEavmtIfrgB1Lb/nCdJtosKPSqp7erfK
8ZtxBtOXxnYla9C+QkrJOY1tkZPRtUwlPa0doK3Lndr3cNv+SG8=
=PnVB
-----END PGP SIGNATURE-----

--Pgaa2uWPnPrfixyx--
