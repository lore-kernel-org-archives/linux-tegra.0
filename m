Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967131BC82;
	Wed, 17 Sep 2025 02:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758074948; cv=none; b=fEoiRVHPEKQJG4TcLeMIVLwYF/VRp4XKRfKnSGRCaC/admnzGCo7X9Z4QVepeoWcW0XFfcGAmyeaCLK/C9gwVSK9+oEEAKzIdUiIelh73Y7R1aBB4ZhdVpXRw4mbRQS6+ietjhevavCVafOjvx2DA+74BV+jEJkyYkreVjnS0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758074948; c=relaxed/simple;
	bh=Cjqf6mGtb6VX6p6jJ6wSTE1xZ6nedQOeEPso1+ZAMGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQb8Wz3e12Xk0mUWNuebl7UTYZSK4lNXoAQtO+4JwnRkSnI5HSDhIWf54yXifN5gicd+5TnXv5TkfqCcL90ZGpt4FHeVO9CXQH7qtwhCmI1KRmXOj4wMgWJyDSngCKA/RyYdAfschEfYfmL7h0M/5E8j7i0V6gCTdEC8UchOM+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eizyX/L1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eizyX/L1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF97C4CEEB;
	Wed, 17 Sep 2025 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758074947;
	bh=Cjqf6mGtb6VX6p6jJ6wSTE1xZ6nedQOeEPso1+ZAMGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eizyX/L1kqStAXq6+JO8vZ1RuNAGS7gkiEAfXypoNRMr9ZwQG7iM0XD73WRYa4xVm
	 GoQSFg0l2Dg0UJG/l+94ZignDi6L6xnlt06gwaVW6pBeond0qTWE/U1eaorWrbMhb4
	 WGcTIF7yWp+0A+L1B/uPDJASVwg/y9hkP0OBUF+knnDrxankq6kIoHdkqtLLl4cl0O
	 RbxGoYCXYTvXb2msSLIAxuV3AHscdxF3He55snzjKzoXZ2xEbsW8gns2vFpwI24Gxf
	 2I3YmbznTNmhQ98apV0QFrjXgm/Q1+LA2y8e2tkcmgpc+ytJbWv5JzcJssadcX1uwY
	 2JjZETB5CfGJA==
Message-ID: <cef760ee-f74d-4a0a-86e6-020223f79b27@kernel.org>
Date: Wed, 17 Sep 2025 11:09:05 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] memory: tegra: Add MC error logging support for
 Tegra264
To: Ketan Patil <ketanp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250916051754.39250-1-ketanp@nvidia.com>
 <20250916051754.39250-5-ketanp@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250916051754.39250-5-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2025 07:17, Ketan Patil wrote:
> +static irqreturn_t handle_sbs_irq(int irq, void *data)
> +{
> +	return handle_generic_irq((struct tegra_mc *)data, MSS_SBS_INTSTATUS_0);
> +}
> +
> +static irqreturn_t handle_channel_irq(int irq, void *data)
> +{
> +	return handle_generic_irq((struct tegra_mc *)data, MC_CH_INTSTATUS_0);
> +}


Patchset fails building (see LKP report), so I won't be doing full
review, but few obvious issues to spare you from one resubmit:

> +
> +const irq_handler_t tegra264_mc_irq_handlers[8] = {

static

> +	handle_mcf_irq, handle_hub_irq, handle_hub_irq,
> +	handle_hub_irq, handle_hub_irq, handle_hub_irq,
> +	handle_sbs_irq, handle_channel_irq
> +};
> +
> +const struct tegra_mc_ops tegra264_mc_ops = {
> +	.probe = tegra186_mc_probe,
> +	.remove = tegra186_mc_remove,
> +	.probe_device = tegra186_mc_probe_device,
> +	.resume = tegra186_mc_resume,
> +	.handle_irq = tegra264_mc_irq_handlers,
> +	.num_interrupts = ARRAY_SIZE(tegra264_mc_irq_handlers),
> +};
> +
>  static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
>  	.xlate = tegra_mc_icc_xlate,
>  	.aggregate = tegra264_mc_icc_aggregate,
> @@ -290,18 +657,31 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
>  	.set = tegra264_mc_icc_set,
>  };
>  


Best regards,
Krzysztof
