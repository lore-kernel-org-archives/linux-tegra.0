Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC74C04A68
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jul 2022 14:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbiG0OR4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jul 2022 10:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbiG0ORz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jul 2022 10:17:55 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B946D8F;
        Wed, 27 Jul 2022 07:17:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id m8so21558703edd.9;
        Wed, 27 Jul 2022 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aX4jjPi3LOwo6LwiJ0nXsb7A0f1ym1l6E+QIm6V0DC8=;
        b=jF0Ma7rSEktoVjG00X3yYygQRrzg2IK/+ciApl2THSUFJCihsCY+fDfw2ApmdFQs07
         2CLm0DSrOC8J12PcIkV9xVyivz2DoH7DsvTpDq3WrdjZtFrR824BIIydddOo60Js8BuG
         HnpX5Z4iVboIzZA9mccQ2P+kWXB/D0TcG8BJIAimxe5YdXwscTeH+ImzY37H9g6gHxWS
         lQkzGzXXikCPd2gfU3VO81wBrmHyhU8+c6jwlDfDutDAPEEtbsqmjfJkEjI9sfhl7HiQ
         j/HpsoWea/Kv4fJC4/uxAuf/5yi5WNkipP7+aYO/O/Ex+kg6rV+10YeM5doYDGyDsuxQ
         KiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aX4jjPi3LOwo6LwiJ0nXsb7A0f1ym1l6E+QIm6V0DC8=;
        b=28MV6osAQDZ35gv83XYhQnxrfbuQyHkUguNYDjYRC/KbJG1HggxFepstGVJ62ZDaCE
         9ILWuwlt9Q/0CLJm5un2y2G9/uqCFm1JIe7z7GWxO3hgt8OOmCZ5o+ocBA3hLYwAnltn
         DX5h75/zHUUyPNhZrJ9zk7nfIqaYDz5RTf4bNiubH2kVLkFTV/WslIstDIR++JbK1WRU
         rLZOeDYh5ZcYnYYYymT4L7ErWD0+U9jutDVHps06R+A+dUpq6KhXy1xIVucd9OfKjNJ5
         tZ+bkl2fzPIDnCtCavRkZ94y9DjZwIynHrmaViM2rSWEhv0C9Oie1EzTukK4h6UaSCb/
         h18g==
X-Gm-Message-State: AJIora9+tPIII2/YhMxCBgc4fGfuQX/qs9hC+drB9KpXL7mN2hZEPl0x
        60x5Gw41nUUyyB/6022InBo=
X-Google-Smtp-Source: AGRyM1tiVdxWrkwfxQ4B5M5iouliobMd2NlZvPRnGQc5owKEw8fkpUGBOAcOe6ZfJV3JjdXwsKx6UQ==
X-Received: by 2002:a05:6402:3551:b0:43c:375f:6d1 with SMTP id f17-20020a056402355100b0043c375f06d1mr10899234edd.166.1658931471669;
        Wed, 27 Jul 2022 07:17:51 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e16-20020a1709061e9000b0072b4da1ed9asm7599518ejj.225.2022.07.27.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 07:17:50 -0700 (PDT)
Date:   Wed, 27 Jul 2022 16:17:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jim Lin <jilin@nvidia.com>
Cc:     jckuo@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, balbi@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        Allie Liu <alliel@nvidia.com>
Subject: Re: [PATCH] xhci: tegra: USB2 pad power controls
Message-ID: <YuFJDQTmKRW9xqj6@orome>
References: <20220727105314.14681-1-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lnKrcflXzYJHFhEX"
Content-Disposition: inline
In-Reply-To: <20220727105314.14681-1-jilin@nvidia.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--lnKrcflXzYJHFhEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 06:53:14PM +0800, Jim Lin wrote:
> Program USB2 pad PD controls during port
> connect/disconnect, port suspend/resume etc
> as suggested by HW to reduce power consumption.
>=20
> Squash following fixes from local kernel 4.9 to this commit:
> ce4e7e5 usb: host: tegra: Power on utmi pads
> 3a10c61 usb: tegra: Program USB2 pad PD controls
> 4e62fbb xhci: tegra: move pad power on to non-atomic place
> ed0fb0a usb: xhci: tegra: don't use hs_pls in xhci-iov
> 401801a usb: xhci: add USB2 pad PD control for Test Mode

Is there any particular reason why we can't submit these changes in the
above form? Why do they need to be submitted as a single patch?

If this is because there are build-time dependencies between these, you
can still send them as individual patches and provide some dependency
information in the cover-letter for the series so that the respective
maintainers can work out how to merge them. In this particular case it
would probably be fine for Greg to pick up all the patches with
Acked-bys from Vinod or Kishon (for PHY) and Felipe (for USB gadget).

Leaving this in the original form makes this a lot easier to review and
presumably solves the problem of the commit description as well.

> Signed-off-by: Allie Liu <alliel@nvidia.com>
> Signed-off-by: Jim Lin <jilin@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c   |  27 +++--
>  drivers/phy/tegra/xusb.c            |  32 +++++-
>  drivers/phy/tegra/xusb.h            |   4 +-
>  drivers/usb/gadget/udc/tegra-xudc.c |   8 +-
>  drivers/usb/host/xhci-hub.c         |   2 +
>  drivers/usb/host/xhci-tegra.c       | 146 +++++++++++++++++++++++++++-
>  include/linux/phy/tegra/xusb.h      |   4 +-
>  7 files changed, 209 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index ae3915ed9fef..4eb29189ebfc 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2022, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
>  #include <linux/delay.h>
> @@ -642,20 +642,25 @@ static void tegra_phy_xusb_utmi_pad_power_on(struct=
 phy *phy)
>  {
>  	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	struct tegra_xusb_usb2_lane *usb2 =3D to_usb2_lane(lane);
>  	struct tegra_xusb_usb2_port *port;
> -	struct device *dev =3D padctl->dev;

This temporary variable was introduced on purpose to keep the call sites
briefer. You're now adding one callsite, so dropping this is counter-
productive. The usage of this variable is admittedly a bit questionable,
but if you want to remove it, better do it in a separate patch so it
doesn't detract from the important bits in this patch.

>  	unsigned int index =3D lane->index;
>  	u32 value;
> =20
> +	dev_dbg(padctl->dev, "power on UTMI pads %u\n", index);
> +
>  	if (!phy)
>  		return;
> =20
>  	port =3D tegra_xusb_find_usb2_port(padctl, index);
>  	if (!port) {
> -		dev_err(dev, "no port found for USB2 lane %u\n", index);
> +		dev_err(padctl->dev, "no port found for USB2 lane %u\n", index);
>  		return;
>  	}
> =20
> +	if (usb2->powered_on)
> +		return;
> +
>  	tegra186_utmi_bias_pad_power_on(padctl);
> =20
>  	udelay(2);
> @@ -667,18 +672,26 @@ static void tegra_phy_xusb_utmi_pad_power_on(struct=
 phy *phy)
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>  	value &=3D ~USB2_OTG_PD_DR;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> +
> +	usb2->powered_on =3D true;
>  }
> =20
>  static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +	struct tegra_xusb_usb2_lane *usb2 =3D to_usb2_lane(lane);
>  	unsigned int index =3D lane->index;
>  	u32 value;
> =20
> +	dev_dbg(padctl->dev, "power down UTMI pad %u\n", index);
> +
>  	if (!phy)
>  		return;
> =20
> +	if (!usb2->powered_on)
> +		return;
> +
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
>  	value |=3D USB2_OTG_PD;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> @@ -688,8 +701,9 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct=
 phy *phy)
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> =20
>  	udelay(2);
> -

This blank line was here for readability, no reason to drop it.

>  	tegra186_utmi_bias_pad_power_off(padctl);
> +
> +	usb2->powered_on =3D false;
>  }
> =20
>  static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *=
padctl,
> @@ -849,14 +863,11 @@ static int tegra186_utmi_phy_power_on(struct phy *p=
hy)
>  	value |=3D RPD_CTRL(priv->calib.rpd_ctrl);
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
> =20
> -	/* TODO: pad power saving */
> -	tegra_phy_xusb_utmi_pad_power_on(phy);
>  	return 0;
>  }
> =20
>  static int tegra186_utmi_phy_power_off(struct phy *phy)
>  {
> -	/* TODO: pad power saving */
>  	tegra_phy_xusb_utmi_pad_power_down(phy);

You've removed the tegra_phy_xusb_utmi_pad_power_on() call from
tegra186_utmi_phy_power_on(), so by not removing the pad power down call
=66rom here makes this asymmetric. Instead, these calls are now sprinkled
all over the place in the XHCI and UDC drivers. The PHY abstraction
layer was supposed to help avoid any custom APIs. Is there no way we can
use something like phy_power_on() or phy_power_off() instead of these?

> =20
>  	return 0;
> @@ -1486,6 +1497,8 @@ static const struct tegra_xusb_padctl_ops tegra186_=
xusb_padctl_ops =3D {
>  	.suspend_noirq =3D tegra186_xusb_padctl_suspend_noirq,
>  	.resume_noirq =3D tegra186_xusb_padctl_resume_noirq,
>  	.vbus_override =3D tegra186_xusb_padctl_vbus_override,
> +	.utmi_pad_power_on =3D tegra_phy_xusb_utmi_pad_power_on,
> +	.utmi_pad_power_down =3D tegra_phy_xusb_utmi_pad_power_down,
>  };
> =20
>  #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 963de5913e50..a6c7550e3a3a 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2022, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
>  #include <linux/delay.h>
> @@ -1446,6 +1446,36 @@ int tegra_xusb_padctl_set_vbus_override(struct teg=
ra_xusb_padctl *padctl,
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
> =20
> +void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane;
> +	struct tegra_xusb_padctl *padctl;
> +
> +	if (!phy)
> +		return;
> +
> +	lane =3D phy_get_drvdata(phy);
> +	padctl =3D lane->pad->padctl;
> +	if (padctl->soc->ops->utmi_pad_power_on)
> +		padctl->soc->ops->utmi_pad_power_on(phy);
> +}
> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_pad_power_on);
> +
> +void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane;
> +	struct tegra_xusb_padctl *padctl;
> +
> +	if (!phy)
> +		return;
> +
> +	lane =3D phy_get_drvdata(phy);
> +	padctl =3D lane->pad->padctl;
> +	if (padctl->soc->ops->utmi_pad_power_down)
> +		padctl->soc->ops->utmi_pad_power_down(phy);
> +}
> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_pad_power_down);
> +
>  int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 034f7a2c28d6..02cc5c6a588e 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2022, NVIDIA CORPORATION.  All rights reserved.
>   * Copyright (c) 2015, Google Inc.
>   */
> =20
> @@ -411,6 +411,8 @@ struct tegra_xusb_padctl_ops {
>  	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>  				    unsigned int index, bool enable);
>  	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
> +	void (*utmi_pad_power_on)(struct phy *phy);
> +	void (*utmi_pad_power_down)(struct phy *phy);
>  	int (*utmi_port_reset)(struct phy *phy);
>  };
> =20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 43f1b0d461c1..bca059b58bc9 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -2,7 +2,7 @@
>  /*
>   * NVIDIA Tegra XUSB device mode controller
>   *
> - * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2013-2022, NVIDIA CORPORATION.  All rights reserved.
>   * Copyright (c) 2015, Google Inc.
>   */
> =20
> @@ -703,6 +703,9 @@ static void tegra_xudc_device_mode_on(struct tegra_xu=
dc *xudc)
> =20
>  	pm_runtime_get_sync(xudc->dev);
> =20
> +	if (xudc->curr_utmi_phy)
> +		tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);

I think you can omit the check here since the function aborts early if
the PHY that's passed in is NULL.

> +
>  	err =3D phy_power_on(xudc->curr_utmi_phy);
>  	if (err < 0)
>  		dev_err(xudc->dev, "UTMI power on failed: %d\n", err);
> @@ -757,6 +760,9 @@ static void tegra_xudc_device_mode_off(struct tegra_x=
udc *xudc)
>  	/* Make sure interrupt handler has completed before powergating. */
>  	synchronize_irq(xudc->irq);
> =20
> +	if (xudc->curr_utmi_phy)
> +		tegra_phy_xusb_utmi_pad_power_down(xudc->curr_utmi_phy);

Same here.

> +
>  	err =3D phy_power_off(xudc->curr_utmi_phy);
>  	if (err < 0)
>  		dev_err(xudc->dev, "UTMI PHY power off failed: %d\n", err);
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index af946c42b6f0..9e458a748a4f 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -646,6 +646,7 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
>  		return &xhci->usb3_rhub;
>  	return &xhci->usb2_rhub;
>  }
> +EXPORT_SYMBOL_GPL(xhci_get_rhub);
> =20
>  /*
>   * xhci_set_port_power() must be called with xhci->lock held.
> @@ -1604,6 +1605,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeR=
eq, u16 wValue,
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>  	return retval;
>  }
> +EXPORT_SYMBOL_GPL(xhci_hub_control);
> =20
>  /*
>   * Returns 0 if the status hasn't changed, or the number of bytes in buf.
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index c8af2cd2216d..ea7863cae180 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -2,7 +2,7 @@
>  /*
>   * NVIDIA Tegra xHCI host controller driver
>   *
> - * Copyright (c) 2014-2020, NVIDIA CORPORATION. All rights reserved.
> + * Copyright (c) 2014-2022, NVIDIA CORPORATION. All rights reserved.
>   * Copyright (C) 2014 Google, Inc.
>   */
> =20
> @@ -189,6 +189,13 @@ struct tegra_xusb_context_soc {
>  	} fpci;
>  };
> =20
> +enum tegra_xhci_phy_type {
> +	USB3_PHY,
> +	USB2_PHY,
> +	HSIC_PHY,
> +	MAX_PHY_TYPES,
> +};
> +
>  struct tegra_xusb_soc {
>  	const char *firmware;
>  	const char * const *supply_names;
> @@ -274,10 +281,16 @@ struct tegra_xusb {
> =20
>  	bool suspended;
>  	struct tegra_xusb_context context;
> +	u32 enable_utmi_pad_after_lp0_exit;
>  };
> =20
>  static struct hc_driver __read_mostly tegra_xhci_hc_driver;
> =20
> +static inline struct tegra_xusb *hcd_to_tegra_xusb(struct usb_hcd *hcd)
> +{
> +	return (struct tegra_xusb *) dev_get_drvdata(hcd->self.controller);
> +}
> +
>  static inline u32 fpci_readl(struct tegra_xusb *tegra, unsigned int offs=
et)
>  {
>  	return readl(tegra->fpci_base + offset);
> @@ -1949,12 +1962,32 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(=
struct tegra_xusb *tegra)
>  static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
>  {
>  	struct tegra_xusb_padctl *padctl =3D tegra->padctl;
> -	unsigned int i;
> +	unsigned int i, j;
> +	char phy_name[5];
> =20
>  	for (i =3D 0; i < tegra->num_phys; i++) {
>  		if (!tegra->phys[i])
>  			continue;
> +		if (tegra_xusb_padctl_remote_wake_detected(padctl, tegra->phys[i])) {
> +			if (i < (tegra->soc->ports.usb3.offset +
> +					tegra->soc->ports.usb3.count)) {
> +				j =3D i;
> +				strcpy(phy_name, "usb3");
> +			} else if (i < (tegra->soc->ports.usb2.offset +
> +					tegra->soc->ports.usb2.count)) {
> +				j =3D i - tegra->soc->ports.usb2.offset;
> +				strcpy(phy_name, "usb2");
> +
> +				tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
> +			} else {
> +				j =3D i - (tegra->soc->ports.usb2.offset +
> +					tegra->soc->ports.usb2.count);
> +				strcpy(phy_name, "hsic");
> +			}
> +			dev_dbg(tegra->dev,
> +				"%s port %u (0 based) remote wake detected\n", phy_name, j);

That's a lot of code for just a debug message. Instead of doing this,
can't you simply use something like dev_name(&tegra->phys[i].dev), which
should print something like this:

	phy-usb2.0

for the first USB2 port, etc. That's not *exactly* what you print above,
but I think it's close enough and allows us to avoid all that extra
code.

> =20
> +		}
>  		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
>  	}
>  }
> @@ -1967,11 +2000,27 @@ static void tegra_xhci_disable_phy_sleepwalk(stru=
ct tegra_xusb *tegra)
>  	for (i =3D 0; i < tegra->num_phys; i++) {
>  		if (!tegra->phys[i])
>  			continue;
> -

Again, no need to remove this blank line.

>  		tegra_xusb_padctl_disable_phy_sleepwalk(padctl, tegra->phys[i]);
>  	}
>  }
> =20
> +static void tegra_xhci_program_utmi_power_lp0_exit(
> +	struct tegra_xusb *tegra)

This should all fit on a single line, no need to wrap it.

> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < tegra->soc->ports.usb2.count; i++) {
> +		if (!is_host_mode_phy(tegra, USB2_PHY, i))
> +			continue;
> +		if (tegra->enable_utmi_pad_after_lp0_exit & BIT(i))
> +			tegra_phy_xusb_utmi_pad_power_on(
> +					tegra->phys[tegra->soc->ports.usb2.offset + i]);
> +		else
> +			tegra_phy_xusb_utmi_pad_power_down(
> +					tegra->phys[tegra->soc->ports.usb2.offset + i]);
> +	}
> +}
> +
>  static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
>  {
>  	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
> @@ -1980,6 +2029,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb =
*tegra, bool runtime)
>  	unsigned int i;
>  	int err;
>  	u32 usbcmd;
> +	u32 portsc;
> =20
>  	dev_dbg(dev, "entering ELPG\n");
> =20
> @@ -1993,6 +2043,16 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb=
 *tegra, bool runtime)
>  		goto out;
>  	}
> =20
> +	for (i =3D 0; i < tegra->soc->ports.usb2.count; i++) {
> +		if (!xhci->usb2_rhub.ports[i])
> +			continue;
> +		portsc =3D readl(xhci->usb2_rhub.ports[i]->addr);
> +		tegra->enable_utmi_pad_after_lp0_exit &=3D ~BIT(i);
> +		if (((portsc & PORT_PLS_MASK) =3D=3D XDEV_U3) ||
> +			((portsc & DEV_SPEED_MASK) =3D=3D XDEV_FS))
> +			tegra->enable_utmi_pad_after_lp0_exit |=3D BIT(i);
> +	}
> +
>  	err =3D xhci_suspend(xhci, wakeup);
>  	if (err < 0) {
>  		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
> @@ -2067,6 +2127,9 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *=
tegra, bool runtime)
>  		phy_power_on(tegra->phys[i]);
>  	}
> =20
> +	if (tegra->suspended)
> +		tegra_xhci_program_utmi_power_lp0_exit(tegra);
> +
>  	tegra_xusb_config(tegra);
>  	tegra_xusb_restore_context(tegra);
> =20
> @@ -2437,6 +2500,82 @@ static int tegra_xhci_setup(struct usb_hcd *hcd)
>  	return xhci_gen_setup(hcd, tegra_xhci_quirks);
>  }
> =20
> +static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req,
> +		u16 value, u16 index, char *buf, u16 length)
> +

Indentation is wrong here. Align arguments on wrapped lines with the
first argument on the first line. Also, you should be able to fit a bit
more on the first line (the limit is 100 characters).

There's also a redundant blank line there.

> +{
> +	struct tegra_xusb *tegra =3D hcd_to_tegra_xusb(hcd);
> +	struct xhci_hub *rhub;
> +	struct xhci_bus_state *bus_state;
> +	int port =3D (index & 0xff) - 1;
> +	int port_index;
> +	struct xhci_port **ports;
> +	u32 portsc;
> +	int ret;
> +
> +	rhub =3D xhci_get_rhub(hcd);
> +	bus_state =3D &rhub->bus_state;
> +	if (bus_state->resuming_ports && hcd->speed =3D=3D HCD_USB2) {
> +		ports =3D rhub->ports;
> +		port_index =3D rhub->num_ports;
> +		while (port_index--) {
> +			if (!test_bit(port_index, &bus_state->resuming_ports))
> +				continue;
> +			portsc =3D readl(ports[port_index]->addr);
> +			if ((port_index < tegra->soc->ports.usb2.count)

How can that even happen? port_index should never exceed the USB2 port
count.

> +					&& ((portsc & PORT_PLS_MASK) =3D=3D XDEV_RESUME))
> +				tegra_phy_xusb_utmi_pad_power_on(
> +					tegra->phys[tegra->soc->ports.usb2.offset + port_index]);
> +		}
> +	}
> +
> +	if (hcd->speed =3D=3D HCD_USB2) {
> +		if ((type_req =3D=3D ClearPortFeature) &&
> +				(value =3D=3D USB_PORT_FEAT_SUSPEND))
> +			tegra_phy_xusb_utmi_pad_power_on(
> +				tegra->phys[tegra->soc->ports.usb2.offset + port]);

This reference to the USB2 port PHY is repeated a lot, so it might be
worth adding a temporary variable for it.

> +	}
> +
> +	ret =3D xhci_hub_control(hcd, type_req, value, index, buf, length);
> +
> +	if ((hcd->speed =3D=3D HCD_USB2) && (ret =3D=3D 0)) {

This looks odd. Perhaps it'd look a bit more intuitive if you switched
this around, something like this:

	if (ret < 0)
		return ret;

	if (hcd->speed =3D=3D HCD_USB2) {
		...
	}

> +		if ((type_req =3D=3D SetPortFeature) &&
> +			(value =3D=3D USB_PORT_FEAT_SUSPEND))
> +			/* We dont suspend the PAD while HNP role swap happens
> +			 * on the OTG port
> +			 */
> +			if (!((hcd->self.otg_port =3D=3D (port + 1)) &&
> +					hcd->self.b_hnp_enable))
> +				tegra_phy_xusb_utmi_pad_power_down(
> +					tegra->phys[tegra->soc->ports.usb2.offset + port]);
> +
> +		if ((type_req =3D=3D ClearPortFeature) &&
> +				(value =3D=3D USB_PORT_FEAT_C_CONNECTION)) {
> +			rhub =3D xhci_get_rhub(hcd);
> +			ports =3D rhub->ports;
> +			portsc =3D readl(ports[port]->addr);
> +			if (portsc & PORT_CONNECT)
> +				tegra_phy_xusb_utmi_pad_power_on(
> +					  tegra->phys[tegra->soc->ports.usb2.offset + port]);
> +			else {
> +				/* We dont suspend the PAD while HNP
> +				 * role swap happens on the OTG port
> +				 */
> +				if (!((hcd->self.otg_port =3D=3D (port + 1))
> +						&& hcd->self.b_hnp_enable))
> +					tegra_phy_xusb_utmi_pad_power_down(
> +						tegra->phys[tegra->soc->ports.usb2.offset + port]);
> +			}
> +		}
> +		if ((type_req =3D=3D SetPortFeature) &&
> +		    (value =3D=3D USB_PORT_FEAT_TEST))
> +			tegra_phy_xusb_utmi_pad_power_on(
> +				tegra->phys[tegra->soc->ports.usb2.offset + port]);
> +	}

Some of the above can take advantage of more horizontal space to avoid
wrapping unnecessarily.

> +
> +	return ret;
> +}
> +
>  static const struct xhci_driver_overrides tegra_xhci_overrides __initcon=
st =3D {
>  	.reset =3D tegra_xhci_setup,
>  };
> @@ -2444,6 +2583,7 @@ static const struct xhci_driver_overrides tegra_xhc=
i_overrides __initconst =3D {
>  static int __init tegra_xusb_init(void)
>  {
>  	xhci_init_driver(&tegra_xhci_hc_driver, &tegra_xhci_overrides);
> +	tegra_xhci_hc_driver.hub_control =3D tegra_xhci_hub_control;
> =20
>  	return platform_driver_register(&tegra_xusb_driver);
>  }
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xus=
b.h
> index 3a35e74cdc61..70998e6dd6fd 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2022, NVIDIA CORPORATION.  All rights reserved.
>   */
> =20
>  #ifndef PHY_TEGRA_XUSB_H
> @@ -21,6 +21,8 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra=
_xusb_padctl *padctl,
>  					   unsigned int port, bool enable);
>  int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
>  					bool val);
> +void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy);
> +void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy);
>  int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>  int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padct=
l,
>  					 unsigned int port);
> --=20
> 2.17.1

Thierry

--lnKrcflXzYJHFhEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLhSQoACgkQ3SOs138+
s6Hk6Q/+MPlHdQDgHpJJksi6C4USMzUh828dcSVP7REgGAVjP/KZn1PyNi9fDRU+
Fbr5NetXL8snzvzSxKuWU9wAF5QOAq2Sp92nsV+1RXQzVVWErHS9RjjM5TsSqs9A
tlCbZ9sdYl4fPnoBZ00Qlhl+zhrDv8uxsjTvi6n8QeOYV1WwDbQ/rc4l97RtN1rP
nWC+kGCmocgW/WmIaSTR5VRPOvJc/c0byVY3rZ4yUHEMwPszfeICtgNaNbdZ8MdM
KXyLXBW0JiHaG9c5elYIlfB707uWRfbeuGgh6ulNdk8RXTtOqtdJaaaILlzsucmX
Dp+1VBay9cvwpaozi14L1jMgclfwt8D7PFMOTX81bLF8NOErkRqgce0MbJT6BoO+
5YXmq3c/Gdw1c8dPCZ0pjHPW652f9GB4CpCKV+uv0FXauGSDZI+daSdPmKb1sd4O
7bhUXGNLOVK4lItmB/yVvzSS/5PCSVsh/ZJRjZyKvvkJjIZbCXmOr3I2ZMWlWnxk
aCK3lPQgyGIrt4tSWVQZ7E1rEuZnzSr2stYVRqDJfQj2B4fmlYZUDpjzEZA+wd3W
NdNdUzss7NKBc1Cwhz/bgi3ghZs99M9FCppY9GWLNQdLOxLGyxILDNaJbyMY9Pf0
fZ6Eb8sCbkoS5uW6MDM2xaerBgkc2nNbd5fPdNoBakdB2Qd6dEM=
=grBH
-----END PGP SIGNATURE-----

--lnKrcflXzYJHFhEX--
