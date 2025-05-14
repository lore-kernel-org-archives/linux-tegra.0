Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92E2F22;
	Wed, 14 May 2025 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259434; cv=none; b=t9jC0gDXrLo04ExvRBk/4TCSSNF/XazmRnQN8DZxcEKK8MW29Ozvo7q2h9gpqHWX4teepW8PTiFME0HFMVpjtmPBymArXAzZg8pT2wz2jDowzOL/FYvOW+WrxrbHpdQgT9EyGxzPd3Ng7qzuJnJpMwXJEbo+oObbdXoi4chdxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259434; c=relaxed/simple;
	bh=TBwCGxAE9tlAznNLsiJmEWfUw7Fy2HDZ2rJFrlJMHss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdU4tDp5ad5DF0FGLY8wlpl6jbbnWtpjnTg45D7mRqtxTY9StPtmsSKphhGbfEKyVDC2/RnjH+xcOndQFN/bP3ON8sjsw7hTABnb4YyFBfYIyWDI98Z2DDwVcqdRxGzVLG4UAxozSeVmQAScmrZP4e6EhieV2JuhgVJDbyDXc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0+vz/+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0+vz/+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EEAC4CEE3;
	Wed, 14 May 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259434;
	bh=TBwCGxAE9tlAznNLsiJmEWfUw7Fy2HDZ2rJFrlJMHss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0+vz/+XAJXmGZoSZF3yA4er1i+MNbm5FXBYQ+3+k5FPEpcfemqRwXyZyzm6c1vp8
	 0wQFXwBeRB4pDyEpOYGNGSflXEQeqydEbdId20JT8XSSJun/tTcSDCURF/5EuHst5g
	 ejj5So9qkXGiTaWgoGzZKNxvktLg2FYCI/uEDWAyeqr5Eq/WCHU2OwsADOF3jzr7v1
	 gQYBUtqWwK3XFRpklRzQAxLFdKQh2OZBA4nDTl19uTXM4ssR8js67G41GOCfCf+97h
	 9c+WSd8S1bJLhErUKuXPqe5fJkyM6vx4/gVc3ohW3XmkVLCBrxAXVswkwMHeqs4W0f
	 yJzEIGwiZAznQ==
Date: Wed, 14 May 2025 16:50:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
	perex@perex.cz, tiwai@suse.com, devicetree@vger.kernel.org,
	broonie@kernel.org, jonathanh@nvidia.com, lgirdwood@gmail.com,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Update Tegra194 and Tegra234 HDA
 bindings
Message-ID: <174725943164.3099141.411153645160050033.robh@kernel.org>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
 <20250512064258.1028331-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512064258.1028331-2-sheetal@nvidia.com>


On Mon, 12 May 2025 06:42:56 +0000, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> - Tegra194 and Tegra234 HDA is not compatible with Tegra30, hence update
>   them as standalone compatibles. Also, add necessary logic to the binding
>   doc as HDA clocks and resets for Tegra194 and Tegra234 are different from
>   Tegra30. This fixes below dtbs_check errors:
>    - compatible: 'oneOf' conditional failed, one must be fixed:
>         ['nvidia,tegra194-hda'] is too short
>         'nvidia,tegra30-hda' was expected
>         'nvidia,tegra132-hda' was expected
>    - compatible: 'oneOf' conditional failed, one must be fixed:
> 	['nvidia,tegra234-hda'] is too short
> 	'nvidia,tegra30-hda' was expected
>         'nvidia,tegra132-hda' was expected
>    - hda@3510000: clock-names:1: 'hda2hdmi' was expected
>    - hda@3510000: reset-names:1: 'hda2hdmi' was expected
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-hda.yaml    | 83 ++++++++++++++++---
>  1 file changed, 72 insertions(+), 11 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

