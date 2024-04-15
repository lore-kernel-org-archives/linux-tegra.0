Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4505C5F466
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713179261; cv=none; b=tyUDGQxqY3QaPmZASWtivg0TETU/cN+xf3sdMvMYdKmVAyzCBG3qAzPbgH9RtMblEOMKzWq1DQ3g1D79y/qwLxGIlxak1LNnqqZ+A/Q7Crt/K1aKK+C/AIUkbMWkZ4rgzpvKFKJAXtI8SPUU8E2/PjmrqglwsODed/+aO8/4OVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713179261; c=relaxed/simple;
	bh=uEd8KkSypzJeOFW4KbVVSyKYNOvRDiQ3KWhLBs8lqHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqKvRNtBrk5bzfnQ1cr+9pfLlW2GCIzn40ma7jn8NhLgYLpGpsIiI9Oy08Jo1HSuhTkYgQUb0P6Qfa4vh41dXZ0AL6MHbVwAS+cFWJAd89r8hjRKCmktKfIV+A+QPM/iZbt8LQQ4uYhzPQLttGsQzB+67RIJoh5FwcdHSoZeefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nw0B/5yZ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nw0B/5yZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7F2926001431;
	Mon, 15 Apr 2024 12:07:26 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id VYUZQpCUh5eG; Mon, 15 Apr 2024 12:07:24 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 31DB66001428;
	Mon, 15 Apr 2024 12:07:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713179244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GzuJkWsZIPpw+94m0N+VU5OuomoSXeNnZYcxe393lkc=;
	b=nw0B/5yZ3zTXDCXK9DhuROeflG86g2Vab6VvS67vgpyefTzarozi+j6EPRuRw5Yw6rFPWG
	IqOzAG02+asNjAIivLeUfUKSwTCwJvIPNMpxStObgbMq3Ej6xLp1rptdMMQlr9sh0Awarl
	/mQ9aACe4Do6uEIQsOVZRK9mxNT/8co=
Received: from diogo-gram (bl10-99-26.dsl.telepac.pt [85.243.99.26])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E5BBE360088;
	Mon, 15 Apr 2024 12:07:23 +0100 (WEST)
Date: Mon, 15 Apr 2024 12:07:18 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/7] memory: tegra: Change macros to interpret parameter
 as integer
Message-ID: <eontyngsaowq552ocwcxp64boyf2ziszi4brhabehuyzigdkce@cfvg6tpxpvww>
References: <20240409094632.62916-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240409094632.62916-5-diogo.ivo@tecnico.ulisboa.pt>
 <b80aa6b2-2c55-4e6b-8882-e57634dfde15@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b80aa6b2-2c55-4e6b-8882-e57634dfde15@linaro.org>

Hi Krzysztof,

On Sat, Apr 13, 2024 at 10:02:07AM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2024 11:46, Diogo Ivo wrote:
> > Convert the macros that manipulate the delay values to interpret their
> > index parameter as an integer to allow the introduction of loops.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 33 +++++++------------
> >  1 file changed, 11 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > index a80c3b575612..65157bd5dc24 100644
> > --- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > +++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
> > @@ -75,29 +75,29 @@ enum {
> >   * The division portion of the average operation.
> >   */
> >  #define __AVERAGE_PTFV(dev)						\
> > -	({ next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] =	\
> > -	   next->ptfv_list[PTFV_DQSOSC_MOVAVG_ ## dev ## _INDEX] /	\
> > +	({ next->ptfv_list[dev] =					\
> > +	   next->ptfv_list[dev] /					\
> 
> Aren't you missing now () over dev?

Yes I am, I'll add it for v2.

> Are you sure this passes checkpatch --strict?

It did :)

Thank you for the review!

Best regards,
Diogo
