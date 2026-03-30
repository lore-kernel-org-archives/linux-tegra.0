Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EA3BF67D;
	Mon, 30 Mar 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881003; cv=none; b=JwPmjWXF1QI44eu1jh2nWwG8NsNW77kjYYvbWmvwjVSg34jBHlxrwW7EV9Nx0XrtbIPMn4uRh2iAN3yvDFBYymiOm44iXZd4bxFpM74a6kNEOdl05tyxiSZMOO2+wZ7vRU2WR+QPlopGMDEHoJfPJZGSRyK5SsHz5d7RQHR+puM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881003; c=relaxed/simple;
	bh=fpizcXYAwVqNmPJral1RNKXefb/SE1t5Xw4/QpJoDa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/rFVei693061ryW3Iu4BMI/oKoAKlHu1xEuGhFAVwr+SlllOFe9Aro8E6EH0BX2q07MzTWwQ2ei4x28BBuLTS7DetXCBPN4wOEOG5h0nmlQ/A+1ocl8EsrypZz8Uyc9l8mLf2tnidI//1soxfMFrJf4gmorIENzTX8Umhyne+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iS6wl7ye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iS6wl7ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CEEC19423;
	Mon, 30 Mar 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774881003;
	bh=fpizcXYAwVqNmPJral1RNKXefb/SE1t5Xw4/QpJoDa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iS6wl7ye0iUPDLUG1A8FfGJ7KMSdJmniAZwmqmrnCvUIIrjrhSPOJpvWeCbHnc80H
	 dHR5JetN0rmzl0qY6/Kd6Mk4nCPeAsGRy3lJaZjxLuXqXVF3VqVWUguQuzOdL7GZrk
	 cSqiPULGz9KpHUjKHHkAL++/YoCYsotc9op7T0Ng=
Date: Mon, 30 Mar 2026 16:29:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Oskar Ray-Frayssinet <rayfraytech@gmail.com>, marvin24@gmx.de,
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026033038-spectacle-judo-37ff@gregkh>
References: <2026030929-uncheck-reclining-315b@gregkh>
 <20260309220718.6475-1-rayfraytech@gmail.com>
 <2026031833-pampers-steed-4804@gregkh>
 <accc-kOYHllCEnxi@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <accc-kOYHllCEnxi@orome>

On Sat, Mar 28, 2026 at 01:21:40AM +0100, Thierry Reding wrote:
> On Wed, Mar 18, 2026 at 03:59:43PM +0100, Greg KH wrote:
> > On Mon, Mar 09, 2026 at 11:07:18PM +0100, Oskar Ray-Frayssinet wrote:
> > > Fix block comment formatting to use * on subsequent lines
> > > and */ on a separate line as required by kernel coding style.
> > > 
> > > Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> > > ---
> > >  drivers/staging/nvec/nvec.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > > index e70fafc095f2..0e655f79ea4a 100644
> > > --- a/drivers/staging/nvec/nvec.c
> > > +++ b/drivers/staging/nvec/nvec.c
> > > @@ -659,7 +659,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> > >  			nvec_tx_set(nvec);
> > >  			to_send = nvec->tx->data[0];
> > >  			nvec->tx->pos = 1;
> > > -			/* Delay ACK due to AP20 HW Bug
> > > +			/* delay ACK due to AP20 HW Bug
> > >  			 * do not replace by usleep_range
> > >  			 */
> > >  			udelay(33);
> > > -- 
> > > 2.43.0
> > > 
> > > 
> > 
> > This change is not what you documented is changing :(
> 
> Hm... this is the 8th version of this patch that I've seen.
> 
> I don't know why there was a flurry of these. The checkpatch warning
> certainly isn't new, so maybe this was a new wave of janitors or
> something? Or maybe people using AI agents to get into kernel
> development. Not that it matters much, but it's not a pattern that I've
> seen before.
> 
> Also, the fact that 7 out of the 8 versions came in after the first had
> already landed in linux-next:
> 
>   29e79c66b3cc ("staging: nvec: fix block comment style in nvec_interrupt()")
> 
> suggests that people aren't using linux-next as their baseline. Do we
> need to be stricter in this regard? Seems a bit wasteful for you to have
> to spend so much time looking at duplicates, even though it seems like
> your automation did a lot of the work.

It's easy for me to reject things that obviously do not apply :)

thanks,

greg k-h
