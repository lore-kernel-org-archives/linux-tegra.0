Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E33E5579;
	Mon,  8 Jun 2026 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947065; cv=none; b=Lb6vR8WXTsR736JNycTcudzInRWMRhq0mb91k/cStnkZQyN4Iz62GZXgwRTNc9aYjMMD2VKdJdddLRiiU0HZjJN0kn/Nbj3v1n+0ztCf8M4ctApISLiL2cSvCr18yatxTOcagh1+RgGAhsbhQene74L197gh55KfKaFwExlRvRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947065; c=relaxed/simple;
	bh=7hPis1QOan5AOjscRkvk+wtn+NndWyFyjt9qFvm8IAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=St5EmDi79vwb8vGasX4Bi/B2K1NOV2CeTopT6WdHYb+hLC6PIv/ZhkFD/6RLDWYcUdcJeKtc9FwIUnUoXSUnbr6OUoq3FvDT35GN5+JotsbvL66u8cia4+si//2lh1n3dEE2PGaIMrjX1kULs4WNe5eu9ppG/wXxIb/oeaNuw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj/2jqeZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj/2jqeZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444931F00898;
	Mon,  8 Jun 2026 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780947064;
	bh=CaGwx8fMcQFu4MbV6qsZyRoVRNCEb4V8PVUbi8x5oB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gj/2jqeZ2qYXivYr4QwtL6V+ZIEGRgnHFVSCLo1GzZiB7ld00mHwP8k3Oo9rjBxpD
	 //A6I15NueGfW97/les+y20pw/hezryl4P/AwESHniu2GTNCS4BUda1mFZ3LYBmQ0c
	 rihU7CV3FYMITsgn3+aC6y4Ak8XVZD06SRB4wuqTAjdV3ePagL9T/0uc6BY6womL0x
	 t+uYYKTxYZOIpaIiLMrWcAEx7h56xkkgo1EG9g55xBCUmG2Ri3ygUFZQ2xcVEH95gD
	 7gLewz+RiiGbDGYTE8umjRDH5n3OcmqjTVkPQfuoCkI6uZ6ZnAnDq1zTwWF/XsjxBp
	 lw+QJ1Zse5SCA==
Date: Mon, 8 Jun 2026 21:30:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] i2c: tegra: Improve DMA mapping, latency, and
 power management
Message-ID: <aicYDVct2VElN4IN@zenone.zhora.eu>
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>

Hi Akhil,

> Akhil R (4):
>   i2c: tegra: use dmaengine_get_dma_device() for DMA buffer allocation
>   i2c: tegra: Disable fair arbitration for non-MCTP buses

I merged these two patches in i2c/i2c-host.

>   i2c: tegra: Update Tegra410 I2C timing parameters
>   i2c: tegra: Fix NOIRQ suspend/resume

I merged these two patches in i2c/i2c-host-fixes and they will
hit mainline first.

I haven't seen any link between the two groups. Let me know if I
missed something.

Thanks,
Andi
