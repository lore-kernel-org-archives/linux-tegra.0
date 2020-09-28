Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9061C47423
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEF6E2076B
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHFKsfV7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgI1Nu2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1Nu1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:50:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC46C061755;
        Mon, 28 Sep 2020 06:50:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so1455476wrm.2;
        Mon, 28 Sep 2020 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WD0Fk2UN67+HiVDZb86b5mH+1TvZfE/WURUMYfk4rNg=;
        b=OHFKsfV7CoC0mIXJM6c1UVhqSAdkmBhebjs/bcNDwURc7Xr96uhRR95seH30L7sTXo
         XV9i5i1ck2lWbekTG1MQULRM3LmSfXqtHpZZRiG9b0cWXQEjR4m4rm0B4tZrk2AexHRs
         q5ipiAqzXqOoZgSQtZi9fRAEM0dsUw/fgnqr0PXChcHGxS/rZa9EnBY7mif3SVmKGIFf
         ivz5zEt+hl7OQ2keoih0C3JxCtx6hxEX+7wEOM491IxRoHF7c9tVCNbW6uKyWT7WTT5G
         goixnM+OCxb7prkL9K84TV8+VqiInExRx5QwqTa3clk97paOfvm0BeZt4KUcXOAP9crC
         S/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WD0Fk2UN67+HiVDZb86b5mH+1TvZfE/WURUMYfk4rNg=;
        b=o9SoF8cYj243xZtmyCUb1u5LwTmzODzZGBYCkRnl+wL99rYMd1VxXcX88hL+WT64Mz
         2M9+0jpeOeEQqbScn7Wb533eZwASwkTk0vRyyyfHE6SnenaKr7t04H7leAeI/EzG/RrU
         xp8ljMAJFobwybthxDEcPq3crTQISUWQtgvZeI1guehZ+Es8nHFaS0YhRrNS7Hdj6OeG
         bykuITayoAu76zvrfazDFmVqtLJCKPJN6LaJVUmqiJcrP+hQOJmf5xIdk9JimpVJGWK2
         MktK0tz8bhHkO2RLfHWJ1mZpl1Fi/DKn720wOGU8w/Feu3IU6DPurAfeB2pjYa592ccm
         RywA==
X-Gm-Message-State: AOAM533Vbh8sg85eh+xhn7wB+/ALmU4XkEJ4P5UQ1jCDUesR6NwxtXel
        YzskXGz3hqWEF8/kmg0I9h8=
X-Google-Smtp-Source: ABdhPJwBsWsBnlCcsmhY8HUr+CoxgyNwW45QlOmvfGjNq1wBHfGBp54gxY6AzTqfRQdsu0Ezv8R67g==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr1791407wru.137.1601301025937;
        Mon, 28 Sep 2020 06:50:25 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q13sm1662271wra.93.2020.09.28.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:50:24 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:50:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 12/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra186
Message-ID: <20200928135021.GM3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-13-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hdhkc9EpVJoq6PQ6"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-13-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:38PM +0800, JC Kuo wrote:
> This commit implements Tegra186/Tegra194 XUSB PADCTL/AO wake and
> sleepwalk operations.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    move 'ao_regs' to the top of 'struct tegra186_xusb_padctl'
>    change return data of .phy_remote_wake_detected() to 'bool'
>    change input parameter of .phy_remote_wake_detected() to 'struct phy*'
>    remove unnecessary 'else'
>    rename 'val' with 'value'
>=20
>  drivers/phy/tegra/xusb-tegra186.c | 626 ++++++++++++++++++++++++++++++
>  1 file changed, 626 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 5d64f69b39a9..104e2a8496b4 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -113,6 +113,117 @@
>  #define  ID_OVERRIDE_FLOATING			ID_OVERRIDE(8)
>  #define  ID_OVERRIDE_GROUNDED			ID_OVERRIDE(0)
> =20
> +/* XUSB AO registers */
> +#define XUSB_AO_USB_DEBOUNCE_DEL		(0x4)
> +#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 4)
> +#define   UTMIP_LINE_DEB_CNT(x)			((x) & 0xf)
> +
> +#define XUSB_AO_UTMIP_TRIGGERS(x)		(0x40 + (x) * 4)
> +#define   CLR_WALK_PTR				(1 << 0)
> +#define   CAP_CFG				(1 << 1)
> +#define   CLR_WAKE_ALARM			(1 << 3)
> +
> +#define XUSB_AO_UHSIC_TRIGGERS(x)		(0x60 + (x) * 4)
> +#define   HSIC_CLR_WALK_PTR			(1 << 0)
> +#define   HSIC_CLR_WAKE_ALARM			(1 << 3)
> +#define   HSIC_CAP_CFG				(1 << 4)
> +
> +#define XUSB_AO_UTMIP_SAVED_STATE(x)		(0x70 + (x) * 4)
> +#define   SPEED(x)				((x) & 0x3)
> +#define     UTMI_HS				SPEED(0)
> +#define     UTMI_FS				SPEED(1)
> +#define     UTMI_LS				SPEED(2)
> +#define     UTMI_RST				SPEED(3)
> +
> +#define XUSB_AO_UHSIC_SAVED_STATE(x)		(0x90 + (x) * 4)
> +#define   MODE(x)				((x) & 0x1)
> +#define   MODE_HS				MODE(0)
> +#define   MODE_RST				MODE(1)
> +
> +#define XUSB_AO_UTMIP_SLEEPWALK_CFG(x)		(0xd0 + (x) * 4)
> +#define XUSB_AO_UHSIC_SLEEPWALK_CFG(x)		(0xf0 + (x) * 4)
> +#define   FAKE_USBOP_VAL			(1 << 0)
> +#define   FAKE_USBON_VAL			(1 << 1)
> +#define   FAKE_USBOP_EN				(1 << 2)
> +#define   FAKE_USBON_EN				(1 << 3)
> +#define   FAKE_STROBE_VAL			(1 << 0)
> +#define   FAKE_DATA_VAL				(1 << 1)
> +#define   FAKE_STROBE_EN			(1 << 2)
> +#define   FAKE_DATA_EN				(1 << 3)
> +#define   WAKE_WALK_EN				(1 << 14)
> +#define   MASTER_ENABLE				(1 << 15)
> +#define   LINEVAL_WALK_EN			(1 << 16)
> +#define   WAKE_VAL(x)				(((x) & 0xf) << 17)
> +#define     WAKE_VAL_NONE			WAKE_VAL(12)
> +#define     WAKE_VAL_ANY			WAKE_VAL(15)
> +#define     WAKE_VAL_DS10			WAKE_VAL(2)
> +#define   LINE_WAKEUP_EN			(1 << 21)
> +#define   MASTER_CFG_SEL			(1 << 22)
> +
> +#define XUSB_AO_UTMIP_SLEEPWALK(x)		(0x100 + (x) * 4)
> +/* phase A */
> +#define   USBOP_RPD_A				(1 << 0)
> +#define   USBON_RPD_A				(1 << 1)
> +#define   AP_A					(1 << 4)
> +#define   AN_A					(1 << 5)
> +#define   HIGHZ_A				(1 << 6)
> +/* phase B */
> +#define   USBOP_RPD_B				(1 << 8)
> +#define   USBON_RPD_B				(1 << 9)
> +#define   AP_B					(1 << 12)
> +#define   AN_B					(1 << 13)
> +#define   HIGHZ_B				(1 << 14)
> +/* phase C */
> +#define   USBOP_RPD_C				(1 << 16)
> +#define   USBON_RPD_C				(1 << 17)
> +#define   AP_C					(1 << 20)
> +#define   AN_C					(1 << 21)
> +#define   HIGHZ_C				(1 << 22)
> +/* phase D */
> +#define   USBOP_RPD_D				(1 << 24)
> +#define   USBON_RPD_D				(1 << 25)
> +#define   AP_D					(1 << 28)
> +#define   AN_D					(1 << 29)
> +#define   HIGHZ_D				(1 << 30)
> +
> +#define XUSB_AO_UHSIC_SLEEPWALK(x)		(0x120 + (x) * 4)
> +/* phase A */
> +#define   RPD_STROBE_A				(1 << 0)
> +#define   RPD_DATA0_A				(1 << 1)
> +#define   RPU_STROBE_A				(1 << 2)
> +#define   RPU_DATA0_A				(1 << 3)
> +/* phase B */
> +#define   RPD_STROBE_B				(1 << 8)
> +#define   RPD_DATA0_B				(1 << 9)
> +#define   RPU_STROBE_B				(1 << 10)
> +#define   RPU_DATA0_B				(1 << 11)
> +/* phase C */
> +#define   RPD_STROBE_C				(1 << 16)
> +#define   RPD_DATA0_C				(1 << 17)
> +#define   RPU_STROBE_C				(1 << 18)
> +#define   RPU_DATA0_C				(1 << 19)
> +/* phase D */
> +#define   RPD_STROBE_D				(1 << 24)
> +#define   RPD_DATA0_D				(1 << 25)
> +#define   RPU_STROBE_D				(1 << 26)
> +#define   RPU_DATA0_D				(1 << 27)
> +
> +#define XUSB_AO_UTMIP_PAD_CFG(x)		(0x130 + (x) * 4)
> +#define   FSLS_USE_XUSB_AO			(1 << 3)
> +#define   TRK_CTRL_USE_XUSB_AO			(1 << 4)
> +#define   RPD_CTRL_USE_XUSB_AO			(1 << 5)
> +#define   RPU_USE_XUSB_AO			(1 << 6)
> +#define   VREG_USE_XUSB_AO			(1 << 7)
> +#define   USBOP_VAL_PD				(1 << 8)
> +#define   USBON_VAL_PD				(1 << 9)
> +#define   E_DPD_OVRD_EN				(1 << 10)
> +#define   E_DPD_OVRD_VAL			(1 << 11)
> +
> +#define XUSB_AO_UHSIC_PAD_CFG(x)		(0x150 + (x) * 4)
> +#define   STROBE_VAL_PD				(1 << 0)
> +#define   DATA0_VAL_PD				(1 << 1)
> +#define   USE_XUSB_AO				(1 << 4)
> +
>  #define TEGRA186_LANE(_name, _offset, _shift, _mask, _type)		\
>  	{								\
>  		.name =3D _name,						\
> @@ -130,7 +241,15 @@ struct tegra_xusb_fuse_calibration {
>  	u32 rpd_ctrl;
>  };
> =20
> +struct tegra186_xusb_padctl_context {
> +	u32 vbus_id;
> +	u32 usb2_pad_mux;
> +	u32 usb2_port_cap;
> +	u32 ss_port_cap;
> +};
> +
>  struct tegra186_xusb_padctl {
> +	void __iomem *ao_regs;
>  	struct tegra_xusb_padctl base;

base should always be the first element in the structure to optimize
container_of().

> =20
>  	struct tegra_xusb_fuse_calibration calib;
> @@ -138,8 +257,25 @@ struct tegra186_xusb_padctl {
>  	/* UTMI bias and tracking */
>  	struct clk *usb2_trk_clk;
>  	unsigned int bias_pad_enable;
> +
> +	/* padctl context */
> +	struct tegra186_xusb_padctl_context context;
>  };
> =20
> +static inline void ao_writel(struct tegra186_xusb_padctl *priv, u32 valu=
e, unsigned long offset)

I prefer offsets to be unsigned int because the _l_ in read_l_() and
write_l_() was originally meant to be "long" (from back when long meant
32-bit). An unsigned long parameter can therefore be easily mistaken for
the value. That's arguably less of an issue with 64-bit because u32 is
an unsigned int. I guess making the offset unsigned int could also be
confusing on 64-bit because now both the value and the offset are
unsigned int, but for compatibility's sake I think that's okay.

Also, offsets are usually pretty small, so a full 64-bit integer isn't
really warranted.

[...]
> +static int tegra186_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_p=
adctl *padctl,
> +						     struct phy *phy,
> +						     enum usb_device_speed speed)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra186_usb3_phy_enable_sleepwalk(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra186_utmi_phy_enable_sleepwalk(phy, speed);
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra186_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_=
padctl *padctl,
> +						      struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra186_usb3_phy_disable_sleepwalk(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra186_utmi_phy_disable_sleepwalk(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra186_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl=
 *padctl, struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra186_usb3_phy_enable_wake(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra186_utmi_phy_enable_wake(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra186_xusb_padctl_disable_phy_wake(struct tegra_xusb_padct=
l *padctl, struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra186_usb3_phy_disable_wake(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra186_utmi_phy_disable_wake(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static bool tegra186_xusb_padctl_remote_wake_detected(struct phy *phy)
> +{
> +	if (is_utmi_phy(phy))
> +		return tegra186_utmi_phy_remote_wake_detected(phy);
> +
> +	if (is_usb3_phy(phy))
> +		return tegra186_usb3_phy_remote_wake_detected(phy);
> +
> +	return false;
> +}

These are pretty much the same multiplexers as for Tegra210. If we had
lane ops function pointers we could make this code more generic.

> +
>  static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
>  {
>  }
> @@ -937,7 +1556,14 @@ static void tegra186_xusb_padctl_remove(struct tegr=
a_xusb_padctl *padctl)
>  static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops =3D {
>  	.probe =3D tegra186_xusb_padctl_probe,
>  	.remove =3D tegra186_xusb_padctl_remove,
> +	.suspend_noirq =3D tegra186_xusb_padctl_suspend_noirq,
> +	.resume_noirq =3D tegra186_xusb_padctl_resume_noirq,
>  	.vbus_override =3D tegra186_xusb_padctl_vbus_override,
> +	.enable_phy_sleepwalk =3D tegra186_xusb_padctl_enable_phy_sleepwalk,
> +	.disable_phy_sleepwalk =3D tegra186_xusb_padctl_disable_phy_sleepwalk,
> +	.enable_phy_wake =3D tegra186_xusb_padctl_enable_phy_wake,
> +	.disable_phy_wake =3D tegra186_xusb_padctl_disable_phy_wake,
> +	.remote_wake_detected =3D tegra186_xusb_padctl_remote_wake_detected,

We might even be able to get rid of these callbacks because the code
that needs to call these can directly call into the lane ops.

Thierry

--hdhkc9EpVJoq6PQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x6h0ACgkQ3SOs138+
s6HdtA//RA3JUyln29e2NrvMWKQrtGkuFsIZy6QOg9A/X7exUxkyjcyhcnmiydeL
/ruHaLwtg8wR8JEvyRHfhNVQCiGbSEJtWncP56dSElJK9Ui9mNIhVh0wlS0Ls06c
uPlvm2Cy57NFG+wFHsbWYycgBzC50x6nTqCTGp1+D5ca30sqWl2S4SPBmlEcpe9s
Lovn5BKtRxWuykJrEE7ZZvjoSQl4T1cQ0AFeWNnE6FjngMYKHhhy/pwoAkFnEPwi
bSmGzFuk0buyaO+j3f1wd/UIRZejTxhW88bgFsIG9KF3mmxo9K7bMM9MmtLB0wBO
dyGM9Tv9TP/4WeVnxhqDn7VtbXO00m1g7drUGzBtf7sVwM587+xffzJ914jclSR1
7XfuqBGTn6TrlIoZwkdz2hpXKNCQ6ZuuLcR/rHzfjaRAlSkLsHEjoHxXfuqBrCRA
ak6vVVy3a+ZqZZf56i0pteXoBFVU3hdf5x2OFL9p/q1BGIyOyRIU9EsrfxIRnd7C
yFd1+A/usPAwWQ0r0U2coBIMgoLt0yy8M9rgBIBjlOigdW5MJ/j0/S3ZqkFYaHuI
BYW0qNoYXyPfvExSe6m31EQzwRMR0W1Af9u/5VkIdG2hChP/T5Cxz4DFudzLxlDe
wPC8gidmrqUIiJqXcRmz+0n8u3vi4zawU36B3a3B0eCF4JnX1ik=
=egWO
-----END PGP SIGNATURE-----

--hdhkc9EpVJoq6PQ6--
