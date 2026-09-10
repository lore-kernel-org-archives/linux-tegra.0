Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728E49B1FB
	for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 13:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047125; cv=none; b=M1uZ0E8XSGn2wgnUZ8fQc3AACyaUK0TgtUkhx1xv9QsMjEswr9S1GVnsYC579Cxh0zGWtRonY9yIl7aLAPczU8bSdJEEpYSglHZ7IGdPFzq5wNhuDx38Rc/4Ii4wrjfjsBqFVBMdt8CX/nEp8f1uYXIFy92lj3H+ZJssg6AipMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047125; c=relaxed/simple;
	bh=gZ84IaYCSPNisWDrqcYNRd96TGMWrpyRTMQscIw0KkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOqjaHVrPnj0SlxPsEUlCRJB687lbRWBqJSrJl8aIFO0qflBvt3uZros2DapaaMFvoVe0XeXGN5Oyj9yFk8eKGTnHf5B6S9Z4QnkDlVren0GYKtqf68cltKTk8Th7ckiS2hMm0OILtT98jkYahUckPfbSmsomNyStL71/59SgxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eW+GCPy3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW+GCPy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BBE1F000FF;
	Thu, 10 Sep 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047123;
	bh=z64d2UUtgfA9+erljiikTuug7E8aMEr1p8Z9AgVJwGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eW+GCPy3lSxOjjgZr6oO4Avr4GNosXZ/c+VUC6xXUhSJbjxjj7B28t8rqb0G2nM2e
	 fVRvPTWOXI9bF1Da5EKOv7lMXvz7ZK55KUcK/juqv09bWZYcLoVeJIVgjEjlJxyjkO
	 TbDBKH2cvtlPKYpF737Gawo/1XQPCRfn6fGuLt8VlBTrEu4wqPlJI4HTYRqovDSiX1
	 ep/eqSwyfCF4k1t4FqBIt0WmOq8ioeXOZ0p5qxxEYA8dpghkxdGUvMG/GNiezShUaB
	 JANwkQBHFjamZouvHB8Go44+qu6IgFDt5wPvgc19xpXW2WuGDuBP2CrrmNS3nLxJ7q
	 SqL4TuqOvVCNA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: tegra: Fix up cooling map names on Tegra194
Date: Thu, 10 Sep 2026 15:31:54 +0200
Message-ID: <178904710146.3571688.13279984161484177172.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902144240.766879-1-thierry.reding@kernel.org>
References: <20260902144240.766879-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 02 Sep 2026 16:42:38 +0200, Thierry Reding wrote:
> Cooling map nodes should be prefixed with map-, so make the necessary
> adjustments on Tegra194.

Applied, thanks!

[1/3] arm64: tegra: Fix up cooling map names on Tegra194
      commit: 655930792744a3cd8a8c6b5d7c3b6db2b67a1628
[2/3] arm64: Fix up cooling map names on Tegra186
      (no commit info)
[3/3] arm64: Fix up cooling map names on Tegra210
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
