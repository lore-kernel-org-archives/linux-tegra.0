Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0C37BE83;
	Tue, 24 Feb 2026 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930896; cv=none; b=SNwZgNzb4106uoB4giE1GGXzXSqXE3brWdtr04SlTbP3+Qv9CkwSmaYBKKnL4JUNR/fjEWsz3yWsg2+r3YlwKuMbtFjOAa6/rtVe9JIQ67q4X5REKdMRdeg3El1zq7kYC7j8fFvIo07Et9sDBBLJJol0IOvcKwAOm+1ZA4+qcJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930896; c=relaxed/simple;
	bh=DHyna20lPkVgH9SNOnPa0ccKVJOYy5dgTdvXttph/so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RYtA81s89Vp9XtfPUqxT0swNxJ5BWqCTrisCoSlKFqLEBgTPQwKKmwXZ86wc5wdMVSbFYxk0lcvUs05mdwO1LiGWN6qH9ZuxEgQ4XLcPKH7HMqL1Nzk2InO4zBBlrigOXfbcGk9Jq1HUuyNDA9dOr//uRGYkWGBHwXy11sVrhuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1h2Q+54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1h2Q+54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2218C19422;
	Tue, 24 Feb 2026 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930896;
	bh=DHyna20lPkVgH9SNOnPa0ccKVJOYy5dgTdvXttph/so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p1h2Q+54alSrTqmRkI8Hm7S2rLrxhZO/4zckuqTOw5jZmwVDIBaX6OeB+DFBfVHvp
	 ehnfOob0VQE6wK3ifksflRNQc0qCSNiQoIMKp4/XTqmw24L3P+iob92GC6iqFpzYse
	 c7oCIj5BVYaJnjCtwWlkyztGrdCjQq9aCp+Kq4JRIeMydoKHoPKR3FLtQYtBrjISsZ
	 UOKmUZP8zroiFeoEMQsnr0lsO0liwKFzCdgzH0gmjCFTS9IMH0XSjM5DV/DigLgvo5
	 bDOwuBcQe2dpLuZBh0IAgQBhtJ3ENfvBiCmym7ChVXvHDRW4++LoO1Zee45PfyB2Sl
	 CvxH/ustQ92lg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
In-Reply-To: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
References: <20260126-fix-emc-dllchange-v1-0-47ad3bb63262@nvidia.com>
Subject: Re: [PATCH 0/2] memory: tegra: Fix DLL setting in EMC sequences
Message-Id: <177193089454.47780.14404306155184870948.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:01:34 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 26 Jan 2026 15:50:41 +0900, Mikko Perttunen wrote:
> The code related to DLL setting change is incorrect in the Tegra30/
> Tegra124 EMC sequences -- fix them.
> 
> 

Applied, thanks!

[1/2] memory: tegra124-emc: Fix dll_change check
      https://git.kernel.org/krzk/linux-mem-ctrl/c/53f3329cd35797056ab915e8bc1c723ec38e2907
[2/2] memory: tegra30-emc: Fix dll_change check
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3c6133ece23b5c3f90fe90c9e524bc322c52c921

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

