Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F55D8FD
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713180137; cv=none; b=QItm2055OS7c3eyNJaYtKxHChK8xvFDUpfi1izElyNBJqV6VhFd/4IDmGmzzXXC6B7iDHWoAmjhArIFaMAC+QryeTzpgNjXucZ8nEVg/kJB+c2jZZJWcuHTdM402XwAYaZsi3wD4dBQKwS/pd/SBYbwYkLM2xs/4OGSDcUALqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713180137; c=relaxed/simple;
	bh=+Wltlh0E4HXQqxDFbNBlx296+OaU/fvm9bP5nrZ3+B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqwC0/lAT3GcJIzApZTC0ivhJRcIVFJpv6maxwXhgM26vJAnMxInfQONWCQ80einOG5Lcp8u3ziPxuFO4cRyCPc5cZf7nlFlJSD6j+SnuW7/z2tMzuB+epm37rU7f3HaSOiRq93H9cdZYE/r0y0uUf2IhQKN92UnBePmbiaWYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nicIKftW; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nicIKftW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id B36B160020EA;
	Mon, 15 Apr 2024 12:22:12 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id k6wC9FGF-Yzd; Mon, 15 Apr 2024 12:22:10 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7148D600025A;
	Mon, 15 Apr 2024 12:22:10 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713180130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lWtgdXTRMq1I/gL4s2ikLErb/TvGHtc2dvy51/RfzKQ=;
	b=nicIKftWC2yQu9PUHCLUMSuhSdWrJRAJ26qTJU1pZTaMMTDcMunejQs3lazzhAcFaBCQAb
	gOybaCv94pgNLBhtxLz9pspAm0rboaGF8SXQzyME2dDjeFSph+AoTXnQQl7vwY5Z9jYMfE
	0D0IOw//RZ+wHZEDlrHaIjmMviTnBNY=
Received: from diogo-gram (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 49314360088;
	Mon, 15 Apr 2024 12:22:10 +0100 (WEST)
Date: Mon, 15 Apr 2024 12:22:02 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 7/7] memory: tegra: Rework update_clock_tree_delay()
Message-ID: <tohunkhyf4ojukj4sjmjn4wfxzv6jdxvngma6f73tztbedvy62@6x3unhxhvmdl>
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-8-diogo.ivo@tecnico.ulisboa.pt>
 <5ab028e3-77fa-44ab-a1af-e70ae9d450ea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab028e3-77fa-44ab-a1af-e70ae9d450ea@linaro.org>

On Sat, Apr 13, 2024 at 10:08:40AM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2024 11:46, Diogo Ivo wrote:
> > Further streamline this function by moving the delay post-processing
> > to the callers, leaving it only with the task of returing the measured
> > delay values.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 120 +++++++-----------
> >  1 file changed, 46 insertions(+), 74 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > index ec2f84758d55..5e2c84fc835c 100644
> > --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > @@ -105,7 +105,7 @@ enum {
> >  			  next->ptfv_list[w])) /			\
> >  			(next->ptfv_list[w] + 1);			\
> >  									\
> > -		emc_dbg(emc, EMA_UPDATES, "%s: (s=%lu) EMA: %u\n",	\
> > +		emc_dbg(emc, EMA_UPDATES, "%s: (s=%u) EMA: %u\n",	\
> 
> Does not look related.

This was necessary to avoid compiler warnings as before when we were calling
this macro from update_clock_tree_delay() the value we were passing in was
declared as an unsigned long and now it is declared as u32, which it still
big enough for the values we are dealing with here.

Best regards,
Diogo
