Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E926330651;
	Thu, 26 Mar 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513853; cv=none; b=JF1dMCk1DOAJeTyinAPI98j2ZVQj6AXapkQdzJMUSprc2+UIJEdO1CkngCHTD91o5mgI7iESqEVuV1HktAIOc1dqB26A72KRlpOf/r9S4NYp4dwGcFWUz6NDP0jEeaKJxJWkNbnjmWqglD11KeBPiczzVS5TYjvNE+wjBw1xgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513853; c=relaxed/simple;
	bh=aXZLmu1r0N3ZiLsyHB3RIQpexKASDNHCMInj5liYXRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrmsDtd96jdkxgZuW5Rx6incevmPfNjcx3uSatQlfKu/x/VjokGmjQR8tBd9kIMuLUBK4vEefLSlNh1s5C6pSSTLXC1iqvTGMuyUQr/joaaJq4n0ud8PZoUZ41XylxqwPYPnTxCc2eHHNUBOQLjN2tKVPd2WC4eazqihbI96DUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/tzRESl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/tzRESl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9B2C116C6;
	Thu, 26 Mar 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513852;
	bh=aXZLmu1r0N3ZiLsyHB3RIQpexKASDNHCMInj5liYXRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/tzRESlxqaOoq+s5j7Z/OeSf/tdF8xOuX+QylNrstiKdyzhLj9TzCP9+OeM5W1Sx
	 NmA1TD2D0fQ9xm3Qf47z1ABPjxM41tzwJZnDxF5Mi0lpFOEk6JRabKceQLSt6AnAMt
	 0POmGWJv8b0qIsg23HhzdtrDaDz0DTiTP1HcxzlkRBvPf5An67LeXQynt/5dAWKkZV
	 d10jO3Fn7Wjw27EdxtPqEYq5WjyBLm8FrgAUi22RekkvM4uGHnLOWnFlCvoEodRueh
	 w2XdqM8vGQH5D93u4AUqXcHkgHczWq8vh0nJCq4gyWLGHHXKfFslHcYQgK26Nwnef3
	 kArB3bzF37wpw==
Date: Thu, 26 Mar 2026 09:30:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V3 3/3] arm64: tegra: Fix Tegra234 MGBE PTP clock
Message-ID: <20260326-fractal-stirring-barnacle-4f3b7b@quoll>
References: <20260325135811.148480-1-jonathanh@nvidia.com>
 <20260325135811.148480-4-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325135811.148480-4-jonathanh@nvidia.com>

On Wed, Mar 25, 2026 at 01:58:11PM +0000, Jon Hunter wrote:
> The Tegra MGBE PTP clock is incorrectly named as 'ptp-ref' and not
> 'ptp_ref' and this causing the initialisation of the PTP clock to fail.
> The device-tree binding doc for the device and the Tegra MGBE driver
> have been updated to use the correct name and so update the device-tree
> for Tegra234 as well.
> 
> Fixes: 610cdf3186bc ("arm64: tegra: Add MGBE nodes on Tegra234")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

