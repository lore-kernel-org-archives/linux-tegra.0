Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B72DB7A8;
	Tue, 10 Feb 2026 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691581; cv=none; b=Tz2V+qdR7Vu9Jcx1nvmKzTOUjpk7/Ys0SaFn6prf6a1yZ0sYtnV+oxYMe3GenTPjk750ZEwm7Lqjv6qdaPzHg17W6NVl4swJ8oB/XFtDWVMvdSUp5JS1CWlvVrJvq1mrUmqDscksM9981h/syJTHvCOPpY7ny/z5E5biZez+gDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691581; c=relaxed/simple;
	bh=Q9Cy7iKV5bc/z2gLfix9jEL9ma0/1NHBV+8qNqpjm/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4aLPl0e98eekiWIZuMSQwFu1g0OkIVHRVe08XNQAKbImhejEqA23oKwMpHPSGanFjt0W3GMnREgblMB/ufoxNoweCRJQApeBz3tvSaULLB0c5VqSz5gOLVE4D/5/0FubVmATctlJV4xJITsc0BOXFEhGdXJotspayJ47BsXOnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljsafPJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljsafPJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DEAC16AAE;
	Tue, 10 Feb 2026 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770691580;
	bh=Q9Cy7iKV5bc/z2gLfix9jEL9ma0/1NHBV+8qNqpjm/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljsafPJcay9Emv0hudR8AQ2Dxt2p/Jzo1Y49PsSTERvp5j5lsmgZohlKjmYx33SWj
	 pafSedNjUdVDXvkBFILURfYg6lLnq7W3zTL3q89IaFPDlrPEdgxZsRmUFKUrIJgcsh
	 uSINiHQQNtVA92TnAtWvsfP8oO7QghKcA5vp+tb1IapYRktr0VVRyYdmg/wG7Ckl++
	 nimbL+sucgg5l8imeECJ3A8eKGx52JhkXHgGstmrIKbxE2JaZe1QsBtsCoot7TrheV
	 ySxCLOYJDsugKecP28K/38XfoNfktg2azs6deLHXfgwfLchUoIM8ii2Hakmkaj1olJ
	 7qIBVZaZsXn3A==
Date: Mon, 9 Feb 2026 20:46:19 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: nvidia,tegra-audio: document
 CPCAP CODEC
Message-ID: <20260210024619.GA2374304-robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com>
 <20260206173423.145954-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206173423.145954-2-clamor95@gmail.com>

On Fri, Feb 06, 2026 at 07:34:18PM +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for CPCAP CODEC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../sound/nvidia,tegra-audio-cpcap.yaml       | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
> new file mode 100644
> index 000000000000..5335fa56fb3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-cpcap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra audio complex with CPCAP CODEC
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: nvidia,tegra-audio-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: '^[a-z0-9]+,tegra-audio-cpcap(-[a-z0-9]+)+$'

Expecting a lot of devices and differences? I would assume all known h/w 
is well known and any differences are known by now. Perhaps even just 
the fallback is sufficient?

> +      - const: nvidia,tegra-audio-cpcap
> +

> +  - |
> +    #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +    sound {
> +        compatible = "motorola,tegra-audio-cpcap-mot",

Why do we need motorola twice?

> +                     "nvidia,tegra-audio-cpcap";
> +        nvidia,model = "Motorola Atrix 4G (MB860) CPCAP";
> +
> +        nvidia,audio-routing =
> +                "Headphones", "HSR",
> +                "Headphones", "HSL",
> +                "Int Spk", "SPKR",
> +                "Int Spk", "SPKL",
> +                "Earpiece", "EP",
> +                "HSMIC", "Mic Jack",
> +                "MICR", "Internal Mic 1",
> +                "MICL", "Internal Mic 2";
> +
> +        nvidia,i2s-controller = <&tegra_i2s1>;
> +        nvidia,audio-codec = <&cpcap_audio>;
> +
> +        clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
> +                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
> +                 <&tegra_car TEGRA20_CLK_CDEV1>;
> +        clock-names = "pll_a", "pll_a_out0", "mclk";
> +    };
> -- 
> 2.51.0
> 
