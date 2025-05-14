Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA21DF27C;
	Wed, 14 May 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238973; cv=none; b=sx4RxGbxl07jqxE6nCTRXP2RlOM/W43HooTmXO4HT6uxmQm2LZDz4E9oMwJDVkSuDPH0sJd/d6v9nhVEqFS3VUfjQVJiwBsRG9qGKUzqlZLu7ERSfkxRyyP6ihgxn7i9aE+pz11gTZQC+mbZ2MpE+OE/rqNlNomaTSgWKkwkg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238973; c=relaxed/simple;
	bh=brXOYswinxGc9zNxJS+g8Vd8CqyPeWaUnE83d41Ku18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp1xn4tscYlOTLBKk/i6MVgee26mFYowayATe/3nRCs71hwqy2fwjEQX4UsjXw4vDTUY86yk2GOnk3pn1eHCRLpul0W7Okta4HHdgPMSEJTAmIgvUuWnGu3jWs58eVyO5YPYq3OAUsxMJx9YJj4ee388xeKN3iK1dRnBfJpGnik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/fSFZRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/fSFZRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CA3C4CEE3;
	Wed, 14 May 2025 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238973;
	bh=brXOYswinxGc9zNxJS+g8Vd8CqyPeWaUnE83d41Ku18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/fSFZRORoFBup1Snyn+SeKDGYCEECWw363pSW6gBLqgOP9PjK/r1+S+j+S+WrkIu
	 YpZ3zgNdHBWvupgf9o5hIcut2OLbkyRXXAlyzcZiPqcx7LSNEzprV+mVSv9sK9yEUo
	 tAqHQNhJ4/fzQ0tFkZRkY46cEbYIyQoX3P9Xq7k7OKtYekOp+1oN+qUdTt0a8V3t5C
	 jENl7ykzfKl24NETgb53UsoZs8YIRNWSHrxahyx3+N+cDOlomXwtUixe/aGIWUUFQU
	 Y6oEdyZnT3dXP2Bzr7FzJHEVgRsoBPYbdau2fA4xlSXnUf57/nOdAU2aTakaNZ8sGd
	 Q1dIzM5rMJJtQ==
Date: Wed, 14 May 2025 11:09:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Message-ID: <174723897079.2456289.5773292846282460106.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-2-thierry.reding@gmail.com>


On Tue, 06 May 2025 15:31:08 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PMC found on Tegra264 is similar to the version in earlier chips but
> some of the register offsets and bitfields differ, so add a specific
> compatible string for this new generation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

