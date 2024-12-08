Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400618C02E
	for <linux-tegra@vger.kernel.org>; Sun,  8 Dec 2024 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677374; cv=none; b=JGapDneP2RG7DIhj3ij/UD4/AlInG13Ma3ztw/qa4y6QqKXOdLpR1LXE2rOA/RQdbfjLkUSNhUbANkjrX3xtefUzBtH5uSkKEDkf7n2tucFaXQZWVGUHh+h1JzWdfv1h4zLVYQXVULqvHpzXS5fXWBl7GC0actVfMlPocJZUSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677374; c=relaxed/simple;
	bh=ZWho2upAeW4Yl/HHcd5o6hWdyOJYuXvjof6/QTXHk0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sUCta+UdEeTYvw247vXMwZL4VJqUR2EMCB6wh2kvntJzqiK6y2aM6vQxitukeSHBwoqhUEKnyd5NzEsuSJq0Df5hX8vCXukLHl2otsyedYxiYIJp9P0j/etwEcLaCW7oIAM0371Lxx7e/PttwgpQgUEBIyEQwIFTLyYTYNzJZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgQLHRs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgQLHRs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F94C4CEE0;
	Sun,  8 Dec 2024 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677374;
	bh=ZWho2upAeW4Yl/HHcd5o6hWdyOJYuXvjof6/QTXHk0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TgQLHRs1Gkh5ZLROsIaFLz0lZR1WnAo4yZno4+MQco4/lzZo91T4ew3QHnBRZUSld
	 +KucDO8oxfNzG/9wZrLbBmB91XmPKoKjbgHE5JVtB3qkhumAtGSXl9aZnO1vNLo6ho
	 JcIbawMItxPtel83L7ZYOgS1AceAIm73NsA2UO7aKRxBK++OHhZpx39f4j4mNHuPor
	 enelig0xWzssIm0yZfzna7/djerKxe47eDb+rCgwBFb0n4Piu5nMA8jADsdBXGaj/B
	 TFkh7xIq47MGxh/3QQJiDMiQCN3nys/5h0pKDFWOFmnZWxIYCJJFSsiarJhwZNMvbn
	 lY8Y37bFHRGng==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
In-Reply-To: <20241201002519.3468-1-lars@metafoo.de>
References: <20241201002519.3468-1-lars@metafoo.de>
Subject: Re: [PATCH] phy: tegra194: p2u: Allow to enable driver on Tegra234
Message-Id: <173367737174.1042266.7031082302793933090.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:32:51 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Nov 2024 16:25:19 -0800, Lars-Peter Clausen wrote:
> Commit de6026682569 ("phy: tegra: Add PCIe PIPE2UPHY support for Tegra234")
> add support for Tegra234 to the tegra194-p2u PHY driver. But the driver is
> currently not selectable when Tegra234 SoC support is enabled.
> 
> Update the Kconfig entry to allow the driver to be built when support the
> Tegra234 SoC is enabled.
> 
> [...]

Applied, thanks!

[1/1] phy: tegra194: p2u: Allow to enable driver on Tegra234
      commit: 3d811a4f38c773779748ed52f49cb7a609428b61

Best regards,
-- 
~Vinod


