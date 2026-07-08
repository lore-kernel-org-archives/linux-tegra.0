Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEA436358;
	Wed,  8 Jul 2026 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509368; cv=none; b=Jmn1XuBmHB+p5A9yjVhUMMe7MEQGQVjtgxB35+TQgbKbcOZxSpj6LK2MJFDqAlzvz86UwXS/Y3/CfhnW5B/Rrcb7cCbvGx5cP10BhMu0UGo2UjInt+/hcy9SDK/1wrTJvcS0ERLPRDrm1F4toNwe+yroZSlnffmCXtQ4JWufaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509368; c=relaxed/simple;
	bh=4bK2Mj2ohxazaTqYee/JEUunO+gG8KhLM+145beEIqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KK3xw2HWRnxY902SVyMCU1AE1LWtK8a6VyzeC+qf4vEcjnJtYfnvUqC/lWsrDHConJetFyVgBROk3P941X0+LCYuWcnWulrPFmsg0bSKjZZbcTm/4w3wpaimw2wXu31h6m1s3sTtxC53o4AI5XfX68fu1cj0JMiS8zuHxZtDV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odIo+6i9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odIo+6i9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F491F00A3A;
	Wed,  8 Jul 2026 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509367;
	bh=NarozPlc7rX0+kXUNCnsLaXADLUcQ14Pkq4E+wD9PXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=odIo+6i9jwUYg4GeCtUhhGBiGVUyTBUWSXSm8Le4PQ9iPWfj/gxrTrUp7TF7plRvO
	 /d+mln9jdYoKW0XmrE1UN/2ImrT8/Illk3T2dWmOILkQ58iMsIC1LdIK4jsHu1/Egu
	 Bw1zza0/q3UWp4DChsewpm3EXRs8xlpV1IMBk+mopxFJdi9jyXvTJobVE188D+e3Fi
	 IZ/6mfxHLVX5kOrk3KpGFCY/syntNwn1xmMisZryI4JjEyNaBxCOYeV9AN9ThziOsT
	 fGqxRl3DdhGoixZk79Fd7HZ68KJ0QItb7yBH4p/fxUosz0jzx2Gn8HBHP/zztY4/nG
	 VX1FDgav1oaJA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: thierry.reding@kernel.org, jonathanh@nvidia.com, 
 Ashish Mhetre <amhetre@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260703045653.395498-1-amhetre@nvidia.com>
References: <20260703045653.395498-1-amhetre@nvidia.com>
Subject: Re: [PATCH] memory: tegra: Guard against NULL mc_regs in IRQ
 handler
Message-Id: <178350936499.90965.18111260359333477681.b4-ty@b4>
Date: Wed, 08 Jul 2026 13:16:04 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 03 Jul 2026 04:56:53 +0000, Ashish Mhetre wrote:
> The per-error decode in tegra30_mc_handle_irq() dereferences
> mc->soc->regs unconditionally. This 'regs' structure is optional and is
> only used for decoding and logging MC error interrupts. The rest of the
> MC functionality does not depend on it.
> 
> When adding support for the Tegra238 SoC, the 'regs' structure was
> initially omitted because it is only used for error logging. We found
> that this resulted in a NULL pointer dereference in IRQ context, causing
> a crash when an MC error interrupt fired. Although existing upstream
> devices will not hit this condition because 'regs' is present, guard
> against it to improve the robustness of the driver.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Guard against NULL mc_regs in IRQ handler
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8111c7f3723f414b7f655a3880775cbbd0e9de8e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

