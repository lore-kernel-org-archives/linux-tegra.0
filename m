Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FE4219E2
	for <linux-tegra@vger.kernel.org>; Wed,  4 Feb 2026 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219855; cv=none; b=bFYyPymz22IHLlKwOvTYI+X0wExRnZuwcU5ue1rxfcldsLz3ICyufSrX/Thra6ELO6CshWMqpSg0uKJghBdrl7bUpt5zhHClQrO4T8+9U213IE4YqUhQJlg6873asqpGuG5aspK8Q1Julp4UxD130qA8FH22FmC342qY0ZiAtnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219855; c=relaxed/simple;
	bh=0aSCwqEYN2k47AGh2z64I1kxBXirOHMxedaAlM3W75I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aVdyUJ4L6VooLCa9Mkb7PUx5n8Mws6aGSaX6gK6EF5Iv7lukYzVxXcGEJFRc7qFA9/BG0Y/lDa7H75S7pS5fBuI9EsEHFaPDcH1uNL7jCaBX96JloX6ibwsj2jFO5JldsDXgpmolR1LVY0DDQ1+Y5lELBFiSZ6HEpZKjTH1k5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSjcLxGm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSjcLxGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AFFC19423;
	Wed,  4 Feb 2026 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770219855;
	bh=0aSCwqEYN2k47AGh2z64I1kxBXirOHMxedaAlM3W75I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tSjcLxGmHObx9qy2PJS139VGmzPDSgemn0MjyVaj5LpAhCKgxF9tKHWVc9RM2Yysk
	 MMrthmwSGl3teeBQKXxZ60tsRaxFgyMXT0DwHGaG75vIMmB7KSdkHEIswjgeu5REPk
	 pTnyW40a0dap/pc+kZ1uVFaE03y6ctP8snBbY+Ic7lcY1QslIniD/RNPdxvAqgDHsI
	 ffDha8sDjl0bE/aozHahs2w7oxuISAWLooRIqrKYfvIrCiWiRidab2fmyPZN49I9Z0
	 lA9EeLvioq09g+2UgrkzZWIDww7bdOf67ritx9FafGkBbYBRlC2bw0cKTYDMMGNiDi
	 yE/dtkIbr1u7A==
From: Vinod Koul <vkoul@kernel.org>
To: JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260202153314.1634145-1-jonathanh@nvidia.com>
References: <20260202153314.1634145-1-jonathanh@nvidia.com>
Subject: Re: [PATCH] phy: tegra: xusb: Remove unused powered_on variable
Message-Id: <177021985325.133434.9334168421882193895.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 21:14:13 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 02 Feb 2026 15:33:14 +0000, Jon Hunter wrote:
> Commit bbf711682cd5 ("phy: tegra: xusb: Add Tegra186 support") added the
> variable 'powered_on' to the structure 'tegra_xusb_usb2_lane' but it has
> never been used. Therefore, remove this unused variable.
> 
> 

Applied, thanks!

[1/1] phy: tegra: xusb: Remove unused powered_on variable
      commit: eeca25fe13a2f690f659a6b43ebbb270b073a6c4

Best regards,
-- 
~Vinod


