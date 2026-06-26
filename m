Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5233F786E
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480131; cv=none; b=Sf75S0PLhJsYt8DW3GMDwMW9ppZ6eAZAWGbmXN6N+/KZTVrEXPFKofwC+PhuD7HzqekwtyiN7h7c+gkgV+EPidgltT9ubAoHkOZ12HWQJIM2iSMQ6pNPFdoVGYtIPLKV2PzWgn0BDy4YHQhBJHsZsg04ibTQ2aXP7Dj2bqIc7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480131; c=relaxed/simple;
	bh=OXzS2AiEpukyyUmgnbynSjzkUcDCK9KPo5Fgbyuncwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8/6sI+P1UY3yU/u34qV7oLnOzUvaa8tTI1Toh5+3ZDre87LtXHo3CGKEGNsLu5p7t+p4Ihse6IGVAjxVwBsFaQtjiWcCFmlvN7A8au06/ro7tffSe6cGjoHIkBo9sskNcwlq8vwRvzM5thUJtXgWZRu564WI7SLAKtReBWCp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mhfqYVQz; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mhfqYVQz"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3967701fc3cso484051fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 06:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480124; x=1783084924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6yvw6+GjJRRakSTt07g6wW5GBrCnruGOoGq+tkn21WA=;
        b=mhfqYVQz06CNAzen+lzM7Y9Kg/vcWqrSubWdwQOkeOZZhLMZkngnWYqsRFr9c0rg3t
         wMq7UqegfuLhZ7YjuTs+5qcip0mRlu5w/IlOqHFzCB4SLOrbv6Y9GmAyAGfa7+3SNKa7
         zt+P6cKGG/tMxN9t2ihjsekrEyOxKUVJGeCOzpikB1CGC8/v+I2RjHmT5ljkc7+N+aZM
         6uZF0sQW1Y+khKa5Yu4Tviq6ojgQPZp9iQDJJcLVIqRfnxGfkGpeanbI9sWJP1i+BDRb
         lrMK7XEQG6/j8Eu83neOQaBAlG0snmICqaWYWgDgruxcRiPF6PNN71ik8Q/H732lc11M
         74dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480124; x=1783084924;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yvw6+GjJRRakSTt07g6wW5GBrCnruGOoGq+tkn21WA=;
        b=R0U5B6x9iCQtgxXwTuBKKPvMINOIwE6E4Ury9GtfVxK+jgvGdqAGf2Up6NBrdH46aQ
         UB+m1iZZeo57Q0lE5MEhqewfuMLU0XwRumBl61VkPVfzqfvVHMk45lIGvyaSGK2P7uUm
         muK2mJNaLS/x9LgyRam/27tODpKRcp3MINgh/sUcGDJgmyh8+6AkZDRriW6VlmOSa9EB
         uz/v/GHmUNTNUNvY0Ilap9caB5F7cSWC8TIOGLw+oL9VjXd86hnlLez2XpONcGkTSsEX
         H7FoIc/xI1hu7NNV9m99UPDbNaLjQiw//t95XrbsHqgNF+2FJodZXOYPEQTfEMW6WE6a
         wW/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqqQignGxp4o08UciOCBYEpoBjoUCfEbEIwTrgPePCLmmjRNtxJMGwDgroey++oMKA33VI3s8f+HN7E0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwvejlUww9W3l+1GAP1b/PksZ6qkBUnH/0LAQnu54vi3KaLzf
	54Q6msaXR2OVAvohtbMOf05XxE0vdB1NVw6jDXgez2LKWwlxASM2BTtGdVYIgCH0Pr0=
X-Gm-Gg: AfdE7clxdN8q9bDGxHZp62YGLmUG07M/+sf3u3ZrxNDKOZRg/jfZEKQuweN9+6xvGI7
	PEKJd+KqokaQ2YunPrsMqzKhg+qZegb4yfVj6Kg+Zf4ZmKbRrf91WusHR4TAxJ90CqvPdImMtyQ
	cC8OLZSXZzXGlIDj8PhYwyMz3Y67I9KcveT1fE5R9khOV078S6o47zsrSF1eS4XXJuxdZBFiixK
	ZXZ+EQ9vSOVw0cAtn6wTfTqqBggXPD1w0BEJgD98jPaMPVSm+pcg7H6BKFn2T5kKIftj6vB/2qk
	9Qq3pTcU7CjitBXqCbdWxACSMTtFTg5ZxRxZbDKBau/SY36EZSZCO446K1K/8LZ1GP243Dwcpxa
	4yDVZ9xBj6BxbFrAh7f2xARwbT5k6gDfV2X9PYuWGMctU5Ekf//3dgl0jXc5vOZHLBjOYkQGgpx
	3BsigPVFbGQ/9xOWSX4ADj7R3j1Nnx4Vg4sAWTaeVNxSdYpzzxj0EVSBs2BN1QIvr1BNw=
X-Received: by 2002:a2e:a547:0:b0:396:831a:ef36 with SMTP id 38308e7fff4ca-39acb6eaffamr7242181fa.5.1782480123871;
        Fri, 26 Jun 2026 06:22:03 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9e53esm49306771fa.6.2026.06.26.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:03 -0700 (PDT)
Message-ID: <409287ae-1bba-44d7-a386-e2369025f8d2@linaro.org>
Date: Fri, 26 Jun 2026 16:22:02 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the existing examples throughout the bindings documentation for
> camera sensors.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
>   Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
>   12 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1a57f2aa1982..b7bc6ba26e6e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -102,7 +103,7 @@ examples:
>               vddio-supply = <&reg_camera_vddio>;
>               reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
>               shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> index 6f2017c75125..b9c61395b24f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -69,6 +69,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>               avdd-supply = <&ov08d10_vdda_2v8>;
>               dvdd-supply = <&ov08d10_vddd_1v2>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> index d96199031b66..fcd617848ce3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> @@ -96,6 +96,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -114,7 +115,7 @@ examples:
>               powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
>               reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f9..6df62fd0c0c0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -85,6 +85,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/px30-cru.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>       #include <dt-bindings/pinctrl/rockchip.h>
>   
>       i2c {
> @@ -108,7 +109,7 @@ examples:
>               dovdd-supply = <&vcc_2v8>;
>   
>               rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> index 3368b3bd8ef2..5732657e1484 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> @@ -103,6 +103,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/px30-cru.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>       #include <dt-bindings/pinctrl/rockchip.h>
>   
>       i2c {
> @@ -126,7 +127,7 @@ examples:
>               dovdd-supply = <&vcc_2v8>;
>   
>               rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> index 2b6143aff391..24787c9aa155 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -72,6 +72,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>         #include <dt-bindings/gpio/gpio.h>
> +      #include <dt-bindings/media/video-interface-devices.h>
>   
>         i2c {
>             #address-cells = <1>;
> @@ -87,7 +88,7 @@ examples:
>                 powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>                 reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>                 rotation = <180>;
> -              orientation = <2>;
> +              orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>   
>                 port {
>                     endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> index 20f48d5e9b2d..56fb5f18f07b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -69,6 +69,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>               dvdd-supply = <&camera_vddd_1v2>;
>               avdd-supply = <&camera_vdda_2v7>;
>   
> -            orientation = <1>;
> +            orientation = <MEDIA_ORIENTATION_BACK>;
>               rotation = <90>;
>   
>               nvmem = <&eeprom>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> index 6050d7e7dcfe..b4a88eaa7ef2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -74,6 +74,7 @@ examples:
>     - |
>       #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>               pinctrl-0 = <&cam_front_default>;
>   
>               rotation = <270>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>               port {
>                   cam_front_endpoint: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> index 7c11e871dca6..69a37ff68db3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>               clocks = <&clock_cam>;
>               dvdd-supply = <&vcc1v1_cam>;
>               lens-focus = <&vcm>;
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               ovdd-supply = <&vcc1v8_cam>;
>               reset-gpios = <&gpio_expander 14 GPIO_ACTIVE_LOW>;
>               rotation = <180>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> index 060ac6829b66..db9f0c15576c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -105,6 +105,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -123,7 +124,7 @@ examples:
>               reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>               st,leds = <2>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> index c6673b8539db..48db22ca4a7e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> @@ -107,6 +107,7 @@ unevaluatedProperties: false
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -125,7 +126,7 @@ examples:
>               reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>               st,leds = <6>;
>   
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>               rotation = <0>;
>   
>               port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> index bc339a7374b2..4a66cb711372 100644
> --- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -173,6 +173,7 @@ examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
>       #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>   
>       i2c {
>           #address-cells = <1>;
> @@ -196,7 +197,7 @@ examples:
>               vddgpio-0-supply = <&vsys_v4p2>;
>               vddgpio-1-supply = <&vsys_v4p2>;
>   
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>               rotation = <0>;
>   
>               sensors {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
