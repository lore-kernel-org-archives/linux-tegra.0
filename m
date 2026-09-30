Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B54C9E08
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 11:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769449; cv=pass; b=ly6AH3lVbo+/Hrc031zz5Olnoc2HEofb4OPs20AY2a7PWRTZzuUfdL9I3iXuhJt3I0JWwFk1eU4b1Zi6CvuoSkVeRA2Z/kKtVlEZIO0Dy+4MddmLvMlYQAhPaWSeTMwmwom6LCTa8Udl4DIfcjLA+TQpSG8hy6KpRiUKu9EWBks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769449; c=relaxed/simple;
	bh=UoFaUknaPGAot9LI650Qdfi+g+WeShPBf70M25SuqEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxGejWc3CRIfliPArM/L0cWagjSi7yOI342e5dmJmOr2HctkIGg4460zdOLNX17FwxQjfnwRhN9AAZKFnpFZ4wsLZRXZyfB6hNiKLbFoJOC9vngLaVYKOdlK0ZgR3qpZIJ7jwkVe0InzGZgcvvPXMAM3acZZ4mCsDNzUQpFkheo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQAr9S1U; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQAr9S1U"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so5465764d50.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 04:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769446; cv=none;
        d=google.com; s=arc-20260327;
        b=LS2/r3cFc4I1M6+tZmgJHql82sa/mrnL4df8OBlaY728260GAAGRc69l6rM7n+5Zax
         /QtvUx9HXe1hb224tvFR28SXROvln4xCmNTf1Rzi7vBWUyqiLmGjqHMcOsu6IFX7lJ7f
         C9qxo1v+aPQAeSrEaMXk6QPpDLpmRdZv0qGb4DDmgN16BsegJpxVbj14mmpAS42Uuj9+
         DIrqeuUsq1fzIuzJaapfhYBDWiFkHbCYQVNjZYmfj5tuv0brtDPMBn2+1uMEjtl3BeHR
         zpHipqauOGHlCg9s/OCh5BxujJMbiCu5Wig0uJTJQKWnm+zT7FhvKWOK5MtBvsAyf7Pu
         8pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        fh=yV96IWB78Vnj2JCLFUjr8o5lzRBM6Gdhbi0uRvUYkZM=;
        b=a8hy90JUTcHKK2RA27wquvE8Y0R0obghTvdbYQqOWnEz4X36FiGFmLHIPTDvKZsnCl
         nxnAcXDQtnIcHtD5+ojrjlDRHDIEM1zY3yoWsshlm8QyHyTPq5RM6RLc+qmlQnf+9TUy
         EDk72KJCNZE6AgYv3aaY/VBM5cDpssI0laHKO+g4RK5jshdPt9/1r8L2kedS3R0pLyR3
         NXS58G3pBZcv1tI0sNe/tJeK6N1K00YyeTlO6GR8EayoxMVMwVPs5if2k2xdsRfatJeZ
         snSjAP7eZzn4HoRP6hIBlxowkQQyDAxy5O/dV7y3VIa44sw84+yZiqw9sOozVVCDPVUu
         wpUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790769446; x=1791374246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        b=OQAr9S1U79AheepEFc3eW+PvLQCQHbuErQhBRpCurfXkkhNAbkqlLqs5mVgVPTmT31
         JhVvAIxcFlb4AJQNHU+X0rRjpW5dtb6ogahQWFHlWB2tIXUgbQFuzkvg8gueKxhiwP3o
         kFPwBIohlqJ/6ZsPcnwpn9fI4xP5Ek8PaC5pejaC+8UmZ4lhpTdyMRTQB8D55E/cLUWn
         3tASZDXqcmX4Fn6qEaZkD6d/r2rx2O1MMLxo1fg5CYUP3xJcCyMYlXaojpNUtNUtQioX
         xlZ33/cdSd3Lnh4qusFiLd1PyuBdFMfdtDMkVcuUKo7OYKT4vba5c+dCw1nDE+vX3ozq
         ZfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769446; x=1791374246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ba7AhExhkiMVWJNfe1v9ZUOyiNk92H/JjgkQAe6kipg=;
        b=HhZnYgnxLgvrytkDftBBlYR74isyHctl48PIXQ9q2d4cP2RGFcdXVFPOsTYTkehl0t
         RJHz2qNXIt2zIkHLkqWoqVpN0zLEBuUHZbgRebpds0U2TorjyPcITPd5EwPZYoefhhjg
         luOXfnG3F0iiBEyBdYkPdV63N+Shw2dW18Z688/J6Q/4nQ5EXWfnT2DoyDp/bmSoiyFC
         eeXCBLil82uQr6hiiETnvEAu9KXkB2btqNJlJaN6xVdivqMLTqAlqO8lL2I5ZoHvEc3m
         dLSoh6TTcrqqBBsjRfbZOPSMFm5vJri48uWn3HexTmYAd5YEnsu4+gjTOQAVRu2eSkF2
         s+dw==
X-Forwarded-Encrypted: i=1; AKwUvBxFYAoK9uRYtDseYdcviRabZHKGlQkQ2MzLChiBRNLxqswimL0bSHwcvWCqYoxU1NE4NfbHLRvrgrs2lA==@vger.kernel.org
X-Gm-Message-State: AFuF++lI9MpAXa/CM2oQGYhESOsguhhQjxdNJ/XLfVDaN5h7V5a2CRPW
	mX/XtObDCWCkkiTgoCP4jdDhXKWGLUa6WGxxNVbmTqbS5hx+05rmOc9OVE7lfHXj65mXzSAp2l1
	a8fFQzGdpNG3u9XfznDy24bN3iRKwaybTRlB+
X-Gm-Gg: AYBFou23zesFfzsCroCVRHymRlffzoItu4fVS+aNLQb4y5o2gjELsds/VfQjlmHwa9H
	RHUE7az1IsBdNu95hYnJGQ6BULRb+FlAY3fALOXWC268S3nAfC0u3zVYcNPUEzWOVNYun8NJYCo
	ZiZDTuFFcnMX2GGKn7hemI3nomjgGBMU3M4H1P/cy6xJ4UOc5M8fsBAKF6ZTvZLCYbfjJpIwcnh
	Umg7iw6Q0Hk1xallcA0ZJES6nRxYYV1Nb3YALOon8VdUwjmlJaMdrNMulu61hbV7ztvf4TR26Mz
	GjyWzTMhRTqF03FAfxxr1og1k+7CaWSpurz7wyds0joyLl0Tn5nSUgI=
X-Received: by 2002:a05:690e:b87:b0:673:572:449c with SMTP id
 956f58d0204a3-67683494064mr311881d50.97.1790769445863; Wed, 30 Sep 2026
 04:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com> <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
In-Reply-To: <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 13:57:11 +0200
X-Gm-Features: AclHuK9c85XY0-0FVl9whcFZZRCVWc-3bABsjYrbvCeX-F_yjm-EuhyLPQ-257A
Message-ID: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:46=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> Under which circumstances will additional background information becom=
e available?
> >
> > The static analyzer is a research-based one, built upon the LLVM IR.
> > The analysis is founded
> > on a symbolic model (not an ML model) for concurrency bugs.
>
> Thanks for such a hint.
>
>
> >                                                             And due to
> > the anonymity
> > requirements, I am afraid I cannot reveal further information.
>
> How does this feedback fit to other known guidance?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
>

I can update more information about the static analyzer (i.e., it is
experimental and its reported log) in the patch.
I believe this aligns with the known guidance, but I cannot provide
the source code links.

>
> >>> Were any more of your contributions supported by advanced source code=
 analysis tools?
> >
> > If you meant AI tools, then at this stage, no. For this patch, I have
> > used AI tools to help phrase
> > the patch better, but I did not use them for code analysis.
> Will this information trigger further collateral evolution?
>

The collateral evolution will only affect the experimental analyzer.
It does not affect the submitted patch.

Sincerely,
Ginger
