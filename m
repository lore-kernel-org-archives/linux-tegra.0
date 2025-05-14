Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A41624DD;
	Wed, 14 May 2025 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251181; cv=none; b=IuQygpzdgFSPfOiom6lIviF6PMAs03bDjq4Sv9wCq97GSmyWmrOUvw7416KAb8MfVqnlD1JPiQiGbJSQ5E4GJpSfoNeNd3qVrRY12Nw8i5Fqfj5sqg85lf8F/SqIJuDO2oDgSXg7n1NHWwHrh3ReQfMtDk0SO5VJMVooldZErZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251181; c=relaxed/simple;
	bh=8V2EkmTjcMCH4OEHIKQotnrppd46LM8W6gcOF6PKQOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9kY6z2L+m2+xEu+SLUJ8dWJQYPeNTHhhMp1PzetEDxy4O13TlQoWtYj01AwAjXO5mdO+5oxu8rViDRSm+8Sr8h9G5PPm0RBKoc6O3js4Pow4hBLuaCZtawKLHwoQHn0cxGJNcFp1v0RFbWP9x/4DviujMiqpczQF5sAPjQSVpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilQ2sw9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilQ2sw9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB894C4CEE3;
	Wed, 14 May 2025 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251181;
	bh=8V2EkmTjcMCH4OEHIKQotnrppd46LM8W6gcOF6PKQOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilQ2sw9tgHXJjch9owrzHEnuV5XAgAJ6gK7QllLLbrQ71gZVF+fJbXMA/LyUNDadq
	 +ucU//BRSs8j93iF/N5zHJUxHNPC+pZI77WBHZ2FTUP/nNZNSY9VgtUjloQJG7xTSU
	 ljX/wXIOCrX21HMazCnhSvGA+/8JmyaeZjdymREOdAK/3S3bCSAl7U38Kw0/aJ7rFl
	 tfgTTgT9mRbzfKetJaKc9o15Bx841OCSPPKMClkYdR9SWlwVBkcJEdjuXuFxZe9q1P
	 6EhqQqPY67dgS+egod89GXvfQ4hUe1WQt3Ga3QBocOQjynz6uNrVsnia+ZjBmpGOuw
	 v9FwxIgsdYfEg==
Date: Wed, 14 May 2025 14:32:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: tegra: Document P3971-0089+P3834-0008
 Platform
Message-ID: <174725117885.2871934.9920497627228392092.robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-4-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-4-thierry.reding@gmail.com>


On Wed, 07 May 2025 16:37:57 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an engineering reference platform for the Tegra264 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

