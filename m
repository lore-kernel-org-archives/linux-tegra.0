Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AC2C027C;
	Sun, 12 Apr 2026 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775969567; cv=none; b=JxAyietBRKwE0tlppELKuRRPMZtKoujpyF4Utx5F3ylKofsJWGiS25YxfGXcCzP1/mHsGANE+Xq1639UOE5diQ2xWt5UwsX8N32g/l1IbZY42kfSyfVimCSmuhzV+YhK6Y6LJP8kfajtaJvVnSSMhN1F4nRc/MF2h28hICB/zp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775969567; c=relaxed/simple;
	bh=vCNTuqhCplT0OgoGRN8meGqKIW1Zum6FeqiTRsFcJLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3AOW1mjth8T7Pn+hzE07Ync+gDpBiSeF1TLUEH5oiT/+9HGWEr9nmbph+tG9lfaBZkHMGBaPCBDKI/ZOC7/NJu4/fCdfThw07y8jbftHya8PPS1pZbxA5TVmpB3g3Fws+Qzjkv8jhSOm8xcJ4terkqV4qVsLNJ/f3fQ4gMT+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qVOXrKHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qVOXrKHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD94C19424;
	Sun, 12 Apr 2026 04:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775969567;
	bh=vCNTuqhCplT0OgoGRN8meGqKIW1Zum6FeqiTRsFcJLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVOXrKHG3cmWWG3mBJkpTzVM9oGzfl6THntyvKryHTLSk4DKmUd44nH9BMpTRd0Dn
	 6mn8+HS4YSgWXfbpBcUjRQrkeeG4rLLbkRbnspjOx8hwYbBxyap46k8wwYN1SeJuSJ
	 nIEUrJN4j5sA7SFfc3jhmCao3UsOU2TfcmoXEGqc=
Date: Sun, 12 Apr 2026 06:52:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: media: tegra-video: add missing error
 checks in vi_tpg_fmts_bitmap_init()
Message-ID: <2026041250-footwear-ashes-84da@gregkh>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
 <20260411211006.150782-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-2-hossu.alexandru@gmail.com>

On Sat, Apr 11, 2026 at 11:10:05PM +0200, Alexandru Hossu wrote:
> tegra_get_format_idx_by_code() returns -1 when the requested format is
> not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
> check this return value before passing it to bitmap_set(). A negative
> index converted to unsigned would result in an out-of-bounds memory
> access, corrupting adjacent kernel memory.
> 
> Add WARN_ON() guards so that any future SoC addition or Kconfig change
> that exposes this path fails loudly rather than silently corrupting memory.

That is not "failing" that is "rebooting the box and loosing all of the
user's data" for when panic-on-warn is set, that will happen.

Please don't do that, if this can be handled by logic, then handle it,
report the error, and move on.  Don't crash systems.

thanks,

greg k-h
