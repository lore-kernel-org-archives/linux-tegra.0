Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691613ED11B;
	Mon,  9 Mar 2026 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073715; cv=none; b=F0Wg+mzDpxrnIv5QpT9LE5UIl66OVItb1/kF/Y7Fsu39Bnp7AvmOL5vypxN2oeMumZSCVjK/l4B6JoDV5HQwQi1BwguqT67OHNlaL5L47lnfKUj2DWYpEvxNZ2x28NU2cCTmO4ZV9lnqQGuw7ijOUs/1ufAwIJt0uIYeJhOo6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073715; c=relaxed/simple;
	bh=z0Yy4MJc3ACIpYlyVT6qyGqLEagBy7yGB+DX9Jmr/Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADRs3RPKoTJgm5aM7RIphQcue44eKq5V3M8TEHcRFieeWgr0FKfkozEpsSFMQ/SJb5hmtkCmimJxcoGo5IR2tbJY/yXpteTLtejN9s3pLpMHgkGVfWal6vMmnyNNc3Ol6KD2QDP+c2ZuGe182GxIBUbmE//6jBN6QhUzEXtDkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OIC3sg3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OIC3sg3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673A6C4CEF7;
	Mon,  9 Mar 2026 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773073714;
	bh=z0Yy4MJc3ACIpYlyVT6qyGqLEagBy7yGB+DX9Jmr/Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIC3sg3kNA3WBW+ezA5QAfPasTyixZ1d7xSu9fI4GWBkmkIIRz9gScBLFzeg3njgy
	 I/6pNwNillGunjNXrVY5RaDOp7d53m3Lu/SrcPl/vTjvCzMNK3Xy1OtSQobTVYktjB
	 BPp171Hp5DEEO9L2rOUb1FtAEI8MNaGgpUi8VMCw=
Date: Mon, 9 Mar 2026 17:28:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Afkari Zergaw <afkarizergaw12@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style
Message-ID: <2026030927-egging-nearness-aebf@gregkh>
References: <20260302014015.3853-1-afkarizergaw12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302014015.3853-1-afkarizergaw12@gmail.com>

On Mon, Mar 02, 2026 at 01:40:15AM +0000, Afkari Zergaw wrote:
> Convert a block comment in nvec.c to follow the kernel block
> comment style where subsequent lines start with '*'.
> 
> Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..0e655f79ea4a 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
>  			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.43.0
> 
> 

Does not apply to my tree :(
