Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80188212D7C;
	Fri, 31 Oct 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916760; cv=none; b=Ugd0dPcre2zesCcawBHpNvK+mV/eKOeMs3hlx5mifx0sNB/1s9PbNf31i0lNQ2PIMSuEoIoFTM7YR2Uqps+N0MVsXrWglMs0KAwJkWz+1TMvGsnrxaiMh2UvCkTDfmP9ccRz0SAk/r/2FI89SUDFyQkidPjzwivpBGQnfXdvJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916760; c=relaxed/simple;
	bh=g9RWQD8D4O1UlN5vPyBMjyczbtK5gnAPjxg/+rIXUAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvNShF3O9hVYJr/OYUNdUPHuV0/H7J4TFJFrf9VoyMSzFHqgVdWrru5s3LfIlZD0RhOgMFddQSTBvWH0/SqNzLT4ykj5O/SdEdJFlil5N8ZehQR8tv512YyI8ZEEfIpxcqU28BEXecxoGMsUa5meypjC6eNGc9ANwov/38s08x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnwBzzqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnwBzzqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56DDC4CEF8;
	Fri, 31 Oct 2025 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761916760;
	bh=g9RWQD8D4O1UlN5vPyBMjyczbtK5gnAPjxg/+rIXUAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GnwBzzqhHp52Vo1y7cVsLrM5uxT5VS/xlZjCpOGGIAPiMQqE9sRpqhjUqq/4VsL1Z
	 FZTw3XywHcO6vaGJPsIo5o2TnPasBWXXBVuOLkVejHeFsqyF8sBGkk0eZOrJqoPEm4
	 tkEB7ehAu8LFdhks2kIRseqXT0MksTVJlUrLzF/9yn42nRBmdRSIUsPmKvIAmuP77L
	 aM39UlOy+qONHzA88MDjTlnw7JxYt2MI6JZqrvXmTbuu5xgzRK08QR4cTDG66fd4qo
	 mKq9hfeqoAoMWDv28kNIWpcUDbMMhG/5NIgYp4JdFkczxMuxbCW9kk1Ru6+zopsarP
	 uDWvO9Kkzhs8A==
Message-ID: <865037d1-c89f-4142-a66f-3283c17bf533@kernel.org>
Date: Fri, 31 Oct 2025 14:19:17 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] memory: tegra210: Support interconnect framework
To: webgeek1234@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251027-t210-actmon-p2-v6-1-1c4bd227d676@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2025 18:48, Aaron Kling via B4 Relay wrote:
> +
> +	err = dev_pm_opp_of_add_table(emc->dev);
> +	if (err) {
> +		if (err == -ENODEV)
> +			dev_err_probe(emc->dev, err,
> +				      "OPP table not found, please update your device tree\n");
> +		else
> +			dev_err_probe(emc->dev, err, "failed to add OPP table\n");
> +
> +		goto put_hw_table;
> +	}
> +
> +	max_opps = dev_pm_opp_get_opp_count(emc->dev);
> +	if (max_opps <= 0) {
> +		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");
> +		goto remove_table;
> +	}
> +
> +	if (emc->num_timings != max_opps) {
> +		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
> +		goto remove_table;
> +	}
> +
> +	for (i = 0; i < emc->num_timings; i++) {
> +		rate = emc->timings[i].rate * 1000;
> +		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
> +		if (IS_ERR(opp)) {
> +			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
> +			goto remove_table;
> +		}
> +
> +		dev_pm_opp_put(opp);
> +	}
> +
> +	dev_info_once(emc->dev, "OPP HW ver. 0x%x, current clock rate %lu MHz\n",
> +		      hw_version, clk_get_rate(emc->clk) / 1000000);
> +
> +	return 0;
> +
> +remove_table:
> +	dev_pm_opp_of_remove_table(emc->dev);
> +put_hw_table:
> +	dev_pm_opp_put_supported_hw(opp_token);
> +
> +	return err;
> +}
> +
>  static void tegra210_emc_detect(struct tegra210_emc *emc)
>  {
>  	u32 value;
> @@ -1966,6 +2222,14 @@ static int tegra210_emc_probe(struct platform_device *pdev)
>  
>  	tegra210_emc_debugfs_init(emc);
>  
> +	err = tegra210_emc_opp_table_init(emc);
> +	if (!err) {
> +		tegra210_emc_rate_requests_init(emc);
> +		tegra210_emc_interconnect_init(emc);

This looks like new ABI or did I miss something and it is already
documented? If so please always mention in the changelog that bindings
are already merged to master tree.

Same question for earlier PM OPP.


> +	} else if (err != -ENODEV) {
> +		return err;
> +	}
> +
>  	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
>  				

Best regards,
Krzysztof
