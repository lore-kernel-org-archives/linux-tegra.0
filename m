Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01083C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A973F207C4
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKTrbiEM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgI1NlD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1NlC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:41:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F434C061755;
        Mon, 28 Sep 2020 06:41:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so1387558wrx.7;
        Mon, 28 Sep 2020 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QFY4b8157RCSTh0is5r4ZBDr6uhqr7sud1mk4+im8LY=;
        b=tKTrbiEMf6sNKfr41DkOA5vVaU6gOJnNhXbwtWlQtEES3fq1YG7Nh7IkA8brlCm1sD
         2DAA0blRjF397OkAKc+OU5WjH53mSDcUrjxjhvQceMUkLH1u29deHzc3dLOytoQTsNH/
         fhC7bK05CS4hIKVg8zH8JHbKWiZ3A3xgC2sw3xULeCAGalG8F/cG6XNQa6jQXvPmV/+l
         KXG5s2d3n2AQUvVK+Ydfsu2ZCas14QIjeViPZiwMX/6HB2WlkK7wxV5eKnggZfHLz14Q
         i/BHvUyP8ZX2AKkV4HEoOSoYR07ihLe0RUYGOW0gZSzyW6H8gVhQJMCzHa7ZUAfbdHtt
         50WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QFY4b8157RCSTh0is5r4ZBDr6uhqr7sud1mk4+im8LY=;
        b=MEnZY7y1ABIwA0tfL+TJ24BkzhClIZGPMEl+nrdAge3G/7c+bqsJ/QRJOgqhHJLD7K
         GX/+gtyV0z3iQIjEyvxN3LG+rUTKzyhaxWRLYb44GVORWCL0danO8X1v792X/Vjq7Ifl
         ohHhIP8rRzZ+vbYPsCsMWxQXVg2b+37fGFuR45Vbn7txsVWruHBJGTheSxSgcFhCxUdV
         ZHQqai6M3TSH3xfryNvtgHUtJGb6Dpv7EfNNfx4ehTsqub0DCjGzL1qV4Vc4HSno5rap
         JykQ4J2eRcNz3aIB1amCfp0onotkB1Y3LM+pQ3YOZCR0pXMslrur8s2HK/jf8hwINq99
         qQ8w==
X-Gm-Message-State: AOAM532cqzVnvz0FBOBHxyO+jiTxqqbTmFNJ3Y0gVOskJvif/LwZGUBc
        PpUusP8D3Wlk9/bgpv93DSQ=
X-Google-Smtp-Source: ABdhPJz5kK/P4iipCYrUZZ71fy9jCUkZv6HHRkiPzqwEYvmP/oz7j4sLPWdujmCqL3DtXSzuOGaI8g==
X-Received: by 2002:a5d:5090:: with SMTP id a16mr1905003wrt.247.1601300461116;
        Mon, 28 Sep 2020 06:41:01 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id j14sm1620596wrr.66.2020.09.28.06.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:40:59 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:40:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 10/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <20200928134057.GK3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-11-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvuyDaC2GNSBQusT"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-11-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:36PM +0800, JC Kuo wrote:
[...]
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
[...]
> @@ -2096,6 +2938,96 @@ static const struct phy_ops tegra210_sata_phy_ops =
=3D {
>  	.owner =3D THIS_MODULE,
>  };
> =20
> +static inline bool is_usb3_phy(struct phy *phy)
> +{
> +	return (phy->ops =3D=3D &tegra210_pcie_phy_ops ||
> +		phy->ops =3D=3D &tegra210_sata_phy_ops);
> +}
> +
> +static inline bool is_hsic_phy(struct phy *phy)
> +{
> +	return phy->ops =3D=3D &tegra210_hsic_phy_ops;
> +}
> +
> +static inline bool is_utmi_phy(struct phy *phy)
> +{
> +	return phy->ops =3D=3D &tegra210_usb2_phy_ops;
> +}
> +
> +static int tegra210_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl=
 *padctl, struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra210_usb3_enable_phy_wake(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra210_utmi_enable_phy_wake(phy);
> +
> +	if (is_hsic_phy(phy))
> +		return tegra210_hsic_enable_phy_wake(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra210_xusb_padctl_disable_phy_wake(struct tegra_xusb_padct=
l *padctl, struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra210_usb3_disable_phy_wake(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra210_utmi_disable_phy_wake(phy);
> +
> +	if (is_hsic_phy(phy))
> +		return tegra210_hsic_disable_phy_wake(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static bool tegra210_xusb_padctl_remote_wake_detected(struct phy *phy)
> +{
> +	if (is_utmi_phy(phy))
> +		return tegra210_utmi_phy_remote_wake_detected(phy);
> +
> +	if (is_hsic_phy(phy))
> +		return tegra210_hsic_phy_remote_wake_detected(phy);
> +
> +	if (is_usb3_phy(phy))
> +		return tegra210_usb3_phy_remote_wake_detected(phy);
> +
> +	return false;
> +}
> +
> +static int tegra210_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_p=
adctl *padctl,
> +						     struct phy *phy,
> +						     enum usb_device_speed speed)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra210_usb3_enable_phy_sleepwalk(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra210_pmc_utmi_enable_phy_sleepwalk(phy, speed);
> +
> +	if (is_hsic_phy(phy))
> +		return tegra210_pmc_hsic_enable_phy_sleepwalk(phy);
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra210_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_=
padctl *padctl,
> +						      struct phy *phy)
> +{
> +	if (is_usb3_phy(phy))
> +		return tegra210_usb3_disable_phy_sleepwalk(phy);
> +
> +	if (is_utmi_phy(phy))
> +		return tegra210_pmc_utmi_disable_phy_sleepwalk(phy);
> +
> +	if (is_hsic_phy(phy))
> +		return tegra210_pmc_hsic_disable_phy_sleepwalk(phy);
> +
> +	return -EINVAL;
> +}

[...]

Could we add function pointers to struct tegra_xusb_lane_ops for all of
these? That would allow us to assign them once during probe and then we
don't have to bother with these is_*() functions and multiplexing but
instead just call ->enable_phy_wake() and ->disable_phy_wake() directly.

> +
> +

There's an extra blank line here.

>  static struct tegra_xusb_pad *
>  tegra210_sata_pad_probe(struct tegra_xusb_padctl *padctl,
>  			const struct tegra_xusb_pad_soc *soc,
> @@ -2293,6 +3225,8 @@ tegra210_xusb_padctl_probe(struct device *dev,
>  			   const struct tegra_xusb_padctl_soc *soc)
>  {
>  	struct tegra210_xusb_padctl *padctl;
> +	struct device_node *node, *np =3D dev->of_node;

We only need dev->of_node once, so I don't think we need to store it in
a local variable. Just make this:

	struct device_node *np;

> +	struct platform_device *pmc_dev;

I'd call this pdev, which is the canonical name for variables pointing
to a platform device.

>  	int err;
> =20
>  	padctl =3D devm_kzalloc(dev, sizeof(*padctl), GFP_KERNEL);
> @@ -2306,6 +3240,23 @@ tegra210_xusb_padctl_probe(struct device *dev,
>  	if (err < 0)
>  		return ERR_PTR(err);
> =20
> +	node =3D of_parse_phandle(np, "nvidia,pmc", 0);
> +	if (!node) {

And make this:

	np =3D of_parse_phandle(dev->of_node, "nvidia,pmc", 0);
	if (!np) {

> +		dev_info(dev, "nvidia,pmc property is missing\n");

It might be better for this to be a warning, to make it easier to catch.

> +		goto no_pmc;
> +	}
> +
> +	pmc_dev =3D of_find_device_by_node(node);
> +	if (!pmc_dev) {
> +		dev_info(dev, "pmc device is not available\n");

Same here. Also s/pmc/PMC/ in the message

> +		goto no_pmc;

Maybe call the label "out", "done" or something similar. "no_pmc" makes
it sound like it's meant for error cases, which makes it confusing when
you fallthrough for the success case as well.

Actually, in this case it might be easier to just return here instead of
using a goto.

> +	}
> +
> +	padctl->regmap =3D dev_get_regmap(&pmc_dev->dev, "usb_sleepwalk");
> +	if (!padctl->regmap)
> +		dev_info(dev, "pmc regmap is not available.\n");

Do we perhaps want to defer probe here?

Thierry

--GvuyDaC2GNSBQusT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x5+YACgkQ3SOs138+
s6HcwBAArapSS6ayhM8YS0nvqyn2aFdfqlNkJpNdoWc4hJvQ8TpgbOd1VuAOf7dH
3tRNmHMRQDqgyDuFjzKEBW4rWlgcHtZJwHXHDAq+o5R1JZ2fax4RvtP68MLQST2E
DHU4CGNYfmBz2QIF0HppGkGmDmkp/qlNkBb+eo2gXzRnBRyrWwTEfun3Hpdy/dfc
vHyHQh6k6mw+QCETfKMGpgW6HmZtJ4QLSMKURNW4yAAUOP6Tz+m+EsxpyLXvGp4Z
qhgDkwPJZmXH3kI1VF7fo/Kjixo8tjLQMLOiBUy3gnX/YT00deTBiWZoKVLZ8Btv
A+T4Jm1Qrm/AxYQbtBAfSdZ5YA72o6vi91nt/mGNfN3CHDmXwpqfyOOgvPyB8fPz
nqp1N5dqetmSEn1INEklRgEeh1Yf4HRSs8ehXqc84SEjXsaS//2rd0pU8Xm8Cz9W
E3IbvRul0tyTZBIQ8aYh1wsuCSsyctPHRsZ4nEtw8pxP8wqprah+u4N19mGXZ8yJ
5g8L0/9u5toYxpxbdU1xlDyBtR0ek5PE7uLgOyaP9zC5pYVeiDe+7FfO1/m2y670
cPkEJRCpg6oXj0LMZKHac1TPXWoOWcBG+/FsFqhSjaO34ta5vCFh9hUhSePLSVUi
0SnXvebDDDU+0Ec+SdgCTLl1RYR3et/969D9cQHxQ8AOGpxA5+M=
=BXxP
-----END PGP SIGNATURE-----

--GvuyDaC2GNSBQusT--
