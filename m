Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FB3AEF37
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753638; cv=pass; b=DXVXWNGDWNBj4EcXVDsRAU3YB5khdeu2W+rbN+96IHzPEkUh+7I+QdBJHReEGAzYKMOs3NwNg0SL6M2hzFIUgd3TBZLcxZQTEv9RZ8bmou5BbZ/CyZ55pJySpYtxv+LpgyuOTgVVSlU8zkrbYEsGKDNBMNEHkTtGs4SFmnsBlJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753638; c=relaxed/simple;
	bh=ZQ9na8R6Owx5vwwgbJYlV2OYkT7SQ1YuPUuVW7uDu60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S28oKaXrBJBq8tDPES9ITsvEKGnyOTgmSjERnryHQm7g/kMKprDMa1WRnhk3vgb1tg3Onvn2d6do93UkAmlWOT0Bgfhx/07vmc6RHnk7wc7b0pkS5fUkhpZjWpdZerk0nS9inIqsAQMb0x5OT5wlGzxqokWOJH7CnGC2fQuYu5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRxZvETw; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRxZvETw"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so5719286d50.0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753635; cv=none;
        d=google.com; s=arc-20260327;
        b=h6bvoxHL3GbGQuXvrTr7CI+JeFIdbOEWbrfc6S3PzZHltCuxz007++mXo978zHQFwB
         qaUsA4mUpJNBeG+MzDMbxSQrULlGVH0+rExQx/tsCcFPrdCPu6thdf3YshaY8RqgHrPi
         5xC4vRtzT1GSRxPqbm4eF87+GtD3hQt25/qeChuympX02PRG7Qy/d7tkGFB7VY+suFCY
         0XJgJ4bk5axY4uaZpatbr2/lda6GQsyRmEMueTjes0ma2clmZsbZ9c9+crupIKtHWPaO
         dsBMmx4YEZTvjHQcKfaVk/9uFI7DTqcp6SHM4usHndK4Cov9JlZtkMKipguNHCim4YiT
         naiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        fh=GvE+I3Vb0R5/WOXZN8Y8d+5SqiF2tnbBXfovautbNsw=;
        b=sttUJLphkOZv2QOpTnlwXH/xs257cGblTGE3MynFHr+oXF1bm3y6KlMiduXVI4Z/rP
         Pxvcr6C/N1Ir/xydWYup0Rlif6bCigIQPTSMuLFkR+zKOPyaQTZG1j5W7MokaxjfeEU1
         nVWcrtOVn9DDQxVr5PZ6McC4LbdqR1yJcrAbDBHh2DWxShoVmjgVUSusc4paZr8vlDBA
         6zIsc+30oIqO5yV8JH0ch3IHEGGuI0Lo44NweFJYTJj7ot3Am6yqHHY8wYC9Lrm0MQyK
         H0FM3R/fI0PR4ckzXTgK1vLxozry9QZbBN58cOBFH+cQlD/dgc9N/u7FNSWkXDuUZ2CM
         jruA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753635; x=1791358435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=RRxZvETw1csmOpk2NlyBiaKR2FkYPnoh5drFAar2txGEz6JbAW/2QF+Zs/DvCMlmX8
         Qs183SGXr2472RZ3IbFudib+kuy+5nXd3UezA0gNWVtwZpewtAKA/FIfHSJhtIJNKuh8
         VCo0zsQnt3Y3URgfBnxrwdDgzxBbkezH7717TBFValEkysLB49EPz6r2D5enaUVfZJUz
         vwc/2+ZQZwYzs4ypfPRLO77G+d6w+MH+lKhWVc29IqZrMJy1/XArROfBVyJep05o4hJG
         ygDaFrabSUPit4XaApRPTURnv1M1z8sjLa2akTaV+z3Kw7H0IDmJwkeTbW93kUUixUFm
         KA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753635; x=1791358435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD0e04Vq0+240ahadbGbuwsBitSBioXyF7M7tnlL6kU=;
        b=SKSwJHjUsvFfhykdjAg2szBlGLXfWZKxlq6ovwHhWan2r2WigOiMizYeaWi2p/z3PP
         VGdZMFNf+t9rl0wKOOlhfrCwcA/pRTb1NOyDUTV0BVsZGk3YsDfbQQ+7XxKJNyB2pO4m
         teLdLO89YBFrfE8y+b6lGyzEvhpqSN7BkUYra9zj3KxtlgDkU/r94bP2TbRTn2YUjL8l
         OJ+XcHUdMHr8EDhv3iAergMj3YcvGlmdpvcc5Dl/bV2yPE/HcjsplSlr8nIoQiISQfE2
         /xzXVbL/HpSXTYe73G5hMOKRJKL2KYP5KXuvpK2FPpQ/0M2eH+EvCMp/iy8UCEn0f6/e
         UYDA==
X-Forwarded-Encrypted: i=1; AKwUvBwc2fHisu/OGsStfyWTt8LsHRkogiolJNsiM2dFa40ep8Ku/8VS4tDSK8TBwGs+oPJ0K2KOlyOjin+U3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kMOdlSpTcKUextBXpAxl1bwj3dD+6aMiY0E/p20h5PYKLV6myX
	kaP6ipUn1lmepwhZTFpHwrmDzn5eQsEP0EfFCBo/ztQpxy0FrJ5TWvJTMm9SazT3uV/j9cKmm7h
	0J97H6jfp5iSjicC9nRrTOM0zoDzRhM8x1Qajvto=
X-Gm-Gg: AYBFou0BvL17Vm8qN1hKBAOzoCE4BTgiNGGv4hLAgkx2L8tkCysvOT04bNDa+nD5ZDJ
	ows+LdeeRk/2b2MrpX3Fa+U1P9hVblxBArj5M25N81DGSwoSGI8Is8FO1gFiWQB8sJJ9rMmfPKj
	d8LM9mEaZ0lK5ZRhAdpwnSFiPsrHLZaRPcBBt0QbXTMJXOe4JefDDDysSizS0YGn0ORZ3OkX8XZ
	EeMGiltxeBqMAVMXQnXqEzgw11bpMlaLNCIzgK3G4twU03hHQBA4hrowSqhf73eFAwXEYWSLDpJ
	T2hppoWthd/y5b9aUcva4n4Rr+Pln6ZNlhVPTtVl4E+b6o+iz4YKFeNcBwc9zAmz
X-Received: by 2002:a05:690e:4411:b0:671:1b72:bd0f with SMTP id
 956f58d0204a3-676834ef47amr147001d50.58.1790753635586; Wed, 30 Sep 2026
 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
In-Reply-To: <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:33:44 +0200
X-Gm-Features: AclHuK8bAkNOdRlVNFbch7Bc0dDjNYgJqW4vj7CakOzQrTXiV9dA3JxcFXe9oWY
Message-ID: <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:25=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > My static analyzer detected a potential issue in the dmag engine.
>
>                                                        DMA?
>
>
> =E2=80=A6
> > ---
> > v3:
> >  - Acknowledge the usage of static analysis in detecting this problem.
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Under which circumstances will additional background information become a=
vailable?
>

The static analyzer is a research-based one, built upon the LLVM IR.
The analysis is founded
on a symbolic model (not an ML model) for concurrency bugs. And due to
the anonymity
requirements, I am afraid I cannot reveal further information.

>> Were any more of your contributions supported by advanced source code an=
alysis tools?

If you meant AI tools, then at this stage, no. For this patch, I have
used AI tools to help phrase
the patch better, but I did not use them for code analysis.

Sincerely,
Ginger
