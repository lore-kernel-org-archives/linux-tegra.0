Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01A7080B;
	Mon,  9 Dec 2024 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769790; cv=none; b=fCkJMumCry5Se88+K4pgOQeIOS6XmT/+2OfusUGcJVMxdNts0nSD6WwfAXAvxtuoho1jltsM3Y1IQ4liD4E9ddLq6PkVV4jQf+TzgUXbYxY2jDFNh0zwVjWthhToEIANRv6/t2PrMBVoYoSGX2RjutKtFl2k6so8acd/2yI6OWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769790; c=relaxed/simple;
	bh=ojpEli5GutwJa5SYzbhkYSwq4mRUsfSiYSiGGNNLcFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfHeI2LQDqhX4Eo4imIASStk/9FeaFUEc8l7eYtk65HDazSDhu/H0wKvgW+7XT9OFKHN6OGcbreV05OcSaEO6A2ho9mCJO/dNeY/mGIgYTOS7Z8/EKSke8IOQiPYs+wW505+jbXnl2B0TQijAaIIY7rXDqmPsjp+40m/NuWEAdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uq5xjWiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq5xjWiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D27C4CED1;
	Mon,  9 Dec 2024 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733769789;
	bh=ojpEli5GutwJa5SYzbhkYSwq4mRUsfSiYSiGGNNLcFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uq5xjWiKg17mNQZbTI4UExKm4udRvhgVqyduDyFXM/jmuDWl1KKPhcYxEtn3b1BT1
	 /bVCzNbaasEZIWbTCCXfqIDK3NtAnSbYS7hwoZi9LoxKxLV2C93fuOyoQP9ObX3kPy
	 AQqIB6iPupGWIGsv86Q0jclh58J5DO1d/wnKyr2YWNSMUSC/c1vjpRz4X5fmt4e2zo
	 1RBdlDSqCnzhVHJhux7D15aR+3IdpYYHqOyr2/P6ML6/ps+YIHUf4egxDYrHSx3AGV
	 qHa+gp+X52an0xmui4cHY44thmRWsZ0BsJhDBiJOUBpaaIbiSVCiRZ+IkysuCV2hzD
	 WPt1yiFcJacjg==
From: Will Deacon <will@kernel.org>
To: suzuki.poulose@arm.com,
	robin.murphy@arm.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	rknight@nvidia.com,
	ywan@nvidia.com
Subject: Re: [PATCH v2 0/4] perf: arm_cspmu: nvidia: update event list and filter
Date: Mon,  9 Dec 2024 18:43:01 +0000
Message-Id: <173375687020.3268682.2167190065642330868.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 31 Oct 2024 14:21:14 +0000, Besar Wicaksono wrote:
> This series update the list of supported events and filters in NVIDIA Grace
> CoreSight PMUs.
> 
> Changes from v1:
>  * Split the change for setting default filter value.
>  * Add new patch to fix NVIDIA PMU sysfs path in kernel doc.
>  * Drop the patch for CNVLINK PMU events renaming from this series.
> v1: https://lore.kernel.org/linux-arm-kernel/20240918215846.1424282-1-bwicaksono@nvidia.com/T/
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/4] perf: arm_cspmu: nvidia: remove unsupported SCF events
      https://git.kernel.org/will/c/ac4c52956f62
[2/4] perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
      https://git.kernel.org/will/c/5f7cd0dc98a6
[3/4] perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
      https://git.kernel.org/will/c/ca26df4b1036
[4/4] perf: arm_cspmu: nvidia: monitor all ports by default
      https://git.kernel.org/will/c/bce61d5c5764

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
