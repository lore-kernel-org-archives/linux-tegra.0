Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF412DCF52;
	Sat,  7 Mar 2026 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772902977; cv=none; b=s3S+T1JCJZbgkTFlK1JnNtlqp4UAL063CfpErFtmIjFxrgTq9TneD335HshY5a3pTWwIPfP2HEQbXSvosC6KY7dOaBWmKQBgvP8DAQpVFav0Q4+t6b9BVhHwlIfEltv0S11YdEYhHRCDOAiGJqGrC68haf3ipaGD+STdvVZV7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772902977; c=relaxed/simple;
	bh=d/xC88Zg2HVwWbzM0Yl3/NxzwPjiOl1M2a1Wy9oLVTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jmDLmlvdOwZYTKuj4Bz44qTnTOLw7TOjJZD3fnbs/roSLc2VfCGJ25HuoZ5Wvt9aTihJ7y/ah7dSF8OQdWdVthWYI2crJJI5bBWBr6Stgc6axNvMq7RQb7RRaT4/TdVpKvUeRHfGIFelZSGEWJlcuxGloTcIMil1q6sc2aX+mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWATGvhX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWATGvhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E464C19422;
	Sat,  7 Mar 2026 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772902977;
	bh=d/xC88Zg2HVwWbzM0Yl3/NxzwPjiOl1M2a1Wy9oLVTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kWATGvhXCmj9e0z/v5lds0MBd4kMRf657cq1LjPOuYAzyiv656gFVaT7EfhvqFhjX
	 nJU01l9szglHyKbEMQyEU1i8JHJEzVibtBLa0MZOytAHY4996JcYEjgN87MI99bc2Y
	 eRGy/kFjTkVvw3PPl72j9Q3aJr6xLVoCIfDgfnZ+BW3rssAYQBinw6BMg0f47DXdCb
	 HY8Pg61wcEbxSWFO4skvknGMyXAl/8Pw1BiUHWuDM1tZTjdlnfOcY72dKNzVNfS8cn
	 MODtFhDrJtoQIEejcnAz4qzIzIIz5TCwNdUHQJdzIFCIpFHLRTdJw7vsixDF12Hrrd
	 G1y2SLMjc7O+Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, 
 Ketan Patil <ketanp@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
References: <20260226163115.1152181-1-ketanp@nvidia.com>
Subject: Re: [PATCH v7 0/6] memory: tegra: Add MC error logging support for
 Tegra264 SoC
Message-Id: <177290297610.42895.11718895252956520652.b4-ty@kernel.org>
Date: Sat, 07 Mar 2026 18:02:56 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 26 Feb 2026 16:31:09 +0000, Ketan Patil wrote:
> In Tegra264, different components from memory subsystems like Memory
> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
> and MC Channels have different interrupt lines for receiving memory
> controller error interrupts. This patch set includes changes to add
> support and enable Memory Controller error logging for Tegra264.
> 
> Ketan Patil (6):
> 
> [...]

Applied, thanks!

[1/6] memory: tegra: Group error handling related registers
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b8a177f18df1b439aac708da2d8bd9fcd68bb1eb
[2/6] memory: tegra: Group register and fields
      https://git.kernel.org/krzk/linux-mem-ctrl/c/95b714bd8c39d65b241aa1c346625b9c942af403
[3/6] memory: tegra: Add support for multiple IRQs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4d865a2374037d2d0842f88822fd753f0918b370
[4/6] memory: tegra: Group SoC specific fields
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2e4cfaa78eb98d2623367818c859225c6b6bf701
[5/6] memory: tegra: Prepare for supporting multiple intmask registers
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9f2614510960f0761144d14e1b4c4d82e0c098e9
[6/6] memory: tegra: Add MC error logging support for Tegra264
      https://git.kernel.org/krzk/linux-mem-ctrl/c/82169065ffb07577075a5088b313d78673ded331

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

