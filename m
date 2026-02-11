Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9035CBB6;
	Wed, 11 Feb 2026 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770844411; cv=none; b=R85U3WbzKC9rpEdlj/QxF602Jigbz/wd2agJbg1ouVWd60FPS36LpjkgggrZQ6QjQguaDpf1JS/wDNwv5uA01YdBH17LsUQXkK/HsCJzdi6o0PQVEuDXgnyI4cikjZqIAeE5Fo7xLtoNlPwYAIsYfcOp5ZeVVtalF0IELPn+lrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770844411; c=relaxed/simple;
	bh=elREHuzud4aN187FLQs9JvA1JdI3V1NW13W5rgg4Kyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su0xuVs7B/BTFFAeWWdwOrNhVqtpnJcF/7ey5fqCkRCXNYSyTmIycoexdI+YaQ0IguGpwPF6tSOJiozdAV/7noEwdgPV4kG+G5/X/GHPFQ1QqBqniVEespqHg2a62NjYdMjs/DevLe3sSjO2I1cL3OuTwnUEoZ4PCODOt9XxqMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjvvDZUB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjvvDZUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D5C4CEF7;
	Wed, 11 Feb 2026 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844410;
	bh=elREHuzud4aN187FLQs9JvA1JdI3V1NW13W5rgg4Kyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjvvDZUBmHRBg6WwgZJqPoDEmcAq12mjfKiODxsFuV4ztoq93P8EddciiIh55MP/g
	 +vs7/5B55vaPzo7Aw9nwAwo5mXk5vFkqmbRaTDtLyj7qJuyfVykvm96ySM6vgRGNM+
	 0Mc35RlhQLAyPQn4Aan0WV0NY/XKyVMI01aYKQarK8Oy+FEWmH8OR1sA/DMuaHHznA
	 DQRUgWP8CieAD7+lNXEqrUUyoVNI/68ygGk4WZnaeS7aLnuskOOmDev8R9DixiPePJ
	 9YqYQMHUIVqCg66c+li1lSyZiHUpdIHPZ7HDoCY4TsPXsybGeTdvudOAgJe0HV1QnR
	 8m4mUeZ36CZ1g==
Date: Wed, 11 Feb 2026 15:13:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x:
 document additional board pins
Message-ID: <177084440873.3909872.156538446557882874.robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com>
 <20260206173423.145954-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206173423.145954-6-clamor95@gmail.com>


On Fri, 06 Feb 2026 19:34:22 +0200, Svyatoslav Ryhel wrote:
> Document additional board pins that may be used in routing.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra-audio-max9808x.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

