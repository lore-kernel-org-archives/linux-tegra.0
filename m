Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D76F14600D;
	Wed, 26 Jun 2024 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380357; cv=none; b=av5ZiTWyyZxoAVbokYCvopxF+eruGKBrkpygVq21iYilfkYTxJ7Mg2ba3QT0ZPjGTJC5kcOpkZ+mnhtPiw0HhH12m4MAZadq9K2GG8IIWWSARAXJHVmuCWPG2Da9TJM4wKCIZc/stbOjr44ywzXJW7q2nSCNmjmeyAPCXLc/M3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380357; c=relaxed/simple;
	bh=xKW8fryJl2j7aazep2G8rv1cxwe7UOol0efPJPKSodg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bPW8/g1Q2U5HIt4mSFYEdNgdfmy+SjnWg1L4cQkdBd8PoWo1NWpsVKQ7cJdeLg3i6OO4nRLiE8z5pI+lJvNOTqX2l66JeHGqockEBiDlE/NfMjbKg/Qg6/F7rYnjqGZe8EtEYZCMxykJTMUV6PL6TYpTkWqcVLtSFo79XtixZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=EJ4U0UXk; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="EJ4U0UXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tjdrBQemgOuBtWyZQmwPsNwgJJWXGvx2ZFSmphIFOTA=;
  b=EJ4U0UXkdmOt7izt2MznxsMSMg+GyWkCFQHsvO7T5xwOPnU/BNUkHeM9
   q3fopTo5BSkkAVqeasMzFOO4k/il7fQ7zXkJFAI83ui7y3RCiRjNw+M2U
   50ja5KrR0jzU90hpAVA+TfAP/ebt3L7T7u4hgjFP5i90izUJzJR+QxYu5
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,266,1712613600"; 
   d="scan'208";a="90635097"
Received: from 203-174-183-243.bri.static-ipl.aapt.com.au (HELO hadrien) ([203.174.183.243])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 07:39:08 +0200
Date: Wed, 26 Jun 2024 15:39:05 +1000 (AEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
cc: Tom Mounet <tommounet@gmail.com>, Marc Dietrich <marvin24@gmx.de>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ac100@lists.launchpad.net, 
    linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: use x instead of x != NULL
In-Reply-To: <c8daf5a0-f511-4071-8c24-3e39aca9e68c@gmail.com>
Message-ID: <7366a4c2-bd20-5f67-9729-bf116548ae2a@inria.fr>
References: <667b2ee6.050a0220.f9c1.5426@mx.google.com> <c2911f68-d1e2-4b45-af95-590926b7a6f1@gmail.com> <21151f5a-059-538c-3cec-7c40d625c5a8@inria.fr> <c8daf5a0-f511-4071-8c24-3e39aca9e68c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 26 Jun 2024, Philipp Hortmann wrote:

> On 6/26/24 06:48, Julia Lawall wrote:
> >
> >
> > On Wed, 26 Jun 2024, Philipp Hortmann wrote:
> >
> > > On 6/25/24 22:56, Tom Mounet wrote:
> > > > Comply with coding rules defined in checkpatch
> > > >
> > > > Signed-off-by: Tom Mounet <tommounet@gmail.com>
> > > > ---
> > > >    drivers/staging/nvec/nvec.c | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> > > > index e5ca78e57..814eb121c 100644
> > > > --- a/drivers/staging/nvec/nvec.c
> > > > +++ b/drivers/staging/nvec/nvec.c
> > > > @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
> > > >    {
> > > >    	mutex_lock(&nvec->sync_write_mutex);
> > > >    -	if (msg != NULL)
> > > > +	if (msg)
> > > >    		*msg = NULL;
> > > >      	nvec->sync_write_pending = (data[1] << 8) + data[0];
> > > > @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
> > > >      	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
> > > >    -	if (msg != NULL)
> > > > +	if (msg)
> > > >    		*msg = nvec->last_sync_msg;
> > > >    	else
> > > >    		nvec_msg_free(nvec, nvec->last_sync_msg);
> > >
> > >
> > > Hi Tom,
> > >
> > > what you change in this patch is fine. But the Description is not so
> > > lucky.
> > > Reason is that checkpatch is not defining the coding style. Not at all.
> > > Sometimes checkpatch is even wrong. The description I like would be:
> > >
> > > Use x instead of x != NULL to shorten code.
> > >
> > > or
> > >
> > > Use x instead of x != NULL to improve readability.
> > >
> > > If you send in a second version of this patch please use a change history.
> > > Description from Dan under:
> > > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> >
> > How about adding "Issue identified by checkpatch"?  Checkpatch helped find
> > the problem, so it would be nice to acknowledge that.
> >
> > julia
> >
>
> Hi Julia,
>
> The following lines sound very authoritative. It is only my opinion and can be
> wrong.
>
> I think checkpatch is valued a lot because every patch send in is checked by
> checkpatch. checkpatch can be mentioned in the description. But the developer
> cannot hide at all behind a checkpatch warning/error message. The developer
> must take full responsibility for the patch. The developer needs to use common
> sense.
>
> Please have a look at this email from Greg:
> https://lore.kernel.org/linux-staging/2024062443-udder-spotted-cc0d@gregkh/T/#m280ebb2be94e434234f405e722fc35dc6d1db710
>
> I think that Greg once wrote that he does not care about the tool that found
> the issue. He much more cares about if the change makes sense. The "Why" in
> the description is most important for him. And the why cannot be because
> checkpatch or any other tool told the developer so.

Of course.  I was only suggesting to acknowledge the help of checkpatch in
addition to one of the sentences that you proposed.

julia

>
> Thanks for your support.
>
> Bye Philipp
>
>
>
>
>
>
>
>
