Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AB355026;
	Fri,  9 Jan 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948907; cv=none; b=OWp4bOMCYnAPuoCg5LoC+A7EyzHoW0LMCfNZ8VBDL7OrSxcdkBieCA3o3M5Zas8G7ndI9XdysLP4gYh09p4cRZATy2qbQt68V/PhWVmp7plhyC7qZc37TBYKeV+quOQHe3hmJtop1L9nSEwPYGoLMfu2wq3rgyg4VjkX4eonc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948907; c=relaxed/simple;
	bh=QbLtberiGgcqv/BaZ/cK9gOIjEj1x/duTqbhJ+4n+mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAa4S8xPRVncHVgGsdpJ8z1ZGAWIJnZIyYCgTWerFDLurn6Vmb1Z8lTRG+e0N0T4tXrPUJdmTJIcGH3uNjsQNxSu7plIR+EJEYVnb2Ha/8fwW6MuyzfxtRbr3uA0jEGjxDoICOd9CYXk61gcY+OjaSwstPzqkFASPQC0FT0aDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sujckARs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sujckARs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A66C4CEF1;
	Fri,  9 Jan 2026 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767948905;
	bh=QbLtberiGgcqv/BaZ/cK9gOIjEj1x/duTqbhJ+4n+mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sujckARsFo4Z8eBoiQ2gfdXSmk08a3kLzFFlwi5GFv/Bn7JjQ1AFubaYEBFsbVeto
	 Z/AFHNOZrpnDyeTmWZjhRyOTxf/2ZDHIWhJ6LaN4TsuuZnQ/ypWAivptNaRakp2w8z
	 oN/3KxIgnLvTbkuNZzj5yGdzM8sQX9b3PN9+j2LVengJheYPcD4OeREkOHopktaNUa
	 BekYq14bmE29Yn0sHI2NFV/9jp92dXmb1cT/Npf30dh6B6a7Ei6VWiYXWuEFtK836m
	 /EGYdvkyk+/4tL9imDVBO9cQS4jkB8nJRh99RLSCAT8/zXChgBiDIpL2phvdyJhjaJ
	 RpK4k+koCOwFQ==
Date: Fri, 9 Jan 2026 09:55:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
Message-ID: <20260109-steel-chipmunk-of-courage-0d7feb@quoll>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <20260108143158.351223-4-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108143158.351223-4-jonathanh@nvidia.com>

On Thu, Jan 08, 2026 at 02:31:58PM +0000, Jon Hunter wrote:
> Various boards that use the rt5640 audio codec define a 'port' child
> node under the codec node to describe the interface between it and the
> SoC that it is connected to. The binding document for the rt5640 codec
> does not define the 'port' child node and so this is generating warnings
> when running the DTB checks for these boards. Add the 'port' node to the
> binding document for the rt5640 codec to fix this.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

