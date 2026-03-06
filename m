Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733329BDAD;
	Fri,  6 Mar 2026 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756604; cv=none; b=EUL1NLVupE4mTV+r/4UGoB5mXFtWVZtor1AVafg4DAdrQ8B4q/9pT+RbHXrFS0fJOn/YQV18tc1AhSzUyIo4n9Yqgda4/Y2b7i5q5iRPz1A4QKwyXznkb8r/SdJcPJr+MPuUlk3r0ZJquHtnGYqAI2dLS7jEBFLeA59XpdflDoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756604; c=relaxed/simple;
	bh=7jmzKe/8dP+2ORvxV2+7V4aYxjh8Uex9/w/o/NnpkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtHPuI+HWpmh03Bl6+APMKdnSr9PZBiqrecOIGPLA9H5kUdTq5ean2EziaRu+g+uJnaZoJguXBLF1Nko+wmp6kcUf4kC/2gJt23fXJkHELkyabFz0tFXC3wZNp3KSxjiAID3PBF0zqxJZMNZMwzGoE59gDKCDKywV3+9ZP47qUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9AhkB5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9AhkB5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546C9C116C6;
	Fri,  6 Mar 2026 00:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756604;
	bh=7jmzKe/8dP+2ORvxV2+7V4aYxjh8Uex9/w/o/NnpkVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9AhkB5i4OMBrl3qp+OEuS5m+4eAJOszDvW5DRtHiDFOEs/033obBwT+kbfQp2GXg
	 mJDPJiOp8t0CdmEOs/tFVlQxyfhPl7NJSLH51otxjlEIMLXk/g8IsBNr+nzCGniI7G
	 Zd6Hei1birtvQd+rkxKETfVh50SFLDFXaqGjBf3wScJ+gxznySFmbTuxQQKY0pyEBw
	 gGP2sUiQCvOTcm6543Ok8hqIPn9WLgOSgdsByqu3W8ROQRJn+pQd1npsTWPu+yanue
	 XJWuoX+7+EeTm8ctmZSs3ZZYn88nLIBGbEzCT1jm+O+oO0nctqq9ajEifBIqAJ14uh
	 wJl5BSkMJ/TXA==
Date: Thu, 5 Mar 2026 18:23:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: interrupt-controller: tegra: Fix reg
 entries
Message-ID: <177275660281.847391.1621029290418902145.robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-5-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-5-thierry.reding@kernel.org>


On Mon, 23 Feb 2026 15:32:59 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra210 takes exactly 6 "reg" property entries, as opposed to Tegra30
> which supports only 5 entries.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra20-ictlr.yaml                 | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

