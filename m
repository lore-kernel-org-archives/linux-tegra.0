Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04A237757F;
	Mon,  8 Jun 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920778; cv=none; b=a20q8FbQkb829Uf6SEuRA0v0JshdvUIi0SweXNsYZkPGpLDZwlkY0wO+RrRdBqjqn2u8z9vIAI6J2bEvH1ZEmnoMeQlZcLEPg3KGgILmwy9zQDt1XQTzLLW45UyaJQKGH+HerSE/QnuEA51zttS7Q1eRQBNsBgA1Z1tLX0qY4kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920778; c=relaxed/simple;
	bh=LXb1fZAbDzM0fEmpucJj1Zu/xweCxXsFltwgZycjxrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SSPdsR/JEbvYG3BmO4TqlVdGQzJgYf5WdyjfI2UTymgGi3MDJNPcZqFA15+hb3MwC1LZDCPpLpCRUnwhH+ZkMzN1+aWJ0w+P33IknoVVx1eQx6fYMdljB2DHjDYJ5qtdnWunuiTqEAmoyRJuQWk4trBgqKpbc1FM2iCDgPlX57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOAI5eAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOAI5eAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77631F00893;
	Mon,  8 Jun 2026 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920777;
	bh=WHrvd+Ix4XPDs1dyzstSh2JQFRCQOTvcE7ymCQq6LUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jOAI5eAXXFrVUwIVdE7M6fwrmaAEymJvrDAkIvaNqWpi2RJN+L5jKGNcvMvnYaFYY
	 akkb0Ni2Q247xeweUhIRZtz2APjpxD/5XMWq2aYL4azekQ17L71R6iNBG6p9t2GxNw
	 zICnZbdKJky0SFraswlXM6pRdml6AjettiCBW3V3lykO4ADErm5erVORwSrPaaSjub
	 sapcqNFsl5jhg1etdIHa9GHq4isZZXvd+TW/qSvrkqNrCR5uYg2PJ8WAHhoumYXMaN
	 wg9jn1Vh6nUgkqK09StGOzIOfrsQ7T9OhM4yr5Ob0l39BTcYeZsjwfShai7+Xx9t2y
	 kG0vdfDk74n0w==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Sheetal <sheetal@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260517163045.363444-1-sheetal@nvidia.com>
References: <20260517163045.363444-1-sheetal@nvidia.com>
Subject: Re: [PATCH v7] dmaengine: tegra210-adma: Add error logging on
 failure paths
Message-Id: <178092077429.96550.17091975503641429507.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:42:54 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 17 May 2026 16:30:45 +0000, Sheetal wrote:
> Add dev_err/dev_err_probe logging across failure paths to improve
> debuggability of DMA errors during runtime and probe.
> 
> Use return dev_err_probe() pattern where no cleanup is required in the
> probe function. On error paths that need explicit unwind, store the
> dev_err_probe() return value in ret before jumping to the cleanup label.
> Also convert existing dev_err calls in probe to dev_err_probe for
> consistency, and use dev_err in non-probe functions.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: tegra210-adma: Add error logging on failure paths
      commit: b55bfcc677dd58d808a53173e0574b466dc27b9f

Best regards,
-- 
~Vinod


