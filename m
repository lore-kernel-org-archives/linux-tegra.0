Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119211F938;
	Tue,  9 Jun 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017364; cv=none; b=am4zlG/s08lpntv7EAba07kH6s3fCwEVn1sPEJojzt1m0BR+WEfv1lA2VlJm+sAxglTZiLWM7StbBEOD4brRk3C/JobwOsicdfUzU8ENo9k3P0f7BPDNblqXPZRw3rakXjoj5rX4AOHLe6De1mD24BGL/rCD4YRP8+9t/ZI601s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017364; c=relaxed/simple;
	bh=/acRB697ZsH/jRnn2Yxe41Kl5XLyRwDcaXLodmXjHTQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cbt5K899gn23XdFSGLv5gdkzzpioAjtIQiVTRDdbqJkyxAGxtF2qSC0h5aOlSG8oRncN80hez+3xzxAHKmJOVcSDGY9sBw44lMkmK9z9sRn0J5lED+VMfDJF98OccDNLv0P8Eu70Jh3nYgeFZf2Uj6BYP+tbGtVjq4zP42euvjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/HOM6z9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/HOM6z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF3B1F00893;
	Tue,  9 Jun 2026 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781017363;
	bh=NtPZPqC8mm00vC/JNAOVxdmMWPslNj+90iWPiF61oJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U/HOM6z9bgw4VTjBtk0U2nzgJHchFFzgcGnHkKcoFAMQWyAYsLiVGc6ziUrtp5XWN
	 mMRy0mySUfbXOJtRpm/XPHJzYQxcxE1rRBw/Pj0cXb22pV+QwKbwmaIPlqgWU8Et0n
	 tQS2C71XwoYbNFxl/8aZ2ezR/7KUKvqQbofHKUfhb1PQFS2dnkUhgdxv0TOCY42Q8d
	 tBIY4Q6aGMm/DDN00AyLvYGVVAn10/DW0+LBiXGW29pPUmUBjA1WA3OfvHJIc380in
	 xEYsOB8unL4HCi4PRPdHi3uZ4BSXxYdaBP3Zz8rRz/zym7xsVsAcH7Voce1ezxT/mP
	 YxORVe3h1bZZA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: treding@nvidia.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Cc: bbasu@nvidia.com
In-Reply-To: <20260527140127.49172-1-sumitg@nvidia.com>
References: <20260527140127.49172-1-sumitg@nvidia.com>
Subject: Re: [PATCH 0/3] memory: tegra: UBSAN fix and cleanups
Message-Id: <178101736026.367059.8668292240401216811.b4-ty@b4>
Date: Tue, 09 Jun 2026 17:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 27 May 2026 19:31:24 +0530, Sumit Gupta wrote:
> This series fixes an UBSAN warning in the Tegra MC ICC aggregate
> path and removes two pieces of related dead code.
> 
> - Patch 1: Sets the EMC provider's aggregate hook to
>   icc_std_aggregate, instead of borrowing the MC's aggregate hook.
> - Patch 2: Drops tegra264_mc_icc_aggregate() as its only check
>   duplicates the one in tegra264_mc_icc_set().
> - Patch 3: Drops a dead 'if (mc)' check inside the CPU-cluster
>   branch of tegra234_mc_icc_aggregate().
> 
> [...]

Applied, thanks!

[1/3] memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2e05f3d6005d9aa3e2e423d2471f290d9ccbe3d2
[2/3] memory: tegra264: drop redundant tegra264_mc_icc_aggregate()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e23d87a69e827b60fb985236a0984bacb3b68a19
[3/3] memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b97f7dceb8adb2b05d556469afc6fb54947ef61c

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

