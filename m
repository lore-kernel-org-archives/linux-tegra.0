Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA287446C01;
	Thu, 17 Sep 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681966; cv=none; b=lCZFWCi7HXhd5FF3UONj7pJ6L+hicoC/77pAg60yfZ46HyUAZvJRuXZa79YnxvsboBXRakj0ND26bm84JuUoZrhcFMqfjDO8kh9MAAHKkE2+8/qtlzf/5V7I4eKPTpTohUJoGujMH6BOECdV0OLzPymI17c6LhQ6rW7g3HUdQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681966; c=relaxed/simple;
	bh=u2yAvD7+Su5SOyqCNNtKqQlu7BTllUK6B/JQe4+7fNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7gYvscesgBGzKwr5TCFn+PWWFbJH+JRHyWqvoQfuqWs6i9Q81YUmCUNZGBZWMBvqAXLCeqbu+t4JG/3BqbbL6KRjBTducdV+9FvajWAGJXe7G2lnjB/BfqqlvLVGmUcLLexDq5OaUnekLyjHoAqXW4MuEbdAE8zVvWiuK8kXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUA+wEl0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUA+wEl0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4844C1F000FF;
	Thu, 17 Sep 2026 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681964;
	bh=ECp8w8b2OljDXSF1jlWE3h9HCxPI21rHDN1xAjfJDmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bUA+wEl0N1nWwcg+aV9zYrJc1+Bv4etzZudtTqcfrFQ4OlOoKZdp9XMfP/QGnjkUs
	 VwdfIgLInT72+jewRq06uPKaLpQHHcQB32Z2UvIRng3Uld/qm4znEPnUHNYjtAt0BF
	 wH+ien59dTStfzO/UD/Z1TcbuH1qNuRpMVGDBRZGCHFaY0bcDVYD3knH+bms231ZTz
	 YM9bH0bmuvgdgbj37Bz9JlAux3AnZuPS07wW4IPqFoClPVnxjxMSS8dPN7SQUm4drt
	 8nAYORquJrFdm0jQO5ljCVpU74SvlHNHaA8my4RbsDE/4orxX1SEoezw50L5VlbC4p
	 gfBfx7lPYpuvw==
Date: Thu, 17 Sep 2026 16:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <178968196203.3977763.9137674744843373634.robh@kernel.org>
References: <20260902003004.453960-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902003004.453960-1-thierry.reding@kernel.org>


On Wed, 02 Sep 2026 02:30:04 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> nodes named stmmac-axi-config and phandle references to them using the
> snps,axi-config property.
> 
> While at it, add the 10gbase-r PHY mode.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - move common properties to snps,dwmac-common.yaml
> - link to v1: https://lore.kernel.org/linux-tegra/20260716212001.989872-1-thierry.reding@kernel.org/
> 
>  .../bindings/net/nvidia,tegra234-mgbe.yaml    |  8 ++-
>  .../bindings/net/snps,dwmac-common.yaml       | 66 +++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +--------------
>  3 files changed, 73 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-common.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

