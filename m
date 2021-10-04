Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56653C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:57:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36CDB6120A
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbhJDU6t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbhJDU6s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 16:58:48 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1064C061745;
        Mon,  4 Oct 2021 13:56:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k7so33004887wrd.13;
        Mon, 04 Oct 2021 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=My9Hxu4hG26Bmwy7AnJp5SnaenR2CFupZ5ckj6AHJNI=;
        b=V5JLPhAQfFwM8bZtFoot2uHa3mEFqbRWZsa2KzZFmZZEwd5WPkNAKV5FIhKf4aAl46
         bvU7ixd1AEJ1cwh2JV6Ai24vJSoc2FH73ePIAg8IpRUS5KdAE4/Y3TsMXqKrWi1T6bPx
         TMxILCiKZB6DQXhyNSDJl23VRzC63TWepeKqIInlW8bgT4qrnDGd+AWcVYem8XUw7Do3
         1jX73unPFWX3wbzr8ZSaO6V/MW2X/jVcLuBjbvoZJ/6y35c9nuDuu7REK9if09o1liXx
         4uOcbOjYRCVg9NdLBmpSWeX8P9OJBmZ22/UqSsPQJZQ6Iq9LFscoTZvLNx65J+jM/PAh
         Xycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=My9Hxu4hG26Bmwy7AnJp5SnaenR2CFupZ5ckj6AHJNI=;
        b=G1pDvjXsgOHiglXOydZEHp1wk7ajbxTIgpr0PIvabx58Y+DnbiQ32T47JCMrFi3KXW
         482XbSLlougjNKDWvgITm5QNNz6iDa/nSsmgHBxxtr0HKHhA/Et2tdSfNNslU860Fq2p
         aOeMkviBtrfcJ9iQFr/AJBrQUDccXaixga6V0WT0UeNM1Y9Jz0+hneuM/yuDPBqWy043
         s/bFV9SWP3sHJwusJPJyvd/5EgXG6fTOpK9U+kutzRGABRtL5lbsFiU7JTlXp5DpvQLn
         4v3Vui9Vqab/If1iGujOlhXK6VW4G8E82qIgqluYIHdaxkDCwS9r4/0So5EPLQAYhqIh
         +G8A==
X-Gm-Message-State: AOAM5321Hh3N2aGlfzky103C5fdmtJNivXIV6bEYYdScV7b94OP9MDHB
        y3322lMFI3uxGkZJlNIKuzc=
X-Google-Smtp-Source: ABdhPJxj94uxnxx91hjtPzJetRFBok9eq2cu7PplyrrqYIMNeNhezKBF96/CqWg6waF3yAe5MQhyDw==
X-Received: by 2002:adf:ab58:: with SMTP id r24mr10674700wrc.200.1633381016335;
        Mon, 04 Oct 2021 13:56:56 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u1sm15841085wrn.66.2021.10.04.13.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:56:55 -0700 (PDT)
Date:   Mon, 4 Oct 2021 22:56:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/3] ARM: tegra: Name clock and regulator nodes
 according to DT-schema
Message-ID: <YVtqlt4m63WuBHGM@orome.fritz.box>
References: <20210926233704.10164-1-digetx@gmail.com>
 <20210926233704.10164-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vwBNp3Uq3MQuLHT+"
Content-Disposition: inline
In-Reply-To: <20210926233704.10164-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vwBNp3Uq3MQuLHT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:37:03AM +0300, Dmitry Osipenko wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> Name clocks and regulators according to DT-schema to fix warnings such as:
>=20
> arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: clock@0: 'anyOf' =
conditional failed, one must be fixed:
>  	'reg' is a required property
>  	'ranges' is a required property
>  	From schema: /home/runner/.local/lib/python3.8/site-packages/dtschema/s=
chemas/root-node.yaml
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts        | 16 +++++------
>  arch/arm/boot/dts/tegra114-roth.dts           | 14 +++++-----
>  arch/arm/boot/dts/tegra114-tn7.dts            |  8 +++---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts     | 26 ++++++++---------
>  arch/arm/boot/dts/tegra124-nyan.dtsi          | 28 +++++++++----------
>  arch/arm/boot/dts/tegra124-venice2.dts        | 28 +++++++++----------
>  .../boot/dts/tegra20-acer-a500-picasso.dts    | 12 ++++----
>  arch/arm/boot/dts/tegra20-harmony.dts         | 16 +++++------
>  arch/arm/boot/dts/tegra20-medcom-wide.dts     |  8 +++---
>  arch/arm/boot/dts/tegra20-paz00.dts           |  6 ++--
>  arch/arm/boot/dts/tegra20-plutux.dts          |  8 +++---
>  arch/arm/boot/dts/tegra20-seaboard.dts        | 16 +++++------
>  arch/arm/boot/dts/tegra20-tamonten.dtsi       |  4 +--
>  arch/arm/boot/dts/tegra20-tec.dts             |  8 +++---
>  arch/arm/boot/dts/tegra20-trimslice.dts       | 12 ++++----
>  arch/arm/boot/dts/tegra20-ventana.dts         | 12 ++++----
>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 10 +++----
>  ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  4 +--
>  .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts          | 20 ++++++-------
>  arch/arm/boot/dts/tegra30-cardhu-a02.dts      | 12 ++++----
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts      | 14 +++++-----
>  arch/arm/boot/dts/tegra30-cardhu.dtsi         | 28 +++++++++----------
>  23 files changed, 156 insertions(+), 156 deletions(-)

I'm not sure about this one. Last time I talked to Rob about this, he
seemed to suggest that reintroducing the top-level clocks and regulators
nodes was preferable to doing these renamed.

Rob, which way do we want to decide this? If we do want to reintroduce
the clocks and regulators top-level "bus" nodes, we probably need the
tooling to learn to accept that, because I /think/ the reason why they
were originally dropped a while ago was because the tooling complained
about the "bus" nodes not being named "bus" (I think that was because
they traditionally have had "simple-bus" in their compatible and hence
the "simple-bus" schema was applied along with the schema for the node
name.

So I think we have a couple of options here:

  * Make it so that these nodes no longer need the "simple-bus"
    compatible string: this would need new code to parse these nodes
    and instantiate platform device for them like "simple-bus" would
    do.

  * Relax the rules for the "simple-bus" compatible string. It looks
    like this would be the simplest, because we could just extend the
    pattern in the "simple-bus" schema. There's a slight catch, though,
    because we'd also need to allow "#size-cells =3D <0>" for these. And
    maybe also make "ranges" not required because it doesn't make sense
    for #size-cells =3D <0>.

  * Create a new compatible string specifically for these. That would be
    similar to the first option, except that it's perhaps a bit more
    formal. We could basically create a separate schema for this type of
    bus, so that simple-bus could remain as-is.

Perhaps there's also yet another option that I haven't thought of that's
better than the above.

Quoting in full below for you to get a better picture of what kinds of
changes we're talking about here.

Thierry

>=20
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/t=
egra114-dalmore.dts
> index 7fd901f8d39a..d23050bfaba6 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -1151,7 +1151,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -1186,7 +1186,7 @@ volume_up {
>  		};
>  	};
> =20
> -	vdd_ac_bat_reg: regulator@0 {
> +	vdd_ac_bat_reg: regulator-acbat {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_ac_bat";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1194,7 +1194,7 @@ vdd_ac_bat_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	dvdd_ts_reg: regulator@1 {
> +	dvdd_ts_reg: regulator-ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "dvdd_ts";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -1203,7 +1203,7 @@ dvdd_ts_reg: regulator@1 {
>  		gpio =3D <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	usb1_vbus_reg: regulator@3 {
> +	usb1_vbus_reg: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1214,7 +1214,7 @@ usb1_vbus_reg: regulator@3 {
>  		vin-supply =3D <&tps65090_dcdc1_reg>;
>  	};
> =20
> -	usb3_vbus_reg: regulator@4 {
> +	usb3_vbus_reg: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb2_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1225,7 +1225,7 @@ usb3_vbus_reg: regulator@4 {
>  		vin-supply =3D <&tps65090_dcdc1_reg>;
>  	};
> =20
> -	vdd_hdmi_reg: regulator@5 {
> +	vdd_hdmi_reg: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_hdmi_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1233,7 +1233,7 @@ vdd_hdmi_reg: regulator@5 {
>  		vin-supply =3D <&tps65090_dcdc1_reg>;
>  	};
> =20
> -	vdd_cam_1v8_reg: regulator@6 {
> +	vdd_cam_1v8_reg: regulator-cam {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_cam_1v8_reg";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -1242,7 +1242,7 @@ vdd_cam_1v8_reg: regulator@6 {
>  		gpio =3D <&palmas_gpio 6 0>;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@7 {
> +	vdd_5v0_hdmi: regulator-hdmicon {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VDD_5V0_HDMI_CON";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra114-roth.dts b/arch/arm/boot/dts/tegr=
a114-roth.dts
> index 07960171fabe..18521707ff5b 100644
> --- a/arch/arm/boot/dts/tegra114-roth.dts
> +++ b/arch/arm/boot/dts/tegra114-roth.dts
> @@ -1016,7 +1016,7 @@ backlight: backlight {
>  		enable-gpios =3D <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -1045,7 +1045,7 @@ power {
>  		};
>  	};
> =20
> -	lcd_bl_en: regulator@0 {
> +	lcd_bl_en: regulator-lcden {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "lcd_bl_en";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1053,7 +1053,7 @@ lcd_bl_en: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_lcd: regulator@1 {
> +	vdd_lcd: regulator-lcd {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_lcd_1v8";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -1064,7 +1064,7 @@ vdd_lcd: regulator@1 {
>  		regulator-boot-on;
>  	};
> =20
> -	regulator@2 {
> +	regulator-1v8ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8_ts";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -1073,7 +1073,7 @@ regulator@2 {
>  		regulator-boot-on;
>  	};
> =20
> -	regulator@3 {
> +	regulator-3v3ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3_ts";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1083,7 +1083,7 @@ regulator@3 {
>  		regulator-boot-on;
>  	};
> =20
> -	regulator@4 {
> +	regulator-1v8com {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8_com";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -1094,7 +1094,7 @@ regulator@4 {
>  		regulator-boot-on;
>  	};
> =20
> -	regulator@5 {
> +	regulator-3v3com {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3_com";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra=
114-tn7.dts
> index 745d234b105b..0534247458f0 100644
> --- a/arch/arm/boot/dts/tegra114-tn7.dts
> +++ b/arch/arm/boot/dts/tegra114-tn7.dts
> @@ -273,7 +273,7 @@ backlight: backlight {
>  		power-supply =3D <&lcd_bl_en>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -303,7 +303,7 @@ volume_up {
>  	};
> =20
>  	/* FIXME: output of BQ24192 */
> -	vs_sys: regulator@0 {
> +	vs_sys: regulator-vs {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VS_SYS";
>  		regulator-min-microvolt =3D <4200000>;
> @@ -312,7 +312,7 @@ vs_sys: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	lcd_bl_en: regulator@1 {
> +	lcd_bl_en: regulator-lcden {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VDD_LCD_BL";
>  		regulator-min-microvolt =3D <16500000>;
> @@ -323,7 +323,7 @@ lcd_bl_en: regulator@1 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_lcd: regulator@2 {
> +	vdd_lcd: regulator-lcd {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VD_LCD_1V8";
>  		regulator-min-microvolt =3D <1800000>;
> diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dt=
s/tegra124-jetson-tk1.dts
> index 35ab296408e1..094f94a627b2 100644
> --- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> +++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
> @@ -1868,7 +1868,7 @@ usb-phy@7d008000 {
>  		vbus-supply =3D <&vdd_usb3_vbus>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -1892,7 +1892,7 @@ power {
>  		};
>  	};
> =20
> -	vdd_mux: regulator@0 {
> +	vdd_mux: regulator-mux {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_MUX";
>  		regulator-min-microvolt =3D <12000000>;
> @@ -1901,7 +1901,7 @@ vdd_mux: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_5v0_sys: regulator@1 {
> +	vdd_5v0_sys: regulator-5v0sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_SYS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1911,7 +1911,7 @@ vdd_5v0_sys: regulator@1 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_sys: regulator@2 {
> +	vdd_3v3_sys: regulator-3v3sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_SYS";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1921,7 +1921,7 @@ vdd_3v3_sys: regulator@2 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_run: regulator@3 {
> +	vdd_3v3_run: regulator-3v3run {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_RUN";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1933,7 +1933,7 @@ vdd_3v3_run: regulator@3 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_3v3_hdmi: regulator@4 {
> +	vdd_3v3_hdmi: regulator-3v3hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_AVDD_HDMI_AP_GATED";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1941,7 +1941,7 @@ vdd_3v3_hdmi: regulator@4 {
>  		vin-supply =3D <&vdd_3v3_run>;
>  	};
> =20
> -	vdd_usb1_vbus: regulator@5 {
> +	vdd_usb1_vbus: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+USB0_VBUS_SW";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1952,7 +1952,7 @@ vdd_usb1_vbus: regulator@5 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_usb3_vbus: regulator@6 {
> +	vdd_usb3_vbus: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_USB_HS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1963,7 +1963,7 @@ vdd_usb3_vbus: regulator@6 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_3v3_lp0: regulator@7 {
> +	vdd_3v3_lp0: regulator-lp0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_LP0";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1975,7 +1975,7 @@ vdd_3v3_lp0: regulator@7 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_hdmi_pll: regulator@8 {
> +	vdd_hdmi_pll: regulator-hdmipll {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+1.05V_RUN_AVDD_HDMI_PLL";
>  		regulator-min-microvolt =3D <1050000>;
> @@ -1984,7 +1984,7 @@ vdd_hdmi_pll: regulator@8 {
>  		vin-supply =3D <&vdd_1v05_run>;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@9 {
> +	vdd_5v0_hdmi: regulator-hdmicon {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_HDMI_CON";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1995,7 +1995,7 @@ vdd_5v0_hdmi: regulator@9 {
>  	};
> =20
>  	/* Molex power connector */
> -	vdd_5v0_sata: regulator@10 {
> +	vdd_5v0_sata: regulator-5v0sata {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_SATA";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -2005,7 +2005,7 @@ vdd_5v0_sata: regulator@10 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_12v0_sata: regulator@11 {
> +	vdd_12v0_sata: regulator-12v0sata {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+12V_SATA";
>  		regulator-min-microvolt =3D <12000000>;
> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/teg=
ra124-nyan.dtsi
> index 63a81270300a..2d045d1a9bcf 100644
> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
> @@ -582,7 +582,7 @@ backlight: backlight {
>  			 256>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -615,7 +615,7 @@ power {
>  		};
>  	};
> =20
> -	vdd_mux: regulator@0 {
> +	vdd_mux: regulator-mux {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_MUX";
>  		regulator-min-microvolt =3D <12000000>;
> @@ -624,7 +624,7 @@ vdd_mux: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_5v0_sys: regulator@1 {
> +	vdd_5v0_sys: regulator-5v0sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_SYS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -634,7 +634,7 @@ vdd_5v0_sys: regulator@1 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_sys: regulator@2 {
> +	vdd_3v3_sys: regulator-3v3sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_SYS";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -644,7 +644,7 @@ vdd_3v3_sys: regulator@2 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_run: regulator@3 {
> +	vdd_3v3_run: regulator-3v3run {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_RUN";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -656,7 +656,7 @@ vdd_3v3_run: regulator@3 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_3v3_hdmi: regulator@4 {
> +	vdd_3v3_hdmi: regulator-3v3hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_AVDD_HDMI_AP_GATED";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -664,7 +664,7 @@ vdd_3v3_hdmi: regulator@4 {
>  		vin-supply =3D <&vdd_3v3_run>;
>  	};
> =20
> -	vdd_led: regulator@5 {
> +	vdd_led: regulator-led {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_LED";
>  		gpio =3D <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
> @@ -672,7 +672,7 @@ vdd_led: regulator@5 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_5v0_ts: regulator@6 {
> +	vdd_5v0_ts: regulator-ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_VDD_TS_SW";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -683,7 +683,7 @@ vdd_5v0_ts: regulator@6 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_usb1_vbus: regulator@7 {
> +	vdd_usb1_vbus: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_USB_HS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -694,7 +694,7 @@ vdd_usb1_vbus: regulator@7 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_usb3_vbus: regulator@8 {
> +	vdd_usb3_vbus: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_USB_SS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -705,7 +705,7 @@ vdd_usb3_vbus: regulator@8 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_3v3_panel: regulator@9 {
> +	vdd_3v3_panel: regulator-panel {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_PANEL";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -715,7 +715,7 @@ vdd_3v3_panel: regulator@9 {
>  		vin-supply =3D <&vdd_3v3_run>;
>  	};
> =20
> -	vdd_3v3_lp0: regulator@10 {
> +	vdd_3v3_lp0: regulator-lp0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_LP0";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -730,7 +730,7 @@ vdd_3v3_lp0: regulator@10 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_hdmi_pll: regulator@11 {
> +	vdd_hdmi_pll: regulator-hdmipll {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+1.05V_RUN_AVDD_HDMI_PLL";
>  		regulator-min-microvolt =3D <1050000>;
> @@ -739,7 +739,7 @@ vdd_hdmi_pll: regulator@11 {
>  		vin-supply =3D <&vdd_1v05_run>;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@12 {
> +	vdd_5v0_hdmi: regulator-hdmicon {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_HDMI_CON";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/t=
egra124-venice2.dts
> index e6b54ac1ebd1..457b8aada1f8 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -1061,7 +1061,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -1086,7 +1086,7 @@ panel: panel {
>  		ddc-i2c-bus =3D <&dpaux>;
>  	};
> =20
> -	vdd_mux: regulator@0 {
> +	vdd_mux: regulator-mux {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_MUX";
>  		regulator-min-microvolt =3D <12000000>;
> @@ -1095,7 +1095,7 @@ vdd_mux: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_5v0_sys: regulator@1 {
> +	vdd_5v0_sys: regulator-5v0sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_SYS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1105,7 +1105,7 @@ vdd_5v0_sys: regulator@1 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_sys: regulator@2 {
> +	vdd_3v3_sys: regulator-3v3sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_SYS";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1115,7 +1115,7 @@ vdd_3v3_sys: regulator@2 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_3v3_run: regulator@3 {
> +	vdd_3v3_run: regulator-3v3run {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_RUN";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1127,7 +1127,7 @@ vdd_3v3_run: regulator@3 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_3v3_hdmi: regulator@4 {
> +	vdd_3v3_hdmi: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_AVDD_HDMI_AP_GATED";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1135,7 +1135,7 @@ vdd_3v3_hdmi: regulator@4 {
>  		vin-supply =3D <&vdd_3v3_run>;
>  	};
> =20
> -	vdd_led: regulator@5 {
> +	vdd_led: regulator-led {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_LED";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1145,7 +1145,7 @@ vdd_led: regulator@5 {
>  		vin-supply =3D <&vdd_mux>;
>  	};
> =20
> -	vdd_5v0_ts: regulator@6 {
> +	vdd_5v0_ts: regulator-ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_VDD_TS_SW";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1156,7 +1156,7 @@ vdd_5v0_ts: regulator@6 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_usb1_vbus: regulator@7 {
> +	vdd_usb1_vbus: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_USB_HS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1167,7 +1167,7 @@ vdd_usb1_vbus: regulator@7 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_usb3_vbus: regulator@8 {
> +	vdd_usb3_vbus: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_USB_SS";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1178,7 +1178,7 @@ vdd_usb3_vbus: regulator@8 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_3v3_panel: regulator@9 {
> +	vdd_3v3_panel: regulator-panel {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_PANEL";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1188,7 +1188,7 @@ vdd_3v3_panel: regulator@9 {
>  		vin-supply =3D <&vdd_3v3_run>;
>  	};
> =20
> -	vdd_3v3_lp0: regulator@10 {
> +	vdd_3v3_lp0: regulator-lp0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3.3V_LP0";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1203,7 +1203,7 @@ vdd_3v3_lp0: regulator@10 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vdd_hdmi_pll: regulator@11 {
> +	vdd_hdmi_pll: regulator-hdmipll {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+1.05V_RUN_AVDD_HDMI_PLL";
>  		regulator-min-microvolt =3D <1050000>;
> @@ -1212,7 +1212,7 @@ vdd_hdmi_pll: regulator@11 {
>  		vin-supply =3D <&vdd_1v05_run>;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@12 {
> +	vdd_5v0_hdmi: regulator-hdmicon {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5V_HDMI_CON";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/b=
oot/dts/tegra20-acer-a500-picasso.dts
> index 5ac288fa9c5e..0abfd6215016 100644
> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> @@ -824,7 +824,7 @@ bat1010: battery-2s1p {
>  	};
> =20
>  	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k-in {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <32768>;
> @@ -836,7 +836,7 @@ clk32k_in: clock@0 {
>  	 * oscillator is used as a reference clock-source by the
>  	 * Azurewave WiFi/BT module.
>  	 */
> -	rtc_32k_wifi: clock@1 {
> +	rtc_32k_wifi: clock-32k-wifi {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <32768>;
> @@ -961,7 +961,7 @@ lvds_encoder_output: endpoint {
>  		};
>  	};
> =20
> -	vdd_5v0_sys: regulator@0 {
> +	vdd_5v0_sys: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -969,7 +969,7 @@ vdd_5v0_sys: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_3v3_sys: regulator@1 {
> +	vdd_3v3_sys: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3_vs";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -978,7 +978,7 @@ vdd_3v3_sys: regulator@1 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_1v8_sys: regulator@2 {
> +	vdd_1v8_sys: regulator-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8_vs";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -987,7 +987,7 @@ vdd_1v8_sys: regulator@2 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_pnl: regulator@3 {
> +	vdd_pnl: regulator-panel {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_panel";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/te=
gra20-harmony.dts
> index ae4312eedcbd..a8494378c382 100644
> --- a/arch/arm/boot/dts/tegra20-harmony.dts
> +++ b/arch/arm/boot/dts/tegra20-harmony.dts
> @@ -640,7 +640,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -666,7 +666,7 @@ panel: panel {
>  		backlight =3D <&backlight>;
>  	};
> =20
> -	vdd_5v0_reg: regulator@0 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -674,7 +674,7 @@ vdd_5v0_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	regulator@1 {
> +	regulator-1v5 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v5";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -682,7 +682,7 @@ regulator@1 {
>  		gpio =3D <&pmic 0 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	regulator@2 {
> +	regulator-1v2 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v2";
>  		regulator-min-microvolt =3D <1200000>;
> @@ -691,7 +691,7 @@ regulator@2 {
>  		enable-active-high;
>  	};
> =20
> -	pci_vdd_reg: regulator@3 {
> +	pci_vdd_reg: regulator-1v05 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v05";
>  		regulator-min-microvolt =3D <1050000>;
> @@ -700,7 +700,7 @@ pci_vdd_reg: regulator@3 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_pnl_reg: regulator@4 {
> +	vdd_pnl_reg: regulator-pn1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_pnl";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -709,7 +709,7 @@ vdd_pnl_reg: regulator@4 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_bl_reg: regulator@5 {
> +	vdd_bl_reg: regulator-bl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -718,7 +718,7 @@ vdd_bl_reg: regulator@5 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@6 {
> +	vdd_5v0_hdmi: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VDDIO_HDMI";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra20-medcom-wide.dts b/arch/arm/boot/dt=
s/tegra20-medcom-wide.dts
> index b31c9bca16e6..cb6199d7d224 100644
> --- a/arch/arm/boot/dts/tegra20-medcom-wide.dts
> +++ b/arch/arm/boot/dts/tegra20-medcom-wide.dts
> @@ -92,7 +92,7 @@ sound {
>  		clock-names =3D "pll_a", "pll_a_out0", "mclk";
>  	};
> =20
> -	vcc_24v_reg: regulator@100 {
> +	vcc_24v_reg: regulator-24v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_24v";
>  		regulator-min-microvolt =3D <24000000>;
> @@ -100,7 +100,7 @@ vcc_24v_reg: regulator@100 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_5v0_reg: regulator@101 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -109,7 +109,7 @@ vdd_5v0_reg: regulator@101 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_3v3_reg: regulator@102 {
> +	vdd_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -118,7 +118,7 @@ vdd_3v3_reg: regulator@102 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_1v8_reg: regulator@103 {
> +	vdd_1v8_reg: regulator-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8";
>  		vin-supply =3D <&vdd_3v3_reg>;
> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegr=
a20-paz00.dts
> index acc816bfd233..61c830f57683 100644
> --- a/arch/arm/boot/dts/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/tegra20-paz00.dts
> @@ -577,7 +577,7 @@ backlight: backlight {
>  		backlight-boot-off;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -614,7 +614,7 @@ panel: panel {
>  		backlight =3D <&backlight>;
>  	};
> =20
> -	p5valw_reg: regulator@0 {
> +	p5valw_reg: regulator-5v0alw {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+5valw";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -622,7 +622,7 @@ p5valw_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_pnl_reg: regulator@1 {
> +	vdd_pnl_reg: regulator-3v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+3VS,vdd_pnl";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/teg=
ra20-plutux.dts
> index 5811b7006a9b..71a8236491df 100644
> --- a/arch/arm/boot/dts/tegra20-plutux.dts
> +++ b/arch/arm/boot/dts/tegra20-plutux.dts
> @@ -60,7 +60,7 @@ sound {
>  		clock-names =3D "pll_a", "pll_a_out0", "mclk";
>  	};
> =20
> -	vcc_24v_reg: regulator@100 {
> +	vcc_24v_reg: regulator-24v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_24v";
>  		regulator-min-microvolt =3D <24000000>;
> @@ -68,7 +68,7 @@ vcc_24v_reg: regulator@100 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_5v0_reg: regulator@101 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -77,7 +77,7 @@ vdd_5v0_reg: regulator@101 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_3v3_reg: regulator@102 {
> +	vdd_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -86,7 +86,7 @@ vdd_3v3_reg: regulator@102 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_1v8_reg: regulator@103 {
> +	vdd_1v8_reg: regulator-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8";
>  		vin-supply =3D <&vdd_3v3_reg>;
> diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/t=
egra20-seaboard.dts
> index 92d494b8c3d2..ca7adeb1fdd9 100644
> --- a/arch/arm/boot/dts/tegra20-seaboard.dts
> +++ b/arch/arm/boot/dts/tegra20-seaboard.dts
> @@ -792,7 +792,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -828,7 +828,7 @@ panel: panel {
>  		ddc-i2c-bus =3D <&lvds_ddc>;
>  	};
> =20
> -	vdd_5v0_reg: regulator@0 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -836,7 +836,7 @@ vdd_5v0_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	regulator@1 {
> +	regulator-1v5 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v5";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -844,7 +844,7 @@ regulator@1 {
>  		gpio =3D <&pmic 0 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	regulator@2 {
> +	regulator-1v2 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v2";
>  		regulator-min-microvolt =3D <1200000>;
> @@ -853,7 +853,7 @@ regulator@2 {
>  		enable-active-high;
>  	};
> =20
> -	vbus_reg: regulator@3 {
> +	vbus_reg: regulator-vbus {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_vbus_wup1";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -864,7 +864,7 @@ vbus_reg: regulator@3 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_pnl_reg: regulator@4 {
> +	vdd_pnl_reg: regulator-pnl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_pnl";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -873,7 +873,7 @@ vdd_pnl_reg: regulator@4 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_bl_reg: regulator@5 {
> +	vdd_bl_reg: regulator-bl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -882,7 +882,7 @@ vdd_bl_reg: regulator@5 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_hdmi: regulator@6 {
> +	vdd_hdmi: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VDDIO_HDMI";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/=
tegra20-tamonten.dtsi
> index dd4d506683de..2ad56f84bb62 100644
> --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> @@ -502,13 +502,13 @@ mmc@c8000600 {
>  		status =3D "okay";
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	pci_vdd_reg: regulator@1 {
> +	pci_vdd_reg: regulator-1v05 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v05";
>  		regulator-min-microvolt =3D <1050000>;
> diff --git a/arch/arm/boot/dts/tegra20-tec.dts b/arch/arm/boot/dts/tegra2=
0-tec.dts
> index 10ff09d86efa..4f41c74384b2 100644
> --- a/arch/arm/boot/dts/tegra20-tec.dts
> +++ b/arch/arm/boot/dts/tegra20-tec.dts
> @@ -69,7 +69,7 @@ sound {
>  		clock-names =3D "pll_a", "pll_a_out0", "mclk";
>  	};
> =20
> -	vcc_24v_reg: regulator@100 {
> +	vcc_24v_reg: regulator-24v {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_24v";
>  		regulator-min-microvolt =3D <24000000>;
> @@ -77,7 +77,7 @@ vcc_24v_reg: regulator@100 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_5v0_reg: regulator@101 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -86,7 +86,7 @@ vdd_5v0_reg: regulator@101 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_3v3_reg: regulator@102 {
> +	vdd_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3";
>  		vin-supply =3D <&vcc_24v_reg>;
> @@ -95,7 +95,7 @@ vdd_3v3_reg: regulator@102 {
>  		regulator-always-on;
>  	};
> =20
> -	vdd_1v8_reg: regulator@103 {
> +	vdd_1v8_reg: regulator-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8";
>  		vin-supply =3D <&vdd_3v3_reg>;
> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/=
tegra20-trimslice.dts
> index 4bc87bc0c2a4..1f4893699614 100644
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> @@ -379,7 +379,7 @@ mmc@c8000600 {
>  		bus-width =3D <4>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -401,7 +401,7 @@ poweroff {
>  		gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
>  	};
> =20
> -	hdmi_vdd_reg: regulator@0 {
> +	hdmi_vdd_reg: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "avdd_hdmi";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -409,7 +409,7 @@ hdmi_vdd_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	hdmi_pll_reg: regulator@1 {
> +	hdmi_pll_reg: regulator-hdmipll {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "avdd_hdmi_pll";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -417,7 +417,7 @@ hdmi_pll_reg: regulator@1 {
>  		regulator-always-on;
>  	};
> =20
> -	vbus_reg: regulator@2 {
> +	vbus_reg: regulator-vbus {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -428,7 +428,7 @@ vbus_reg: regulator@2 {
>  		regulator-boot-on;
>  	};
> =20
> -	pci_clk_reg: regulator@3 {
> +	pci_clk_reg: regulator-pciclk {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "pci_clk";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -436,7 +436,7 @@ pci_clk_reg: regulator@3 {
>  		regulator-always-on;
>  	};
> =20
> -	pci_vdd_reg: regulator@4 {
> +	pci_vdd_reg: regulator-pcivdd {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "pci_vdd";
>  		regulator-min-microvolt =3D <1050000>;
> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/te=
gra20-ventana.dts
> index 5a2578b3707f..4284054ebd2c 100644
> --- a/arch/arm/boot/dts/tegra20-ventana.dts
> +++ b/arch/arm/boot/dts/tegra20-ventana.dts
> @@ -606,7 +606,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -647,7 +647,7 @@ panel: panel {
>  		ddc-i2c-bus =3D <&lvds_ddc>;
>  	};
> =20
> -	vdd_5v0_reg: regulator@0 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -655,7 +655,7 @@ vdd_5v0_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	regulator@1 {
> +	regulator-1v5 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v5";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -663,7 +663,7 @@ regulator@1 {
>  		gpio =3D <&pmic 0 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	regulator@2 {
> +	regulator-1v2 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v2";
>  		regulator-min-microvolt =3D <1200000>;
> @@ -672,7 +672,7 @@ regulator@2 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_pnl_reg: regulator@3 {
> +	vdd_pnl_reg: regulator-pnl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_pnl";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -681,7 +681,7 @@ vdd_pnl_reg: regulator@3 {
>  		enable-active-high;
>  	};
> =20
> -	vdd_bl_reg: regulator@4 {
> +	vdd_bl_reg: regulator-bl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl";
>  		regulator-min-microvolt =3D <2800000>;
> diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/=
arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
> index 9732cd6f20b7..6433fde6db02 100644
> --- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
> +++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
> @@ -1045,7 +1045,7 @@ battery_cell: battery-cell {
>  	};
> =20
>  	/* PMIC has a built-in 32KHz oscillator which is used by PMC */
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <32768>;
> @@ -1183,7 +1183,7 @@ lvds_encoder_output: endpoint {
>  		};
>  	};
> =20
> -	vdd_5v0_sys: regulator@0 {
> +	vdd_5v0_sys: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1192,7 +1192,7 @@ vdd_5v0_sys: regulator@0 {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_3v3_sys: regulator@1 {
> +	vdd_3v3_sys: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1202,7 +1202,7 @@ vdd_3v3_sys: regulator@1 {
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> -	vdd_pnl: regulator@2 {
> +	vdd_pnl: regulator-panel {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_panel";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -1213,7 +1213,7 @@ vdd_pnl: regulator@2 {
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> =20
> -	vcc_3v3_ts: regulator@3 {
> +	vcc_3v3_ts: regulator-ts {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "ldo_s-1167_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dts=
i b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
> index 53966fa4eef2..cd28e8782f7d 100644
> --- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
> +++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
> @@ -166,12 +166,12 @@ ldo8 {
>  		};
>  	};
> =20
> -	vdd_3v3_sys: regulator@1 {
> +	vdd_3v3_sys: regulator-3v3 {
>  		gpio =3D <&pmic 3 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> =20
> -	regulator@4 {
> +	regulator-usb {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "avdd_usb";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b=
/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
> index 9365ae607239..ee4a3f482769 100644
> --- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
> +++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
> @@ -143,7 +143,7 @@ vdd_core: core-regulator@60 {
>  		};
>  	};
> =20
> -	vdd_3v3_sys: regulator@1 {
> +	vdd_3v3_sys: regulator-3v3 {
>  		gpio =3D <&pmic 6 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/teg=
ra30-beaver.dts
> index e159feeedef7..2ec5e47d9623 100644
> --- a/arch/arm/boot/dts/tegra30-beaver.dts
> +++ b/arch/arm/boot/dts/tegra30-beaver.dts
> @@ -1966,7 +1966,7 @@ usb-phy@7d008000 {
>  		status =3D "okay";
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -1985,7 +1985,7 @@ gpled2 {
>  		};
>  	};
> =20
> -	vdd_5v_in_reg: regulator@0 {
> +	vdd_5v_in_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v_in";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -1993,7 +1993,7 @@ vdd_5v_in_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	chargepump_5v_reg: regulator@1 {
> +	chargepump_5v_reg: regulator-chargepump {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "chargepump_5v";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -2004,7 +2004,7 @@ chargepump_5v_reg: regulator@1 {
>  		gpio =3D <&pmic 0 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	ddr_reg: regulator@2 {
> +	ddr_reg: regulator-ddr {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_ddr";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -2016,7 +2016,7 @@ ddr_reg: regulator@2 {
>  		vin-supply =3D <&vdd_5v_in_reg>;
>  	};
> =20
> -	vdd_5v_sata_reg: regulator@3 {
> +	vdd_5v_sata_reg: regulator-sata {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_5v_sata";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -2028,7 +2028,7 @@ vdd_5v_sata_reg: regulator@3 {
>  		vin-supply =3D <&vdd_5v_in_reg>;
>  	};
> =20
> -	usb1_vbus_reg: regulator@4 {
> +	usb1_vbus_reg: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -2039,7 +2039,7 @@ usb1_vbus_reg: regulator@4 {
>  		vin-supply =3D <&vdd_5v_in_reg>;
>  	};
> =20
> -	usb3_vbus_reg: regulator@5 {
> +	usb3_vbus_reg: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb3_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -2050,7 +2050,7 @@ usb3_vbus_reg: regulator@5 {
>  		vin-supply =3D <&vdd_5v_in_reg>;
>  	};
> =20
> -	sys_3v3_reg: regulator@6 {
> +	sys_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "sys_3v3,vdd_3v3_alw";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -2062,7 +2062,7 @@ sys_3v3_reg: regulator@6 {
>  		vin-supply =3D <&vdd_5v_in_reg>;
>  	};
> =20
> -	sys_3v3_pexs_reg: regulator@7 {
> +	sys_3v3_pexs_reg: regulator-pexs {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "sys_3v3_pexs";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -2074,7 +2074,7 @@ sys_3v3_pexs_reg: regulator@7 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_5v0_hdmi: regulator@8 {
> +	vdd_5v0_hdmi: regulator-hdmi {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "+VDD_5V_HDMI";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts=
/tegra30-cardhu-a02.dts
> index 4899e05a0d9c..247185314f46 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> @@ -16,7 +16,7 @@ mmc@78000400 {
>  		keep-power-in-suspend;
>  	};
> =20
> -	ddr_reg: regulator@100 {
> +	ddr_reg: regulator-ddr {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_ddr";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -27,7 +27,7 @@ ddr_reg: regulator@100 {
>  		gpio =3D <&pmic 6 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	sys_3v3_reg: regulator@101 {
> +	sys_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "sys_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -38,7 +38,7 @@ sys_3v3_reg: regulator@101 {
>  		gpio =3D <&pmic 7 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	usb1_vbus_reg: regulator@102 {
> +	usb1_vbus_reg: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -49,7 +49,7 @@ usb1_vbus_reg: regulator@102 {
>  		vin-supply =3D <&vdd_5v0_reg>;
>  	};
> =20
> -	usb3_vbus_reg: regulator@103 {
> +	usb3_vbus_reg: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb3_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -60,7 +60,7 @@ usb3_vbus_reg: regulator@103 {
>  		vin-supply =3D <&vdd_5v0_reg>;
>  	};
> =20
> -	vdd_5v0_reg: regulator@104 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -69,7 +69,7 @@ vdd_5v0_reg: regulator@104 {
>  		gpio =3D <&pmic 2 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	vdd_bl_reg: regulator@105 {
> +	vdd_bl_reg: regulator-bl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts=
/tegra30-cardhu-a04.dts
> index a11028b8b67b..2911f08863a0 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> @@ -16,7 +16,7 @@ mmc@78000400 {
>  		keep-power-in-suspend;
>  	};
> =20
> -	ddr_reg: regulator@100 {
> +	ddr_reg: regulator-ddr {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "ddr";
>  		regulator-min-microvolt =3D <1500000>;
> @@ -27,7 +27,7 @@ ddr_reg: regulator@100 {
>  		gpio =3D <&pmic 7 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	sys_3v3_reg: regulator@101 {
> +	sys_3v3_reg: regulator-3v3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "sys_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -38,7 +38,7 @@ sys_3v3_reg: regulator@101 {
>  		gpio =3D <&pmic 6 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	usb1_vbus_reg: regulator@102 {
> +	usb1_vbus_reg: regulator-usb1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb1_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -49,7 +49,7 @@ usb1_vbus_reg: regulator@102 {
>  		vin-supply =3D <&vdd_5v0_reg>;
>  	};
> =20
> -	usb3_vbus_reg: regulator@103 {
> +	usb3_vbus_reg: regulator-usb3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "usb3_vbus";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -60,7 +60,7 @@ usb3_vbus_reg: regulator@103 {
>  		vin-supply =3D <&vdd_5v0_reg>;
>  	};
> =20
> -	vdd_5v0_reg: regulator@104 {
> +	vdd_5v0_reg: regulator-5v0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "5v0";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -69,7 +69,7 @@ vdd_5v0_reg: regulator@104 {
>  		gpio =3D <&pmic 8 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	vdd_bl_reg: regulator@105 {
> +	vdd_bl_reg: regulator-bl {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -80,7 +80,7 @@ vdd_bl_reg: regulator@105 {
>  		gpio =3D <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	vdd_bl2_reg: regulator@106 {
> +	vdd_bl2_reg: regulator-bl2 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_bl2";
>  		regulator-min-microvolt =3D <5000000>;
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/te=
gra30-cardhu.dtsi
> index 448f1397e64a..d2f6121049a4 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -433,7 +433,7 @@ backlight: backlight {
>  		default-brightness-level =3D <6>;
>  	};
> =20
> -	clk32k_in: clock@0 {
> +	clk32k_in: clock-32k {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <32768>;
>  		#clock-cells =3D <0>;
> @@ -475,7 +475,7 @@ panel: panel {
>  		backlight =3D <&backlight>;
>  	};
> =20
> -	vdd_ac_bat_reg: regulator@0 {
> +	vdd_ac_bat_reg: regulator-acbat {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_ac_bat";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -483,7 +483,7 @@ vdd_ac_bat_reg: regulator@0 {
>  		regulator-always-on;
>  	};
> =20
> -	cam_1v8_reg: regulator@1 {
> +	cam_1v8_reg: regulator-cam {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "cam_1v8";
>  		regulator-min-microvolt =3D <1800000>;
> @@ -493,7 +493,7 @@ cam_1v8_reg: regulator@1 {
>  		vin-supply =3D <&vio_reg>;
>  	};
> =20
> -	cp_5v_reg: regulator@2 {
> +	cp_5v_reg: regulator-5v0cp {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "cp_5v";
>  		regulator-min-microvolt =3D <5000000>;
> @@ -504,7 +504,7 @@ cp_5v_reg: regulator@2 {
>  		gpio =3D <&pmic 0 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	emmc_3v3_reg: regulator@3 {
> +	emmc_3v3_reg: regulator-emmc {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "emmc_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -516,7 +516,7 @@ emmc_3v3_reg: regulator@3 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	modem_3v3_reg: regulator@4 {
> +	modem_3v3_reg: regulator-modem {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "modem_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -525,7 +525,7 @@ modem_3v3_reg: regulator@4 {
>  		gpio =3D <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	pex_hvdd_3v3_reg: regulator@5 {
> +	pex_hvdd_3v3_reg: regulator-pex {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "pex_hvdd_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -535,7 +535,7 @@ pex_hvdd_3v3_reg: regulator@5 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_cam1_ldo_reg: regulator@6 {
> +	vdd_cam1_ldo_reg: regulator-cam1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_cam1_ldo";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -545,7 +545,7 @@ vdd_cam1_ldo_reg: regulator@6 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_cam2_ldo_reg: regulator@7 {
> +	vdd_cam2_ldo_reg: regulator-cam2 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_cam2_ldo";
>  		regulator-min-microvolt =3D <2800000>;
> @@ -555,7 +555,7 @@ vdd_cam2_ldo_reg: regulator@7 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_cam3_ldo_reg: regulator@8 {
> +	vdd_cam3_ldo_reg: regulator-cam3 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_cam3_ldo";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -565,7 +565,7 @@ vdd_cam3_ldo_reg: regulator@8 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_com_reg: regulator@9 {
> +	vdd_com_reg: regulator-com {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_com";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -577,7 +577,7 @@ vdd_com_reg: regulator@9 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_fuse_3v3_reg: regulator@10 {
> +	vdd_fuse_3v3_reg: regulator-fuse {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_fuse_3v3";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -587,7 +587,7 @@ vdd_fuse_3v3_reg: regulator@10 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_pnl1_reg: regulator@11 {
> +	vdd_pnl1_reg: regulator-pnl1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_pnl1";
>  		regulator-min-microvolt =3D <3300000>;
> @@ -599,7 +599,7 @@ vdd_pnl1_reg: regulator@11 {
>  		vin-supply =3D <&sys_3v3_reg>;
>  	};
> =20
> -	vdd_vid_reg: regulator@12 {
> +	vdd_vid_reg: regulator-vid {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vddio_vid";
>  		regulator-min-microvolt =3D <5000000>;
> --=20
> 2.32.0
>=20

--vwBNp3Uq3MQuLHT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbapMACgkQ3SOs138+
s6EwmQ/5AWrR11YJ3T/b6jY4TUXMlatDWzF0KT6eETSVUDgn25cd/6QfT5jC/Ti3
b44qIzRzb//oZ9GuBWmwwwyz4JJRQdKCkYbZ0h6AtPP0JAOeJvz/a+NHpnVDGhx8
0/vka+YIwAWOQmM9Z+iREu7ESObEYnatWK6UTn8dKacNiQ+S7aduKWqaVgoBdJCb
2C8qxb2qdWTUIojYNszVyWShS9lwf2YxwZJ1qBKozNlcwdyH9szTXmyiLyUORnFE
vceV0jjpVQ5erWDZm2XhfAuvgEhrKZvvcWydg2510dy2963fujvycRDxxr927Zz7
UCUNY46d1B0UY+9dZEHbAeQT2+mC0aQyMEkl3uoC1hk/JOtUUP9u1bkSP8GVJmln
xKWFK4txzvpXMVtzpFCSW2Y2ph+n3KorDwL+XGZSEhbTc+Kv4a/X71gbHR9qTJRT
K+RpbWkOY/H5vTkM46CMmOZSikBYee9WlbAE1QZ8CPS7JHpRwMLumjmbwN6V/L1z
Gk5pj5WHu0iaZJuvAeh6TFI9k3M+RLw7S5st2Db0p6PcYxGmWpZ4iiW9cnWeg8lI
KWSHn6KVCXVJiLaxOKet64VmEJQGsjLx/chVKrfE6tCdLJS+Sgj0MY4DNyjZ92sP
w3quWAv711Rc+7GCPr8C17JrluDPNs6kDRB3Z4SIc/xuaPEzjro=
=kUuJ
-----END PGP SIGNATURE-----

--vwBNp3Uq3MQuLHT+--
