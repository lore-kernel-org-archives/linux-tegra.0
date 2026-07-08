Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253DA435A85;
	Wed,  8 Jul 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509366; cv=none; b=kngyOOIHGKEPLqfyCmB/bdD0/TdjB6TZEXYCjZK7FIFqT+3tiPr3k7BygHCx4uKWsw0HyfG9FBz8BoB8fIi0Wk0pUM3j3Op3AM0mxw+lokeHLcGfc9gKgEEzZDNX0V09SYpRLLEP1+IBPCQ+OcLYU0b/nQK2YG0JDSX6bfh8Ans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509366; c=relaxed/simple;
	bh=8SSsKB3vqH7BY19YJR7fApPsT5mMzfPPcuoOnwMl7Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ijvs5rOG6Tsmjh5n3dxndJyNeAVMuwOlDE0eI5RonTz8F5yJuOfRdz0A3sGYE/AS/qtkktd+Ha1nVPiGfcTrX34FoqCKYC4NNjqftbCqHbJJn2bkvRYk0zt1aU5QVRyJrx5mLo9zxJko7fmsBxhFZbnfVKxUDEsoyGFQ8dOJESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tk6BmzIK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tk6BmzIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0C61F000E9;
	Wed,  8 Jul 2026 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509364;
	bh=2RqurbOB39h1xhT2BoPOmEQ2mE9O1wdcvDpPbmrELIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tk6BmzIK7RpTGmc8/KQYY0zpXni/2Y8L338vxz2whX490FI3LjqCKWs8MvL4tMPF1
	 toda03elEJWfw/Gz5+m21fwf4ODkej5+pb+dxZOIkZqAgPkkD/FDZmNF0E62NnDF4H
	 A4KvOCKj7QYrqqeRNzxWhgujeIm/py3Fjs68n2LRDG7pKSy1gOrcOwwdt8Sj2D5mS3
	 evie7nPWlm3AUs39BioaLErbAR0v5cfljb+KoiuW++Eomd7JWC17Exjvsb+wbqFSmR
	 lMzZOpDVNDMuqfBMyi965klmDI+bpxCGgsJrZqcBSX4t5J0KS6o4r7MQwa6/V2sEBI
	 7+xVxtrHcoT3A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: treding@nvidia.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Cc: bbasu@nvidia.com
In-Reply-To: <20260626131423.3986998-1-sumitg@nvidia.com>
References: <20260626131423.3986998-1-sumitg@nvidia.com>
Subject: Re: [PATCH v3] memory: tegra: add multi-socket support to the
 memory interconnect
Message-Id: <178350936232.90965.14677795402442305935.b4-ty@b4>
Date: Wed, 08 Jul 2026 13:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 26 Jun 2026 18:44:23 +0530, Sumit Gupta wrote:
> Add support for representing each memory-controller instance (one
> per NUMA node / socket) as its own interconnect (ICC) provider,
> with its own MC client nodes, to match the hardware topology on
> multi-socket Tegra SoCs.
> 
> Use the NUMA node ID to make client IDs globally unique across
> per-socket providers, since the ICC framework allocates node IDs
> from a single global IDR. Per-socket MC and EMC node names are
> also derived from dev_name() so they match the corresponding
> debugfs subdirectory. On single-socket platforms (NUMA_NO_NODE)
> the existing client IDs and node-name strings are preserved.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: add multi-socket support to the memory interconnect
      https://git.kernel.org/krzk/linux-mem-ctrl/c/5239692170f1815c0bbc57de432d7eb8b616f8f1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

