Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B940DFDE
	for <linux-tegra@vger.kernel.org>; Mon, 30 Mar 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871196; cv=none; b=rKELrJM7AmtSbiyGuPVIohhKx9+Vh77rXYv6ySwXXgoXeqjRRm2Z+PYwX87FkXDFDC3sqLhhp06N9D97brhFJR+RgCK4rVZLGq+/nWcDZxZsKsWD+Tggf0S/PxpO8TCqFi7W6dT0t+cX35f8JA49nTMh6HUmp4o9B93XOXwgbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871196; c=relaxed/simple;
	bh=vNBRaBmxUML/9tvCHr/F0jTWJtIo36Ls04uYN9WKbQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ho/nCtT2QrDSAt5tQP0U7Ef4vLI9D0aqClQxUudwt77UYpNoPyZSP6szQs9NTH6M6pirImjV0oa4JfpySxdETu+VkQo23Xl0yJUif82kpx7z0dT8cVtSX7dw5sT4gCvJ9DUVWdW1w+sM+h6LOGrHW8r0cLoPkz9dWYh54zU6PD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzEby+oS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzEby+oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352A2C4CEF7;
	Mon, 30 Mar 2026 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871195;
	bh=vNBRaBmxUML/9tvCHr/F0jTWJtIo36Ls04uYN9WKbQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RzEby+oS5hA4ztdP34lTC7HWqKiGaf/mX4Vhjw+MUqBJEDsuhk5mFAmOzDfkKzvuQ
	 +QhapPlgi64ILY8d/7zHw7il3PFnTdTlL4zSIpbhn9NslzspcGbnrSAhPuhG9FJF1F
	 8T+gkBHx7KNETahPZmqOtH1KfevNMi/+VU/zIWqKiSST9cGYV72b+yQZVbLPoAns/d
	 8dkvNPzp4OvfpBw/Iiz53+m8fBuYeamO0Mge+OFJWmj3KFrmvNURy9lVzNBxbcv83V
	 exJkhvCkNd/i3SsEPts3FG20y23kIyf4oe84eBrtvnYrvkO9weKJGQd8/vTMNR5NRi
	 PI2P1yAPaGAug==
Message-ID: <058d79b7-3d4c-4f0a-a95f-b2e3582a4fa7@kernel.org>
Date: Mon, 30 Mar 2026 13:46:32 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
To: Thierry Reding <thierry.reding@kernel.org>, arm@kernel.org, soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-4-thierry.reding@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260329151045.1443133-4-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/03/2026 17:10, Thierry Reding wrote:
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v7.1-rc1
> 
> Various improvements for Tegra114 boards, as well as some legacy cleanup
> for PAZ00 and Transformers devices.
> 
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       ARM: tegra: paz00: Configure WiFi rfkill switch through device tree
> 
> Svyatoslav Ryhel (8):
>       ARM: tegra: Add SOCTHERM support on Tegra114
>       ARM: tn7: Adjust panel node
>       ARM: tegra: lg-x3: Add panel and bridge nodes
>       ARM: tegra: lg-x3: Add USB and power related nodes
>       ARM: tegra: lg-x3: Add node for capacitive buttons
>       ARM: tegra: Add ACTMON node to Tegra114 device tree
>       ARM: tegra: Add External Memory Controller node on Tegra114
>       ARM: tegra: transformers: Add connector node
> 
>  arch/arm/boot/dts/nvidia/tegra114-tn7.dts        |  13 +-
>  arch/arm/boot/dts/nvidia/tegra114.dtsi           | 221 +++++++++++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra20-paz00.dts       |   8 +
>  arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts |  21 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts     |  23 +++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts     |  33 ++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi      | 174 +++++++++++++++++-
>  arch/arm/mach-tegra/Makefile                     |   2 -
>  arch/arm/mach-tegra/board-paz00.c                |  56 ------
>  arch/arm/mach-tegra/board.h                      |   2 -
>  arch/arm/mach-tegra/tegra.c                      |   4 -

Why does the DTS branch has mach code? Tag message mentions legacy
cleanup only and such cleanup should not cause mixing independent
hardware description (DTS) with drivers.

Best regards,
Krzysztof
