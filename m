Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A0E3F7867
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480152; cv=none; b=khxByQi5jrTSmZ9R5APg7OjBxvnKH/0dSYVxlTtNifC5I1OvI7ipwXDqqrWb6HDCEMLxC8xcD59bGvGNRohI742a7yPSzE9eIrnOV7kb1neiC5Ya1j8ntwBVgruDC0UZRB0jbqHtkx0XeNN+RymZMi96XWNc8wyM7zv7EAneylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480152; c=relaxed/simple;
	bh=q2OQEI6d+Tec35kArN+O+0T9NYgl5oyAH46QKy9KqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmjvr2XbNIhdtYLb+hRdSuAGJpSg2/g7Z8keQJUw/6TRxZe8CXGpb/3hDkaMRYuXkSROmvLWxloXWyHlj6bEuI5VnDYqbMr+KrI6yF31eyzFKhBH3F9QAPXFrct27/ECu6sW0bqwFDTPs36usCu9M2yPE5qXnIDwU36fbedxQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dE01KKpC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dE01KKpC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ad699b182dso99589e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 06:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480146; x=1783084946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=dE01KKpCwvD6mEFfkrhc5h0fDAQbU4VSjs3tJ5sOQCiMhxzk1s6GNBVRupxnVxUz3n
         gkzkzOLpRXo8fB4bhseoPyzfFkzzUc6Ws38uMS7a5upffH/jM76fOwFjJsb2Sw6ovTSn
         yJCvcY99gLeHImZDyPJQoV+rfA4CtMNMDMtzOvvebqegMcE73CdMxYOom425sC544/na
         QHqkRpcYYfCD7qwIwSzONsEWezu703GV5wVFnlDhDBjQ2BnIb2pJs2tBaNeQka97O9xv
         VjJZAei8EenEIHPxKdCMLQOCrxiG25nCW4EFx7EUCybYeBpqeSeuVfauR/VXAcucOwWq
         TVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480146; x=1783084946;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=R4ybBikzPVrPEOHRls000TSCrdYq9gfotw1q+pCelQQKJ1mbZCR2xOFwKZ758SxPBI
         2RIWXDu5Jk9ibSgUFhEHr6n7UmAr+vjQshgPY8tl9MWWTje44k+yE0eCfHKXT1Q9Nhqi
         Cl7mE1Jyz1QBXp+3GG9Y4Qbb237Zt7agxFupAB+WviIfx5znaH450l6cyJMgdwR/t5KR
         9ogSd6RPFOawtJj0eQXLXL/GL92C6aWlrGt8KxVFhSSDK5Oupf7BPAZRUdHU78BMABBb
         KcUKfIshaoIA4YzmvqZsXo5TmGH6w/TopL2ZqOdYxaaWUpKr0hCDZieG801qRrjq8mCQ
         xv5g==
X-Forwarded-Encrypted: i=1; AHgh+Rp5+mkrF4OiPBgLYenldSqwIRjWQ8KoVfYQ2ek1Qb4jJZOQFQ2CRBZVpwD0IMFXD3bk1ZHZfbdWPj7NpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza21a0zBgz8v+lzIKZ6m0AuWiqHYCcNZBbxLONlDNjSuZOUII3
	Zq3BdzJ+Rw6ayQdj+GoqptzB9gM5gjg4fFqi+QUjEI5ke1PVICgXOthLobuC9+C95B4=
X-Gm-Gg: AfdE7cniTr3UHB6NbLLSU8oFAigpdFzy0JgCge4FO/7ldN4xNuoVHVGCFq/zRIjJ3zr
	dKdGRAuUoKGHzbbkXvb/hBWYGbwkMpI7T/Np5eOVqsGdv9inVNOgxZu+iWagPrWJQ4P2c4T4cxw
	SJECl4QVqOGUiWgJpzEc/kw6R+qEHIgvXQHulcaJMx/+mLM4nRm9GuwG2z12eMBCcM9H+lNrgYb
	ezEo8Z/6osU8yJ3ir/mr5eWer55xQ+kVvYPVJ3fk2w5uBS+Cy6r2IMV7e3z+ZhQGOxhl+CTOuyH
	EgXf+L7u+ZDikhniDWuBIgwf6ZjIGeuR0sqVrXyDhbzTZIdaG5mwo6E4QF1pb11YU4IW7Gw2jM/
	SDJZ8sMi/aVWvRkrzKAq60DDFycmceet4Rm8B7SN+L3HEyKWVxxv7nIgv74wkI0MPDXPIdiBSTm
	Tzqz+qefRlcwetCUgf2CQpQrKnyC30LxuFdGroLhDOHjFcvYnIe06qYnlnAsdaDn46SQU=
X-Received: by 2002:a05:6512:1252:b0:5ad:4ead:72d7 with SMTP id 2adb3069b0e04-5aea1f630cbmr1249234e87.5.1782480146180;
        Fri, 26 Jun 2026 06:22:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea5195050sm816328e87.83.2026.06.26.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:25 -0700 (PDT)
Message-ID: <eaca986e-81d5-44f7-bc64-8e89e5a1f823@linaro.org>
Date: Fri, 26 Jun 2026 16:22:24 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
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
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29f..d79be22108c8 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -701,7 +702,7 @@ camera@10 {
>   		pinctrl-0 = <&cam_mclk3_default>;
>   		pinctrl-names = "default";
>   
> -		orientation = <0>; /* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   		rotation = <270>;
>   
>   		port {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..543fc691fd3c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "sc8280xp.dtsi"
> @@ -682,7 +683,7 @@ camera@10 {
>   
>   		clocks = <&camcc CAMCC_MCLK3_CLK>;
>   
> -		orientation = <0>;	/* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		avdd-supply = <&vreg_l6q>;
>   		dvdd-supply = <&vreg_l2q>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index 0f57b915186b..375b3c0edea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include "sdm670.dtsi"
> @@ -460,7 +461,7 @@ camera@1a {
>   		pinctrl-names = "default";
>   
>   		rotation = <270>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		port {
>   			cam_front_endpoint: endpoint {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
