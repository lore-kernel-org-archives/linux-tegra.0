Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69732A3C5;
	Mon,  3 Nov 2025 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181879; cv=none; b=jgn0Wed4KUD3P/2gbWA+9FGnZ9S4vfadbxFsJVA8N9/ynCc4QncKzTZ1ITdrdUyWz+fxcla0toOKnLGiRgaHB3WcySGjb65G8VEArRjR/R6OCQk+5b5XElwrOLwYGIb8khxaJgPFHDsQ0vrNRkpOZk536ccciBYyiFKe7aXJw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181879; c=relaxed/simple;
	bh=AbV0ABvCZd1kvghexyj1yJEoaSmQNI8stxZWlAytKKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fCr1hgz8jsSpe85+/OZWNWK7KSZqB81zulsfwj9+2dHrCY3oXJty7a/4U0+5md0ril7b3jBzPEa6NWivsTFRzKEWFxY7mb4IqRNQgbkl/whFO9u+DMHgeJjEwXyS4bDDK0LnK8jC2I9RWnvt75coGzcFZ3IDMQ7k1fX8CT+SKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdjF7tLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdjF7tLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E2FC19421;
	Mon,  3 Nov 2025 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181879;
	bh=AbV0ABvCZd1kvghexyj1yJEoaSmQNI8stxZWlAytKKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdjF7tLZpSe+2/T4d1NisM5e2ZE1KdSWDaXa9YA3UpeH8OxQkQzgAR2RBaenDcAEu
	 Z4zl2kTgbi/a6jXjsb6+JEs89mVupNXbE5nqPPoHbDooMlHnAejkD7+MhgbitbRS0i
	 0r7ZoIrDgMV4vCnssq8b0VuhsHlsJZT7yS6y/RDn7KU8KzFngWu98hdaVB6VV7zA0p
	 zna0bygb9nDkibXNYN21mJV4IGHiIUNEkNp+2Q0NTrXecFRv4KJYtc7h1HT6/pmCQ8
	 iEQupk+t2Uw1zZY1gAZnvPlTXnsi3ZZXvoHlZW/2P0aOipfo2QI+gHGoP2L+ra1Vd5
	 PaB2R5YUigbsw==
From: Will Deacon <will@kernel.org>
To: suzuki.poulose@arm.com,
	robin.murphy@arm.com,
	ilkka@os.amperecomputing.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mark.rutland@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	sdonthineni@nvidia.com
Subject: Re: [PATCH v3 0/5] perf/arm_cspmu: Preparatory patches for NVIDIA T410 PMU
Date: Mon,  3 Nov 2025 14:57:46 +0000
Message-Id: <176217690916.2889046.15109510463947392648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 30 Sep 2025 00:25:59 +0000, Besar Wicaksono wrote:
> This series contains initial patches before adding support for upcoming
> NVIDIA T410 PMUs.
> 
> Thanks,
> Besar
> 
> Changes from v2:
>  * Add Reviewed-by from Ilkka for patch #2, and #5
>  * Add Reviewed-by from Suzuki for patch #2
>  * Add stubbed implementation for arm_cspmu_acpi_dev_get
>    for !CONFIG_ACPI case
> Thanks to Ilkka, Suzuki, and Robin for the review comments.
> v2: https://lore.kernel.org/all/20250923001840.1586078-1-bwicaksono@nvidia.com/T/#t
> 
> [...]

Applied patches 2-5 to will (for-next/perf), thanks!

[2/5] perf/arm_cspmu: Add callback to reset filter config
      https://git.kernel.org/will/c/a2573bc7908d
[3/5] perf/arm_cspmu: Add pmpidr support
      https://git.kernel.org/will/c/04330be8dc7f
[4/5] perf/arm_cspmu: nvidia: Add revision id matching
      https://git.kernel.org/will/c/82dfd72bfb03
[5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
      https://git.kernel.org/will/c/decc3684c241

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
