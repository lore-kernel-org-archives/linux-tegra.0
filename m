Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC3215067;
	Wed, 14 May 2025 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259527; cv=none; b=n7aWnd1PDVM5M/Qef2VPeV9dU8nSZAAIkFirA7d9mK+zNL/2iIc8cpxeLxrjkIHLroz63yGJvAt0grWREx3f79UPIJk9kXn5mUygWqYx7a4eDG2obzrNk+alsiKiwMocWX9j9k5OEiVg0NJHvfsPGFWxNYaxuIqlKtwCMWGAJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259527; c=relaxed/simple;
	bh=uP6ECvuLzjkEvyy0LlPR8ssZUXSIF+C9102LZ8ocYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lywdJ4IR/JKJ4OV/026wk17fy6r1fRyPtjthEQFv9/UG/5m79qLTvNQhQa3r1lC3LCFIAQDnzoXMhnrKjhIBMZ1/c9eUe6UyKSJ5PM5xJdGqeTzbT9Z+cKTrTaLfmBSOi5800q5fSfezdoGmUNRScaMAicpqYW45jA/qNUsq1xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLRT5WO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLRT5WO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B50C4CEE3;
	Wed, 14 May 2025 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259526;
	bh=uP6ECvuLzjkEvyy0LlPR8ssZUXSIF+C9102LZ8ocYJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLRT5WO5iPJCiqN6shJXPldHXPrgrDboP5Ne5g8Cu53qnvLf7qrnjCMQVPaDCzNkS
	 5Bb9jRl7wLhewx0pRkbiAynVaCChTOL/KowYwOX6XECTPicMaoOKU27tPKANTeiSWU
	 Uvil7wk9/OzZ4HWbT6WnrA7WdnqgSpZSNMJ+FRrvWfO0UII3+zXC+HkyMvOtx+M4f8
	 5IylwZRKxNf75VEJmyo6IO3bFgbSiqa6nLGifg6gxtraH1bEmZnP71BQ1Z/d74MLJc
	 nttcnyFkcUo18fnueLuJdOeKrD5GlsGm5H95VeNPL9+X5mEc26/wDjiRhgUdBLsCYl
	 cJWgUkE/Q+ffg==
Date: Wed, 14 May 2025 16:52:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com, perex@perex.cz,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-tegra@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH 2/3] dt-bindings: Document Tegra264 HDA Support
Message-ID: <174725952441.3101271.15433560346114148625.robh@kernel.org>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
 <20250512064258.1028331-3-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512064258.1028331-3-sheetal@nvidia.com>


On Mon, 12 May 2025 06:42:57 +0000, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> For Tegra264 device there is one clock, two resets and no power-domain.
> Add the Tegra264 compatible and necessary logic to the binding doc to
> determine appropriate clocks, resets and power-domain properties based
> on the compatible string.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-hda.yaml    | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

