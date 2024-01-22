Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDF3FB0D
	for <linux-tegra@vger.kernel.org>; Mon, 22 Jan 2024 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705940730; cv=none; b=Zci0GJRWdT50JJtl5ZnxmgrrYYGxluWxxc40OXSFKzgkagysH6XHAS45m/aP2NQQ286n7kptF7Aetsyj128j2Uh54c+vjN7G8qyZGtvbgS/YwAxKvxqVYdhfEuHFBGK+Nqhfuo+QdJ0ita3H0njYPHl96TtLnmA3MrOaAShJ2VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705940730; c=relaxed/simple;
	bh=KtlQoRP/zhDumyw1fouCN7/Z4w8AT5EfhjPHGchUqSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pctHyb4RvcyaBqkxmansOVNrKi77lkNui/cOq4TEhyEuwEFG6+dIbbc7oqx3e2Knh4Xsk3H88m1p0SkSoSLyslC059XsJ53GYS0Dz0SgVat51ynfbE82/x7m7msmzGCgtk7Q9kwuLXiZIZBcv8vOS9b22xXlbcHCMB8JYQcBBwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5fNUaZ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5fNUaZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CDAC433C7;
	Mon, 22 Jan 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705940730;
	bh=KtlQoRP/zhDumyw1fouCN7/Z4w8AT5EfhjPHGchUqSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c5fNUaZ2KJVG5D9wOJWhP1pr35s9MDIIfw0l4477xfzlzt7yzgQ3uQsKEY6lOwGe8
	 Fe3SMQSzQ+A/VIZZ5l+UeB+aU1hoITKHYCehrPf0+8R3YTJrbKAP2mr5z7i/AqQk9s
	 h5a4BaBNeME+g/Qzz/ommcylqsbsvcFQ1n61THE03aGlnPncSeVFP0HHJKjAMM8F+7
	 WmCbnUI1optsyaVUA9i2AHY2CQarMtWUlPe5LsT9GXYGD2zM7Cos1ELNpB/Yo1IKwv
	 sBGUL7oAb5JxhO6fZQVZTTeywqGBYNYNF74JAB1TlAV3tsai0yfPP3+e8cxG7SeCg+
	 EkyQZR7n1Vsxw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-tegra@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
In-Reply-To: <20240112093310.329642-1-pbrobinson@gmail.com>
References: <20240112093310.329642-1-pbrobinson@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] bus: tegra-aconnect: Update dependency
 to ARCH_TEGRA
Message-Id: <170594072843.298019.14078317290082328664.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:55:28 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 12 Jan 2024 09:32:55 +0000, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
> this driver.
> 
> 
> [...]

Applied, thanks!

[2/2] dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
      commit: 33b7db45533af240fe44e809f9dc4d604cf82d07

Best regards,
-- 
~Vinod


