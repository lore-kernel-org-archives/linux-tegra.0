Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295F8F54;
	Tue, 27 Aug 2024 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766652; cv=none; b=NeMmEJOPhe2lTrQ6ItzMY2t6BEl+AfDPTc03vr3VtEjCWDzrCUV1FGqKW+Pxdi9523NIVvgctv4gK4OXWGlFjy21Ja4GM8cryyxd9ZPkSJwlW7Lu672aG/NXRhTenEk2MOdo/uO89H3GuQBBT6F3Y3OkaT1r2mPbfB+KDMjlnmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766652; c=relaxed/simple;
	bh=yyaK86cIMMTd3wpksUlSfN5t/YeeCIjLW+ZTAg0foC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e70Z4QRuVTfzVq3sHAjrnD5Nmc7TLTTRY/3HbQfoyGpU+PYXwESrENt61tPqPIE7OpEWixZJehBGNxFYtmud5lb8cSJDe/Tjh2AUbBnDPEriCLcnrdTEiV+cmDTetXRzCoNdknRGo47demCWQjt5/uTFR0UrM1E59jZcW2oCBi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo3ZzlPo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo3ZzlPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD6C4FDF2;
	Tue, 27 Aug 2024 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724766652;
	bh=yyaK86cIMMTd3wpksUlSfN5t/YeeCIjLW+ZTAg0foC8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Bo3ZzlPohVVBS/ZKvyxFyFyp2cBhnsbxo9SQzyKnOYbsd9I62/PFsT7OIv0wcW+7J
	 QhKdxx2gTghDrpfNkuuHYmzDhUM7jpcJsprjKQenAmzGjF/EfX6j+GmtQ990ypUHsc
	 tWjNFOdobxbggCTId7Sg2L4bbeA3+bgj+KbdyqcjVhXQYTog1AitXi4u3kx8Gs5J6k
	 45tGjHM1sdDy+AQu2FRbIaQimz+6u6wo1pSqz6DjqtCicU6zLz6v/28dBe3jRE20XT
	 VWKYBl3hYkEI7YQZ8zhh8FbAws6VehJQlz6Owpn1+xNkHosQtqPk4ylT6TQE2XbMCv
	 V5gopRNyQjL9w==
Message-ID: <87abe3f1-3cf2-4331-8dde-a422716dd94a@kernel.org>
Date: Tue, 27 Aug 2024 15:50:45 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/8] soc: fsl: cpm1: Simplify with dev_err_probe()
To: Jinjie Ruan <ruanjinjie@huawei.com>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.com,
 herve.codina@bootlin.com, qiang.zhao@nxp.com, christophe.leroy@csgroup.eu,
 thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com,
 ssantosh@kernel.org, petlozup@nvidia.com, pshete@nvidia.com,
 christophe.jaillet@wanadoo.fr, ulf.hansson@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, jic23@kernel.org
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
 <20240827114607.4019972-3-ruanjinjie@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240827114607.4019972-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 13:46, Jinjie Ruan wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.
> This also handle scenario, when EDEFER is returned and useless error
> is printed.

? Sorry, this cannot happen. Please point to below code which can defer.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/soc/fsl/qe/tsa.c | 62 +++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 7fa399b7a47c..fc37d23b746d 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -453,10 +453,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  
>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
> -		if (ret) {
> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>  		switch (tdm_id) {
>  		case 0:
>  			tsa->tdms |= BIT(TSA_TDMA);
> @@ -465,18 +463,15 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  			tsa->tdms |= BIT(TSA_TDMB);
>  			break;
>  		default:
> -			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
> -				tdm_id);
> -			return -EINVAL;
> +			return dev_err_probe(tsa->dev, -EINVAL, "%pOF: Invalid tdm_id (%u)\n",
> +					     tdm_np, tdm_id);
>  		}
>  	}
>  
>  	for_each_available_child_of_node_scoped(np, tdm_np) {
>  		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
> -		if (ret) {
> -			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
> -			return ret;
> -		}
> +		if (ret)
> +			return dev_err_probe(tsa->dev, ret, "%pOF: failed to read reg\n", tdm_np);
>  
>  		tdm = &tsa->tdm[tdm_id];
>  		tdm->simode_tdm = TSA_SIMODE_TDM_SDM_NORM;
> @@ -484,35 +479,26 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>  		val = 0;
>  		ret = of_property_read_u32(tdm_np, "fsl,rx-frame-sync-delay-bits",
>  					   &val);
> -		if (ret && ret != -EINVAL) {
> -			dev_err(tsa->dev,
> -				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
> -				tdm_np);
> -			return ret;
> -		}
> -		if (val > 3) {
> -			dev_err(tsa->dev,
> -				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
> -				tdm_np, val);
> -			return -EINVAL;
> -		}
> +		if (ret && ret != -EINVAL)
> +			return dev_err_probe(tsa->dev, ret,
> +					     "%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
> +					     tdm_np);
> +		if (val > 3)
> +			return dev_err_probe(tsa->dev, -EINVAL,
> +					     "%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
> +					     tdm_np, val);
>  		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
>  
>  		val = 0;
>  		ret = of_property_read_u32(tdm_np, "fsl,tx-frame-sync-delay-bits",
>  					   &val);
> -		if (ret && ret != -EINVAL) {
> -			dev_err(tsa->dev,
> -				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
> -				tdm_np);
> -			return ret;
> -		}
> -		if (val > 3) {
> -			dev_err(tsa->dev,
> -				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
> -				tdm_np, val);
> -			return -EINVAL;
> -		}
> +		if (ret && ret != -EINVAL)
> +			return dev_err_probe(tsa->dev, ret,
> +				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n", tdm_np);
> +		if (val > 3)
> +			return dev_err_probe(tsa->dev, -EINVAL,
> +					     "%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
> +					     tdm_np, val);
>  		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
>  
>  		if (of_property_read_bool(tdm_np, "fsl,common-rxtx-pins"))
> @@ -645,10 +631,8 @@ static int tsa_probe(struct platform_device *pdev)
>  		return PTR_ERR(tsa->si_regs);
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
> -	if (!res) {
> -		dev_err(tsa->dev, "si_ram resource missing\n");
> -		return -EINVAL;
> -	}
> +	if (!res)
> +		return dev_err_probe(tsa->dev, -EINVAL, "si_ram resource missing\n");
>  	tsa->si_ram_sz = resource_size(res);
>  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(tsa->si_ram))

Best regards,
Krzysztof

