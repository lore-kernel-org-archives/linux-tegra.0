Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3425F7B9
	for <linux-tegra@vger.kernel.org>; Thu, 28 May 2026 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000697; cv=none; b=hQXgToCjBsLtpbNWjEvfyO86nx533+i23QkVOCigw5W1wVEfWjlkbizWyDjkeIgUFbRTWAyuAdSpXRxavPylgiCrBUjIHu/CObHtaEm7J7935HhWBgNjwiLNG2NlOHsfxOk4j2lGLE+iySh8orad5RDqG5fY+ATJyUgtrvCn5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000697; c=relaxed/simple;
	bh=uZkBkcRSO01viivGj5Bs069NFs+5GD0LgM3Ve2OBh/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZsQOG9BvgopnCIbZS58sEGAT4dd27vTFoW2m6odru0+TiPLDJB659czOuwWR4ChLWoQLXIZIPjcThvzWMBePEP+zIsilCvS1csrHJoMu0mhuJ1tpqoR4PRg3LloPrbu9Ick4dHnswiWXaHlM8gJ1vYo7GVnnmjmS94v8jbBhsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coYrtrWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coYrtrWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DA31F000E9;
	Thu, 28 May 2026 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000696;
	bh=e8kxBxwjVFFZ1oyPy8BGbBsvcqLCPECQ61925KiShzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=coYrtrWWImSFBujTYLl14e7Pwi8Hbu/A/I17/lbk/3SShIgcZIdcaPGO8y+ms7d4/
	 DpntBPT7Rsov2bn5VgthwaTYRldxDsaMp6Ze7+g/3W4kK3wNd3WvavKr0i4gRMG2eo
	 kU0Uk+kP34jHEgGXXPPJs2dus1NxGsJz/Z6Ft+Xxtw9Kwm/m9QGNbOCqgGPhprfENU
	 Z+3p7ytE77Sv/lz9TmD4CLR9diX5p82TQOv/RFoz8DhUyvhXbd1oPCjqyn/96//Pxo
	 KxSDpvAEL5CqyhMI3UEOyj8DY6eAV0OqiGrMsnWVt8LEndEKty5VUwqCLMkWMyhpW7
	 9wIeAEWcqLkzA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Populate powergate debugfs only when needed
Date: Thu, 28 May 2026 22:38:12 +0200
Message-ID: <178000068287.183798.14108264637400163133.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522155824.76002-1-jonathanh@nvidia.com>
References: <20260522155824.76002-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 22 May 2026 16:58:24 +0100, Jon Hunter wrote:
> The 'powergate' debugfs node is used to show the state of the powergates
> but for some devices the 'num_powergates' is 0 and so it displays
> nothing. Therefore, only populate this debugfs entry for devices where
> num_powergates is greater than 0.

Applied, thanks!

[1/1] soc/tegra: pmc: Populate powergate debugfs only when needed
      commit: e106029fc8749ff20bbe8c1c9bf6c4570ab8681d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
