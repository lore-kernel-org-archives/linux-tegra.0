Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518FA1C3C18;
	Thu,  3 Jul 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551325; cv=none; b=K918D20M4XAoNp7DutUjYUUiCOa5PfKIr+uIMu/17Ns9xL5vdyvgb1NrBRq1WPkY5hsn/Dj4V2jMxDoFtM7zPVRNYxXCcckMQIr1k0KlSTYo5rNtzyVh1Gp/dO2LpQqkEbylZEfoYEdUpbvViY7TYMgNMRQOCy0J0PjZ4urdRXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551325; c=relaxed/simple;
	bh=mCPgMlVKOVyG4kXhgTN7HonObN3VJQSIFT5T6Gsa6O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrOppjKJ862MX2wlsanJxDZWTRIRoDLBGADrgEGUoesguf9gisP+OogstShVHY4zNkQH6Jfros1qRupsPT4AvUIGDidMpLr1lLqh3s4BkJPoZTk7CgacIyFOLInf3BwWzxNLcaKTnyyztD/1OU5pkn0RRloK3p0jvIPlhNDDSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvJ2WqkB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvJ2WqkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A758AC4CEF2;
	Thu,  3 Jul 2025 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551324;
	bh=mCPgMlVKOVyG4kXhgTN7HonObN3VJQSIFT5T6Gsa6O0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dvJ2WqkBl65jd2oimJ/LiXpsfCZuzfgimz1bNsYntlUoovyFZ0HBsYgKB7w/65Elf
	 nfMFAHCcsG3wcpIMcincE5NeFWwJlXmTG8mIZS2tL4uQiC85q0EDInK+zc4Isvedeo
	 9cwsyOtyBZrVHbN7e909chwvG4mUWSyEy0oU4Mvr7ehZrB1rnqpNF/QRbsab47XutL
	 fSLC6qxsfZ/yN6m6olaszXchXpsaM/xOfDLniqVUYkaMz8pijjP4syEGkkvJ6ALm2s
	 4uaQ+/r4MC5G0VCZhr1RU6dxgBqs4AYq1AiKGNKt02vtb/ywEaHIWKSZJLShLLJaUU
	 VkypCreYhE4VA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso10700834a12.2;
        Thu, 03 Jul 2025 07:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSDIKf4B44fL5HjjzQTBUvimdu/9jbGTOxHxtmOZGO3/5gFzSGKC3AwJ9EPofT6iQUk9zu49KYoCgl@vger.kernel.org, AJvYcCVUmAyu8rJMHjvdlHS/bQgQtmHdfJI+pwEa2KkuK87pZpW9lSqnIklMP8rDTp8c7o2NjmdfSsjXbwmogfvu@vger.kernel.org, AJvYcCWQokb1zkOkeQAYO7sU8u+/uVQ9k6zYUCT24jktg1VvSXNZYhAMYrdHJGpUmArFF5ZI5IZ76Y5dLVsc@vger.kernel.org, AJvYcCXWsQjucUV7g2Q2Lej7XnVtfD/6z4kDjCkvW6V7YI/6EebmNQg6hikMeWnGI9rWs7sh0CDkusMEtUntRhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy64mCBBrZWQCsumNCUSiAt0nBD3G+VM/V9ObiVb4lnoQ4CzwX/
	DTDFzJ9FrRsmUcMwnlUd1KvClw1gz3m9nCk1qD38s7EPyUZRMGEOO+Gq2TVRkX9Hb5z7s0TXivS
	8Zcl44axGvZ2sqxmVAPvvd4VYwoOArQ==
X-Google-Smtp-Source: AGHT+IG7rHR9+lG+I7nKAIO/NxPfjF+V6YeNpGZbR7jsVYiHAb0Q6c/MrY9ZAlRlTyOHohEIwfddBMcKM+B/ifFEVKI=
X-Received: by 2002:a17:907:d8a:b0:ae3:b94b:36f5 with SMTP id
 a640c23a62f3a-ae3c2c4bdcamr578245366b.34.1751551323014; Thu, 03 Jul 2025
 07:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630232632.3700405-1-robh@kernel.org> <hphr525b57li2fe4xstxbpwihldv6fr5kslktpphlvku22buv7@w3n5ynczr27v>
In-Reply-To: <hphr525b57li2fe4xstxbpwihldv6fr5kslktpphlvku22buv7@w3n5ynczr27v>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Jul 2025 09:01:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK4g+O=sf-SBdcFRg0tL_PSUEhavXF6f04FB3+3zxaCvg@mail.gmail.com>
X-Gm-Features: Ac12FXw7NlyQU3-HOWZG-2LMipHgBz8UDZfAQ4L2umMnNXmWgCPjP-69v-q3IoA
Message-ID: <CAL_JsqK4g+O=sf-SBdcFRg0tL_PSUEhavXF6f04FB3+3zxaCvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Convert nvidia,tegra124-dfll to DT schema
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 5:26=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Jun 30, 2025 at 06:26:30PM -0500, Rob Herring (Arm) wrote:
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 -------------
> >  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 219 ++++++++++++++++++
> >  2 files changed, 219 insertions(+), 155 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegr=
a124-dfll.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegr=
a124-dfll.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-df=
ll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > deleted file mode 100644
> > index f7d347385b57..000000000000
> > --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> > +++ /dev/null
> > @@ -1,155 +0,0 @@
> > -NVIDIA Tegra124 DFLL FCPU clocksource
> > -
> > -This binding uses the common clock binding:
> > -Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -
> > -The DFLL IP block on Tegra is a root clocksource designed for clocking
> > -the fast CPU cluster. It consists of a free-running voltage controlled
> > -oscillator connected to the CPU voltage rail (VDD_CPU), and a closed l=
oop
> > -control module that will automatically adjust the VDD_CPU voltage by
> > -communicating with an off-chip PMIC either via an I2C bus or via PWM s=
ignals.
> > -
> > -Required properties:
> > -- compatible : should be one of:
> > -  - "nvidia,tegra124-dfll": for Tegra124
> > -  - "nvidia,tegra210-dfll": for Tegra210
> > -- reg : Defines the following set of registers, in the order listed:
> > -        - registers for the DFLL control logic.
> > -        - registers for the I2C output logic.
> > -        - registers for the integrated I2C master controller.
> > -        - look-up table RAM for voltage register values.
> > -- interrupts: Should contain the DFLL block interrupt.
> > -- clocks: Must contain an entry for each entry in clock-names.
> > -  See clock-bindings.txt for details.
> > -- clock-names: Must include the following entries:
> > -  - soc: Clock source for the DFLL control logic.
> > -  - ref: The closed loop reference clock
> > -  - i2c: Clock source for the integrated I2C master.
> > -- resets: Must contain an entry for each entry in reset-names.
> > -  See ../reset/reset.txt for details.
> > -- reset-names: Must include the following entries:
> > -  - dvco: Reset control for the DFLL DVCO.
> > -- #clock-cells: Must be 0.
> > -- clock-output-names: Name of the clock output.
> > -- vdd-cpu-supply: Regulator for the CPU voltage rail that the DFLL
> > -  hardware will start controlling. The regulator will be queried for
> > -  the I2C register, control values and supported voltages.
> > -
> > -Required properties for the control loop parameters:
> > -- nvidia,sample-rate: Sample rate of the DFLL control loop.
> > -- nvidia,droop-ctrl: See the register CL_DVFS_DROOP_CTRL in the TRM.
> > -- nvidia,force-mode: See the field DFLL_PARAMS_FORCE_MODE in the TRM.
> > -- nvidia,cf: Numeric value, see the field DFLL_PARAMS_CF_PARAM in the =
TRM.
> > -- nvidia,ci: Numeric value, see the field DFLL_PARAMS_CI_PARAM in the =
TRM.
> > -- nvidia,cg: Numeric value, see the field DFLL_PARAMS_CG_PARAM in the =
TRM.
> > -
> > -Optional properties for the control loop parameters:
> > -- nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE i=
n the TRM.
> > -
> > -Optional properties for mode selection:
> > -- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> > -
> > -Required properties for I2C mode:
> > -- nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
> > -
> > -Required properties for PWM mode:
> > -- nvidia,pwm-period-nanoseconds: period of PWM square wave in nanoseco=
nds.
> > -- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts whe=
n PWM
> > -  control is disabled and the PWM output is tristated. Note that this =
voltage is
> > -  configured in hardware, typically via a resistor divider.
> > -- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM=
 control
> > -  is enabled and PWM output is low. Hence, this is the minimum output =
voltage
> > -  that the regulator supports when PWM control is enabled.
> > -- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
> > -  corresponding to a 1/33th increase in duty cycle. Eg the voltage for=
 2/33th
> > -  duty cycle would be: nvidia,pwm-min-microvolts +
> > -  nvidia,pwm-voltage-step-microvolts * 2.
> > -- pinctrl-0: I/O pad configuration when PWM control is enabled.
> > -- pinctrl-1: I/O pad configuration when PWM control is disabled.
> > -- pinctrl-names: must include the following entries:
> > -  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled=
.
> > -  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabl=
ed.
> > -
> > -Example for I2C:
> > -
> > -clock@70110000 {
> > -        compatible =3D "nvidia,tegra124-dfll";
> > -        reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
> > -              <0 0x70110000 0 0x100>, /* I2C output control */
> > -              <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> > -              <0 0x70110200 0 0x100>; /* Look-up table RAM */
> > -        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> > -        clocks =3D <&tegra_car TEGRA124_CLK_DFLL_SOC>,
> > -                 <&tegra_car TEGRA124_CLK_DFLL_REF>,
> > -                 <&tegra_car TEGRA124_CLK_I2C5>;
> > -        clock-names =3D "soc", "ref", "i2c";
> > -        resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
> > -        reset-names =3D "dvco";
> > -        #clock-cells =3D <0>;
> > -        clock-output-names =3D "dfllCPU_out";
> > -        vdd-cpu-supply =3D <&vdd_cpu>;
> > -
> > -        nvidia,sample-rate =3D <12500>;
> > -        nvidia,droop-ctrl =3D <0x00000f00>;
> > -        nvidia,force-mode =3D <1>;
> > -        nvidia,cf =3D <10>;
> > -        nvidia,ci =3D <0>;
> > -        nvidia,cg =3D <2>;
> > -
> > -        nvidia,i2c-fs-rate =3D <400000>;
> > -};
> > -
> > -Example for PWM:
> > -
> > -clock@70110000 {
> > -     compatible =3D "nvidia,tegra124-dfll";
> > -     reg =3D <0 0x70110000 0 0x100>, /* DFLL control */
> > -           <0 0x70110000 0 0x100>, /* I2C output control */
> > -           <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> > -           <0 0x70110200 0 0x100>; /* Look-up table RAM */
> > -     interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> > -     clocks =3D <&tegra_car TEGRA210_CLK_DFLL_SOC>,
> > -              <&tegra_car TEGRA210_CLK_DFLL_REF>,
> > -              <&tegra_car TEGRA124_CLK_I2C5>;;
> > -     clock-names =3D "soc", "ref", "i2c";
> > -     resets =3D <&tegra_car TEGRA124_RST_DFLL_DVCO>;
> > -     reset-names =3D "dvco";
> > -     #clock-cells =3D <0>;
> > -     clock-output-names =3D "dfllCPU_out";
> > -
> > -     nvidia,sample-rate =3D <25000>;
> > -     nvidia,droop-ctrl =3D <0x00000f00>;
> > -     nvidia,force-mode =3D <1>;
> > -     nvidia,cf =3D <6>;
> > -     nvidia,ci =3D <0>;
> > -     nvidia,cg =3D <2>;
> > -
> > -     nvidia,pwm-min-microvolts =3D <708000>; /* 708mV */
> > -     nvidia,pwm-period-nanoseconds =3D <2500>; /* 2.5us */
> > -     nvidia,pwm-to-pmic;
> > -     nvidia,pwm-tristate-microvolts =3D <1000000>;
> > -     nvidia,pwm-voltage-step-microvolts =3D <19200>; /* 19.2mV */
> > -
> > -     pinctrl-names =3D "dvfs_pwm_enable", "dvfs_pwm_disable";
> > -     pinctrl-0 =3D <&dvfs_pwm_active_state>;
> > -     pinctrl-1 =3D <&dvfs_pwm_inactive_state>;
> > -};
> > -
> > -/* pinmux nodes added for completeness. Binding doc can be found in:
> > - * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.ya=
ml
> > - */
> > -
> > -pinmux: pinmux@700008d4 {
> > -     dvfs_pwm_active_state: dvfs_pwm_active {
> > -             dvfs_pwm_pbb1 {
> > -                     nvidia,pins =3D "dvfs_pwm_pbb1";
> > -                     nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> > -             };
> > -     };
> > -     dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> > -             dvfs_pwm_pbb1 {
> > -                     nvidia,pins =3D "dvfs_pwm_pbb1";
> > -                     nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-df=
ll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > new file mode 100644
> > index 000000000000..67d99fd89ea9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> > @@ -0,0 +1,219 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra124 DFLL FCPU clocksource
> > +
> > +maintainers:
> > +  - Joseph Lo <josephl@nvidia.com>
> > +  - Thierry Reding <treding@nvidia.com>
> > +  - Tuomas Tynkkynen <ttynkkynen@nvidia.com>
>
> Tuomas isn't at NVIDIA anymore, as far as I can tell.
>
> > +
> > +description:
> > +  The DFLL IP block on Tegra is a root clocksource designed for clocki=
ng the
> > +  fast CPU cluster. It consists of a free-running voltage controlled o=
scillator
> > +  connected to the CPU voltage rail (VDD_CPU), and a closed loop contr=
ol module
> > +  that will automatically adjust the VDD_CPU voltage by communicating =
with an
> > +  off-chip PMIC either via an I2C bus or via PWM signals.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra124-dfll
> > +      - nvidia,tegra210-dfll
> > +
> > +  reg:
> > +    items:
> > +      - description: DFLL control logic registers
> > +      - description: I2C output logic registers
> > +      - description: Integrated I2C master controller registers
> > +      - description: Look-up table RAM for voltage register values
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: Clock source for the DFLL control logic
> > +      - description: Closed loop reference clock
> > +      - description: Clock source for the integrated I2C master
> > +
> > +  clock-names:
> > +    items:
> > +      - const: soc
> > +      - const: ref
> > +      - const: i2c
> > +
> > +  clock-output-names:
> > +    description: Name of the DFLL CPU clock output
> > +    items:
> > +      - const: dfllCPU_out
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    items:
> > +      - const: dvco
> > +      - const: dfll
> > +
> > +  vdd-cpu-supply: true
> > +
> > +  nvidia,sample-rate:
> > +    description: Sample rate of the DFLL control loop
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> I have a local patch for this and have a few additional restrictions for
> some of these properties that I think would make sense to include.

Can you send yours then. These are all just bulk conversions with AI
help and minimal time by me to tweak.

Rob
