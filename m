Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397C2DB798;
	Mon,  8 Jun 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920772; cv=none; b=tT/xwDqPprN3kdOthGIdd3Mbu9aeC2UbjVXDI4vPYAeqyqWZqWgr6B061dfPWUywpnHv6TfZ1pzpoR3x1DpEntBHWU227YdylIT13EqZ3BlrGM83tDvSq4ljW42BHjuGclUnsX+SzO6VartmFVJla1o5NxQuUn126vLFo/gst5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920772; c=relaxed/simple;
	bh=+tLmKfMpk8drSfyfQSTMrb6JFo6LepIGwKm92nnk62Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eWjgO4Ee9aRb6hdRZvsSFZ2kORwdg16h02ay2uu0z0bgACUYbhmU+4QhzV2odRhmgQlZcv0cYeB4Ol6K7TFR5eip7sMM3qAOFYvqxN5cD3Ouo/95V8bJirlTC/yWf6S3/P/u1b3oXIBFStvenysL9TbTnSAohE/N1oqrsMlQsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnKFr/Xa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnKFr/Xa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549B81F00893;
	Mon,  8 Jun 2026 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920771;
	bh=9qS7SFSfRUq21Gc1cCdftCGwGNUZJGwmb3/Fobz/um8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bnKFr/Xava7syJUYy3DbrNNysklMEgaCgXy4yG6EFpoKtBxC8nMdYyDYOM3TJfHt4
	 5WUCrgcw4zcVhGhFOVCXIVdju3zAIHHI/CBTjB0mB1w+Fo+E7cxoWbSUp7BBYXP3gP
	 cqGTRJroRjMMMR0HsgfFJacnywij8RuI5X0E+qiNR+c7SVhtuy0toYNvmwr+dJutCP
	 Jabm8XZGPAVcsFQLvLegRpEqE/5ThpxcXGWrtFtSIiGhX0ZQxEKP8+jbYggiz4kNFG
	 49Zn63GrhWUfqJxx90zLdeev37pqmD/3hPn3hDnc5nq4EmrZHtZbyiJjRza8sk6KNY
	 Nqip07nS4BTxg==
From: Vinod Koul <vkoul@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Sheetal <sheetal@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Frank Li <Frank.Li@kernel.org>, 
 Mohan Kumar <mkumard@nvidia.com>, dmaengine@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260318073922.1760132-1-sheetal@nvidia.com>
References: <20260318073922.1760132-1-sheetal@nvidia.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: Add error logging on failure
 paths
Message-Id: <178092076795.96550.4000844569244724664.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 18 Mar 2026 07:39:22 +0000, Sheetal wrote:
> Add dev_err/dev_err_probe logging across failure paths to improve
> debuggability of DMA errors during runtime and probe.
> 
> 

Applied, thanks!

[1/1] dmaengine: tegra210-adma: Add error logging on failure paths
      commit: b55bfcc677dd58d808a53173e0574b466dc27b9f

Best regards,
-- 
~Vinod


