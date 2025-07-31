Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01BB22FF2E;
	Thu, 31 Jul 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753983435; cv=none; b=jYJ+MvibBavrqlLrN+5hHSQdruOO5scu3SrzmR+kBa+w7vd1DR7UogzyRU075FR2uFL/yn0iLNhdpkudA2k4UaHBRHYEaDxZarmIsfmVMPyuHbGMEQpuaourZQ4gCFiIayRKJmT+IfvSbRWRdKrXx1lNoWJn9YpOPJcxtiWdxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753983435; c=relaxed/simple;
	bh=ywlvPM717dLhVttjQEnvzvv1noJR+G4RB/Fn/JLZAQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C19i+FqgOVIKR+c2theVg/FmWDg/Qo1wpAizT8dX7KL+bEnRZXsnVOprGqEfrleEppL0YvWjODxHAu/MFAr713MeYqNy3waHInY3byZDW8HMkwd1EiEjPmb6LkPOAZAHEZsnc9QOthpqUepadNcIm+j9DNerlc0ZPnDsCdN7dmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAvimPmH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAvimPmH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E45C4CEEF;
	Thu, 31 Jul 2025 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753983435;
	bh=ywlvPM717dLhVttjQEnvzvv1noJR+G4RB/Fn/JLZAQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAvimPmHvyHLSkWLKue9aYm6eJpiGPpaftzUIyA9Socrc35CEJARj3SDFWyC7zyN5
	 mLg6zpHtK0spOpe68k8DIW6eNaU6lqLm/8oIEs/j1FBp/ppvB84kRIL9X5Z6ySTi0i
	 V4x9QfOhfQZCfm9jSTPawAYLXx6rAlXG5Z70GXudBwLIAmH9waUUaV/cYd3T19ejPl
	 iIhYHsxs6YwbJnjwQMakrL2z6DtiUCWEF+5p/hhaQXs3GcHrVh7HDquISrlXvqNQ7u
	 eAPIPfCmvrfMgIoTarFV4P7bLhXM0UXEmNjSz8b4C6cnTzmiBi/d8bv7XOEgbD0iJ2
	 +LEK98xsdgrTw==
Date: Thu, 31 Jul 2025 12:37:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, digetx@gmail.com,
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
	ldewangan@nvidia.com, conor+dt@kernel.org, thierry.reding@gmail.com,
	linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
	krzk+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256
 I2C compatible
Message-ID: <175398343346.2270652.1269106467992234487.robh@kernel.org>
References: <20250731091122.53921-1-akhilrajeev@nvidia.com>
 <20250731091122.53921-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731091122.53921-2-akhilrajeev@nvidia.com>


On Thu, 31 Jul 2025 14:41:21 +0530, Akhil R wrote:
> Add compatible for Tegra256 I2C controllers. Tegra256 consists of
> 8 generic Tegra I2C controllers similar to previous generations.
> The parent clock frequency is different in these controllers and
> hence the timing parameter values are different from the previous
> ones.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

