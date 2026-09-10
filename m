Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCB4BFE7C
	for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2026 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044073; cv=none; b=JNJ4Xs5e0/OwYutPX+qwMl5i2njWoaOqvquvJdokqimXJ6OAiP6UgnxQAZjnzpFa6OO+LEChy8GYwAIjG9X4a71UMySCcJgdhIFqJZlKYB43af1HXBHsuYgmWh8deiTJDDVxoyPfxjibk2pHaYZC7t33Mmj5MCxG01LDERG2MkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044073; c=relaxed/simple;
	bh=YHWANGD3p0KdnbN+MqA6xoTrX2p7p70IdWFNuwDJ3kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L033fdxLuVr+vAxQ6ohsphX1RBs7zYQriP/v4Q5QhVK3uOGt/pf5pdBI4uRhIKlGWQPL3WuSlZmVpyJwFhNz1NHarphbMOFpE508m2RUZyi0UIHu+jF8mWLOa+DRtFcYYJWLNgVQ7uHt3+E2AcZmNr5P0RhIrVFDZ1uNhsxdbNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQt/iXRz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQt/iXRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F291F000FF;
	Thu, 10 Sep 2026 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044071;
	bh=nqcCxRxMFbBrhwPMpodtxEXS6u5ZBiAiUWNlaX+MgFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YQt/iXRzX69wBB0GMl+FdVJYEpPyRQDJpNHFnFYfGR+wwExa6vYlr2/ygpKeF9Iou
	 ObaUKZ6XSDR3t6yGKBJmxOyyRDcmRw3+CUeQVFrNnzzZKU7hkbupXbUn5EJM/WXbza
	 KjRRA+GAFpu4P8BsuIdsxm4ROS3XaiLqgk7rk6xq9xl6WXKJRwhiJvMlX130jiTLB+
	 eV+8p7ZnuEubrC82Hk5dbFZXUt6SvZNhqTzGdYyGiDRRpIRXJaEl2YXQbpA8kaoGLW
	 /z2fm+Gr3vSBCCPzuG54THAJ0mksF5h1qQtOUW7RS0G6VYgzScMDF4K6j1mcJr0api
	 65v1xk03czdww==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Fix uninitialised clock rate
Date: Thu, 10 Sep 2026 14:41:04 +0200
Message-ID: <178904405812.3565311.12410117644991652709.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821130124.58844-1-jonathanh@nvidia.com>
References: <20260821130124.58844-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 21 Aug 2026 14:01:24 +0100, Jon Hunter wrote:
> For legacy 32-bit Tegra devices, the warning in the
> tegra_pmc_enter_suspend_mode() function is being triggered because the
> early_pmc->rate variable is never configured and hence, always 0. This
> issue started occurring after updating the PMC driver to create the PMC
> context dynamically which causes the 'rate' to be set in the new dynamic
> context, but missed updating the rate in the early PMC context.
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: pmc: Fix uninitialised clock rate
      commit: c5c95dbdc9011a56359df4dc00be829bbcc0b036

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
