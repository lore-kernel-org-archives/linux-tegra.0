Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBB13C3F9;
	Wed, 26 Jun 2024 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377369; cv=none; b=fCTXcHPjZSj358TveaEQm2wdn9XRbQgjXKGgYmFfcRnBKfkbqba+TWgeB+452IeDVy6dEfQTFsRAksVRDhB+ewgXMdtT1mqJVOM+qOew6sqVoA6lJ4umAs/er/1EhpYrCD9hEzlPAzB0koIxgSsQWjnbWwtBmmCOGzvXztnLZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377369; c=relaxed/simple;
	bh=DeNUckMmF4HuoYfQPD23ziZ14eW1uotkgiAdWyU4xxY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OvRwftbc2s9Z42ixqlxkeOYjUU9bPXgZiF89exNJTfth8knFTJTQ2/k34cyKxoTyf2nSYPm8foj3EsVzFOF49QRjHyRDjITPm7VoHGD+0cSZDs1lJ9wV/j+YH7eySq2H8gkyiaT1fT2dkEYFHWYskO2Cdmn0Jetr2XBM1IxJl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=u96Etjop; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="u96Etjop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gWh23bngFhtOBET3jRZTmg2MWDWx9l+WXBy5PKJFqxo=;
  b=u96Etjop0wXuyWgHQWBwrlZVH6sEVJgjoyS+LoNx5zy7VPXmLaN7+mrv
   CnPaAgtTCqNOd+M4U8XRSAMqcd+JUl1dDV0H8ZZlLYFMHNlRgOPm0iZ+k
   PHHpls2Mhb1Jaj74urRKaN3gEh+2U3HjJdfBPO1M9r0/L/mBQeAIyIYQp
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,265,1712613600"; 
   d="scan'208";a="90632967"
Received: from 203-174-183-243.bri.static-ipl.aapt.com.au (HELO hadrien) ([203.174.183.243])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 06:48:08 +0200
Date: Wed, 26 Jun 2024 14:48:03 +1000 (AEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
cc: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: use x instead of x != NULL
In-Reply-To: <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com>
Message-ID: <21151f5a-059-538c-3cec-7c40d625c5a8@inria.fr>
References: <667b2ee6.050a0220.f9c1.5426@mx.google.com> <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 26 Jun 2024, Philipp Hortmann wrote:

> On 6/25/24 22:56, Tom Mounet wrote:
> > Comply with coding rules defined in checkpatch
> >
> > Signed-off-by: Tom Mounet <tommounet@gmail.com>
> > ---
> >   drivers/staging/nvec/nvec.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > index e5ca78e57..814eb121c 100644
> > --- a/drivers/staging/nvec/nvec.c
> > +++ b/drivers/staging/nvec/nvec.c
> > @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
> >   {
> >   	mutex_lock(&nvec->sync_write_mutex);
> >   -	if (msg != NULL)
> > +	if (msg)
> >   		*msg = NULL;
> >     	nvec->sync_write_pending = (data[1] << 8) + data[0];
> > @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
> >     	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
> >   -	if (msg != NULL)
> > +	if (msg)
> >   		*msg = nvec->last_sync_msg;
> >   	else
> >   		nvec_msg_free(nvec, nvec->last_sync_msg);
>
>
> Hi Tom,
>
> what you change in this patch is fine. But the Description is not so lucky.
> Reason is that checkpatch is not defining the coding style. Not at all.
> Sometimes checkpatch is even wrong. The description I like would be:
>
> Use x instead of x != NULL to shorten code.
>
> or
>
> Use x instead of x != NULL to improve readability.
>
> If you send in a second version of this patch please use a change history.
> Description from Dan under:
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

How about adding "Issue identified by checkpatch"?  Checkpatch helped find
the problem, so it would be nice to acknowledge that.

julia


>
> Thanks
>
> Bye Philipp
>
>
