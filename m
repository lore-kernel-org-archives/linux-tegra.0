Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7933E4C79;
	Mon,  4 May 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916890; cv=none; b=ZLG0ieSo/X2UHPSr8+ILJ9UNZxOEz5LKHmXRsbSQ8HbN/cIIzqBBnAybDuWTcwBfRgD19cVzp15nZ5fWq45Fnq4cI/PZx9WJJofp+qpw663gRyWwH3R/IjDLAk+b0pDzksyZn8M7Dx7f7Lr373r5y2eDU5ztXtsjXauba7TyciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916890; c=relaxed/simple;
	bh=8fXM4A/xLEB6Yi/FE9Y1BqvALmm2G4rXkoefEjIzJtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nHi00U4iwhyskYrCZjKpSfud1D5bOWqv3d0teDlVZEArzhpua6el0kWGOZ+38BQedYrsCTeAVpA56NQKwAPLTRS3Aval95sW97mnDK3NkqJ3t8leYjbHak28cKip51pB/1oyIxp/i1+M2ZTqtQAVV/TspJ5Bb3W/C0tsUrJpYLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TayNZSVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TayNZSVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E95C2BCB8;
	Mon,  4 May 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916890;
	bh=8fXM4A/xLEB6Yi/FE9Y1BqvALmm2G4rXkoefEjIzJtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TayNZSVndrzJ122+nD2q15QOFEyVAN+qs208rllMjib4thGrDuzJhC00lamw1ZHnp
	 ja/lE5K0agfC6y83CBm4eqqiX7eEmALZLvHjHuzvL5lhnIJSbZeXLGDG7gcMWy/3dF
	 mFDj1v3uF+BYvoJ9WaRyO5wyllaM3ZXW+A8D+K3/gmrasNMuvLmrNNOXUh7XW8iXQv
	 JvLAbZs+RrEFBOSQKxiluwBTMl6zpkcSs7LSOCaQjM5f/YZZ2VqJx0h0M40YnA2STJ
	 o8PNAMJ/RSoN/rYNkkQXqvC08djIIbkabB5Ku/dzCo3firNFe9m5jvvCxixgpB4Kzb
	 KLws8XU+hKB/w==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: thierry.reding@kernel.org, jonathanh@nvidia.com, 
 Ashish Mhetre <amhetre@nvidia.com>
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260430095202.1167651-1-amhetre@nvidia.com>
References: <20260430095202.1167651-1-amhetre@nvidia.com>
Subject: Re: [PATCH V3 0/3] memory: tegra: Restore MC state on system
 resume
Message-Id: <177791688871.723206.1524056077241270952.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 30 Apr 2026 09:51:59 +0000, Ashish Mhetre wrote:
> The tegra-mc platform driver does not register any dev_pm_ops, so the
> SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume) on
> system wake. On Tegra186 and later this means MC client Stream-ID
> override registers are not reprogrammed, and clients behind the ARM
> SMMU fault on the first DMA after resume.
> 
> Patch 1 makes the SoC-level ->resume() callback return void, since the
> sole implementation never fails. This simplifies the wrapper added in
> the next patch.
> 
> [...]

Applied, thanks!

[1/3] memory: tegra: Make ->resume() callback return void
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4f42beeb9796e24e8009c46d1a2d676803e5ab24
[2/3] memory: tegra: Wire up system sleep PM ops
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2411c8d1e3e09910e94bab0d0a2c071fbc8a9e7b
[3/3] memory: tegra: Restore MC interrupt masks on resume
      https://git.kernel.org/krzk/linux-mem-ctrl/c/35934fd08d17071c5ae0e99b95258f61f0cff763

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

