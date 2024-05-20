Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5F8BEA;
	Mon, 20 May 2024 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716195811; cv=none; b=mFnt8Bd2H/9ekJABp8D8tiv4MCcerGX/wPr4YiO6ww/DIWjfZRv09oF7Qdl5yB+CRayXVVM7UbLDnsR4m6IKF/APeHihqPczF+wBRaMiVcjtsgYtvmBaTYfc9dcdf2I6xAsg0iesXGhbSLKTpcTpOKwJjZaRifPEBevzvncDdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716195811; c=relaxed/simple;
	bh=vNIDBF9X86I3eNH3ACbqdxubrgXLfR93QrgLlvkHabM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ho5AhLgeqrETieKO+wP4TSRuWr9XdBBjlXk0FKPcqa9kpVKpbDPjpsC+rhRZMVsIgqhbMm+qWc18Zx3uzPODnqt3sFG2sD559tMv9Wo2atnANvT6F9oFGDGPoo3UHj1HmoaAuQVWb/OIhI4E9rhUQyDrbsrwB6zKtwvNSkG9RP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t+Eld+Qe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t+Eld+Qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE033C2BD10;
	Mon, 20 May 2024 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716195810;
	bh=vNIDBF9X86I3eNH3ACbqdxubrgXLfR93QrgLlvkHabM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+Eld+QeRuyMzXsiBDA6bKkJBWz4UxGITjqpjVyhJ43ySTPuwleWWyZTJm4L8uWgS
	 jU43YQH2gTFxPUcDfTaHyNz+7cY5F7blavYCX7bGF2D22nuv59D32isDwBBm/L8ucq
	 PtnTSJePjop2UjQTf5qdDRqbrNojFNhFRivSsFFo=
Date: Mon, 20 May 2024 11:03:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes robust
Message-ID: <2024052009-impotent-open-1621@gregkh>
References: <20240421104642.25417-1-marvin24@gmx.de>
 <334d0a42-9dda-a21b-2650-d33187525eb9@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <334d0a42-9dda-a21b-2650-d33187525eb9@gmx.de>

On Mon, May 20, 2024 at 10:11:20AM +0200, Marc Dietrich wrote:
> Hello Greg,
> 
> On Sun, 21 Apr 2024, Marc Dietrich wrote:
> 
> > The i2c controller needs to read back the data written to its registers.
> > This way we can avoid the long delay in the interrupt handler.
> > 
> > Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> > ---
> > drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
> > 1 file changed, 24 insertions(+), 17 deletions(-)
> 
> I think I answered all remaining comments. Are there any other
> objections?

Sorry, just went back and looked, and no, as-is I don't want to take
this:

> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index 45df190c2f94..214839f51048 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
> > 		(uint)nvec->tx->size, nvec->tx->data[1]);
> > }
> > 
> > +/**
> > + * i2c_writel - safely write to an I2C client controller register
> > + * @val: value to be written
> > + * @reg: register to write to
> > + *
> > + * A write to an I2C controller register needs to be read back to make sure
> > + * that the value has arrived.
> > + */
> > +static void i2c_writel(u32 val, void *reg)
> > +{
> > +	writel_relaxed(val, reg);
> > +
> > +	/* read back register to make sure that register writes completed */
> > +	readl_relaxed(reg);
> > +}

This is not an i2c write function, please don't call it that and give it
kernel doc formatting implying that it is an i2c write.

Name it after this odd device that requires the read to happen, that's
unique to it, nothing else.

And don't worry about "potential drivers in the future", we worry about
what we have here today.  You can rename/modify/whatever in the future
if anything else ever happens.  We can only go off of what we have in
front of us now.

thanks,

greg k-h
