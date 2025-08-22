Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68169219A8D;
	Fri, 22 Aug 2025 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874813; cv=none; b=bTc6UD6lwjbzQTpxilI00bkj1rw2Gix3DehapO6t3fT4O3GZ3+5h24YkyZIkBudJgxvC00WCWtuX0A/vEjRA3t5EZpcBD0i0p4s7n25f5gw4tw/Tj+TBhxH2qrkIf5CZffvN6NgEjRrOr4lfQ1UQOvI2LGeFS8ViSzgg6OE3vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874813; c=relaxed/simple;
	bh=6om6cMm8aDeUHA8oJeNHUJjynL3ew4PBiTwAcGYXIpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPPtnvW19HnT4fTxDpKp0+SHsIPppaaPbxT85GcGShMtKDMDf8Mie35v8uzVvMM8IvVGfBvEbmWxWNuPdwoXLnJ/dV4q1PNWV0LI9De8yiD+u9mT6ASZm0HNgghEblIuRC8C0sZ1bSQCS98TXzhrRQKVVbfQAGuMcyn9SaDohes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5icBuSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5icBuSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB908C4CEED;
	Fri, 22 Aug 2025 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874813;
	bh=6om6cMm8aDeUHA8oJeNHUJjynL3ew4PBiTwAcGYXIpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5icBuSUqIJ+Ep905dJ2qVFgn6x0SDIvf3WD34Fts4ffYkfm3EiAoaozwuer8Z0ws
	 klok80c9JUQwP0wwBI6+jhMZJ/a0kF4mrZovOmd282unuXUveFZ42Ze0rBs5xsirzO
	 ACu9Y7q0I3vCjmngv+zIlNwclL0bUYunm0LfLM/baL67bNZIgDBZLgAY7yGZf3FxjG
	 +j4JVWxdR66IW8uxRiGBm8J/ZawKSt/Krl4zDrRDtXWzwafiiLegePL14nDEQCCrSA
	 am5fvlSO18t6NK8jvvMXzs1tEpFnJCwZIaMb0xIvpGMD0I5/8w80KhiZR5OVmJaUkA
	 7SXr9QDSiSjKA==
Date: Fri, 22 Aug 2025 10:00:11 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: memory: Document Tegra114 External
 Memory Controller
Message-ID: <20250822150011.GB3791610-robh@kernel.org>
References: <20250820151323.167772-1-clamor95@gmail.com>
 <20250820151323.167772-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820151323.167772-7-clamor95@gmail.com>

On Wed, Aug 20, 2025 at 06:13:20PM +0300, Svyatoslav Ryhel wrote:
> Include Tegra114 support into existing Tegra124 EMC schema with the most
> notable difference being the amount of EMC timings and a few SoC unique
> entries.

Same comments apply to this one.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../nvidia,tegra124-emc.yaml                  | 445 ++++++++++++------
>  1 file changed, 292 insertions(+), 153 deletions(-)
