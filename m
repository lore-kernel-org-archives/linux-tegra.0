Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1411B4250;
	Fri, 28 Feb 2025 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740757700; cv=none; b=mRIuSu8H1FsMT4iR4tjwvvCpzhz4oe/dK+UhKvoocTYA7gwfRRlb0wKduyO9k85/ifXUvMPdtN2Kz0Rbvh5emyh3iHtg0NrRnmlJmSw++b6LM6WgguEupGZ4Q5Vcbu4Rcs/VADaj25tps8gWtsr164XJuEsB7tXBYtQekPtlLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740757700; c=relaxed/simple;
	bh=9P6/+EsVlp5BNVchl8htmv7DBh6aF+YmtS3T/EuAKas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxUy/5gHys3CNZKkUdozDtY+uzq67Zc6HPO4cK0uo7mj/kXZ7Lon4icbwCYtCp8JGpr6HOnWDmosHpO/wdluv03mPUBhf0Q5tfh3Sh3Y9LZ9bqEEyt8sRvxO1b4Mqo8Z4CDiYeD4JrxJF4OIc96NZ0jLMsmp1v5HjNcSa1sKwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Rq4UGavv; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Rq4UGavv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=I0xJ39hUZ6TGWLlkG1MakJCHxny3Dc6eRv0GRs5Wrko=; b=Rq4UGavvAKlw+Zg9
	6fWEfvg+jHej+O9ehAgHbPN21bVMnqiq63hddWimR/6oar2YBnOSezOO4tloaJlzShIoop/tlAC35
	wvgQcVQ47uprJG1HRU2qEyTo3Wr2eeLBGYENaFzmwlBrerU3ngH+Xl6vqOXPG5rurjyWJegdB0+SD
	VJHXTwQsg68k5x3kEKoKvdtMlac6PIFbLW4iMVo0LimFI5I7wiL8p+D73eD/c5gqgvdGatEWEVoCX
	SprRIgqjr2KRUqncN/FC5NJ6VJ5mFHVa799ULaqpLJ3t2EJpCfHrkEgggkg2OmvLTf0E8ZpNOiKHi
	ksWOPdTyW7LSLfd1YA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1to2aw-001g8w-09;
	Fri, 28 Feb 2025 15:48:10 +0000
Date: Fri, 28 Feb 2025 15:48:09 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de
Cc: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com,
	mperttunen@nvidia.com, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Message-ID: <Z8HauW1ewQoz0iLh@gallifrey>
References: <20241215214750.448209-1-linux@treblig.org>
 <0036ecec-8476-4617-ac40-8ff90fb33c07@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0036ecec-8476-4617-ac40-8ff90fb33c07@kapsi.fi>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:47:30 up 296 days,  3:01,  1 user,  load average: 0.01, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,

* Mikko Perttunen (cyndis@kapsi.fi) wrote:
> On 12/16/24 6:47 AM, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > host1x_debug_dump_syncpts() has been unused since
> > commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
> > fences")
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >   drivers/gpu/host1x/debug.c | 9 ---------
> >   drivers/gpu/host1x/debug.h | 1 -
> >   2 files changed, 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> > index a18cc8d8caf5..6433c00d5d7e 100644
> > --- a/drivers/gpu/host1x/debug.c
> > +++ b/drivers/gpu/host1x/debug.c
> > @@ -216,12 +216,3 @@ void host1x_debug_dump(struct host1x *host1x)
> >   	show_all(host1x, &o, true);
> >   }
> > -
> > -void host1x_debug_dump_syncpts(struct host1x *host1x)
> > -{
> > -	struct output o = {
> > -		.fn = write_to_printk
> > -	};
> > -
> > -	show_syncpts(host1x, &o, false);
> > -}
> > diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
> > index 62bd8a091fa7..c43c61d876a9 100644
> > --- a/drivers/gpu/host1x/debug.h
> > +++ b/drivers/gpu/host1x/debug.h
> > @@ -41,6 +41,5 @@ extern unsigned int host1x_debug_trace_cmdbuf;
> >   void host1x_debug_init(struct host1x *host1x);
> >   void host1x_debug_deinit(struct host1x *host1x);
> >   void host1x_debug_dump(struct host1x *host1x);
> > -void host1x_debug_dump_syncpts(struct host1x *host1x);
> >   #endif
> 
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>

Can this find it's way into drm please.

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
