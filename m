Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7952352927;
	Fri,  9 Jan 2026 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948639; cv=none; b=GpBozqzCFLxwcIXLXDuWaUiE9KJQ+QgsFuuK5Lb/T6lXbPMFLpSk1klnVA9F9V4xUAAxVVtX/uLsUgvxuT2lEQIC0Cx/AbhPf0/r+YbnVGOfJgjRHECcqQccGXmAuUb+FlPCMR4Y9Cg4yQIxZj6QlZReNbj25wWYeWXw09am3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948639; c=relaxed/simple;
	bh=XV2CLePxIzzyiX5YhW+d3geQeL81y017zN1sTVB11D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAMgRgy+3zFYbUx6a+Vt4awuCSUFaBVeDB+SJLA1jWoMsdaAJh9I3XkiP8vPFocKMHZgj6kK10TNlCDkq4LrbTqTbXJjhRuMmChyz3e1riqOL33Dm5YG2opm0IBdbO3FQmO3PnXkbkV3yQDCyJJmMuKR9ib9w0W0Y+gc4QWQ7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH3/EgtF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH3/EgtF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11778C4CEF7;
	Fri,  9 Jan 2026 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767948638;
	bh=XV2CLePxIzzyiX5YhW+d3geQeL81y017zN1sTVB11D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RH3/EgtFaJ4q0lZ5pDdZ/HErLgL+l9mWtpJ/hD+NT5XLFiKxfKY2cI3UBsPG/MsQq
	 pUDetyLsw4ggQCR5DlabhHa7RxTy8Wpz7X+hISFUug/LmPIHdu0Q9Qu2AhgIZPlFnp
	 RBMdPc9O+8OEpH8A3gDK5oZ6sUZItx8A0mx3BGTuq0LTW0ElRnB8DJkoLPLAwQjWLx
	 6aBvpoKLkwIyVzWvRaL0xlg6VWe90dZfmtg1cWL21d6gqS+idJgimQziIQJv/plrd5
	 PGf77kL7MPJGJwj0svZ4jEASI7ktk06WfmzoJ1XaVplmWxlNGdjLeprKnY0nMlLp04
	 jj/rbEZvr/orQ==
Date: Fri, 9 Jan 2026 09:50:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
Message-ID: <20260109-exotic-quantum-jellyfish-8ec0ec@quoll>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
 <20260108143158.351223-2-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108143158.351223-2-jonathanh@nvidia.com>

On Thu, Jan 08, 2026 at 02:31:56PM +0000, Jon Hunter wrote:
> Commit eba5a0bac211 ("ASoC: dt-bindings: realtek,rt5640: Convert to
> dtschema") converted the rt5640 dt-binding to yaml format but in the
> process dropped 'clock' and 'clock-names' properties that are used to
> specify the codec 'mclk'. This is causing DTB build warnings for boards
> that use this codec and define an 'mclk' in device-tree. Update the
> rt5640 binding document to add the optional mclk.
> 
> Fixes: eba5a0bac211 ("ASoC: dt-bindings: realtek,rt5640: Convert to dtschema")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt5640.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

