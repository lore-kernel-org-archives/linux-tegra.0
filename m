Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389121D54C4;
	Tue,  6 Aug 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722951826; cv=none; b=NdwjUCNy++F4fzkzZOs/I6hEn0GivXTK4ZDtRx9MAqj2lM2LQZrBoSCeIqN+O62pkMGeBPmnlTsihn8KjMXcKh/5OFMg8VW6c+IJABRHybwuZsK+pNRsTwVq+TP2/oAsRlcKelxm5bMbD74wH95xTnl0nm51DjLcwNpcmlShYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722951826; c=relaxed/simple;
	bh=e9Cji46MWQ7EWSQqMp1wyVoIkqIoBXEY9CBa4vv+zeA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=S6gogM/aoDbIQel5KnggihWkxi99AuAfoCxRU0CHAgrQ1jgZKaDT+8VlbX+/WCb8qsTOKmp7TCPPpzhnY2OfhSdbS7JAnBN48uZNwHdhqiMRQfJ2mcABahSUEVVa0nyYZYQJbSib99kn9bMa+mzjvhmypxKB3dO/EhitL9rTjkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq0SS4+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq0SS4+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8408C4AF11;
	Tue,  6 Aug 2024 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722951826;
	bh=e9Cji46MWQ7EWSQqMp1wyVoIkqIoBXEY9CBa4vv+zeA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rq0SS4+vhHI4QOL7H79edwDK4WYuN5vYqw3exlD76hp/D8RU5xWph/5lqgI4PKyLz
	 t9/+7OxwX9l1hGgIPLuNglSN6ZZ+odJO1ADQcvSzA5g7dfnCKcN8mKYIK65Rv77NdA
	 4IswFwafAeqIgaN43tJcEe1dQ9oXlbUfaoiA1vFMjNOab9xIsoIp038UblRMf/hSRe
	 faAnc3a5+RNem0hhKjJyY9gOYyk/zbm0QLP8U0MPwjlbKV9SG5X9rqASQFYkE2re+Q
	 +DTabbGD5laQys/YlQYBReT45ATW3QP67+BasttE/BV93XecdQnOUcrbA9cF0NXJpy
	 /ujHEyY2WFP8Q==
Date: Tue, 06 Aug 2024 07:43:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Message-Id: <172295171833.1220432.7828757275501895898.robh@kernel.org>
Subject: Re: [PATCH v1 00/11] Tegra114: complete TF701T device tree


On Tue, 06 Aug 2024 15:38:55 +0300, Svyatoslav Ryhel wrote:
> Complete ASUS TF701T device tree with available information
> about the device.
> 
> Svyatoslav Ryhel (11):
>   ARM: nvidia: tf701t: use unimomentary pinmux setup
>   ARM: nvidia: tf701t: bind VDE device
>   ARM: nvidia: tf701t: correct and complete PMIC and PMC bindings
>   ARM: nvidia: tf701t: add HDMI bindings
>   ARM: nvidia: tf701t: add Bluetooth node
>   ARM: nvidia: tf701t: adjust sensors nodes
>   ARM: nvidia: tf701t: complete sound bindings
>   ARM: nvidia: tf701t: bind WIFI SDIO and EMMC
>   ARM: nvidia: tf701t: re-group GPIO keys
>   ARM: nvidia: tf701t: use dedicated backlight regulator
>   ARM: nvidia: tf701t: configure USB
> 
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 1516 ++++++++++++++---
>  1 file changed, 1289 insertions(+), 227 deletions(-)
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y nvidia/tegra114-asus-tf701t.dtb' for 20240806123906.161218-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000: 'nvidia,ddc-i2c-bus' is a required property
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: hdmi@54280000: 'nvidia,hpd-gpio' is a required property
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinmux:gmi-cs4-clk:nvidia,pins:1: 'gmi_clk_lb' is not one of ['ulpi_data0_po1', 'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_po4', 'ulpi_data4_po5', 'ulpi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0', 'ulpi_clk_py0', 'ulpi_dir_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_pp0', 'dap3_din_pp1', 'dap3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmmc1_clk_pz0', 'sdmmc1_cmd_pz1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc1_dat1_py6', 'sdmmc1_dat0_py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_pn7', 'ddc_scl_pv4', 'ddc_sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart2_rts_n_pj6', 'uart2_cts_n_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_cts_n_pa1', 'uart3_rts_n_pc0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu6', 'gen1_i2c_sda_pc5', 'gen1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', 'dap4_dout_pp6', 'dap4_sclk_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp_n_pc7', 'gmi_iordy_pi5', 'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', 'gmi_cs0_n_pj0', 'gmi_cs1_n_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4_n_pk2', 'gmi_cs6_n_pi3', 'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'gmi_ad2_pg2', 'gmi_ad3_pg3', 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'gmi_ad7_pg7', 'gmi_ad8_ph0', 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', 'gmi_ad12_ph4', 'gmi_ad13_ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj7', 'gmi_a17_pb0', 'gmi_a18_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_pi1', 'gmi_dqs_p_pj3', 'gmi_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_pt6', 'sdmmc4_clk_pcc4', 'sdmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_paa1', 'sdmmc4_dat2_paa2', 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_dat5_paa5', 'sdmmc4_dat6_paa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1', 'pbb0', 'cam_i2c_scl_pbb1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', 'pbb6', 'pbb7', 'pcc2', 'pwr_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0', 'kb_row1_pr1', 'kb_row2_pr2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5', 'kb_row6_pr6', 'kb_row7_pr7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2', 'kb_col0_pq0', 'kb_col1_pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4', 'kb_col5_pq5', 'kb_col6_pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_req_pz5', 'core_pwr_req', 'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0', 'dap1_din_pn1', 'dap1_dout_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_out_pw4', 'spdif_in_pk6', 'spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'dap2_dout_pa5', 'dap2_sclk_pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3_aud_px3', 'dvfs_clk_px2', 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_aud_px6', 'gpio_x7_aud_px7', 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat0_pb7', 'sdmmc3_dat1_pb6', 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_pee3', 'sdmmc1_wp_n_pv3', 'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_aud_pw3', 'usb_vbus_en0_pn4', 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 'sdmmc3_clk_lb_out_pee4', 'reset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1', 'drive_at2', 'drive_at3', 'drive_at4', 'drive_at5', 'drive_cdev1', 'drive_cdev2', 'drive_dap1', 'drive_dap2', 'drive_dap3', 'drive_dap4', 'drive_dbg', 'drive_sdio3', 'drive_spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'drive_uart3', 'drive_sdio1', 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_gmf', 'drive_gmg', 'drive_gmh', 'drive_owr', 'drive_uda']
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinmux:clk-32k-in:nvidia,pins:0: 'clk_32k_in' is not one of ['ulpi_data0_po1', 'ulpi_data1_po2', 'ulpi_data2_po3', 'ulpi_data3_po4', 'ulpi_data4_po5', 'ulpi_data5_po6', 'ulpi_data6_po7', 'ulpi_data7_po0', 'ulpi_clk_py0', 'ulpi_dir_py1', 'ulpi_nxt_py2', 'ulpi_stp_py3', 'dap3_fs_pp0', 'dap3_din_pp1', 'dap3_dout_pp2', 'dap3_sclk_pp3', 'pv0', 'pv1', 'sdmmc1_clk_pz0', 'sdmmc1_cmd_pz1', 'sdmmc1_dat3_py4', 'sdmmc1_dat2_py5', 'sdmmc1_dat1_py6', 'sdmmc1_dat0_py7', 'clk2_out_pw5', 'clk2_req_pcc5', 'hdmi_int_pn7', 'ddc_scl_pv4', 'ddc_sda_pv5', 'uart2_rxd_pc3', 'uart2_txd_pc2', 'uart2_rts_n_pj6', 'uart2_cts_n_pj5', 'uart3_txd_pw6', 'uart3_rxd_pw7', 'uart3_cts_n_pa1', 'uart3_rts_n_pc0', 'pu0', 'pu1', 'pu2', 'pu3', 'pu4', 'pu5', 'pu6', 'gen1_i2c_sda_pc5', 'gen1_i2c_scl_pc4', 'dap4_fs_pp4', 'dap4_din_pp5', 'dap4_dout_pp6', 'dap4_sclk_pp7', 'clk3_out_pee0', 'clk3_req_pee1', 'gmi_wp_n_pc7', 'gmi_iordy_pi5', 'gmi_wait_pi7', 'gmi_adv_n_pk0', 'gmi_clk_pk1', 'gmi_cs0_n_pj0', 'gmi_cs1_n_pj2', 'gmi_cs2_n_pk3', 'gmi_cs3_n_pk4', 'gmi_cs4_n_pk2', 'gmi_cs6_n_pi3', 'gmi_cs7_n_pi6', 'gmi_ad0_pg0', 'gmi_ad1_pg1', 'gmi_ad2_pg2', 'gmi_ad3_pg3', 'gmi_ad4_pg4', 'gmi_ad5_pg5', 'gmi_ad6_pg6', 'gmi_ad7_pg7', 'gmi_ad8_ph0', 'gmi_ad9_ph1', 'gmi_ad10_ph2', 'gmi_ad11_ph3', 'gmi_ad12_ph4', 'gmi_ad13_ph5', 'gmi_ad14_ph6', 'gmi_ad15_ph7', 'gmi_a16_pj7', 'gmi_a17_pb0', 'gmi_a18_pb1', 'gmi_a19_pk7', 'gmi_wr_n_pi0', 'gmi_oe_n_pi1', 'gmi_dqs_p_pj3', 'gmi_rst_n_pi4', 'gen2_i2c_scl_pt5', 'gen2_i2c_sda_pt6', 'sdmmc4_clk_pcc4', 'sdmmc4_cmd_pt7', 'sdmmc4_dat0_paa0', 'sdmmc4_dat1_paa1', 'sdmmc4_dat2_paa2', 'sdmmc4_dat3_paa3', 'sdmmc4_dat4_paa4', 'sdmmc4_dat5_paa5', 'sdmmc4_dat6_paa6', 'sdmmc4_dat7_paa7', 'cam_mclk_pcc0', 'pcc1', 'pbb0', 'cam_i2c_scl_pbb1', 'cam_i2c_sda_pbb2', 'pbb3', 'pbb4', 'pbb5', 'pbb6', 'pbb7', 'pcc2', 'pwr_i2c_scl_pz6', 'pwr_i2c_sda_pz7', 'kb_row0_pr0', 'kb_row1_pr1', 'kb_row2_pr2', 'kb_row3_pr3', 'kb_row4_pr4', 'kb_row5_pr5', 'kb_row6_pr6', 'kb_row7_pr7', 'kb_row8_ps0', 'kb_row9_ps1', 'kb_row10_ps2', 'kb_col0_pq0', 'kb_col1_pq1', 'kb_col2_pq2', 'kb_col3_pq3', 'kb_col4_pq4', 'kb_col5_pq5', 'kb_col6_pq6', 'kb_col7_pq7', 'clk_32k_out_pa0', 'sys_clk_req_pz5', 'core_pwr_req', 'cpu_pwr_req', 'pwr_int_n', 'owr', 'dap1_fs_pn0', 'dap1_din_pn1', 'dap1_dout_pn2', 'dap1_sclk_pn3', 'clk1_req_pee2', 'clk1_out_pw4', 'spdif_in_pk6', 'spdif_out_pk5', 'dap2_fs_pa2', 'dap2_din_pa4', 'dap2_dout_pa5', 'dap2_sclk_pa3', 'dvfs_pwm_px0', 'gpio_x1_aud_px1', 'gpio_x3_aud_px3', 'dvfs_clk_px2', 'gpio_x4_aud_px4', 'gpio_x5_aud_px5', 'gpio_x6_aud_px6', 'gpio_x7_aud_px7', 'sdmmc3_clk_pa6', 'sdmmc3_cmd_pa7', 'sdmmc3_dat0_pb7', 'sdmmc3_dat1_pb6', 'sdmmc3_dat2_pb5', 'sdmmc3_dat3_pb4', 'hdmi_cec_pee3', 'sdmmc1_wp_n_pv3', 'sdmmc3_cd_n_pv2', 'gpio_w2_aud_pw2', 'gpio_w3_aud_pw3', 'usb_vbus_en0_pn4', 'usb_vbus_en1_pn5', 'sdmmc3_clk_lb_in_pee5', 'sdmmc3_clk_lb_out_pee4', 'reset_out_n', 'drive_ao1', 'drive_ao2', 'drive_at1', 'drive_at2', 'drive_at3', 'drive_at4', 'drive_at5', 'drive_cdev1', 'drive_cdev2', 'drive_dap1', 'drive_dap2', 'drive_dap3', 'drive_dap4', 'drive_dbg', 'drive_sdio3', 'drive_spi', 'drive_uaa', 'drive_uab', 'drive_uart2', 'drive_uart3', 'drive_sdio1', 'drive_ddc', 'drive_gma', 'drive_gme', 'drive_gmf', 'drive_gmg', 'drive_gmh', 'drive_owr', 'drive_uda']
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux@70000868: pinmux:clk-32k-in:nvidia,function:0: 'clk' is not one of ['blink', 'cec', 'cldvfs', 'clk12', 'cpu', 'dap', 'dap1', 'dap2', 'dev3', 'displaya', 'displaya_alt', 'displayb', 'dtv', 'emc_dll', 'extperiph1', 'extperiph2', 'extperiph3', 'gmi', 'gmi_alt', 'hda', 'hsi', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2cpwr', 'i2s0', 'i2s1', 'i2s2', 'i2s3', 'i2s4', 'irda', 'kbc', 'nand', 'nand_alt', 'owr', 'pmi', 'pwm0', 'pwm1', 'pwm2', 'pwm3', 'pwron', 'reset_out_n', 'rsvd1', 'rsvd2', 'rsvd3', 'rsvd4', 'sdmmc1', 'sdmmc2', 'sdmmc3', 'sdmmc4', 'soc', 'spdif', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'spi6', 'sysclk', 'trace', 'uarta', 'uartb', 'uartc', 'uartd', 'ulpi', 'usb', 'vgp1', 'vgp2', 'vgp3', 'vgp4', 'vgp5', 'vgp6', 'vi', 'vi_alt1', 'vi_alt3']
	from schema $id: http://devicetree.org/schemas/pinctrl/nvidia,tegra114-pinmux.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv0-gpio: {'nvidia,pins': ['pv0'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 2, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pv1-gpio: {'nvidia,pins': ['pv1'], 'nvidia,function': ['rsvd1'], 'nvidia,pull': 2, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pu0-gpio: {'nvidia,pins': ['pu0'], 'nvidia,function': ['rsvd3'], 'nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pu2-gpio: {'nvidia,pins': ['pu2'], 'nvidia,function': ['rsvd1'], 'nvidia,pull': 2, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pcc-gpio: {'nvidia,pins': ['pcc1', 'pcc2'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 1, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb3-gpio: {'nvidia,pins': ['pbb3'], 'nvidia,function': ['rsvd4'], 'nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 1} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb4-5-6-gpio: {'nvidia,pins': ['pbb4', 'pbb5', 'pbb6'], 'nvidia,function': ['rsvd4'], 'nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: pinmux: pbb7-gpio: {'nvidia,pins': ['pbb7'], 'nvidia,function': ['rsvd2'], 'nvidia,pull': 0, 'nvidia,tristate': 0, 'nvidia,enable-input': 0} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: serial@70006200: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart'] is too long
	'nvidia,tegra114-hsuart' is not one of ['nvidia,tegra20-hsuart', 'nvidia,tegra30-hsuart', 'nvidia,tegra186-hsuart', 'nvidia,tegra194-hsuart']
	'nvidia,tegra124-hsuart' was expected
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: serial@70006200: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/nvidia,tegra20-hsuart.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /serial@70006200: failed to match any schema with compatible: ['nvidia,tegra114-hsuart', 'nvidia,tegra30-hsuart']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: bluetooth: reset-gpios: False schema does not allow [[20, 134, 1]]
	from schema $id: http://devicetree.org/schemas/net/broadcom-bluetooth.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound: nvidia,audio-routing:14: 'IN1N' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound: nvidia,audio-routing:17: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound: nvidia,audio-routing:19: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#





