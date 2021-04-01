Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C8DC433ED
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DCDE60FED
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233629AbhDAKoa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 06:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhDAKn6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 06:43:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2918AC0613E6;
        Thu,  1 Apr 2021 03:43:58 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r12so2180139ejr.5;
        Thu, 01 Apr 2021 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z2Xj9X++1xKNjk6Nkw+jJ5VVq86lauIjuo/R8uGXA1Q=;
        b=JMJUL97JvyV4vzgt4RoMBmpjB9ZN25b3h9VsWlVl9AbUtg4U77lylxgBc/8CN4o0e9
         1ZLFGC/bmYe5YzbuV/6xZHnh+PYQGdpKAkIuEjvftBWqNQRrVZiTWNGTLP9teJF3pIo4
         FYAWOoLUQB4isIJyZBRXauVdYt4QD0Xou4WVVvtIgGCkHqfnBmckOgiqXnz18lA/TnCG
         5AqQXs+zKt/nxpBFKoSnUJsTzff3mSGMGiYTTXX5ecSspsdvil21wuYTSKLSC8Q4KN0+
         0xK40WicPNz2TTitj5vwe1K0MIl9Eo85PM9km75MFmZtuKyVlBcXqSlbKcn6oqQTMEEh
         d9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z2Xj9X++1xKNjk6Nkw+jJ5VVq86lauIjuo/R8uGXA1Q=;
        b=dBC2xhJeJnLMjjOC2TbpKgyAwXkgItMBSJnQAye4HSXsHHdMmYakPyp4s04cEluyc8
         S+KFhGIMEl1bCts8dRpRPCAIQCo9NuAjV1od2ItwS4GW3+hCAs3OlKRTUTxL5Mn7iH+P
         SvYeBni52jfJircooKwCGllC5poqTvGQlKIi7GYAlev5JEUaOklznsrxTlaoDkq4STrz
         GAPTyDuN4IrxfTHCB/vLpxqI4lsLUy2B/jbbIP75UfuP4uiukTip/nZ10RhmFbILIrYu
         1d+TIbqb2ZP6LgQTJUPffp745K3+Q3I08oKGyjvjonts4ovQMBVGysTXuwErhNYuOzr3
         iv/Q==
X-Gm-Message-State: AOAM530Jq1TikZE4C4Ll3jICMcdML1K6OQUSVFIFiGVU3C/eFMG8GhIE
        VZbZJLGNQqbpn71oOqPCVsM=
X-Google-Smtp-Source: ABdhPJxbblLGWVTf/sepUozDRnpyY5PZ4mzcupZDOP0VB1Ffw9zjvwvn9AOV/Qlh0/6jB4duxvP0Xg==
X-Received: by 2002:a17:906:4ada:: with SMTP id u26mr8385823ejt.129.1617273836871;
        Thu, 01 Apr 2021 03:43:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x4sm3104954edd.58.2021.04.01.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 03:43:54 -0700 (PDT)
Date:   Thu, 1 Apr 2021 12:44:22 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 09/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YGWkBsGu0R/dnYcA@orome.fritz.box>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-10-thierry.reding@gmail.com>
 <YGVr9EIBOHC9N/+/@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="scOahIY3tU/uvpTQ"
Content-Disposition: inline
In-Reply-To: <YGVr9EIBOHC9N/+/@vkoul-mobl.Dlink>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--scOahIY3tU/uvpTQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 12:15:08PM +0530, Vinod Koul wrote:
> On 25-03-21, 17:40, Thierry Reding wrote:
>=20
> > +static int tegra210_usb3_enable_phy_sleepwalk(struct tegra_xusb_lane *=
lane,
> > +					      enum usb_device_speed speed)
> > +{
> > +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> > +	int port =3D tegra210_usb3_lane_map(lane);
> > +	struct device *dev =3D padctl->dev;
> > +	u32 value;
> > +
> > +	if (port < 0) {
> > +		dev_err(dev, "invalid usb3 port number\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(dev, "phy enable sleepwalk usb3 %d\n", port);
>=20
> Too much noise for my taste :)
> (here and other places)

These are purely for debugging purposes. The idea being that they can be
quickly enabled by defining DEBUG. Otherwise if something ever goes
wrong in this code somebody will have to add this exact same code again
just to troubleshoot.

But if you insist I can remove this and similar other debug messages.

> > +static int tegra210_pmc_utmi_enable_phy_sleepwalk(struct tegra_xusb_la=
ne *lane,
> > +						  enum usb_device_speed speed)
> > +{
> > +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> > +	struct tegra210_xusb_padctl *priv =3D to_tegra210_xusb_padctl(padctl);
> > +	struct device *dev =3D padctl->dev;
> > +	unsigned int port =3D lane->index;
> > +	u32 value, tctrl, pctrl, rpd_ctrl;
> > +
> > +	if (!priv->regmap)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (speed > USB_SPEED_HIGH)
> > +		return -EINVAL;
> > +
> > +	dev_dbg(dev, "phy enable sleepwalk usb2 %d speed %d\n", port, speed);
> > +
> > +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> > +	tctrl =3D TCTRL_VALUE(value);
> > +	pctrl =3D PCTRL_VALUE(value);
> > +
> > +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(port));
> > +	rpd_ctrl =3D RPD_CTRL_VALUE(value);
> > +
> > +	/* ensure sleepwalk logic is disabled */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
> > +	value &=3D ~UTMIP_MASTER_ENABLE(port);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
> > +
> > +	/* ensure sleepwalk logics are in low power mode */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_MASTER_CONFIG);
> > +	value |=3D UTMIP_PWR(port);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_MASTER_CONFIG);
>=20
> We really should have a read_modify_write() helper.. quite repeat of
> this here

I actually tried this once a while back, but the resulting code didn't
look much better, in my opinion. In this particular case it might
actually work because what we modify is simple, but consider the case
of some of the other expressions where individual arguments to the
functions will become really long and then the code ends up very
unreadable.

One alternative that I had considered was to have a mix and use the
read/modify/write helper only where it wouldn't hurt readability, but
that is perhaps half of the time and it would make register accesses
completely inconsistent.

I agree that this looks like a bit of boilerplate, but on the other hand
it's consistent and it's also very trivial to follow.

> > +	/* set debounce time */
> > +	value =3D padctl_pmc_readl(priv, PMC_USB_DEBOUNCE_DEL);
> > +	value &=3D ~UTMIP_LINE_DEB_CNT(~0);
> > +	value |=3D UTMIP_LINE_DEB_CNT(0x1);
> > +	padctl_pmc_writel(priv, value, PMC_USB_DEBOUNCE_DEL);
> > +
> > +	/* ensure fake events of sleepwalk logic are desiabled */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_FAKE(port));
> > +	value &=3D ~(UTMIP_FAKE_USBOP_VAL(port) | UTMIP_FAKE_USBON_VAL(port) |
> > +			UTMIP_FAKE_USBOP_EN(port) | UTMIP_FAKE_USBON_EN(port));
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_FAKE(port));
> > +
> > +	/* ensure wake events of sleepwalk logic are not latched */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
> > +	value &=3D ~UTMIP_LINE_WAKEUP_EN(port);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
> > +
> > +	/* disable wake event triggers of sleepwalk logic */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
> > +	value &=3D ~UTMIP_WAKE_VAL(port, ~0);
> > +	value |=3D UTMIP_WAKE_VAL_NONE(port);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
> > +
> > +	/* power down the line state detectors of the pad */
> > +	value =3D padctl_pmc_readl(priv, PMC_USB_AO);
> > +	value |=3D (USBOP_VAL_PD(port) | USBON_VAL_PD(port));
> > +	padctl_pmc_writel(priv, value, PMC_USB_AO);
> > +
> > +	/* save state per speed */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SAVED_STATE(port));
> > +	value &=3D ~SPEED(port, ~0);
> > +	if (speed =3D=3D USB_SPEED_HIGH)
> > +		value |=3D UTMI_HS(port);
> > +	else if (speed =3D=3D USB_SPEED_FULL)
> > +		value |=3D UTMI_FS(port);
> > +	else if (speed =3D=3D USB_SPEED_LOW)
> > +		value |=3D UTMI_LS(port);
> > +	else
> > +		value |=3D UTMI_RST(port);
>=20
> This could look better with a switch statement

Agreed, I've switched this to a switch statement.

> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SAVED_STATE(port));
> > +
> > +	/* enable the trigger of the sleepwalk logic */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
> > +	value |=3D UTMIP_LINEVAL_WALK_EN(port);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
> > +
> > +	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
> > +	 * as well as capture the configuration of the USB2.0 pad
> > +	 */
>=20
> /*
>  * multi
>  * line style please
>  */

Done.

> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_TRIGGERS);
> > +	value |=3D (UTMIP_CLR_WALK_PTR(port) | UTMIP_CLR_WAKE_ALARM(port) |
> > +		UTMIP_CAP_CFG(port));
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_TRIGGERS);
> > +
> > +	/* program electrical parameters read from XUSB PADCTL */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_TERM_PAD_CFG);
> > +	value &=3D ~(TCTRL_VAL(~0) | PCTRL_VAL(~0));
> > +	value |=3D (TCTRL_VAL(tctrl) | PCTRL_VAL(pctrl));
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_TERM_PAD_CFG);
> > +
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_PAD_CFGX(port));
> > +	value &=3D ~RPD_CTRL_PX(~0);
> > +	value |=3D RPD_CTRL_PX(rpd_ctrl);
> > +	padctl_pmc_writel(priv, value, PMC_UTMIP_PAD_CFGX(port));
> > +
> > +	/* setup the pull-ups and pull-downs of the signals during the four
> > +	 * stages of sleepwalk.
> > +	 * if device is connected, program sleepwalk logic to maintain a J and
> > +	 * keep driving K upon seeing remote wake.
> > +	 */
> > +	value =3D padctl_pmc_readl(priv, PMC_UTMIP_SLEEPWALK_PX(port));
> > +	value =3D (UTMIP_USBOP_RPD_A | UTMIP_USBOP_RPD_B | UTMIP_USBOP_RPD_C |
> > +		UTMIP_USBOP_RPD_D);
> > +	value |=3D (UTMIP_USBON_RPD_A | UTMIP_USBON_RPD_B | UTMIP_USBON_RPD_C=
 |
> > +		UTMIP_USBON_RPD_D);
> > +	if (speed =3D=3D USB_SPEED_UNKNOWN) {
> > +		value |=3D (UTMIP_HIGHZ_A | UTMIP_HIGHZ_B | UTMIP_HIGHZ_C |
> > +			UTMIP_HIGHZ_D);
> > +	} else if ((speed =3D=3D USB_SPEED_HIGH) || (speed =3D=3D USB_SPEED_F=
ULL)) {
> > +		/* J state: D+/D- =3D high/low, K state: D+/D- =3D low/high */
> > +		value |=3D UTMIP_HIGHZ_A;
> > +		value |=3D UTMIP_AP_A;
> > +		value |=3D (UTMIP_AN_B | UTMIP_AN_C | UTMIP_AN_D);
> > +	} else if (speed =3D=3D USB_SPEED_LOW) {
> > +		/* J state: D+/D- =3D low/high, K state: D+/D- =3D high/low */
> > +		value |=3D UTMIP_HIGHZ_A;
> > +		value |=3D UTMIP_AN_A;
> > +		value |=3D (UTMIP_AP_B | UTMIP_AP_C | UTMIP_AP_D);
> > +	}
>=20
> no else? err case? Also this could use a switch too

There's no else or error case here because all other values have already
been rejected by the "speed > USB_SPEED_HIGH" check earlier in this
function. I agree that this looks better as a switch, though, so I've
changed to that.

> > +static int tegra210_pmc_utmi_disable_phy_sleepwalk(struct tegra_xusb_l=
ane *lane)
> > +{
> > +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> > +	struct tegra210_xusb_padctl *priv =3D to_tegra210_xusb_padctl(padctl);
> > +	struct device *dev =3D padctl->dev;
> > +	unsigned int port =3D lane->index;
> > +	u32 value;
> > +
> > +	if (!priv->regmap)
> > +		return -EOPNOTSUPP;
>=20
> That should be an error like EIO as we always expect regmap to be set,
> no an unsupported error right?

This is for backwards-compatibility with older device trees. Device
trees prior to this patch series don't have a reference to that regmap,
but the code should keep working with such device trees, otherwise USB
will be broken on newer kernel versions if you don't update the device
tree.

"unsupported" here means that this particular feature isn't supported
because the regmap is missing, so we can't reprogram the registers
needed to make this work.

FWIW, the ->probe() function will print a warning if the regmap is
absent, so in combination with this -EOPNOTSUPP that is hopefully going
to make this clearer to users.

Thierry

--scOahIY3tU/uvpTQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBlpAQACgkQ3SOs138+
s6GZ6hAAmhcGixFEuOzP/8dzao8GjIg64Y26a8H3scO7s4v9HPqfDVbHoPNgQPfX
yxouvPhV+a7GEYaEdmot9roPKiwVxZM3ZXVlnAzrELHsBR4s6vlqYkDE+4I6lh+e
Ga19/8JTpiJLPex9M6RsW/EHb7oOwhclfQzqunruyhMaCfwKMb1d5iEAWtBEHNAo
RvT3ERs5rsgdyWARj/dAkG9nxh3JW3QgK6trUn40/axrTeDFl1Efp0ZI0BO1j0L8
QCmvbmdvnYvAttlslijQDGPzsqbR273yC9xZ3eqHxTajYWeIYDPym8fxCBa5pFmn
+gUZhFwduSoyjC7XTmLoLG85hs/bwQyzncptKH/7C50/eI4/c3SJPOvTdosh333G
YheLDcrqgt522iE2KegwWFH64Cx8fMnWvpZ0Gyh/si1skJs873JFQGrGtyV26TOt
RoHMu0sPh5WP3wrnJ/Fd4Q1cYrMZQqN2hNJFXqHjs3Ye63zW2tK6/5Q9nEzbE1n7
lxJ36nMSvxFPRWSJPW/u+zyINAp3vnxzmnE2Hije1gIIlM9Hvp29rrtUmWV9hnJJ
aM/OMlBm/VUWHDrhzi6sQ2vll7+XqU/4scjZx0mWTbfrDW28shRqgsg/FcKOqHZT
1JXwFIqVRW0+ZwWoX8Rw0Tu/WI0fgzkb1IWvf4Qo6BLAgndLobo=
=Jhuu
-----END PGP SIGNATURE-----

--scOahIY3tU/uvpTQ--
