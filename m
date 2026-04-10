Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650B3976B3;
	Fri, 10 Apr 2026 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818843; cv=none; b=Phvw4FruIJOoWXKsh/vgCMXnICtx/4mDSo2UO43C90pG+PmkT5aia5GoGpxteSC9tRqxEUW3p/7+r0RbMnzXe36CJUwJqzfmXqUg9vlH5mAvZvPe6TO1Rs8OWbPGB39uFXjMK5aN7rD2/7XS4+fXZ6k4cDUo/9Qai9fdfZla6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818843; c=relaxed/simple;
	bh=mA23v3QC+JRvCzjyBd/s1wSu6ZpU41sDI6803W1vbD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK2ETzQrQ2h3QFc9UMSoJEGXDb/vM8f/1nkjcdR8rZ0CbnDT0NhzU+4qknv8Zah5bU+Vt59FfiC7NPNTfY63EeqjGXbbe2//STaYgJZUh8DSwimCWqVdQ3R+W4Sn0R7uhPezUytjAYNY6ibrX7Y9nScuQSRzpKQIaM2vB/wTjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNpxZVSr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNpxZVSr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79F6C19421;
	Fri, 10 Apr 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818843;
	bh=mA23v3QC+JRvCzjyBd/s1wSu6ZpU41sDI6803W1vbD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNpxZVSrX/1El7Se3viD+bat+IUrySh4F5a1EuthfecOkMbgVEQAnDyU5LkZXUVF0
	 CmLGSoJPqBoJ91CDt1gioQzlj8e5WJXxBkEG2FFmjh/3dKWQuEqtXkpIMahWThxf0+
	 FF6+mfazLZPj4NsC40uCdr2YZ+v5Iny+EjKHc7BwrvzSTTqWfjZC/0LxB76Oq4BN8h
	 jg+Q7HUp9rkWhI/A4etUfp8qJ0Gov/B05d4aXLAAovtVnomzIvRiQM+56gyeK/GyXc
	 PejqP7vQ+w+/ehx/5p02U3uLz6tgHkrf1l+pTjrLE2lLWo920wSbGvKLpvHF+TqTU9
	 PcgIeKqIDIxUQ==
Date: Fri, 10 Apr 2026 13:00:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	ebiggers@kernel.org, geert@linux-m68k.org, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	kuninori.morimoto.gx@renesas.com, linusw@kernel.org, luca.weiss@fairphone.com, 
	michal.simek@amd.com, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, 
	rosenp@gmail.com, sven@kernel.org, thierry.reding@kernel.org, 
	webgeek1234@gmail.com
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <20260410-benign-sassy-vole-efeb56@quoll>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-3-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409131340.168556-3-pshete@nvidia.com>

On Thu, Apr 09, 2026 at 01:13:36PM +0000, pshete@nvidia.com wrote:
> +patternProperties:
> +  "^pinmux(-[a-z0-9-]+)?$":
> +    type: object
> +
> +    # pin groups
> +    additionalProperties:
> +      $ref: nvidia,tegra238-pinmux-common.yaml
> +
> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ bootv_ctl_n_paa0, soc_gpio00_paa1, vcomp_alert_paa2,
> +                    pwm1_paa3, batt_oc_paa4, soc_gpio04_paa5,
> +                    soc_gpio25_paa6, soc_gpio26_paa7,
> +                    hdmi_cec_pbb0,
> +                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> +                    spi2_cs0_pcc3, spi2_cs1_pcc4, uart3_tx_pcc5,
> +                    uart3_rx_pcc6, gen2_i2c_scl_pcc7,
> +                    gen2_i2c_sda_pdd0, gen8_i2c_scl_pdd1,
> +                    gen8_i2c_sda_pdd2, touch_clk_pdd3, dmic1_clk_pdd4,
> +                    dmic1_dat_pdd5, soc_gpio19_pdd6, pwm2_pdd7,
> +                    pwm3_pee0, pwm7_pee1,
> +                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE)
> +                    drive_bootv_ctl_n_paa0, drive_soc_gpio00_paa1,
> +                    drive_vcomp_alert_paa2, drive_pwm1_paa3,
> +                    drive_batt_oc_paa4, drive_soc_gpio04_paa5,
> +                    drive_soc_gpio25_paa6, drive_soc_gpio26_paa7,
> +                    drive_hdmi_cec_pbb0,
> +                    drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
> +                    drive_spi2_mosi_pcc2, drive_spi2_cs0_pcc3,
> +                    drive_spi2_cs1_pcc4, drive_uart3_tx_pcc5,
> +                    drive_uart3_rx_pcc6, drive_gen2_i2c_scl_pcc7,
> +                    drive_gen2_i2c_sda_pdd0, drive_gen8_i2c_scl_pdd1,
> +                    drive_gen8_i2c_sda_pdd2, drive_touch_clk_pdd3,
> +                    drive_dmic1_clk_pdd4, drive_dmic1_dat_pdd5,
> +                    drive_soc_gpio19_pdd6, drive_pwm2_pdd7,
> +                    drive_pwm3_pee0, drive_pwm7_pee1 ]
> +
> +unevaluatedProperties: false

additionalProperties. I'll fix existing files.

> +
> +examples:
> +  - |

Best regards,
Krzysztof

