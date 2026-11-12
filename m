Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474265;
	b=wQfqM3MXn2zlEKmIfccGMDOceRTgRx1pNsOl+Aym3y1jr7t/h1j9S780wBMSTrY84CDQ
	 RfriA2PpaoMdzx7T0ipgxiS+DZMymKHbw98u/hAeQWJYGX/buYWcYU4RdAgIWuOZrInet
	 TPb/gK2svc4N3L5zWtv22TLIAK5jgtWUnRW/tc6d1H3ec7ovtM4FGSu1GS+NmMDKgGZim
	 +VLrBJrvLVvwgIAtyMP6lj89dQywVdzUcIKZmxfFAMm94Nh7RKNij4nsFERmeYm+uqC9N
	 mfvhrpo58HAZX1FFRNgwakKA94YWmY92FvI05jiLG7W4x9nbTzal3F0sfQGejqHCoAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474265;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=zANsLWOkkKydSY36VvIkeP0ssVMGqXoqCZ7BWo9mDis=;
	b=tOWkGF1s1PaFvBZUvT2fvh1kkrYy3qnDXE3GDbJ8ORi9JZHtWLlpSZqw5Stet4Nnln1Y
	 5M74HNLDvlROv1cCCG63p9AzdmraSgbf0iAWtavWTBVeFS2AAB3taKBRnTi5vRhO7P3Xo
	 LpkD0yfb6UFB25vkmVBvfyTNZ8VqdXCmEwtIzddZpHCd9KiPjbGIbWjzeX8Wvyk95Cym9
	 Ybmi1T3XOhVWkQVaoD0HRk8pRobStMdWB8bv8zxzFxhbPlZyCAggj/MVDFghxTkz+2nb0
	 7V2ZBivkGxD+KViSpJZ73Gh2nsRo+JTDVaCfc/QAqp68/jLxzQFDBH55GUO7msTJmPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQnq4qip;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23960A381F;
	Thu, 12 Nov 2026 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQnq4qip
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE7E1F00A05;
	Thu, 12 Nov 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474264;
	bh=zANsLWOkkKydSY36VvIkeP0ssVMGqXoqCZ7BWo9mDis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RQnq4qipuMERRhxQu8PeX+pFNm8wHKaDYbzMLOqWVWrqT9SZ/UswIg2Idu9UmXrOC
	 fSUu9cBigvmwF9SUrjk/8Z5+rntiW2o+GQG8AA0u/RsPR6YPFG03/7EPzwZvZlPUqO
	 zqo+3QUq+l4SrzOnejIiSXbS7SPbBAdnTKbE9d2T+oUAsE5EN0HOJ+MS1Th23tQgFA
	 iIxQijVq2O/pezsEG8wZtYOI0kS+KBMzUbaA6H0FfTroLwQG6aw9Iv18DovqDtUaZP
	 tcE3jqryz4cwaZU3p4X0n5TVh+G2SacZGZEWvzj1QsjXj95I529rjjKDrS0dQbOnaC
	 UCiVkdC7+dNng==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
References: <20261012-tegra-phy-v1-1-3241bf3c86e9@nvidia.com>
Subject: Re: [PATCH] phy: tegra: Clean-up Makefile for Tegra186
Message-Id: <179447426202.428303.3201325856795215999.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 14:34:22 +0530
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 12 Oct 2026 12:16:31 +0100, Jon Hunter wrote:
> The Makefile for the Tegra XUSB PHY driver has an entry for every Tegra
> SoC that compiles the xusb-tegra186.c file. Clean this up by adding a
> new Kconfig option called PHY_TEGRA186_XUSB that when defined compiles
> the xusb-tegra186.c file.
> 
> Finally, update the xusb.[ch] files to use this new config option as
> well instead of using the individual SoC Kconfig options.
> 
> [...]

Applied, thanks!

[1/1] phy: tegra: Clean-up Makefile for Tegra186
      commit: 96dbc4521e9410912b296e1683a025815cff3fcf

Best regards,
-- 
~Vinod


