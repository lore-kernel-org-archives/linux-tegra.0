Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A85695;
	Sun,  4 May 2025 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746365882; cv=none; b=bXr4UtLpHGHkKPUrj4lg2Pz5rjnE/YCKz7BvYJzG4pPp0GtL40hrBt3Hez39Yh53t0GgTV1WPfq6YXjv/CgsUTnYZcPTE5R5MJV9kUNA6fUhYq/Bkar+XfO5IotDVz4snaGYeGT9oHvgy2veAvpiygZLruPVFHaxrrki/NBNY8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746365882; c=relaxed/simple;
	bh=TKviVJjXWZywKKGT0eWF4OOA/jY5DJYyKQaraAnPVrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYvp4ZSxEXzPJFLOkDJgeZaso7tNGqHITZ5QrouEUNFjqgsJ2vclyRrrs4k35UFj/OzySpCOTx5Vyy3NYqLudEVHW+aWy8YtuSHZjkw6VM+iKub54lqebhrQkieK1DMqKb7a9VenclvQ3BOAE4g/UDIag+k+v6iB+D04IiS9z+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ekp8CYmA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ekp8CYmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A80AC4CEE7;
	Sun,  4 May 2025 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746365881;
	bh=TKviVJjXWZywKKGT0eWF4OOA/jY5DJYyKQaraAnPVrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ekp8CYmArOY5y7h/PYShCXjxWo91+3/1XFQho11J2OivXI9tGjsEN4UvZ6FfD1Gir
	 XOEc+YykRuub0IlDu3FsbgfayCsqsAckP4ZzX3ZRaKe7dqGXmedmzEkyK1JcSMpxdY
	 /8PtmRYgs5BJ9jFeTT26DrOa64I8hDRCAH1lP0MCVljx6u83XaycwCNCCuwySzKF1k
	 ujAyY1tX5nQmELZAMW2NT0OcVIQ5014TdJuma60nKrwmZGAWZDC9IY+ZpYcx4gnYbO
	 L7oCzfxliNIC+veMf42rxFlRpUr0Q42LcyF3KVttXqDGs2zku/yynPUu0gFxgguOfL
	 bp6OTGE/7k5Pw==
Message-ID: <0dcf786f-d93a-4526-bdc6-e11d59347f98@kernel.org>
Date: Sun, 4 May 2025 15:37:58 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra210-emc: Support Device Tree EMC Tables
To: webgeek1234@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250430-tegra210-emc-dt-v1-1-99896fa69341@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 19:52, Aaron Kling via B4 Relay wrote:
> +#undef EMC_READ_PROP
> +#undef EMC_READ_STRING
> +#undef EMC_READ_PROP_ARRAY
> +
> +	return 0;
> +}
> +
> +#define NOMINAL_COMPATIBLE "nvidia,tegra21-emc-table"
> +#define DERATED_COMPATIBLE "nvidia,tegra21-emc-table-derated"

No, you cannot add undocumented compatibles. Missing bindings.

> +static int tegra210_emc_load_timings_from_dt(struct tegra210_emc *emc,
> +					     struct device_node *node)
> +{
> +	struct tegra210_emc_timing *timing;
> +	unsigned int num_nominal = 0, num_derated = 0;
> +	int err;
> +
> +	emc->num_timings = 0;
> +	for_each_child_of_node_scoped(node, child) {
> +		if (of_device_is_compatible(child, NOMINAL_COMPATIBLE))
> +			emc->num_timings++;
> +		else if (of_device_is_compatible(child, DERATED_COMPATIBLE))
> +			num_derated++;
> +	}
> +
> +	if (!emc->num_timings || (num_derated && (emc->num_timings != num_derated)))
> +		return -EINVAL;
> +
> +	emc->nominal = devm_kcalloc(emc->dev, emc->num_timings, sizeof(*timing),
> +				    GFP_KERNEL);
> +	if (!emc->nominal)
> +		return -ENOMEM;
> +
> +	if (num_derated) {
> +		num_derated = 0;
> +		emc->derated = devm_kcalloc(emc->dev, emc->num_timings, sizeof(*timing),
> +					    GFP_KERNEL);
> +		if (!emc->derated)
> +			return -ENOMEM;
> +	}
> +
> +	for_each_child_of_node_scoped(node, child) {
> +		if (of_device_is_compatible(child, NOMINAL_COMPATIBLE))
> +			timing = &emc->nominal[num_nominal++];
> +		else if (of_device_is_compatible(child, DERATED_COMPATIBLE))
> +			timing = &emc->derated[num_derated++];
> +		else
> +			continue;
> +
> +		err = load_one_timing_from_dt(emc, timing, child);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra210_emc_parse_dt(struct tegra210_emc *emc)
> +{
> +	struct device_node *node, *np = emc->dev->of_node;
> +	int ram_code, ret = 0;
> +
> +	if (!np) {
> +		dev_err(emc->dev, "Unable to find emc node\n");
> +		return -ENODEV;
> +	}
> +
> +	if (of_find_property(np, "nvidia,use-ram-code", NULL)) {

I cannot find the bindings for this. Where is your DTS? Was it tested?

It seems nothing here is documented.

Best regards,
Krzysztof
