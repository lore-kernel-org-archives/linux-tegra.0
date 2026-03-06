Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDC2405E1;
	Fri,  6 Mar 2026 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756532; cv=none; b=alOccGBy1+Knn9eWEx5jRUTxtBUATrcma9830yMTNOnx7haTY2Mbgo5Oxp/Il6blnD+5N3Fn+roQrUmvShfGp8nXHE+0G0umsqqAbgMAarJRvQAh4MO0Kei+AtN6ilIH0pA37dlEPnRkBD3ydSa5mYf5ZsSMGPvslB9DyGKs5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756532; c=relaxed/simple;
	bh=P/kQyQF49gsem4F8NmuJwiyDL17VZ0ByHJyM3F3SW3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9Gnhy///c9O+1SM8+1ZLplIDCEm/uP/v7I2HE7tkee/vFU3VaAWlzCn1HoiDpGSxp75Lm3EPQN7eQj0J0nWKm4OM8o+1FBATVgbuDQc9IoPjrO3PN90BdBBGGkFWWN+Imzx/arjOgojz70tjLpr7UCleLdpmw08qqUirEgWuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dS/YCoEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dS/YCoEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A10C116C6;
	Fri,  6 Mar 2026 00:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756531;
	bh=P/kQyQF49gsem4F8NmuJwiyDL17VZ0ByHJyM3F3SW3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dS/YCoExQUap5J/R7gsU4MBUKVEA8ar+M4Nq4Tn9POil8JgDgE8qpoK2l/APNI7Eb
	 8jt2/QN3lFw60ROQ6hfCqfQWL5fF31a7U97hn+liNjsg9A7CVRpD1XCj70rU5r70sc
	 J+9OuMsH82sSaQENE1g0hN62S9aJOiLdkILtVZ1vGD39L6PkXBXlLdqysjtrJovyn4
	 UsaB60MxXr59YJcX2ejO3Pc9uLRWwEpbdmVg79VYCgx2Fo9uocLHNSb+2FaJcbItvb
	 OcClglUtw9xGk1ppsztDtR3BLUQE74P6hK+IEMaxafbg21XvEomXSV4+K534QVkRBZ
	 Rl3uNtL49oW3Q==
Date: Thu, 5 Mar 2026 18:22:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 03/10] dt-bindings: clock: tegra124-dfll: Convert to
 json-schema
Message-ID: <177275652922.845926.16698461314516941731.robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-4-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-4-thierry.reding@kernel.org>


On Mon, 23 Feb 2026 15:32:58 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra124 (and later) DFLL bindings from the free-form text
> format to json-schema.
> 
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - adopt some changes from Rob's patch
> - turn dependencies into if:then:else to correctly represent when
>   the vdd-cpu-supply property is needed
> 
> Changes in v2:
> - license under GPL-2.0-only OR BSD-2-Clause
> - add constraints for vendor properties
> 
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ----------
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 290 ++++++++++++++++++
>  2 files changed, 290 insertions(+), 155 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

