Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616CB5DF0E
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713179837; cv=none; b=fAOkbeO1zvviwkccXyQEsx/jUl+rDXxIJN5p1zLM0fbGId+p61j6b7LhRLiDH96hxipMyEryhwOgsxkN8tzqLXCIjYgUpr2t+Ep5Pp7pSWRRgjHXJaPVC5N1QcUSm/dCHOw0tiuUOwjxXJkgEzQ+yJzR5pRqTeKIX4m7/2oabVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713179837; c=relaxed/simple;
	bh=XFXzT1Nm1+WuYptXa/70YDKw1woB1/xudrWYwqfgj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prJnkhhh3CkuP9XA0zY5JesqyOXWQnsTJZjoXAa84wqwRZcCIrF2J0j30uzagW12E/buzMU837QHUNvW3bvELZUBvBUDyMGfpFHGAc/ZpjUMFUwQHG/w7xB8Et22HXbY8s0BjsshCXfoV//3ktf166CYaEuj6FgTLqTMRjOJN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=iLEqXwnZ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="iLEqXwnZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5C38E60020CC;
	Mon, 15 Apr 2024 12:17:12 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id LN8m-CQecFhQ; Mon, 15 Apr 2024 12:17:10 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 1B3256001421;
	Mon, 15 Apr 2024 12:17:10 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713179830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14nw/LFobQEJ2RIZ7+bwFXe5oogugQHIy0rhzkLshjo=;
	b=iLEqXwnZw1b1biywcumZrQKVoCNSINeNIXfMR0cYt1dOSadAnJuII5Q3hlGnpIyz4UrhPD
	nYpZemjiW8zTC6NW3q+64hZYQbhLUuhwEzAKlssp4CyqUShRvqmxQdsKm85HnBQCPNp6WR
	GiDlhJpUSw/b/Qg1GuBsKzNGDVEu148=
Received: from diogo-gram (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E529736008A;
	Mon, 15 Apr 2024 12:17:09 +0100 (WEST)
Date: Mon, 15 Apr 2024 12:17:05 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 6/7] memory: tegra: Move compare/update current delay
 values to a function
Message-ID: <bhcjccpyhr4ss2waya5z57c6reoxkhho43pzv4lhztlso7qhbw@fie3dnsmlygx>
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-7-diogo.ivo@tecnico.ulisboa.pt>
 <54d2d6f5-4628-42d0-aea5-6c1790cf356d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d2d6f5-4628-42d0-aea5-6c1790cf356d@linaro.org>

On Sat, Apr 13, 2024 at 10:07:44AM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2024 11:46, Diogo Ivo wrote:
> > Separate the comparison/updating of the measured delay values with the
> > values currently programmed into a separate function to simplify the
> > code.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 84 +++++++++----------
> >  1 file changed, 38 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > index 566e5c65c854..ec2f84758d55 100644
> > --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > @@ -113,19 +113,35 @@ enum {
> >  #define __MOVAVG(timing, dev)                      \
> >  	((timing)->ptfv_list[dev])
> >  
> > +static bool tegra210_emc_compare_update_delay(struct tegra210_emc_timing *timing,
> > +					      u32 measured, u32 idx)
> > +{
> > +	u32 *curr = &timing->current_dram_clktree[idx];
> > +	u32 rate_mhz = timing->rate / 1000;
> > +	u32 tmdel;
> > +
> > +	tmdel = abs(*curr - measured);
> > +
> > +	if (tmdel * 128 * rate_mhz / 1000000 > timing->tree_margin) {
> > +		*curr = measured;
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
> >  {
> >  	bool periodic_training_update = type == PERIODIC_TRAINING_UPDATE;
> >  	struct tegra210_emc_timing *last = emc->last;
> >  	struct tegra210_emc_timing *next = emc->next;
> >  	u32 last_timing_rate_mhz = last->rate / 1000;
> > -	u32 next_timing_rate_mhz = next->rate / 1000;
> >  	bool dvfs_update = type == DVFS_UPDATE;
> > -	s32 tdel = 0, tmdel = 0, adel = 0;
> >  	bool dvfs_pt1 = type == DVFS_PT1;
> >  	u32 temp[2][2], value, udelay;
> >  	unsigned long cval = 0;
> >  	unsigned int c, d, idx;
> > +	bool over = false;
> >  
> >  	if (dvfs_pt1 || periodic_training_update) {
> >  		udelay = tegra210_emc_actual_osc_clocks(last->run_clocks);
> > @@ -174,17 +190,9 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
> >  			else if (periodic_training_update)
> >  				__WEIGHTED_UPDATE_PTFV(idx, cval);
> >  
> > -			if (dvfs_update || periodic_training_update) {
> > -				tdel = next->current_dram_clktree[idx] -
> > -						__MOVAVG_AC(next, idx);
> > -				tmdel = (tdel < 0) ? -1 * tdel : tdel;
> > -				adel = tmdel;
> > -
> > -				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> > -				    next->tree_margin)
> > -					next->current_dram_clktree[idx] =
> > -						__MOVAVG_AC(next, idx);
> > -			}
> > +			if (dvfs_update || periodic_training_update)
> > +				over |= tegra210_emc_compare_update_delay(next,
> > +							__MOVAVG_AC(next, idx), idx);
> >  
> >  			/* C[c]D[d]U[1] */
> >  			idx++;
> > @@ -202,35 +210,26 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
> >  			else if (periodic_training_update)
> >  				__WEIGHTED_UPDATE_PTFV(idx, cval);
> >  
> > -			if (dvfs_update || periodic_training_update) {
> > -				tdel = next->current_dram_clktree[idx] -
> > -						__MOVAVG_AC(next, idx);
> > -				tmdel = (tdel < 0) ? -1 * tdel : tdel;
> > -
> > -				if (tmdel > adel)
> > -					adel = tmdel;
> > -
> > -				if (tmdel * 128 * next_timing_rate_mhz / 1000000 >
> > -				    next->tree_margin)
> > -					next->current_dram_clktree[idx] =
> > -						__MOVAVG_AC(next, idx);
> > -			}
> > +			if (dvfs_update || periodic_training_update)
> > +				over |= tegra210_emc_compare_update_delay(next,
> > +							__MOVAVG_AC(next, idx), idx);
> >  		}
> >  	}
> >  
> > -	return adel;
> > +	return over;
> 
> You are now returning always 0 or 1, while previously it was tmdel,
> which I suppose is not 0/1.
> 
> This looks odd, especially that function prototype did not change.

I completely forgot to change the return type of update_clock_tree_delay(),
it should now be bool instead of u32.

Before, tmdel was the largest difference between the current measurements
of delay values and the values that are programmed in the hardware.

All the callers of this function were taking this tmdel return value and
repeating the calculation that I moved to tegra210_emc_compare_update_delay(),
so this return value now simply reflects if the largest measured delay is over
the set margin or not to avoid this repetition.

Best regards,
Diogo
