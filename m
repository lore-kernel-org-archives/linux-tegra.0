Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF98C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 384E623104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbhASXg7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395252AbhASOMS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:12:18 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E0EC061573;
        Tue, 19 Jan 2021 06:11:36 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id 186so21886548qkj.3;
        Tue, 19 Jan 2021 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b+3EAfMUK2Pd7hJPkoCdOK/Ss+UF/oaJmaMm82ocHYc=;
        b=C4css+jaIhLmEq33qcko+uudGSe+gQi1YpfP0252UaK9yIxIiGGpLT3KY37JFBUS+L
         GhG2Vg+k7yA92I95EQLcOupImuvbjb259HPoPxhVLYIchOjVcLfumTk+LWSWbCJFrgUI
         fjrXfwugYJ762j/zT31GoVMKMq9kBW7s2Q0q22U/cD+Yxqf+Wb8ykuYOyxGogziACv87
         NSzVSNifnonQlMo9Eq7GOfo/KIHWH3Gx3au/S8hj95kCjGyynTlTVo9G7XUOoqrKEjMw
         Jp1i4O+6KKTKjGdBHZ50WjFv5M4prJOCobooRrH6Np8/h1nS67dzCfwplCmDP1X9oT4m
         DoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b+3EAfMUK2Pd7hJPkoCdOK/Ss+UF/oaJmaMm82ocHYc=;
        b=OaibLML/mERyFukuBqzzJETtPhRO7m3Jy2VDYSPOPwqZI3o8RSr0X9Vp1tKLAYgZVO
         T8hBOl8OWn1P2XjJ8IHtwKjDdizcu8Gbr7emz+xgigFpDtlQG9oOI/AYqVAoNC6T4IJR
         beAUsD3tpGEPi3s4JnIgqFYsC7BNUUBmgtphjXRT80xUWAorG7lYyp63qhVafxvIn479
         H4yfvXaiXAxuixW0Z6bwhsepA1BeeelC48OH2yGqocwtY0a5KN91IeAKBn8py03U0929
         9zGWrw83qy2Ob5nG6kZ5L8Rut7ZMt81ZvsJwMdVB442Fl5uRU6jL7FqcawSTDbiLl6yG
         gQpA==
X-Gm-Message-State: AOAM53050EC7ZW8Er7cz8+NcNKLOxMrA8evchRsTMId3JHFPwGpfl2C9
        j8o6/8u/hmoLre54rSzwdIk=
X-Google-Smtp-Source: ABdhPJxghCLXpIaUsfyXQ0vaKeMdJYRxuVeBnwJMfdxeoM2m2AdjY3rphj1Zi0OeeHq8wu8dyHCDBw==
X-Received: by 2002:a05:620a:15e3:: with SMTP id p3mr4436366qkm.397.1611065495687;
        Tue, 19 Jan 2021 06:11:35 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r190sm13139819qka.54.2021.01.19.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 06:11:34 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:11:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 01/15] clk: tegra: Add PLLE HW power sequencer control
Message-ID: <YAbok9mDA82mkIRi@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-2-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kglYWkkBvx+6liW+"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-2-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kglYWkkBvx+6liW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:32PM +0800, JC Kuo wrote:
> PLLE has a hardware power sequencer logic which is a state machine
> that can power on/off PLLE without any software intervention. The
> sequencer has two inputs, one from XUSB UPHY PLL and the other from
> SATA UPHY PLL. PLLE provides reference clock to XUSB and SATA UPHY
> PLLs. When both of the downstream PLLs are powered-off, PLLE hardware
> power sequencer will automatically power off PLLE for power saving.
>=20
> XUSB and SATA UPHY PLLs also have their own hardware power sequencer
> logic. XUSB UPHY PLL is shared between XUSB SuperSpeed ports and PCIE
> controllers. The XUSB UPHY PLL hardware power sequencer has inputs
> from XUSB and PCIE. When all of the XUSB SuperSpeed ports and PCIE
> controllers are in low power state, XUSB UPHY PLL hardware power
> sequencer automatically power off PLL and flags idle to PLLE hardware
> power sequencer. Similar applies to SATA UPHY PLL.
>=20
> PLLE hardware power sequencer has to be enabled after both downstream
> sequencers are enabled.
>=20
> This commit adds two helper functions:
> 1. tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
>    PLLE hardware sequencer at proper time.
>=20
> 2. tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
>    check whether PLLE hardware sequencer has been enabled or not.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> v6:
>    no change
> v5: no change
> v4:
>    update copyright strings
> v3:
>    rename 'val' with 'value
>=20
>  drivers/clk/tegra/clk-tegra210.c | 53 +++++++++++++++++++++++++++++++-
>  include/linux/clk/tegra.h        |  4 ++-
>  2 files changed, 55 insertions(+), 2 deletions(-)

Michael, Stephen,

we need these custom APIs to pass control of the hardware PLL sequencer
to the UPHY driver. Do you have any objections to this? Subsequent
patches in this series depend on these symbols, so it'd be great if you
could give an Acked-by on this and patch 2 (I'll Cc you on that right
away) so that they can go in via either the PHY or USB trees.

Thanks,
Thierry

> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-teg=
ra210.c
> index 68cbb98af567..b9099012dc7b 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2012-2014 NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2012-2020 NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
>  #include <linux/io.h>
> @@ -403,6 +403,14 @@ static unsigned long tegra210_input_freq[] =3D {
>  #define PLLRE_BASE_DEFAULT_MASK		0x1c000000
>  #define PLLRE_MISC0_WRITE_MASK		0x67ffffff
> =20
> +/* PLLE */
> +#define PLLE_MISC_IDDQ_SW_CTRL		(1 << 14)
> +#define PLLE_AUX_USE_LOCKDET		(1 << 3)
> +#define PLLE_AUX_SS_SEQ_INCLUDE		(1 << 31)
> +#define PLLE_AUX_ENABLE_SWCTL		(1 << 4)
> +#define PLLE_AUX_SS_SWCTL		(1 << 6)
> +#define PLLE_AUX_SEQ_ENABLE		(1 << 24)
> +
>  /* PLLX */
>  #define PLLX_USE_DYN_RAMP		1
>  #define PLLX_BASE_LOCK			(1 << 27)
> @@ -489,6 +497,49 @@ static unsigned long tegra210_input_freq[] =3D {
>  #define PLLU_MISC0_WRITE_MASK		0xbfffffff
>  #define PLLU_MISC1_WRITE_MASK		0x00000007
> =20
> +bool tegra210_plle_hw_sequence_is_enabled(void)
> +{
> +	u32 value;
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	if (value & PLLE_AUX_SEQ_ENABLE)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_is_enabled);
> +
> +int tegra210_plle_hw_sequence_start(void)
> +{
> +	u32 value;
> +
> +	if (tegra210_plle_hw_sequence_is_enabled())
> +		return 0;
> +
> +	/* skip if PLLE is not enabled yet */
> +	value =3D readl_relaxed(clk_base + PLLE_MISC0);
> +	if (!(value & PLLE_MISC_LOCK))
> +		return -EIO;
> +
> +	value &=3D ~PLLE_MISC_IDDQ_SW_CTRL;
> +	writel_relaxed(value, clk_base + PLLE_MISC0);
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	value |=3D (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> +	value &=3D ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	value |=3D PLLE_AUX_SEQ_ENABLE;
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_start);
> +
>  void tegra210_xusb_pll_hw_control_enable(void)
>  {
>  	u32 val;
> diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
> index eb016fc9cc0b..f7ff722a03dd 100644
> --- a/include/linux/clk/tegra.h
> +++ b/include/linux/clk/tegra.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2012-2020, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
>  #ifndef __LINUX_CLK_TEGRA_H_
> @@ -123,6 +123,8 @@ static inline void tegra_cpu_clock_resume(void)
>  }
>  #endif
> =20
> +extern int tegra210_plle_hw_sequence_start(void);
> +extern bool tegra210_plle_hw_sequence_is_enabled(void);
>  extern void tegra210_xusb_pll_hw_control_enable(void);
>  extern void tegra210_xusb_pll_hw_sequence_start(void);
>  extern void tegra210_sata_pll_hw_control_enable(void);
> --=20
> 2.25.1
>=20

--kglYWkkBvx+6liW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG6JMACgkQ3SOs138+
s6FLew/+KMCIRNB//9pQHITt5igYM24Ugdmk+mYiuwFw1GM+AWRzH4PApSTMBwq1
+NQfOomTyXwkpwm1yvFxahKkYmS+nA3Mz2bYYKjHzZVIkbLpMRlj0J9hxdMsQ4DV
aQH9UerGOY8++pbEEhMedXhx6UIGYAvGgOzbZ7Y2AnPonyQU4t0oUbpIvo6yYq8o
OxXmAp1WRaJ+PF3gCZes2GZspt5Ujh7A77I6gsR+QohZnD0uAE/zGKn0cIemLi+z
6UMooT+WBiM/R48LSlnd3+HmvxihQiwuaSCN4/35hM+pmZ8DJbvHYvmCGrY0bTQI
U4xjp8SFVccHtUzj2SPW3vx9bOmmCcj7GHFm+1v97kchOIl4fKWHxeSpm6LVh84g
uXVcsx3FlT5S311nt3M5nv+JUaNba8VjsZ8fNufc1CA+HEZdwSp5+PJ4z1z3ACLw
xcv/qOugrfwmhJlsM5d3O7lfXhGMaPsjO1yRG/tXnd15/FC18eqnOxn/DD6z5ixv
FWjg8edAwOiDgp+3QXR2X1qssko0NQG5qux0XNgq5EVHz7Bih4Jt6QQ+gvPnQcOf
7KMRP+6lSNTHBWZ+laONGZuc83wH+EDklKwuiTEYq5HI3JTzIAkl14ZwpPwW+H6C
AxxherBD+cn7puE5HVF2VjTMOalGO/LRfnASlp9+yM4fTjSW0M0=
=4KoJ
-----END PGP SIGNATURE-----

--kglYWkkBvx+6liW+--
