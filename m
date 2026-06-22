Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F435F5ED;
	Mon, 22 Jun 2026 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111272; cv=none; b=DCvZCHpu4v0tDOiqo/yZMSz1bCL7DMreNZpxN7HhOpNtIEOdO8QK4wxMe5QuEbT0AB8Y23ORYDZ2uWi2hAQJT1FgW/fIGjmLBCWnAaynO3HgOflWRkrxOXDRxIJ2CD30NGC9VFLdjsSOjnR1XMAzuDqZLhTeW3N+cKyHN2INHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111272; c=relaxed/simple;
	bh=HAPEUlZL+g1ppqHSYkm2jdadeyXvc+Jnv2D42oNv6E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9DXbHlLrUdEa2ZRR3YIb8HRYyJpcWks74Lq2Ifde4pFYfbaDjojtX0Xojxp5l3AhDaMbV3lXr8waa3Re0YUwqA+boDCyW59QfEjcimbhy3r2DFjc3M/vg5a3Rl4fdIjORuoMq/6GQtM6mc5h+O6SPb9of54yChJWMxHYDHG8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixNpsGTX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixNpsGTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF1E1F000E9;
	Mon, 22 Jun 2026 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111271;
	bh=rGrjX4lLifTaYZDGfLPhYZQnL1HW/INGYXQNxqZ8mCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ixNpsGTXRcRqCWMYkDVemZzE3Px5ul2wdc46Osl+UmVv3t+aW6WtKUkPdhbeYno9H
	 5LF1bHtFx7LX46u8D5QzbmsG5e4mx4MOhMnBkAKFHRbDwZNyJFSeiRQ3Uy8ZcZm0wH
	 ndU5IAOdJLLfM0KYdYsXRzGRgponb/volnvIUhX5snyC7fmkTz5AyqDpIJMZNE5/SF
	 kffRtgyWcK6AJPaG1g34wxsLj2j0OGVx3vok99x5RciTGoMFZkOiiNCSFVo7f1NhTx
	 pA5wc9Zx591aq0mCW05pPPQzyWbQkJx+nphdpHv//sWzzqAIVcrpD8aavZCZnaxasE
	 aA2id0K46lpuw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: fix #ifdef block in header
Date: Mon, 22 Jun 2026 08:54:27 +0200
Message-ID: <178211123544.2502680.5292960713261733379.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618143654.2102062-1-arnd@kernel.org>
References: <20260618143654.2102062-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 18 Jun 2026 16:36:50 +0200, Arnd Bergmann wrote:
> When build testing on ARM without the PMC driver, the other drivers
> fail to link:
> 
> ld.lld: error: undefined symbol: tegra_pmc_core_domain_state_synced
> >>> referenced by regulators-tegra30.c
> >>>               drivers/soc/tegra/regulators-tegra30.o:(tegra30_regulator_balance_voltage) in archive vmlinux.a
> >>> referenced by regulators-tegra20.c
> >>>               drivers/soc/tegra/regulators-tegra20.o:(tegra20_core_rtc_update) in archive vmlinux.a
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: fix #ifdef block in header
      commit: 813e034925814858cc52e7de321ec4848314e15d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
