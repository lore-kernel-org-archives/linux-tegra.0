Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8FB360EC4;
	Tue,  2 Jun 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411768; cv=none; b=SzW9LgH/iga8JW4IWTd2rPQXGuC9JASQFzldzQDeDfs9N6yS6rPmUGche2kL4tTZ9QkHzCt7uUXh6XhPwvWDbPkKZ5SAu6H7TOwHpjlwuQ2+yzTM4AWjOFEB51ymArm7Jj5IO/IAk6jehbvob0twlmgIueocN77Ds5mRtXQW06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411768; c=relaxed/simple;
	bh=DVp+Yi6Ko8xx5mdi9XXlmSgI4NVc6UePJZaaTPzAuoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5AjWOAXje39ti4FpHMp1XIJHquys/pH2Wu8nwDwqb9vfnZdtCPttelgxOfDlBRtjtCqtUNv2uNJAMn97igLhHw5xiOa4wqy9UPnyQaC4/Vr9E8xLZsBpoVPiD6Daaw3+ryv4v14ZRHBwco2xAV/uFq12WSv7EY9mFyhSSHQ6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqHXc6mP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqHXc6mP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962F21F00893;
	Tue,  2 Jun 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780411767;
	bh=fwO3EbMXCByI/1FOlLo/YL+bNhKbnRuBIGbzG8zbilU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kqHXc6mPKuyCPk9Aky7H52MNPP5X0cSVLTks5Ta4rrE8Vw/O1LwqvjS+wh6PosKfA
	 NpqD1XobDvFOF+6TJqcA1VEf1jYwnqBJehbQR5ZYCdmcN7FxmcYgTRkEfFG7mXux/1
	 mGfl++ZMfB+Xwd+YHlRz2LJ2+DH5YYQX2Dz5KfaCzP0UdKP7YaviowRR3h+6pjshoZ
	 8S6s37xNYF8yl6k0Ragoovi2BfsTDYFnNROJ9FSd/yhcPTdY1/A0YWj3H9/UdNT6go
	 OsFCR0AXf5X85j6EDXiFmo6Wf4TzmFjbKPT7UaHigO3PPFkc/ift7hQd7UsQF8lvNE
	 1gk73lblxTqJw==
Date: Tue, 2 Jun 2026 15:49:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Conor
 Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, Thierry Reding
 <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: smccc: add cache clean/invalidate IDs and
 return codes
Message-ID: <20260602154921.6c8e60e5@jic23-huawei>
In-Reply-To: <20260602082145.404939-2-smadhavan@nvidia.com>
References: <20260602082145.404939-1-smadhavan@nvidia.com>
	<20260602082145.404939-2-smadhavan@nvidia.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  2 Jun 2026 08:21:44 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
> call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
> need transient error handling.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

I assume beta spec is enough to merge this?  Probably just need
someone from Arm to confirm.  Last time we had this feature and it got
ripped out it only made it to an alpha spec (which is not enough!)

Jonathan

