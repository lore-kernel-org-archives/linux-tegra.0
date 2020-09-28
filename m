Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49574C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0615C2074B
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJFlM6Jq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgI1NR5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI1NR5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:17:57 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF736C061755;
        Mon, 28 Sep 2020 06:17:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so1111757wmj.5;
        Mon, 28 Sep 2020 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvMfkYcp7tAK44w/oII4o4hjiAgqMmj2syisBGUXHno=;
        b=fJFlM6JqqJSn/YZ2LV9pM+ITEUaCGmqm/8h/SX49DYmR9n382B/c1y7wL4qoYKJBER
         jIxMFrOEWc2oRVK7z1UE6QvGJtFEcwQXSD6cfSbqA40H8tKt3Jwh+oPSlEkFMwlP8m39
         /X+uXAvfo63+R2CqJyBcizkolPPN8I1XOqJWlT6UdBW7OYNhX5eOsiCYtMHv5SRJRa92
         xH4K6tTl4zGJQgyfQHGB0HSk2UgdmeiALxGtZ4hEKModyjWErBteW1rChDUxUpzxTlZw
         0ZgQq41iq65Rnvt4cRK1EiNBj2GCm3Kp4GTCXl0clHJ4zXxVxNf2uenqLMOvSn0s8GJb
         20Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvMfkYcp7tAK44w/oII4o4hjiAgqMmj2syisBGUXHno=;
        b=dR7Jo7rXlV6b6jL+FKVdOujIxlkhZsA7UhJwLwiK1iLYOlhOBYysv1YSQB83gNsx7h
         u11uQkWQoi8Fvy2OIh0FSoG45wRbhBlPpUfVScPn6OutzEic+x2537W+NdI0hMpc045k
         eIIL/8yChUVr00umDEuSl579D0aj9cMh8xzUtNWdFsPpWWJ1kxbvU7pVfEcyVzJa3vsX
         6Fvw8+uI2xnlBDPQF1VRGhRN7yxGlgNsQaklK7RtD+2rxEj0HKW/I4Bp8iFm+6PxO/1J
         5kpxE1HiE3u8EVrTOVCArQn8GaamumNLw04BWH25koRURwE1fDBuXjAH6LHKCzGdSf/o
         R1Dg==
X-Gm-Message-State: AOAM531g/FjB6Q007hz/Q+EEuQI7aNQ62sOollFo+2ahZCAVax2pfBTC
        7t4E1xCes68fK1qcYNqKimU=
X-Google-Smtp-Source: ABdhPJzS4KaxTxneTILXYROgXAElFG7t23r1ogwMgGoOUG0hrdoOcqVTC/s2ryd5HdPL3+XkeAioiQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr1626296wmp.187.1601299075450;
        Mon, 28 Sep 2020 06:17:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b188sm7205513wmb.2.2020.09.28.06.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:17:54 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:17:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 08/15] soc/tegra: pmc: Provide usb sleepwalk register
 map
Message-ID: <20200928131751.GI3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-9-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8/UBlNHSEJa6utmr"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-9-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:34PM +0800, JC Kuo wrote:
> This commit implements a register map which grants USB (UTMI and HSIC)
> sleepwalk registers access to USB PHY drivers. The USB sleepwalk logic
> is in PMC hardware block but USB PHY drivers have the best knowledge
> of proper programming sequence. This approach prevents using custom
> pmc APIs.

I don't think this final sentence is useful. The commit message should
explain what you're doing, but there's no need to enumerate any other
inferior solution you didn't choose to implement.

If you do want to keep it: s/pmc/PMC/.

While at it, perhaps replace "usb" by "USB" in the subject as well.

>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    commit message improvement
>    drop regmap_reg() usage
>    rename 'reg' with 'offset'
>    rename 'val' with 'value'
>    drop '__force' when invokes devm_regmap_init()
>    print error code of devm_regmap_init()
>    move devm_regmap_init() a litter bit earlier
>    explicitly set '.has_usb_sleepwalk=3Dfalse'
>   =20
>  drivers/soc/tegra/pmc.c | 95 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index d332e5d9abac..ff24891ce9ca 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -43,6 +43,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/regmap.h>
> =20
>  #include <soc/tegra/common.h>
>  #include <soc/tegra/fuse.h>
> @@ -102,6 +103,9 @@
> =20
>  #define PMC_PWR_DET_VALUE		0xe4
> =20
> +#define PMC_USB_DEBOUNCE_DEL		0xec
> +#define PMC_USB_AO			0xf0
> +
>  #define PMC_SCRATCH41			0x140
> =20
>  #define PMC_WAKE2_MASK			0x160
> @@ -133,6 +137,13 @@
>  #define IO_DPD2_STATUS			0x1c4
>  #define SEL_DPD_TIM			0x1c8
> =20
> +#define PMC_UTMIP_UHSIC_TRIGGERS	0x1ec
> +#define PMC_UTMIP_UHSIC_SAVED_STATE	0x1f0
> +
> +#define PMC_UTMIP_TERM_PAD_CFG		0x1f8
> +#define PMC_UTMIP_UHSIC_SLEEP_CFG	0x1fc
> +#define PMC_UTMIP_UHSIC_FAKE		0x218
> +
>  #define PMC_SCRATCH54			0x258
>  #define  PMC_SCRATCH54_DATA_SHIFT	8
>  #define  PMC_SCRATCH54_ADDR_SHIFT	0
> @@ -145,8 +156,18 @@
>  #define  PMC_SCRATCH55_CHECKSUM_SHIFT	16
>  #define  PMC_SCRATCH55_I2CSLV1_SHIFT	0
> =20
> +#define  PMC_UTMIP_UHSIC_LINE_WAKEUP	0x26c
> +
> +#define PMC_UTMIP_BIAS_MASTER_CNTRL	0x270
> +#define PMC_UTMIP_MASTER_CONFIG		0x274
> +#define PMC_UTMIP_UHSIC2_TRIGGERS	0x27c
> +#define PMC_UTMIP_MASTER2_CONFIG	0x29c
> +
>  #define GPU_RG_CNTRL			0x2d4
> =20
> +#define PMC_UTMIP_PAD_CFG0		0x4c0
> +#define PMC_UTMIP_UHSIC_SLEEP_CFG1	0x4d0
> +#define PMC_UTMIP_SLEEPWALK_P3		0x4e0
>  /* Tegra186 and later */
>  #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
>  #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
> @@ -334,6 +355,7 @@ struct tegra_pmc_soc {
>  	const struct pmc_clk_init_data *pmc_clks_data;
>  	unsigned int num_pmc_clks;
>  	bool has_blink_output;
> +	bool has_usb_sleepwalk;
>  };
> =20
>  static const char * const tegra186_reset_sources[] =3D {
> @@ -2495,6 +2517,68 @@ static void tegra_pmc_clock_register(struct tegra_=
pmc *pmc,
>  			 err);
>  }
> =20
> +static const struct regmap_range pmc_usb_sleepwalk_ranges[] =3D {
> +	regmap_reg_range(PMC_USB_DEBOUNCE_DEL, PMC_USB_AO),
> +	regmap_reg_range(PMC_UTMIP_UHSIC_TRIGGERS, PMC_UTMIP_UHSIC_SAVED_STATE),
> +	regmap_reg_range(PMC_UTMIP_TERM_PAD_CFG, PMC_UTMIP_UHSIC_FAKE),
> +	regmap_reg_range(PMC_UTMIP_UHSIC_LINE_WAKEUP, PMC_UTMIP_UHSIC_LINE_WAKE=
UP),
> +	regmap_reg_range(PMC_UTMIP_BIAS_MASTER_CNTRL, PMC_UTMIP_MASTER_CONFIG),
> +	regmap_reg_range(PMC_UTMIP_UHSIC2_TRIGGERS, PMC_UTMIP_MASTER2_CONFIG),
> +	regmap_reg_range(PMC_UTMIP_PAD_CFG0, PMC_UTMIP_UHSIC_SLEEP_CFG1),
> +	regmap_reg_range(PMC_UTMIP_SLEEPWALK_P3, PMC_UTMIP_SLEEPWALK_P3),
> +};
> +
> +static const struct regmap_access_table pmc_usb_sleepwalk_table =3D {
> +	.yes_ranges =3D pmc_usb_sleepwalk_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(pmc_usb_sleepwalk_ranges),
> +};
> +
> +static int tegra_pmc_regmap_readl(void *context, unsigned int offset, un=
signed int *value)
> +{
> +	struct tegra_pmc *pmc =3D context;
> +
> +	*value =3D tegra_pmc_readl(pmc, offset);
> +	return 0;
> +}
> +
> +static int tegra_pmc_regmap_writel(void *context, unsigned int offset, u=
nsigned int value)
> +{
> +	struct tegra_pmc *pmc =3D context;
> +
> +	tegra_pmc_writel(pmc, value, offset);
> +	return 0;
> +}
> +
> +static const struct regmap_config usb_sleepwalk_regmap_config =3D {
> +	.name =3D "usb_sleepwalk",
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.fast_io =3D true,
> +	.rd_table =3D &pmc_usb_sleepwalk_table,
> +	.wr_table =3D &pmc_usb_sleepwalk_table,
> +	.reg_read =3D tegra_pmc_regmap_readl,
> +	.reg_write =3D tegra_pmc_regmap_writel,
> +};
> +
> +static int tegra_pmc_regmap_init(struct tegra_pmc *pmc)
> +{
> +	struct regmap *regmap;
> +	int err;
> +
> +	if (pmc->soc->has_usb_sleepwalk) {
> +		regmap =3D devm_regmap_init(pmc->dev, NULL, (void *) pmc,

I don't think you need that explicit cast there.

With those minor comments addressed:

Acked-by: Thierry Reding <treding@nvidia.com>

--8/UBlNHSEJa6utmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x4n8ACgkQ3SOs138+
s6GmiA//S57Ija3gTgeRRo+t19DjQqhaDBEvnn6kYYTx1xvtqiq+Xg3TlFOKpQh7
MrPINACNc3TPc6poLP36X3FZ1IPp6u8npGQnqKEGY4AkXyVoYBGxPeZmZiHOjC4r
y9OE27d+lshl2Pebp4eYouBIlgRwCFa/g0S8MRoD4CO16nEJWb0ATKK9KCCDalry
XEEtPezU3tHAa2QpzmDDNLVtvlcdDASkpvlTrH2k9R7erv3TSMO/0RXPGdVJNTao
ovsJ+g3lEJqd7xpjmaOUUTndCnWMTNynNrm8DRqbRKs0Y92KtHBa0z2M88qXaNFQ
TtMfL0d6gv7pAqH/VyTddGs5PIRpokwM0QpCQ7uLCWADeD7zdzR0FeSNXmZ9/N5r
VrGpdwbdPN+n0U3CciEK6dOIK9iv7Q7cZDDHCog9WeCEQdcMzrXxABmIcxtsWzVS
ftjzbTXq/cOQx2ohVw3BlsYf3vFEQZnJa7/MzYyWGCxLPczlsBhtBavEIlAkXODu
VbKqFzb2y8G5JCaGajHqhAjxiMjwabXniUypLeefkgXdooYrRIkSo67REsi5HkVK
44SCLSlOFT9GHvfT3Uxh3n4k9GkclfSqbm3psJRRojHY/H/6SRkWQJ1Isg5MrWz/
ir0XNgQ+EZbGIQElaja7NF8CBVPgZD+DEN8qHyfdUNkLjZMS5N4=
=J/bb
-----END PGP SIGNATURE-----

--8/UBlNHSEJa6utmr--
