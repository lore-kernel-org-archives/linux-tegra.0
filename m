Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A761DA53;
	Mon,  8 Jul 2024 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720472536; cv=none; b=JSJQU+BJzzYFQvjgCZ51GMLy40/1+WAOYdg6pQ8/RMhvh0BwE1Jr/pT30ixh65d6YHF/S9Ehz3Jhnt30TCdp1z/JEUGR+rUrQ1Ijokb+21OeoQYKpP2A7mMxZ5lJzfzmsd6l4EkcMeW+lWA2TIrPWok7kMIJjx6xFGT6lJiQmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720472536; c=relaxed/simple;
	bh=Sr7q5YZv7nmVUkMNEpRaZ5flo8nETsjiwr7pQ2wNePM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=md7Zdf8CuhfFSZiqVVZuzgr0eq2o1HaiBPUDu1AMc5tGnyMEfD+vzqWD9ARyojlWHrrH35hfefF5JmcT14tBGkWRi2hGTkfwOW5+w1TQTM1tzb+juGXfriisERXg7LakT6pF2rTLmQtPZKVZHVwEHNViqMRTMW6t2/qbRZ6tUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imEEaiQh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imEEaiQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4961C116B1;
	Mon,  8 Jul 2024 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720472536;
	bh=Sr7q5YZv7nmVUkMNEpRaZ5flo8nETsjiwr7pQ2wNePM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imEEaiQhDXHaG6EqcPrez7MGicaKyffuagUHE6BxGYHBuFdvVJvyG7KihG75Oao5h
	 PqcDPlcVcl/14/4egKop14k1y8+J8Zl9UVlXFJl8OBr5hGtEhDNJUDhKkFVTtmMjv3
	 wEpPldZ9ZK795gOj+vDuvVNZXEH+b+mK9D/Mnno0mbgNGY2NJAEXzD06NL2pCbU6QC
	 /4VDypBP8O4LKwus+766Cr4VMWjd/nftZE0pmS+BZqKXpw10FWYS8B6xch225jGAHW
	 8P5kULsNWOCOCgtyBBMsckE8eUyXYkXo4YnTXIl+Nt2MbHM+fA9YjU0jMGBfL4wquW
	 pIiU2Oae1h0nQ==
Date: Mon, 8 Jul 2024 15:02:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Thierry Reding <treding@nvidia.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: tegra: Document Nyan, all revisions in
 kernel tree
Message-ID: <172047253375.3899888.12655488091485132661.robh@kernel.org>
References: <20240705235254.126567-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705235254.126567-1-david@ixit.cz>


On Fri, 05 Jul 2024 16:52:43 -0700, David Heidelberg wrote:
> Avoid firing useless warnings when running make dtbs_check
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/arm/tegra.yaml        | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

