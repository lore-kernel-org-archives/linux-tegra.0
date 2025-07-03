Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D05E2E498F;
	Thu,  3 Jul 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538408; cv=none; b=bKgL2DBB1UhZpEvtJ3GVvnJnDFm0YcfaJe7hKwUErVIVSlYl7fu1sSktmgJ9w9Dh9PySup+PGWyKmQEaY4TeUXmAAxT1Q+8tWM2WqxYcDKyHb2VuQs1xtuWqO547IMwVIJnbCvThPKLouwBLFWINy7PcIcepDQ6k0xvSctgB+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538408; c=relaxed/simple;
	bh=dbilV22VO3muDCanYbKJvEOTnVO+6+dJBtvhpcD3hOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXon81TTanQ8Am9Vy3n/OYT9JMwNjaqj7IDSqrCxX23VyODgj22m+eStLDJAfA7ovEg3XR4dYe0ZD/0JOornHDVmuePBW1CVZiwxI5klJcObLA8Ejl4pNZ5vccdZGHOryqPHGbVoflm+3cjnUGdyv0X94wgCrCLKg8GQToDOjzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcCowKGf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcCowKGf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so53099895e9.1;
        Thu, 03 Jul 2025 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538402; x=1752143202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXWowOmGIffPRxlOWADDgGpb22fWorXamFRtd495nzE=;
        b=hcCowKGfnetq7n6mbgM6WHJOs9GhuEPYJqm3y+c3mdGk6hup6E+8uv8SLN3zO+VBwI
         gJb0/UkqFqCSlUp+78Ee8OXJ9/AoT3p9VNf2VOBlLyqmN6Qi31aHsk/rT8nZ7IlCK5H5
         5fCXX9DsuzrhAlVyBRwUaYaU2fYbRlgnaqVYjNxpFe/zylCJ91XNeoy9Nb5oSWYKLoD0
         psXHvBR3UpMmHiX6Q/55lhOYjVlv0OtEbT2ngO6/ZJvmBQqQK+2xE1sMwa/UwRSg/ADm
         R81/4TxoF8MuUMtiNa9M38j6CfsQ1Q4VEnRjHhyVV/TCbBJ1vAmrG+5VhS8fVzajxWXi
         FQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538402; x=1752143202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXWowOmGIffPRxlOWADDgGpb22fWorXamFRtd495nzE=;
        b=KITbZ1m/6IQeduAoT02NSi0qTcgfcbTL3wyW7WQOMOZldvRGvWB7iCelvRpCNEGwY1
         B5rNxl/Th5XJbuhFG2bUrGI6gaJqWm51Sjx1PlD95Mwy0NOFYDbaGlU/OM1zRvS1O005
         GY7mbBmJxvY5+2nTCTzQmxTd/DI97AW1iHScmustiDWBFKZQrdQt/GtGs5tCAnjED3jW
         TApSQPAf+OPwP1YUSO/QRk/iVJvNdMJITSp8lSvQBufPTP7sLW7nbo7N6gYrJmPjVA/n
         qKgXiu94e6OGmzR0yNE5MeLsJQmvoAoIBWcK5/H8JH1U3ixDhEeF0dLtj/TKv6uMeiOJ
         AWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUpODsyqa0n0YCv3mqG/L/JJMpEOv568E5MzR/jg8/VQvoIjg+lvQy1DpUTzr+5LPmso0jhqYF3sPOK@vger.kernel.org, AJvYcCV0hg6zK0Eiq+P1H1V42bYpbj6gupmIk5dn8KZv0S8XXABr5LEFGHJWuJLXDOiQFAEqj+4jRxlmTNpO@vger.kernel.org, AJvYcCXFWik9faBxjc0Mv+56i5NT6yBZ9FtqRsWAnJNSq42FihJ3epOMNyepBGLSP2b4Fm7l1/CX4yrhyppOFVw=@vger.kernel.org, AJvYcCXSLUxF3f4r0XwnXswWv8afX7mgUYsEUaOhtyd8dhcRAz0WIZLuruxIgSPvgmTPwD6kQPHIkPe7liy4QtN8@vger.kernel.org
X-Gm-Message-State: AOJu0YwVsiTegJ9X0OsP7GIguDDh++9NY6I6oULW6m0DYgcdcy9DAwud
	v8h70csLJdIx4T/eGGywncIYMkx2+l/RkqgTmPcu6K6gyETeiv6pAhU401EuCw==
X-Gm-Gg: ASbGncva2FGXBE2frlMrhV9TtQFf9omdRIckIgPRp+gknB0yRcVaxB2BwQtojeE9rNb
	bbeXlfYRdoqXIqyzRdkLV64GdWn0IMQg5+spvLFIkdoAstNXm/bwVV+dkyfbzmPVZ+/JgYkn0De
	Fk3CiAusxGCxKHETANQ5EBwPFZYLWVca2UBgP2AE15LoJHGzXdCVD2SOzQzE8+Yy9ic9me5TpEA
	wAMf+36vmOTS03mkxygSYSYoo4ktCBmyv2ldhs7BIi8W2GSNJ88FtNft5/ay/AAocYT+M9ydQSu
	smbHgLotJlmfsrwVs6Zq/dvYI82iC4PUAbR1Bdm/ITNGOsSlwrw0GKMvRC+j33Hq0BKQeA+wlym
	BP149P94ydrD1m2Cy+dmKdhBle75bbGvZqS2FEEm+XoJfvWn2Ylca15wMTS0=
X-Google-Smtp-Source: AGHT+IE9NZ2kqm5+/q6eR4siHuvm2lG5FAQ6w9JKxUm/eJ0KPWyzwgq9Kp8BLuTCzWpyoZ146BVymQ==
X-Received: by 2002:a05:600c:19d4:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-454ab3778a3mr23192875e9.8.1751538402020;
        Thu, 03 Jul 2025 03:26:42 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm22779675e9.12.2025.07.03.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:26:40 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:26:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joseph Lo <josephl@nvidia.com>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Convert nvidia,tegra124-dfll to DT
 schema
Message-ID: <hphr525b57li2fe4xstxbpwihldv6fr5kslktpphlvku22buv7@w3n5ynczr27v>
References: <20250630232632.3700405-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="howhl4r74vwsl3vi"
Content-Disposition: inline
In-Reply-To: <20250630232632.3700405-1-robh@kernel.org>


--howhl4r74vwsl3vi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: clock: Convert nvidia,tegra124-dfll to DT
 schema
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 06:26:30PM -0500, Rob Herring (Arm) wrote:
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 -------------
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 219 ++++++++++++++++++
>  2 files changed, 219 insertions(+), 155 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra1=
24-dfll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra1=
24-dfll.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll=
=2Etxt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> deleted file mode 100644
> index f7d347385b57..000000000000
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ /dev/null
> @@ -1,155 +0,0 @@
> -NVIDIA Tegra124 DFLL FCPU clocksource
> -
> -This binding uses the common clock binding:
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -The DFLL IP block on Tegra is a root clocksource designed for clocking
> -the fast CPU cluster. It consists of a free-running voltage controlled
> -oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
> -control module that will automatically adjust the VDD_CPU voltage by
> -communicating with an off-chip PMIC either via an I2C bus or via PWM sig=
nals.
> -
> -Required properties:
> -- compatible : should be one of:
> -  - "nvidia,tegra124-dfll": for Tegra124
> -  - "nvidia,tegra210-dfll": for Tegra210
> -- reg : Defines the following set of registers, in the order listed:
> -        - registers for the DFLL control logic.
> -        - registers for the I2C output logic.
> -        - registers for the integrated I2C master controller.
> -        - look-up table RAM for voltage register values.
> -- interrupts: Should contain the DFLL block interrupt.
> -- clocks: Must contain an entry for each entry in clock-names.
> -  See clock-bindings.txt for details.
> -- clock-names: Must include the following entries:
> -  - soc: Clock source for the DFLL control logic.
> -  - ref: The closed loop reference clock
> -  - i2c: Clock source for the integrated I2C master.
> -- resets: Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names: Must include the following entries:
> -  - dvco: Reset control for the DFLL DVCO.
> -- #clock-cells: Must be 0.
> -- clock-output-names: Name of the clock output.
> -- vdd-cpu-supply: Regulator for the CPU voltage rail that the DFLL
> -  hardware will start controlling. The regulator will be queried for
> -  the I2C register, control values and supported voltages.
> -
> -Required properties for the control loop parameters:
> -- nvidia,sample-rate: Sample rate of the DFLL control loop.
> -- nvidia,droop-ctrl: See the register CL_DVFS_DROOP_CTRL in the TRM.
> -- nvidia,force-mode: See the field DFLL_PARAMS_FORCE_MODE in the TRM.
> -- nvidia,cf: Numeric value, see the field DFLL_PARAMS_CF_PARAM in the TR=
M.
> -- nvidia,ci: Numeric value, see the field DFLL_PARAMS_CI_PARAM in the TR=
M.
> -- nvidia,cg: Numeric value, see the field DFLL_PARAMS_CG_PARAM in the TR=
M.
> -
> -Optional properties for the control loop parameters:
> -- nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in =
the TRM.
> -
> -Optional properties for mode selection:
> -- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> -
> -Required properties for I2C mode:
> -- nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
> -
> -Required properties for PWM mode:
> -- nvidia,pwm-period-nanoseconds: period of PWM square wave in nanosecond=
s.
> -- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when =
PWM
> -  control is disabled and the PWM output is tristated. Note that this vo=
ltage is
> -  configured in hardware, typically via a resistor divider.
> -- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM c=
ontrol
> -  is enabled and PWM output is low. Hence, this is the minimum output vo=
ltage
> -  that the regulator supports when PWM control is enabled.
> -- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
> -  corresponding to a 1/33th increase in duty cycle. Eg the voltage for 2=
/33th
> -  duty cycle would be: nvidia,pwm-min-microvolts +
> -  nvidia,pwm-voltage-step-microvolts * 2.
> -- pinctrl-0: I/O pad configuration when PWM control is enabled.
> -- pinctrl-1: I/O pad configuration when PWM control is disabled.
> -- pinctrl-names: must include the following entries:
> -  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
> -  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
> -
> -Example for I2C:
> -
> -clock@70110000 {
> -        compatible =3D "nvidia,tegra124-dfll";
> -        reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
> -              <0 0x70110000 0 0x100>, /* I2C output control */
> -              <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> -              <0 0x70110200 0 0x100>; /* Look-up table RAM */
> -        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> -        clocks =3D <&tegra_car TEGRA124_CLK_DFLL_SOC>,
> -                 <&tegra_car TEGRA124_CLK_DFLL_REF>,
> -                 <&tegra_car TEGRA124_CLK_I2C5>;
> -        clock-names =3D "soc", "ref", "i2c";
> -        resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
> -        reset-names =3D "dvco";
> -        #clock-cells =3D <0>;
> -        clock-output-names =3D "dfllCPU_out";
> -        vdd-cpu-supply =3D <&vdd_cpu>;
> -
> -        nvidia,sample-rate =3D <12500>;
> -        nvidia,droop-ctrl =3D <0x00000f00>;
> -        nvidia,force-mode =3D <1>;
> -        nvidia,cf =3D <10>;
> -        nvidia,ci =3D <0>;
> -        nvidia,cg =3D <2>;
> -
> -        nvidia,i2c-fs-rate =3D <400000>;
> -};
> -
> -Example for PWM:
> -
> -clock@70110000 {
> -	compatible =3D "nvidia,tegra124-dfll";
> -	reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
> -	      <0 0x70110000 0 0x100>, /* I2C output control */
> -	      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> -	      <0 0x70110200 0 0x100>; /* Look-up table RAM */
> -	interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks =3D <&tegra_car TEGRA210_CLK_DFLL_SOC>,
> -	         <&tegra_car TEGRA210_CLK_DFLL_REF>,
> -		 <&tegra_car TEGRA124_CLK_I2C5>;;
> -	clock-names =3D "soc", "ref", "i2c";
> -	resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
> -	reset-names =3D "dvco";
> -	#clock-cells =3D <0>;
> -	clock-output-names =3D "dfllCPU_out";
> -
> -	nvidia,sample-rate =3D <25000>;
> -	nvidia,droop-ctrl =3D <0x00000f00>;
> -	nvidia,force-mode =3D <1>;
> -	nvidia,cf =3D <6>;
> -	nvidia,ci =3D <0>;
> -	nvidia,cg =3D <2>;
> -
> -	nvidia,pwm-min-microvolts =3D <708000>; /* 708mV */
> -	nvidia,pwm-period-nanoseconds =3D <2500>; /* 2.5us */
> -	nvidia,pwm-to-pmic;
> -	nvidia,pwm-tristate-microvolts =3D <1000000>;
> -	nvidia,pwm-voltage-step-microvolts =3D <19200>; /* 19.2mV */
> -
> -	pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";
> -	pinctrl-0 =3D <&dvfs_pwm_active_state>;
> -	pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
> -};
> -
> -/* pinmux nodes added for completeness. Binding doc can be found in:
> - * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
> - */
> -
> -pinmux: pinmux@700008d4 {
> -	dvfs_pwm_active_state: dvfs_pwm_active {
> -		dvfs_pwm_pbb1 {
> -			nvidia,pins =3D "dvfs_pwm_pbb1";
> -			nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> -		};
> -	};
> -	dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> -		dvfs_pwm_pbb1 {
> -			nvidia,pins =3D "dvfs_pwm_pbb1";
> -			nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll=
=2Eyaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> new file mode 100644
> index 000000000000..67d99fd89ea9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> @@ -0,0 +1,219 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra124 DFLL FCPU clocksource
> +
> +maintainers:
> +  - Joseph Lo <josephl@nvidia.com>
> +  - Thierry Reding <treding@nvidia.com>
> +  - Tuomas Tynkkynen <ttynkkynen@nvidia.com>

Tuomas isn't at NVIDIA anymore, as far as I can tell.

> +
> +description:
> +  The DFLL IP block on Tegra is a root clocksource designed for clocking=
 the
> +  fast CPU cluster. It consists of a free-running voltage controlled osc=
illator
> +  connected to the CPU voltage rail (VDD_CPU), and a closed loop control=
 module
> +  that will automatically adjust the VDD_CPU voltage by communicating wi=
th an
> +  off-chip PMIC either via an I2C bus or via PWM signals.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra124-dfll
> +      - nvidia,tegra210-dfll
> +
> +  reg:
> +    items:
> +      - description: DFLL control logic registers
> +      - description: I2C output logic registers
> +      - description: Integrated I2C master controller registers
> +      - description: Look-up table RAM for voltage register values
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Clock source for the DFLL control logic
> +      - description: Closed loop reference clock
> +      - description: Clock source for the integrated I2C master
> +
> +  clock-names:
> +    items:
> +      - const: soc
> +      - const: ref
> +      - const: i2c
> +
> +  clock-output-names:
> +    description: Name of the DFLL CPU clock output
> +    items:
> +      - const: dfllCPU_out
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: dvco
> +      - const: dfll
> +
> +  vdd-cpu-supply: true
> +
> +  nvidia,sample-rate:
> +    description: Sample rate of the DFLL control loop
> +    $ref: /schemas/types.yaml#/definitions/uint32

I have a local patch for this and have a few additional restrictions for
some of these properties that I think would make sense to include.

For sample-rate, I have minimum: 12500 and maximum: 25000.

> +
> +  nvidia,droop-ctrl:
> +    description: Droop control parameter (CL_DVFS_DROOP_CTRL) in TRM
> +    $ref: /schemas/types.yaml#/definitions/uint32

For this I have "enum: [ 0x00000f00 ]".

> +
> +  nvidia,force-mode:
> +    description: Force mode parameter (DFLL_PARAMS_FORCE_MODE) in TRM
> +    $ref: /schemas/types.yaml#/definitions/uint32

enum: [ 0, 1, 2, 3 ]

> +
> +  nvidia,cf:
> +    description: CF parameter (DFLL_PARAMS_CF_PARAM) in TRM
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 63

> +
> +  nvidia,ci:
> +    description: CI parameter (DFLL_PARAMS_CI_PARAM) in TRM
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 7

> +
> +  nvidia,cg:
> +    description: CG parameter (DFLL_PARAMS_CG_PARAM) in TRM
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 255

> +
> +  nvidia,cg-scale:
> +    description: CG scale flag (DFLL_PARAMS_CG_SCALE) in TRM
> +    type: boolean
> +
> +  nvidia,pwm-to-pmic:
> +    description: Use PWM to control regulator rather than I2C
> +    type: boolean
> +
> +  nvidia,i2c-fs-rate:
> +    description: I2C full speed transfer rate when using I2C mode
> +    $ref: /schemas/types.yaml#/definitions/uint32

enum: [ 100000, 400000 ]

> +
> +  nvidia,pwm-period-nanoseconds:
> +    description: Period of PWM square wave in nanoseconds
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 1000, maximum: 1000000000

> +
> +  nvidia,pwm-tristate-microvolts:
> +    description: Regulator voltage in microvolts when PWM control is dis=
abled
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 3300000

> +
> +  nvidia,pwm-min-microvolts:
> +    description: Regulator voltage in microvolts when PWM control is ena=
bled
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 3300000

> +
> +  nvidia,pwm-voltage-step-microvolts:
> +    description: Voltage increase in microvolts per duty cycle increment
> +    $ref: /schemas/types.yaml#/definitions/uint32

minimum: 0, maximum: 1000000

Though given the additional comment that I added:

+      Voltage increase in micro volts corresponding to a 1/33th increase
+      in duty cycle. Eg the voltage for 2/33th duty cycle would be:
+
+        nvidia,pwm-min-microvolts + nvidia,pwm-voltage-step-microvolts * 2

that maximum should probably be 100000 instead.

Otherwise this looks very similar to what I have.

Thanks for taking care of this.

Thierry

--howhl4r74vwsl3vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmWtsACgkQ3SOs138+
s6FIeA/8CAy41guIi8myMrlDgJUF8D1I0dyjzo59wfb9jZnpMqwpe0qHISPMasJa
1MT04ZoILZpN7iHu7sWRE8S1WSDSlF0MqSzMw3sSrh4Dtv47ORuEhYudHFnYpLUF
Gkr5FUScFCYUxFxh/NrHTdAzckNkAvy7ae29LDwAHydgDjqCCG2kfA5kPy/NMGWa
I8JJCKpdYFEFWrrFV7UOBURN2bP9VOJgKocDZp6o7O5IWICsnsajEACJzixhp8RE
b4HEwfqFWxiu1FEAtplEyAvmMRxrP3HtmNG5RrljpqFfi0u3Kpe6FecxpIg8lTrO
dSgzYeAhc57a3XiOhE4S4cpJOfj6J3DsP5sSl6iCWpQpQPJvTyevf7ZGxs44pTGT
saC6mKhjw5QCQQV4KL2G/sxvWvscSAvAtm66/Vf1odGSzv+1ZUaZ3iNoGE0iVJ9i
x2qKOtiMJHg7wt1x/vgz558/izAU6NZuPSz1++NDCDRrKrMIwQsrYDlBJk/HCLU+
mb3KpZ0q05XPioBC3TsRekzW9Lwq6tUs+tiQCCPnZxTEwhf9jyAKIctKKCjG98MQ
O5h3v9Db1rVZCTY13X73p6RoTdavnbM2yWyB47wk35G09olGUHRo1ZfATOqJSWH+
LcjwMknh/Am6NPvtIvbqDBZiPGV2E2EJ5kiA7kUiWApuLJtyEhM=
=QvNW
-----END PGP SIGNATURE-----

--howhl4r74vwsl3vi--
