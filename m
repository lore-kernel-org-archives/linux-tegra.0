Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1562C2BB9A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C243238EF
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgLQNem (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgLQNem (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:34:42 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF32C061794;
        Thu, 17 Dec 2020 05:34:02 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r7so26622909wrc.5;
        Thu, 17 Dec 2020 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RdPgE+O03vZl8d5OConBq4/ErbiJyM2cotJazGoLY04=;
        b=g+NE7p8bCSzsc/PcTU+e+cZ4dCWNV/mkDqZVE5ep5L2MhtW6FrhhFV8Gd708kV7dR1
         bVjyNZnXJnCzegBJnTcHm4yjmualZByZWBZXGZDY62H+zIZbTEdWO1DBrGlZTxc63HUK
         /FNIL5KykwprgsZuT5Zh9bcSvyj25PbM9Nk8We5IOCdnzcakHYmi5Tg9iGgjqa9mIhxa
         l0tjHtGcQ98xkXFSIpd90mX6d53MwVtBuXUQbQ74xiyjBpchWoKSVCvAY9OuAkFITY2E
         LE1J+H680V3sCOotsOCWS1bqym+Hn79/Ad4pBxOVfG0P8eE5YNKwzZk8ABuzwdkfo9q5
         rNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RdPgE+O03vZl8d5OConBq4/ErbiJyM2cotJazGoLY04=;
        b=MSirS4z0xEqgLyXa4vDIk0Ypt0sFP2ugPgfAHQN6uMgLFQZITSzS50EbO3zvNT4nPc
         GYUis8D9Vu2YVUUqrm3EOFvyESZI5H6wvZnDT7BuhgEIFx5N38Y9yb8k1GVMWt+D/poT
         usveGyfDwojj6qxjzX0OW4F4noUFg/doQsi3H9ikebEsZtALtadIT22DvNlrKoOO6iGj
         ZRhoWwfAQ7uWG2ozP2vwNf3X8K2mzJHQS0gNynsg1Sje+x+zanfbikBZv51uybvXqKNI
         PXhxF19ske9tSctXx6JcAo+msRUY7ZCeygr/NvsIVqSQuVL9N39qYP1scnfl1TFNQtB3
         d2sQ==
X-Gm-Message-State: AOAM531Pv7fYZ2/YiSgbK9TP9nsUymUtoSDWVFJ3PsS//S4Dvx5O/ykX
        xDg49GUfNuJcCjQlIArlOJ8=
X-Google-Smtp-Source: ABdhPJyRy/9xkZuGDvhBcKhJIYJ4l48j5x2ipIw06LNgP/XVotvWKszzxTV0v6V9/TLVpO55ElXNlQ==
X-Received: by 2002:adf:c454:: with SMTP id a20mr43421614wrg.314.1608212040740;
        Thu, 17 Dec 2020 05:34:00 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i9sm8970970wrs.70.2020.12.17.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 05:33:57 -0800 (PST)
Date:   Thu, 17 Dec 2020 14:33:56 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] usb: phy: tegra: Support waking up from a low
 power mode
Message-ID: <X9teRPo/MadN79NI@ulmo>
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r233Q7uw7p4hkkfc"
Content-Disposition: inline
In-Reply-To: <20201217094007.19336-3-digetx@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--r233Q7uw7p4hkkfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 12:40:01PM +0300, Dmitry Osipenko wrote:
> Support programming of waking up from a low power mode by implementing the
> generic set_wakeup() callback of the USB PHY API.
>=20
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c   | 94 +++++++++++++++++++++++++++++--
>  include/linux/usb/tegra_usb_phy.h |  2 +
>  2 files changed, 90 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 1296524e1bee..46a1f61877ad 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -45,6 +45,7 @@
>  #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
> =20
>  #define USB_SUSP_CTRL				0x400
> +#define   USB_WAKE_ON_RESUME_EN			BIT(2)
>  #define   USB_WAKE_ON_CNNT_EN_DEV		BIT(3)
>  #define   USB_WAKE_ON_DISCON_EN_DEV		BIT(4)
>  #define   USB_SUSP_CLR				BIT(5)
> @@ -56,6 +57,15 @@
>  #define   USB_SUSP_SET				BIT(14)
>  #define   USB_WAKEUP_DEBOUNCE_COUNT(x)		(((x) & 0x7) << 16)
> =20
> +#define USB_PHY_VBUS_SENSORS			0x404
> +#define   B_SESS_VLD_WAKEUP_EN			BIT(6)
> +#define   B_VBUS_VLD_WAKEUP_EN			BIT(14)
> +#define   A_SESS_VLD_WAKEUP_EN			BIT(22)
> +#define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
> +
> +#define USB_PHY_VBUS_WAKEUP_ID			0x408
> +#define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
> +
>  #define USB1_LEGACY_CTRL			0x410
>  #define   USB1_NO_LEGACY_MODE			BIT(0)
>  #define   USB1_VBUS_SENSE_CTL_MASK		(3 << 1)
> @@ -334,6 +344,11 @@ static int utmip_pad_power_on(struct tegra_usb_phy *=
phy)
>  		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
>  	}
> =20
> +	if (phy->pad_wakeup) {
> +		phy->pad_wakeup =3D false;
> +		utmip_pad_count--;
> +	}
> +
>  	spin_unlock(&utmip_pad_lock);
> =20
>  	clk_disable_unprepare(phy->pad_clk);
> @@ -359,6 +374,17 @@ static int utmip_pad_power_off(struct tegra_usb_phy =
*phy)
>  		goto ulock;
>  	}
> =20
> +	/*
> +	 * In accordance to TRM, OTG and Bias pad circuits could be turned off
> +	 * to save power if wake is enabled, but the VBUS-change detection
> +	 * method is board-specific and these circuits may need to be enabled
> +	 * to generate wakeup event, hence we will just keep them both enabled.
> +	 */
> +	if (phy->wakeup_enabled) {
> +		phy->pad_wakeup =3D true;
> +		utmip_pad_count++;
> +	}
> +
>  	if (--utmip_pad_count =3D=3D 0) {
>  		val =3D readl_relaxed(base + UTMIP_BIAS_CFG0);
>  		val |=3D UTMIP_OTGPD | UTMIP_BIASPD;
> @@ -503,11 +529,24 @@ static int utmi_phy_power_on(struct tegra_usb_phy *=
phy)
>  		writel_relaxed(val, base + UTMIP_PLL_CFG1);
>  	}
> =20
> +	val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +	val &=3D ~USB_WAKE_ON_RESUME_EN;
> +	writel_relaxed(val, base + USB_SUSP_CTRL);
> +
>  	if (phy->mode =3D=3D USB_DR_MODE_PERIPHERAL) {
>  		val =3D readl_relaxed(base + USB_SUSP_CTRL);
>  		val &=3D ~(USB_WAKE_ON_CNNT_EN_DEV | USB_WAKE_ON_DISCON_EN_DEV);
>  		writel_relaxed(val, base + USB_SUSP_CTRL);
> =20
> +		val =3D readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
> +		val &=3D ~VBUS_WAKEUP_WAKEUP_EN;
> +		writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
> +
> +		val =3D readl_relaxed(base + USB_PHY_VBUS_SENSORS);
> +		val &=3D ~(A_VBUS_VLD_WAKEUP_EN | A_SESS_VLD_WAKEUP_EN);
> +		val &=3D ~(B_VBUS_VLD_WAKEUP_EN | B_SESS_VLD_WAKEUP_EN);
> +		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
> +
>  		val =3D readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
>  		val &=3D ~UTMIP_PD_CHRG;
>  		writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
> @@ -605,31 +644,55 @@ static int utmi_phy_power_off(struct tegra_usb_phy =
*phy)
> =20
>  	utmi_phy_clk_disable(phy);
> =20
> -	if (phy->mode =3D=3D USB_DR_MODE_PERIPHERAL) {
> -		val =3D readl_relaxed(base + USB_SUSP_CTRL);
> -		val &=3D ~USB_WAKEUP_DEBOUNCE_COUNT(~0);
> -		val |=3D USB_WAKE_ON_CNNT_EN_DEV | USB_WAKEUP_DEBOUNCE_COUNT(5);
> -		writel_relaxed(val, base + USB_SUSP_CTRL);
> -	}
> +	/* PHY won't resume if reset is asserted */
> +	if (phy->wakeup_enabled)
> +		goto chrg_cfg0;
> =20
>  	val =3D readl_relaxed(base + USB_SUSP_CTRL);
>  	val |=3D UTMIP_RESET;
>  	writel_relaxed(val, base + USB_SUSP_CTRL);
> =20
> +chrg_cfg0:

I found this diffcult to read until I realized that it was basically
just the equivalent of this:

	if (!phy->wakeup_enabled) {
		val =3D readl_relaxed(base + USB_SUSP_CTRL);
		val |=3D UTMIP_RESET;
		writel_relaxed(val, base + USB_SUSP_CTRL);
	}

>  	val =3D readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
>  	val |=3D UTMIP_PD_CHRG;
>  	writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
> =20
> +	if (phy->wakeup_enabled)
> +		goto xcvr_cfg1;
> +
>  	val =3D readl_relaxed(base + UTMIP_XCVR_CFG0);
>  	val |=3D UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
>  	       UTMIP_FORCE_PDZI_POWERDOWN;
>  	writel_relaxed(val, base + UTMIP_XCVR_CFG0);
> =20
> +xcvr_cfg1:

Similarly, I think this is more readable as:

	if (!phy->wakeup_enabled) {
		val =3D readl_relaxed(base + UTMIP_XCVR_CFG0);
		val |=3D UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
		       UTMIP_FORCE_PDZI_POWERDOWN;
		writel_relaxed(val, base + UTMIP_XCVR_CFG0);
	}

>  	val =3D readl_relaxed(base + UTMIP_XCVR_CFG1);
>  	val |=3D UTMIP_FORCE_PDDISC_POWERDOWN | UTMIP_FORCE_PDCHRP_POWERDOWN |
>  	       UTMIP_FORCE_PDDR_POWERDOWN;
>  	writel_relaxed(val, base + UTMIP_XCVR_CFG1);
> =20
> +	if (phy->wakeup_enabled) {

Which then also matches the style of this conditional here.

> +		val =3D readl_relaxed(base + USB_SUSP_CTRL);
> +		val &=3D ~USB_WAKEUP_DEBOUNCE_COUNT(~0);
> +		val |=3D USB_WAKEUP_DEBOUNCE_COUNT(5);
> +		val |=3D USB_WAKE_ON_RESUME_EN;
> +		writel_relaxed(val, base + USB_SUSP_CTRL);
> +
> +		/*
> +		 * Ask VBUS sensor to generate wake event once cable is
> +		 * connected.
> +		 */
> +		if (phy->mode =3D=3D USB_DR_MODE_PERIPHERAL) {
> +			val =3D readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
> +			val |=3D VBUS_WAKEUP_WAKEUP_EN;
> +			writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
> +
> +			val =3D readl_relaxed(base + USB_PHY_VBUS_SENSORS);
> +			val |=3D A_VBUS_VLD_WAKEUP_EN;
> +			writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
> +		}
> +	}
> +
>  	return utmip_pad_power_off(phy);
>  }
> =20
> @@ -765,6 +828,15 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *=
phy)
>  	usleep_range(5000, 6000);
>  	clk_disable_unprepare(phy->clk);
> =20
> +	/*
> +	 * Wakeup currently unimplemented for ULPI, thus PHY needs to be
> +	 * force-resumed.
> +	 */
> +	if (WARN_ON_ONCE(phy->wakeup_enabled)) {
> +		ulpi_phy_power_on(phy);
> +		return -EOPNOTSUPP;
> +	}

How do we control phy->wakeup_enabled? Is this something that we can set
in device tree, for example? I hope so, because otherwise this would
cause a nasty splat every time we try to power-off a ULPI PHY.

Thierry

--r233Q7uw7p4hkkfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/bXkQACgkQ3SOs138+
s6ED8g/+Ikv2wPvtmCUUOWM5pFyV7LszZXMIR4xbkG76O2xKYl5zUenU10AkpKDv
lJ530RRl4FeVc6yt98OWIE9eU+pQz+d49gRJAm6+t1t1nhsCKyA60d5tktHJBVqb
h8npE7vM4QO8HB5Ig7ibO61tz10++0vYoVemiALZkXIdIR/4TpWRtq1UBAxSWvhv
5CW6aY81y/qp2/rJ3SB+b1z31HTfhhPvXnUKZcKWat7nDaX8vRZaxCdVnksXslD5
Izbtq6C8cPb228Xos/e8Qo9gxn4ORMQdmjMqUV8+SD4deP2SpYzzXz4Rj2rqrP5T
V3YGsFpXAPI4lueVIg5ZCGBmx3ops3EuImCHsW0wZCNQiCJ7sZ3ljqSF3KpgnyJP
oNNGlDbGUp4a+HzOskTsEJJoK+Ffyc0lyFTDA+iognGGJq2NJS2hVoILfvGi9eUb
SAjU/v2yp6F5f9vm7DkTv0/Ky+W/C+Iz9+StqrIca61kx6gs/cDPBPdyNEtMLWZj
RCLpVKEoIaSik4wCVsRjSKPSTdB5bYYYsm5Sr8QaNuAPsz53MxMHwd9PQhln6i/W
s7M3AGw4Wa9vXfqe4BghkH0WBGnf+pJV3adfcUzGSY0IUIyd60eOPoUI1IpsvO60
/h8L4LaYExXnmmRys0mPNXL2ZoGUJjTtspSLGdT2gnoqBlU6C9g=
=b0CX
-----END PGP SIGNATURE-----

--r233Q7uw7p4hkkfc--
