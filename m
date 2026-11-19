Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125026;
	b=DWQT4hiwaBXQB7z9RmaLXZiz+DiwctJe1JWtAAKcPZ0j1mbHn3hId2dz4h8/jDXDPYX/
	 wHJ8gUYmeSLvHhp47nbq16XeHhBSifPKGoocDdriTlgi+pNnMv1WLn5A5KuF6ZXLEgUN/
	 EuAz2M0hIrwhp8qAvCOjEiDRNavAPFNg76Q5mUNeOzAevetQCKIIEB22CsNQAnlzHTw64
	 IuailtdEaope/3n+WtgLEjABDPzcJi+lLQG8Zy2zIbHyQYzHNSWBaElYISvD2EoUlLIVj
	 qgytT08/BPmv5j7dU+mypQa6NF8ZwZREeAU87g/bf8mtouWheSqTRBFJvh1kqsuSl9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125026;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9I9is493Ul2I6ePS6J+/O8EfhsF91z9iYwM6wNTdrH8=;
	b=qyRfC6CFpbxIyoPp0Gp92YafBIAoqfieLIOOVKPiuODuOC6dm7PHQQkQD60B6cjWmI6+
	 v39S04AQyuGp1d/AVm865vjJyv/YnijQg5gw7K5c8n1xgduoMUQxZ/dheuaBFL2ggALbM
	 idpgLKCWWeol0g9QEY8OssKr0DGj6AhWG0eYaMj37F7jy/SMqZAA2jlcBJJ+hs5Olz9pa
	 8La/VhhWSqbS8Jn/dmEE+wuzoc4ZwRuniN9XIw5rfbslm0BPpGh3dZKmICwFY1LmD54ld
	 zqKEYcYXScx/far41KenBfPCvdPQig98ra5hPB3LVi2cfY+yiSNdFiWp4+xBePGqUaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijY6gCKr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C4606A325;
	Thu, 19 Nov 2026 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijY6gCKr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A671F000C0;
	Thu, 19 Nov 2026 21:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125026;
	bh=9I9is493Ul2I6ePS6J+/O8EfhsF91z9iYwM6wNTdrH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijY6gCKrw7IGislOItd1+tneA+hVCAGQbwdOD3gj/E0tISza9BPrTrcvYNmgj1MpN
	 vJxUAjgjUfucsarIgdMx8q1et84C3QqQ/roCqutGRL3NieKR3TU150WBloTusWQB7H
	 +a0L6l5dD/O94hsezZfBCD9Mmpy6EOrd8tJ+7nd8oFSd5iEr9C0boUUEu2N33WLxy/
	 DkDKlb8b/o7QslZumR3jz5t7WqdlH1iQdTCMmrzcDE2RlnasAZMzuj3hJBMckAOVqY
	 YmYqILtxHT0o0wU1d1T/qBMaCya4Sq6k2o3l3WADuFz3/f8uNVqw51sVvzb3ebkfSs
	 8jo68458NtFyw==
Date: Thu, 19 Nov 2026 15:50:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: realtek,alc5632: Document
 #sound-dai-cells property
Message-ID: <179512502324.790223.9965352097613492162.robh@kernel.org>
References: <20261104124057.240288-1-clamor95@gmail.com>
 <20261104124057.240288-3-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124057.240288-3-clamor95@gmail.com>


On Wed, 04 Nov 2026 14:40:52 +0200, Svyatoslav Ryhel wrote:
> The Realtek ALC5632 codec provides a single DAI cell.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

