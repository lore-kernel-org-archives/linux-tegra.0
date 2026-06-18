Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABA4368287;
	Thu, 18 Jun 2026 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788370; cv=none; b=pnif7n2MR+8TBYZmzi3ecUOPKk5fZ0AsNBMwi7B9RONuEsuQx1vX2zYgCr/W8mPdIgEgd/XDmWscN5l2cvH+/sI/lsCkZnoxPFiFcSUhfZJcnjFTgE323glzfuZkwBPoB6I8usCfKord4+T2mdDtZNw6QgwjdA7FRC0TDOngF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788370; c=relaxed/simple;
	bh=o+hWvHSHJKjbm+xQUPcCIEkB7/6jEEPh/7kR3Xc2ed4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c78a5nhV6qJFRjkmj8xHfmHOgDziJ2Tz5Ai94gOrBqAMiqc9SiRfc+vaEwyOe3E8CUQvKvumsQWDtra5mO5KecCO3i1jB1+83P8Dn0uYUla0ZD1hoLwqscHvunxXB3drAmXNtC6VYM5/fZX6bo2pUOJ9GYf58xAoDimxSBjzsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5440220071A;
	Thu, 18 Jun 2026 15:12:41 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1waCXx-003RXD-0m;
	Thu, 18 Jun 2026 15:12:41 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1waCXx-00000000B3O-0Xsr;
	Thu, 18 Jun 2026 15:12:41 +0200
Message-ID: <b84c8940187da3a493c8334bb50a992be7553092.camel@pengutronix.de>
Subject: Re: [PATCH v4 08/12] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil R <akhilrajeev@nvidia.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Guenter Roeck <linux@roeck-us.net>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding	
 <thierry.reding@kernel.org>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Jun 2026 15:12:40 +0200
In-Reply-To: <20260616095429.3947205-9-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
	 <20260616095429.3947205-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Di, 2026-06-16 at 09:54 +0000, Akhil R wrote:
> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
> resources exposed via the clk/reset frameworks. Unlike device tree,
> ACPI on Arm does not model such provider functions. The hardware is
> expected to be brought out of reset and have its clocks enabled by the
> firmware before the OS takes over. Any data to be shared with the OS is
> passed using the _DSD property.
>=20
> Add match data for such devices to skip acquiring clock and reset control=
s
> during probe and read the clock rate from the "clock-frequency" _DSD
> property. Note that the "clock-frequency" here is the controller's core
> clock and not the bus speed. I3C specifies the bus speed separately using
> "i3c-scl-hz" and "i2c-scl-hz" and hence this should not cause any conflic=
t.
>=20
> Also, move match data parsing before clock/reset acquisition so the quirk
> is available early enough.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 66 ++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 3e510fddf06c..a2a4b88c2017 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -242,6 +242,7 @@
>  /* List of quirks */
>  #define AMD_I3C_OD_PP_TIMING		BIT(1)
>  #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
> +#define DW_I3C_ACPI_SKIP_CLK_RST		BIT(3)
> =20
>  struct dw_i3c_cmd {
>  	u32 cmd_lo;
> @@ -556,13 +557,28 @@ static void dw_i3c_master_set_intr_regs(struct dw_i=
3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
> =20
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *m=
aster)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		return clk_get_rate(master->core_clk);
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate=
_prop)) {
> +		dev_err(master->dev, "missing clock-frequency property\n");
> +		return 0;
> +	}
> +
> +	return core_rate_prop;
> +}
> +
>  static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
>  {
>  	unsigned long core_rate, core_period;
>  	u32 scl_timing;
>  	u8 hcnt, lcnt;
> =20
> -	core_rate =3D clk_get_rate(master->core_clk);
> +	core_rate =3D dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
> =20
> @@ -615,7 +631,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *maste=
r)
>  	u16 hcnt, lcnt;
>  	u32 scl_timing;
> =20
> -	core_rate =3D clk_get_rate(master->core_clk);
> +	core_rate =3D dw_i3c_master_get_core_rate(master);
>  	if (!core_rate)
>  		return -EINVAL;
> =20
> @@ -1577,18 +1593,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> -
> -	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(master->pclk))
> -		return PTR_ERR(master->pclk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
> +	} else if (pdev->dev.of_node) {
> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> =20
> -	master->core_rst =3D devm_reset_control_get_optional_exclusive_deassert=
ed(&pdev->dev,
> -										"core_rst");
> -	if (IS_ERR(master->core_rst))
> -		return PTR_ERR(master->core_rst);
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk =3D NULL;
> +		master->pclk =3D NULL;
> +		master->core_rst =3D NULL;
> +	} else {
> +		master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +		if (IS_ERR(master->pclk))
> +			return PTR_ERR(master->pclk);
> +
> +		master->core_rst =3D devm_reset_control_get_optional_exclusive_deasser=
ted(&pdev->dev,
> +											"core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);

Why does this need to move around at all?

The reset control is already optional, so I would expect this to set
core_rst to NULL on missing reset, no quirk necessary.

Same question for pclk. Wouldn't it be enough to make core_clk optional
as well?

regards
Philipp
