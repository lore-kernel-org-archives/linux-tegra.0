Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6665632BD;
	Thu, 15 Oct 2026 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087481; cv=none; b=Mn0fdp0AsBA/BPkl0FgePuCUGk7kMe7gp+kOM2asAMAw1J4KpLaxjM77RvJavlW/LBl9ZSsdOsDnI07Bzi5kzyJ0ZWf5i+VGiVoN0OpvtUQcmmWZioQDqhAFLLavqP3bYDf4UEymLHnJwcQEmpa4oqc+n875pXdOTMRwEEOe8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087481; c=relaxed/simple;
	bh=uHBTgk4DZweeMhQu7sTVDC9/m+G6LPRhE9pGY3s0Wh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qrjjYzTvjbrNyywfbCyg1BT3JGIlfO+SGB6jDThDJgO8jnl1Jkenk2WwOt1L1GnzR22xED8UGIlpTf3DLrUGjQFHONAC5YCwufPS70G1LXSnDzwNjjJMbIWKAuUUVmHBVC8pD0UK/dhX1YCiAPxPPg+f6Jz4nG5+fHKPHbS/KNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=EugHRsME; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="EugHRsME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jWrsgsCVJy/bOueBv9chBG0gbHrXDDac//7peF8o+5c=;
  b=EugHRsMEXiXoPjlT63QRYyvgb0RQX/SqFrqHxS7moOYEMpv9LPDF/RLB
   Psg+ONHRxkGuyMDh/Q4kBjINIAJ9acdLXVi8vruVMOHTq18hB4w1bP35R
   3dMYFGH2uFTbEEA/shsGejBYT+zc+mjlA7BRVW/RaRpznDFT4uaO9zmRf
   o=;
X-CSE-ConnectionGUID: z8y1XpdjR9Gt0nVAUXdI7g==
X-CSE-MsgGUID: haYQMa1dRRexV9fmJ4FpKg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,160,1787004000"; 
   d="scan'208";a="159950748"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:04:21 +0200
Date: Thu, 15 Oct 2026 14:04:20 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <gservice341@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jeremy Dean Clifton <deaner92@yahoo.com>, Marc Dietrich <marvin24@gmx.de>, 
    ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: nvec: use guard(mutex) in
 nvec_write_sync()
In-Reply-To: <de94c8cd-0afc-4a35-bf81-019a8e4cc8e8@gmail.com>
Message-ID: <d9abf950-62eb-cd29-b25b-3bb727da6d2b@inria.fr>
References: <20261012222926.7754-1-deaner92.ref@yahoo.com> <20261012222926.7754-1-deaner92@yahoo.com> <2026101335-expansive-veteran-c4d6@gregkh> <de94c8cd-0afc-4a35-bf81-019a8e4cc8e8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 15 Oct 2026, Jeremy Dean Clifton wrote:

> On 10/13/26 12:15 AM, Greg Kroah-Hartman wrote:
> > On Mon, Oct 12, 2026 at 10:29:26PM +0000, Jeremy Dean Clifton wrote:
> > > The three return paths of nvec_write_sync() each release
> > > sync_write_mutex with explicit unlock calls.
> > >
> > > Use guard(mutex) to unlock the lock automatically on any return
> > > path.
> > >
> > > This removes the three mutex_unlock() calls.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> > > ---
> > > v2:
> > >   - Reword the commit message to state the motivation and to make
> > >     clear that removing the mutex_unlock() calls is the result of
> > >     the change (Julia Lawall).
> > > v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/
> >
> > Please read the archives for why I will not take guard() rewrites of
> > staging drivers (nor do I want to see you use a LLM in here either.)
> >
> > sorry,
> >
> > greg k-h
>
> Hello Greg + Everyone,
>
>
> It turns out that I was unknowingly subscribed to this list and started
> creating patches for the Outreachy group without ever having submitted an
> application to Outreachy. I just wanted to learn how to contribute to the
> Linux Kernel and I saw https://kernelnewbies.org/ as a direct connection to
> Outreachy.
>
> While I am technically not part of this cohort, I can still review patches.
> What is preferred?
>
> I assume that the same rules apply outside of Outreachy? No LLMs and no
> guard() rewrites.

Yes, to my understanding.

julia

>
> Jeremy
>
>
>
