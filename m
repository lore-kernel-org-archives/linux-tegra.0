Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E5405C37;
	Mon, 15 Jun 2026 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537557; cv=none; b=aAXsV5yBmoIDuubcjsG7FZB2PmjSx/ZuoQbxrSC0LoszxgsmiqFd7hKyUn897qCyxK5JGHuBJIopIaSBoIKXilD5g9irnpcp3wzWwbdlmUF6DSQOcvEkQ/KTrN7YF+JX76OqteFzPUMvm9BzvKRYp7rFQRq491kbxR3hY4ZlbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537557; c=relaxed/simple;
	bh=tBJ7jTIxnov9Hn6ZqJswVPD6eytk2cVT2Xn3xqpOJ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+gKom2UNo+PdlWDaNTnE0qrHf4nra4WqqL6rqfprBoE329xtmyrztTatftm6fJprEb3oSt+IGFFL1MIZhRtwbZMfkSNW/FZsqsNFsZ5i58FjAQgev0cIYfErnlRKUmWaOcPA92tBl9f9K1qG3XBKvEZ+hvGscj8Eexs9G9UE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YTyIw/8T; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YTyIw/8T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vAs69HDaUKzpuXRgFebwsAmOLTdAIrIfTVvtFCpS00M=; b=YTyIw/8TWpn6Vx4ZigHqjfjqiE
	TfHLcQCsFgAE0ye2VwnXJf4aRZaro6NJoMtcQ6Fa8KBA0Pj/dOsoiVbHCcq++eRZ/DWTKNpAC2R2o
	sC7nnUf/BvhO8oHNNRmcLI+egYWIoIvfy6Fro706BItFEX9Y9tUhB2roPmoNp5pmwimJ3gw0Dv4oy
	E1IN29UJ8P/4hyOu7Qqyztw1p+ZZyWNJ9GLEhhcmdbSJqEl4S4rPlyBbRkASlMj2eDE3F4yoqXqAN
	X/n9zsd/nU1yNA+JIiYxne5PQh3tr1yWjIAhd8vU1EjmbEZh0FUyrkCU5wmgTgCmee1FgN8TKbyDg
	1xPXWHSw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZ9Ib-00DAan-1x;
	Mon, 15 Jun 2026 15:32:29 +0000
Date: Mon, 15 Jun 2026 08:32:25 -0700
From: Breno Leitao <leitao@debian.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] soc/tegra: fuse: Fix spurious straps warning on SMCCC
 platforms
Message-ID: <ajAa4JAXyssMpr1R@gmail.com>
References: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-tegra_warn_fix-v1-1-78522c852340@debian.org>
X-Debian-User: leitao


On Thu, Jun 04, 2026 at 03:36:17AM -0700, Breno Leitao wrote:
> My Grace host started to show this warning:
>   WARNING: drivers/soc/tegra/fuse/tegra-apbmisc.c:120 at tegra_read_straps
>    tegra30_fuse_add_randomness
>    tegra30_fuse_init
>    tegra_fuse_probe
> 
> tegra_read_straps() warns when the static "chipid" cache is still zero,
> using it as a proxy for "APBMISC has been initialised". However chipid
> is only ever populated lazily by tegra_read_chipid() when it reads the
> APBMISC register.
> 
> Guard on apbmisc_base instead, which is set unconditionally in
> tegra_init_apbmisc_resources() for all platforms and is already the
> sentinel used by tegra_read_chipid().
> 
> Fixes: c71f213fa5af ("soc/tegra: fuse: Warn if straps are not ready")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 87ae63a7e52d..7aba7c58bad0 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -117,7 +117,7 @@ bool tegra_is_silicon(void)
>  
>  u32 tegra_read_straps(void)
>  {
> -	WARN(!chipid, "Tegra ABP MISC not yet available\n");
> +	WARN(!apbmisc_base, "Tegra ABP MISC not yet available\n");

Hello Thierry,

Have you had a chance to look at this one? This is showing up in my
Grace all the time.

Thanks

