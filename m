Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B01465A0;
	Fri, 13 Sep 2024 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257327; cv=none; b=W0c1PXWOdOYy2ybHyKRLnv377/X4mGqu5KmomxQ7iYZGXL5zqK24zZ5nVy0j/QUNkgiXgBG77wpUfKt29HG1mcyk7eozGZYlNCify9oQGJi5fLzn8IvoTKcNCluot9BOReHjunPrfSEQ4k3Y1/946RH1ysTiG/Qz6XfeUWzWvO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257327; c=relaxed/simple;
	bh=058KE6hhnCiBs8UYiqbrPBuFQAXnVeXDBhu0hTz6HlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akovM8+jSO99M9fzfe04HwBL84fqb1oNjdcEAM9h0HilKZsoy8fNRChHZ94OGC5o1E+uvScIaqmuZne/ALDstmj6mYJ8hpWFLHyPoLVNK5J/7krkQ9afAYebWbF2FOFVV1cgNeT07gEGeKOwvnezZpZt8rV4vuT/UfOzC8pEiAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c17QPk5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c17QPk5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D35C4CEC0;
	Fri, 13 Sep 2024 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726257327;
	bh=058KE6hhnCiBs8UYiqbrPBuFQAXnVeXDBhu0hTz6HlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c17QPk5xNn1XQzLxDeKKSuQvCub8XBHSwjDHwJ/TFRMi0i9vtT8qk1n12Nn9jKl52
	 902hkVF3yjuv2H5IqcdP4DFc4asxR4gEG/JLMeWjliddmy1zdMoLX+KpTUaVbLrT4H
	 rlZusKYxQiuLROj7Yv7CXHQuocUnTSWTWgHoazFGdQvB1zctY1qb2wjJbTRZCBgJL4
	 vJalTZaETVfCeZ7YHZ3c3UsNlG/axCaQxbF+0VoU5nS+jZ3aG7ZVQK2f7KAAAZG5o1
	 nOWbWSFBEqups0ETbFCyUQVraJrkWBpFpYLhrh6LUnQZFMx1pZnic26XDTp1HiN4HK
	 MCAyYwOUob4Yw==
Date: Fri, 13 Sep 2024 14:55:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpu: Drop duplicate
 nvidia,tegra186-ccplex-cluster.yaml
Message-ID: <172625732540.514644.9976932820524098634.robh@kernel.org>
References: <20240910234422.1042486-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910234422.1042486-1-robh@kernel.org>


On Tue, 10 Sep 2024 18:44:21 -0500, Rob Herring (Arm) wrote:
> "nvidia,tegra186-ccplex-cluster" is also documented in
> arm/tegra/nvidia,tegra-ccplex-cluster.yaml. As it covers Tegra234 as
> well, drop nvidia,tegra186-ccplex-cluster.yaml.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../cpu/nvidia,tegra186-ccplex-cluster.yaml   | 37 -------------------
>  1 file changed, 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
> 

Applied, thanks!

