Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA6542A165;
	Fri,  9 Oct 2026 06:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526250; cv=none; b=BQtkiOgK/w24afC5H949yFMuaXp5BHwSOEHuVd3lzB5tnWGHxYMeZ5A+gDdt/Sjn2paS1EDuyQuVLum8jnnmEzDgWvecsp+pOi9bYVF6sMJA7QzrwTDje0wLI8sSumt2F5bag8ps8AKk52XLyKATLNtsrbTRBnc6ZLt2QeeWois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526250; c=relaxed/simple;
	bh=uZZSYAOjuJMOd9IMpZoWRtC11rV4plwn/pRAjV9rM/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFOZTw0jCwuTowz8W755eGGEzGHV3+WDlbFPEjcKQigFNgBeTTtj4yapwEK/7Ti6d4xcMxYGnCEo6jqgurRLXWUfoOPxySeo76PJiA8l2sQUFDRfrXg4vwmh6XsfH726dDBZGN6PbzUEUx4WM0UpU3fw/MAl/RrIqkNiscUoXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th2wQWgL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th2wQWgL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E2D1F000FF;
	Fri,  9 Oct 2026 06:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526248;
	bh=iSvppU/VIwgUjLgHLY+2yfkmaTPGx2jQBRc2qY3PfdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Th2wQWgLkUIUbUa9P7OdQoa+4jOz/4lruJgGs8eKOTUwAeX7Q9+hbqCzQSvLztDDJ
	 958bwpn1zjnZQl3RZiLRve68iqMIuohYfMaCj+N9XHF4KT/jGrCi/3A8PH8MWAzHaB
	 0Y7ljKhBHznW/ueF+DDrvJe+lJ1Fi/vlh+4/937ypk0egOiy9yWWuhSXW7F+f3bjKa
	 mTLyQ8yzTOJ5Xw7xUmH73s35FgaspvHsmD/hucDSrVVrv2EoUBv6QcPZmVcPsMLQRN
	 FdrOkdL8/K7MnrsR7/nEaoXiOPrGpzI02QO8+QswkCBovCYp7eFx3enG3qKTg2GBVW
	 rfXgho+3vjqFg==
Date: Fri, 9 Oct 2026 08:10:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] mtd: rawnand: tegra: fix OF node leak in
 tegra_nand_chips_init()
Message-ID: <20261009-zippy-prompt-ringtail-e8fc6c@quoll>
References: <20261008182442.2770036-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008182442.2770036-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 02:24:42 +0800, Haotian Zhang wrote:
> tegra_nand_chips_init() takes an extra reference on the child NAND node
> with of_get_next_child() and passes it to nand_set_flash_node(), which
> only stores the pointer in mtd->dev.of_node. None of the return paths,
> including the successful one, drop that reference, so the device node is
> leaked. The get/put pair performed by the MTD core in add_mtd_device()
> and mtd_release() is balanced and cannot compensate for it.
> 
> Release the reference with of_node_put() right after the node has been
> stored, and route the earlier error paths through an err_put_node label
> so that they release it as well.
> 
> Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




