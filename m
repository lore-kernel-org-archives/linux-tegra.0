Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185382;
	b=EDp/Mq5BZW0JZu4XWUsGKpHnAw/JJwAskhd8wpPM56CtsyAikI4w6MB6705H6SiohF1I
	 F0t4aIf7gbnWmmTs+AQ1uoDPgXEWVOJzxt5y2idxev61UbrYFAxZsTbLpj9ix4w+L85+l
	 rZm3Ic72sGTSN8G0a+AEJSxwNg+SdS/le891wI6v4hTnclfKMB7JBecA2FPUnZzmD264d
	 BDsM9Z63dl+opAOPGE/Q70e5CBheJ3WsDOd7OJfp9VYHR+SfTkMHNMTd41iRIVpAMiV7e
	 iQp4nkJzmaBzbhKWRlagSM6o2AEk56N/5cYPZU+lf+m40H4xiem9e7sbMUDMJnjz5LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=i0kk3aapQT2U+tj0mw7g2JYLQDYCyfi7o3Lj/LOB5+I=;
	b=NGowee+UprNcvgkMThfEbrAB1MM7Z+Ssq0A4L1ak58BVxhA7sF9V+gG28ZVjX5brEkT+
	 NUb+OafanYqvn2+pUk19DOna42J/ecEEYX+fvQHZ8lFXd2VhaWW5F9eoYRcuXoPKdi4Xa
	 C5pDxvrjLPlU5ABNzhG/Q7UM4vu7ynmYH4hxn67NwbbWvLoJez81tRLf+asZzY1rUMtde
	 he2JfBPn4SKfDIBUcA6EbtGyzFXAQjMllnjK+SgoMF8mQDxIx4GNWDAern+kqWBkHcLZH
	 OdAK56mXJRhGBrIBb35byyjpcIihAVugdiVa+SQeZPPnlwkkDw5REWwuY+3vdHiJ9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QendF40D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31938606A31D;
	Wed, 28 Oct 2026 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QendF40D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918641F01825;
	Wed, 28 Oct 2026 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793185381;
	bh=i0kk3aapQT2U+tj0mw7g2JYLQDYCyfi7o3Lj/LOB5+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QendF40D2eU452DZQs1CMgpLem31EhGLdWBQ9KdRxZoHWoxh83hkcNBWQL0cJ4r4x
	 c7/RZ20mVlhygp9Q3UNqXPeuD1nDKOQ4T/6rS/9zzPmR/sRcsBLQK9Ws3GgqUSBDZm
	 lYzFjqHUbT+zw6bgkhp9mYIxObgfO4z6X59wJHXPoPVn5HW6ijfYvd+XGaAZnfFt55
	 wKBUDARJeieFTZhY0p2gEpaT2K66BvIKTx6hvgXW1LMIsEaazHBrYWV6aWGfhCoh5h
	 fB83M6m9GF+xQEdmePu6y6V5taqZM814gR5DJ4KJhm+XXZFccSdpxBlHkl/vHYiFWU
	 j7QSN35G3gzLQ==
Date: Wed, 28 Oct 2026 06:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Prateek Agarwal <praagarwal@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Document Tegra268 pin
 controllers
Message-ID: <20261028110258.GA2175260-robh@kernel.org>
References: <20261014104210.3978188-1-praagarwal@nvidia.com>
 <20261014104210.3978188-3-praagarwal@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014104210.3978188-3-praagarwal@nvidia.com>

On Wed, Oct 14, 2026 at 10:42:09AM +0000, Prateek Agarwal wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Tegra268 contains three pin controllers. Document their compatible strings
> and describe the list of pins and functions that they provide.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
> ---
>  .../pinctrl/nvidia,tegra268-pinmux-aon.yaml   |  78 ++++++++++
>  .../nvidia,tegra268-pinmux-common.yaml        |  72 ++++++++++
>  .../pinctrl/nvidia,tegra268-pinmux-main.yaml  | 136 ++++++++++++++++++
>  .../pinctrl/nvidia,tegra268-pinmux-uphy.yaml  |  75 ++++++++++
>  4 files changed, 361 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-main.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-uphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
> new file mode 100644
> index 000000000000..0757e15c1327
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-aon.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-aon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra268 AON Pinmux Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra268-pinmux-aon
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:
> +      $ref: nvidia,tegra268-pinmux-common.yaml
> +
> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ soc_gpio00_paa0, vcomp_alert_paa1, ao_retention_n_paa2,
> +                    batt_oc_paa3, bootv_ctl_n_paa4, power_on_paa5,
> +                    hdmi_cec_paa6, soc_gpio07_paa7, soc_gpio08_pbb0,
> +                    soc_gpio09_pbb1, gen2_i2c_scl_pcc0, gen2_i2c_sda_pcc1,
> +                    gen3_i2c_scl_pcc2, gen3_i2c_sda_pcc3, gp_pwm4_pcc4,
> +                    uart0_tx_pcc5, uart0_rx_pcc6, spi2_sck_pcc7,
> +                    spi2_miso_pdd0, spi2_mosi_pdd1, spi2_cs0_n_pdd2,
> +                    soc_gpio21_pdd3, soc_gpio23_pdd5, soc_gpio24_pdd6,
> +                    soc_gpio25_pdd7, soc_gpio26_pee0, soc_gpio27_pee1,
> +                    drive_ao_retention_n_paa2, drive_batt_oc_paa3,
> +                    drive_power_on_paa5, drive_vcomp_alert_paa1,
> +                    drive_bootv_ctl_n_paa4, drive_soc_gpio00_paa0,
> +                    drive_soc_gpio07_paa7, drive_soc_gpio08_pbb0,
> +                    drive_soc_gpio09_pbb1, drive_hdmi_cec_paa6,
> +                    drive_gen2_i2c_scl_pcc0, drive_gen2_i2c_sda_pcc1,
> +                    drive_gen3_i2c_scl_pcc2, drive_gen3_i2c_sda_pcc3,
> +                    drive_gp_pwm4_pcc4, drive_uart0_tx_pcc5,
> +                    drive_uart0_rx_pcc6, drive_spi2_sck_pcc7,
> +                    drive_spi2_miso_pdd0, drive_spi2_mosi_pdd1,
> +                    drive_spi2_cs0_n_pdd2, drive_soc_gpio21_pdd3,
> +                    drive_soc_gpio23_pdd5, drive_soc_gpio24_pdd6,
> +                    drive_soc_gpio25_pdd7, drive_soc_gpio26_pee0,
> +                    drive_soc_gpio27_pee1 ]
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
> +
> +    pinmux@c7a2000 {
> +        compatible = "nvidia,tegra268-pinmux-aon";
> +        reg = <0xc7a2000 0x2000>;
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&state_default>;
> +
> +        state_default: pinmux-default {
> +            uart0 {
> +                nvidia,pins = "uart0_tx_pcc5";
> +                nvidia,function = "uarta_txd";
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
> new file mode 100644
> index 000000000000..1b276a211b02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra268-pinmux-common.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra268-pinmux-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra268 Pinmux Common Properties
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +$ref: nvidia,tegra-pinmux-common.yaml
> +
> +properties:
> +  nvidia,function:
> +    enum: [ dca_vsync, dca_hsync, rsvd0, dp_aux_ch0_hpd, dp_aux_ch1_hpd,
> +            gp_pwm2, gp_pwm3, i2c7_clk, i2c7_dat, i2c9_clk, i2c9_dat, spi3_cs0,
> +            spi3_cs3, spi3_din, spi3_dout, spi3_sck, uartf_cts, uartf_rts,
> +            uartf_rxd, uartf_txd, spi1_cs0, spi1_cs1, spi1_din, spi1_dout,
> +            spi1_sck, extperiph2_clk, extperiph1_clk, i2c12_clk, i2c12_dat,
> +            nv_therm_fan_tach0, gp_pwm9, i2c0_clk, i2c0_dat, i2c1_clk, i2c1_dat,
> +            i2s2_lrck, i2s2_sclk, i2s2_sdata_out, i2s2_sdata_in, uarte_cts,
> +            uarte_rts, uarte_rxd, uarte_txd, i2c5_dat, i2c5_clk, i2s4_sdata_out,
> +            i2s4_sclk, i2s4_sdata_in, i2s4_lrck, aud_mclk, i2s1_sclk,
> +            i2s1_sdata_in, i2s1_sdata_out, i2s1_lrck, i2c11_clk, i2c11_dat,
> +            xhalt_trig, gp_pwm1, gp_pwm6, gp_pwm7, gp_pwm8, ufs0, pe1_clkreq_l,
> +            pe1_rst_l, pe2_rst_l, pe2_clkreq_l, pe3_clkreq_l, pe3_rst_l,
> +            sgmii0_sma_mdio, sgmii0_sma_mdc, usb_vbus_en0, usb_vbus_en1,
> +            pe4_clkreq_l, pe4_rst_l, eth0_mdio, eth0_mdc, eth2_mdio, eth2_mdc,
> +            qspi0_cs_n, qspi0_io0, qspi0_io1, qspi0_io2, qspi0_io3, qspi0_sck,
> +            dcb_vsync, dcb_hsync, dsa_lspii, dce_vsync, dce_hsync, bl_en,
> +            bl_pwm_dim0, rsvd1, soc_therm_oc3, i2s5_sclk, i2s5_sdata_in,
> +            extperiph3_clk, extperiph4_clk, i2s5_sdata_out, i2s5_lrck,
> +            i2c14_dat, i2s8_sclk, i2s8_sdata_out, i2s8_lrck, i2c16_clk,
> +            i2c16_dat, i2s3_sclk, i2s3_sdata_out, i2s3_sdata_in, i2s3_lrck,
> +            pm_trig1, pm_trig0, dcc_vsync, dcc_hsync, rsvd2, dcf_vsync,
> +            dcf_hsync, soundwire1_clk, soundwire1_dat0, soundwire1_dat1,
> +            soundwire1_dat2, dmic2_clk, dmic2_dat, nv_therm_fan_tach1,
> +            i2c15_clk, i2c15_dat, i2s7_sdata_out, dmic1_clk, dcd_vsync,
> +            dcd_hsync, rsvd3, dcg_vsync, dcg_hsync, dspk1_clk, dspk1_dat,
> +            soc_therm_oc2, istctrl_ist_done_n, soc_therm_oc1, tsc_edge_out0c,
> +            tsc_edge_out0d, tsc_edge_out0a, tsc_edge_out0b, touch_clk, hdmi_cec,
> +            i2c2_clk, i2c2_dat, i2c3_clk, i2c3_dat, gp_pwm4, uarta_txd,
> +            uarta_rxd, spi2_sck, spi2_din, spi2_dout, spi2_cs0, tsc_sync1,
> +            tsc_edge_out3, tsc_edge_out0, tsc_edge_out1, tsc_sync0,
> +            soundwire0_clk, soundwire0_dat0, uartl_txd, uartl_rxd, i2s9_sclk,
> +            i2s9_sdata_out, i2s9_sdata_in, i2s9_lrck, dmic5_dat, tsc_edge_out2 ]
> +
> +  # out of the common properties, only these are allowed for Tegra268
> +  nvidia,pins: true
> +  nvidia,pull: true
> +  nvidia,tristate: true
> +  nvidia,schmitt: true
> +  nvidia,enable-input: true
> +  nvidia,open-drain: true
> +  nvidia,lock: true
> +  nvidia,drive-type: true
> +  nvidia,io-hv: true
> +
> +required:
> +  - nvidia,pins
> +
> +# We would typically use unevaluatedProperties here but that has the
> +# downside that all the properties in the common bindings become valid
> +# for all chip generations. In this case, however, we want the per-SoC
> +# bindings to be able to override which of the common properties are
> +# allowed, since not all pinmux generations support the same sets of
> +# properties. This way, the common bindings define the format of the
> +# properties but the per-SoC bindings define which of them apply to a
> +# given chip.

No need for this explanation. If this is a result of sashiko, just 
ignore it or try putting this after the commit msg (i.e. below '---').

Rob
