Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A632BEC41;
	Fri, 14 Nov 2025 18:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144465; cv=none; b=aeg1dCn8rK9qnBmFyhOTZgwtW0Hu+MIuIeQ0VtxenkQhK/8jrqBmGV3TmvsB7xavf1iuEa6d32kSpJXKcUNRTY7Up8zLZWEl2Xh2K5BYurwfUzFl2NeYVdH8S/yv2S3HlsJsYXyjUl+M6lRgjDI0Cut4GnVqhjuZmesqbS1ARuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144465; c=relaxed/simple;
	bh=YRp85zTU54Nz7K2egt1pgnfG1dsAZ/QmKoB5wQG6HOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1taIolkjhTPKAvaXTf+IXCTloE5S/wcW8wSxFxRcdFY/Mh1UaDqvRMNkosgO0rPdqRvmxKwDv/yvMq55qYXlS6jfGotJUQG1Kr7LrVKzSpTnWV8EfAQciDOSOWd0SQ7Odbuf/kQqOcw/5SDpYE0qLfKh6rmpsQwXVBC5IWuon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKxoE2eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKxoE2eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E70C4CEF8;
	Fri, 14 Nov 2025 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763144464;
	bh=YRp85zTU54Nz7K2egt1pgnfG1dsAZ/QmKoB5wQG6HOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKxoE2eqg2NWiHZ82wMldaKUayP+2LBdYp1Zhwe0qZ+sBX1Ofex/0rSXqt+/lMcBr
	 GKHQ/ssW4UF5Z5ZNJkWiKXHsb2tB1j4a4KJok9q/a4DejhvsH3BIUCmK1AcjrMQ8rK
	 SDeao+jvVkcLOfmRsGZII2G9zW3p0rfkyJNtjbv7NcbxEF+mcW9yVZw8jU++ElU+FF
	 6FjxMmdrk42HuB5LYyJZPe0jzYy9pa7mC9KgbOPKUuvRhiXVCtAAHEhWhUULJrNZr1
	 tT03YJVyG/2hw0/HAn1H7ttfa0wtH0j2tRiRQHCpHL9shmf3g4gA3nOuTGphzScB11
	 K9V64uqJy0xDw==
Date: Fri, 14 Nov 2025 12:21:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: memory: tegra: Document DBB clock
 for Tegra264
Message-ID: <176314446160.3849504.15297758784571269397.robh@kernel.org>
References: <20251105195342.2705855-1-thierry.reding@gmail.com>
 <20251105195342.2705855-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105195342.2705855-2-thierry.reding@gmail.com>


On Wed, 05 Nov 2025 20:53:40 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Accesses to external memory are routed through the data backbone (DBB)
> on Tegra264. A separate clock feeds this path and needs to be enabled
> whenever an IP block makes an access to external memory. The external
> memory controller driver is the best place to control this clock since
> it knows how many devices are actively accessing memory.
> 
> Document the presence of this clock on Tegra264 only.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add minItems to clocks and clock-names properties
> 
>  .../memory-controllers/nvidia,tegra186-mc.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

