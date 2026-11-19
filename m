Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124945;
	b=vWU2Vs3tbOqyxCFmm8DrRafSrHg2EL5KtMoUTz5x7wR4wtPvk0i8Nx9ZBK4aHcJYa1tk
	 ZKYbY6KEnbD77Ptfw36eKB+UtBTHyM3pSMuLutHjVY7p5dLahFdl1PR4MfggjnVL7dffe
	 SJcnvMPdwaAfJU+Yp847/m1yRL87CY2mTxSBf95zSukf6YcADTA9TVQi3AD+TUKJH+2Ak
	 kOLFbwNCNsmHU6ZP0QSBTUrgvdWkjKnqhZztR7DsKkBU1fJlpqJrHfrfMwAnC1nEOov3U
	 55UChsoE4Mjv/dcVwOTy5UlVlQAKaWQa6PW2V8A/zLuT9gvGqLVAVaZWUzR1reBWWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124945;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Dci2ELC1DesZ7oTDqh8J2thAlLwSnm+SSTMRCxSUyxU=;
	b=hvB7t91BgBpM9poxhA0cIDSDNSxRYgcVrX6mufg7JaXF0rJ6jo4HrdqqCjrw2/SZ2p1W
	 BOXN+EVn2IBKhSljjATWfKADkf1V+Llvfgxc6a9MYSYAuX47++2hSix/BeIBEL6TIhfVH
	 VpZAlWp74hA8vMg445RkKP3jIqxQFajnt/bQ7DBxXLKylFx4F8vPpDDJ83M2BPZtAUghU
	 brt36Q7euvwoFjomAfAo1jvCgQaFDJZd0YiUaoR9t1yVm4OnEqnJRZDljHdD9WGbBy6cD
	 ClqmW/mFKwqq2f8IZy5bep0QDoW+RRDPuTrftDEmFyQ3NCYJtu4jAH5Er2utCjfni5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iskk6tVz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993E606A339;
	Thu, 19 Nov 2026 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iskk6tVz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91481F000C0;
	Thu, 19 Nov 2026 21:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124945;
	bh=Dci2ELC1DesZ7oTDqh8J2thAlLwSnm+SSTMRCxSUyxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iskk6tVzcfj77tkTVddt1LIM5/0OM1iG00kmjxL3iwzsfBO7koQ7OD0y2FMhO2YSA
	 iRcp8mjK8wruj9dO04nAgcRVy+Bay48d9nyEzIuVyDVlmipcCMobhvNGKtcXigIlw7
	 4MjmAfQJgChPSwHFtpizx5aCucJ38YMFYma3VdGf3DLw7nPpHYUhP595kcjSnQdFm0
	 6+ZHy4g6WHq7tqdTh4tYJoddmSrQ7TwQ0vlCGZXVNPnN1qS1LvocKyiWL+7/puFTNm
	 zViksj3rQm+wv9Yl9n5MRy6MzjQLQ50s7YBpBaeBwwCC3SER+dDCdOSX0OREAbgIpw
	 aM7Nk0xrD3U/A==
Date: Thu, 19 Nov 2026 15:49:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Anupama Kunkulagunta <akunkulagunt@nvidia.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: nvidia,tegra210-adma: Add Tegra268
 support
Message-ID: <179512494227.783763.1329720459172434228.robh@kernel.org>
References: <20261104110932.1097294-1-sheetal@nvidia.com>
 <20261104110932.1097294-2-sheetal@nvidia.com>
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
In-Reply-To: <20261104110932.1097294-2-sheetal@nvidia.com>


On Wed, 04 Nov 2026 11:09:30 +0000, Sheetal wrote:
> From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> 
> Add the Tegra268 ADMA compatible. Tegra268 has 10 ADMA channels,
> so set the interrupt limit accordingly.
> 
> Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/dma/nvidia,tegra210-adma.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

