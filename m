Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC34D6C2A
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771803; cv=pass; b=Txg0xk4B9PvF4f1u1RvebNAAtCbTbOmNTY2FufP8EEgwXDRM0ZDN2Wl4z+qoQe2C3cyZl4bgnxQhQnDdXMvLO0uxBo4Xr7HW+jg5WA5fnx4i/9BJA+Ee8oWwWEF2Dp4K7KSnYTAM//pZdlEPdKZHUbqcZhCwgah0Y+Oiy5Uuivk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771803; c=relaxed/simple;
	bh=RZzbWSIjgew6wFLJXJB540VLEgS01esjSjMrQti3Bdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxkGKsUeXSjkMAaDWNXM2GrQsENvX5Vuhzms1bvasCYqyMeoPQsMbW6ennLVFcK8YQi4oHu1Gh8BRc6AhSnDg8l4tXlTXM89Q8pvDRLlIXEApitpV+dIf71dZJ1Tki+U75jf0rJGjld4JlWUOFwm38HF+nIFPxIaMTWVNQs++s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFUAWwpx; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFUAWwpx"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6756a6320f6so1355502d50.2
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 05:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771798; cv=none;
        d=google.com; s=arc-20260327;
        b=VIMIrDFSWsANNADpIfW+glrBs6wM1Xgr9stfJ2lN5RMIo0ES10LW4SWsGRTi4YIRfe
         beZ2AdKj/VtK7InBMQsEHoB0uelcS+GWcfN9xNRuHF1dyOSsXlxNrk5Y81gBxQkJQDMc
         33isAr9Rb37eCr3JM2+7DG27T/uwvDAxrBILdQ9eqsuIjsf46jgS4zcMt7Bw9DowhmCl
         vcKn/7gmIOjC5u5ijAlkhfuEpd0e8p0MysgxKsT2so6Twte41eAZz4XETkppUn4GA03w
         bzbly/hXp9qKT5zvo89rF4wEGPMXT9PtQWkfaW0i+hnqyCMxfZKtDOFekVas6y1c8chY
         HhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        fh=XvFb5+nzSYz7JA4a2JT813W73fI456ZTo5G5H5dZ2w4=;
        b=fvgzAJ7ZUaV+neaSBNFp2s7Lofel5C2G8AXXCoCp7BNg65ewmxUUb3O5VkLXukxCLz
         HSsPKvD5VlvPKf1beHYwTCMEx9gpPiEBY+e2Iw41wkT9dwqWLKnC5E0pNMkjTEsVzeFx
         X1y4hvimXCBNhIh4hixroMjxhDL1fTZKftZRfGkxf3Tjv86eJBLdnGTUJzkwGtQigTLl
         PuloghjLYpAW4xBto91R2fhVFLDcoutGsPhe69GZTMHR5cvIs1vPcKIu0n+fAZ5jBzZc
         uKjbc3dQewJP/5lzMi1TR5rTMbCsg43bW0fsS/F7VkXaicZcFcI3LTuM1UL/Nfkj0Syt
         YYXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771798; x=1791376598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=PFUAWwpxNVvoPpL968Pb8klzGZoDvFMcmc/qjkL3jOCzDfaqtEGBir6MNK67BXFeFD
         QZpUSbUMM4sJD2OV71f602feOvoskCzQDQdVIkfmFuUcQcMOXknakedYngeHUGP1+Yz4
         Ig/+pzR2mFzdQVeW/LfCDQfyMAIzQ5Tqj8kiNiy4qjM9HIaiL8IU1JDq5wZA9Vq2trij
         cS7JjZhUOmfGCKQperMi4noQreYOqEYzGP4GJJe+WlZ8LEhRkuyTp5FIZDQ+nbt/onau
         55yTPK4B9GRMg8hpVgu2FReGBboX+593W/SW+lS0OW6/V39xZ2gfZEdo8ntqNapaSNpt
         TAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771798; x=1791376598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZZ8445AScZ85lemNE3paemynEJ9NhaaEv5j+9dCcvY=;
        b=kwS4m7ekSnq0l3LUz7szoQ9nO3djno68NqYeLBznPj2PKjC5S7W2UCEx9dHztbJ2cu
         MCyL0Odhz/TaW0HqwXFlkg523psccWzXVST4UT0D8aL3DHaqe4jqPPB7PVl07hm+QozW
         H6aq2VSiMb7ePMVeAUVq5Yt8yQGnTo1EDNaupSKPberYkxLdQuo9c4GiUzLpt20XRA/H
         eg5G6o70r3O7wFbqDJsnU2YQRtdpYAVoZ4XpdHDVYJyVUCKIXySXy8fWxrES5gWwaz+i
         HIwKl90jr/X86vIUs/2PyTib57uDXa9N2+z/Ya9JJ0RMEnL9yTN6ClWsm/dP5kBJzO9+
         Xd6A==
X-Forwarded-Encrypted: i=1; AKwUvBxPPFJ0nXOmS6IAoXQCUlI3K4PuCOWw55yVWgPwucNT47RN7Fj8oxYg+xsO1QTxlr7fpoz+jQFNIMyBvw==@vger.kernel.org
X-Gm-Message-State: AFuF++nBKT5h/jYUEbJ9JwqPJjY1bZ5NOYTJOGhsp/7hP+3jR+818ot2
	A8pW4iF1idprNnyeY8wAUiiJfxrfYLqGTuGFTbwu21MexdUQ9MVuPc2bV/Za5rABxlwhuIiGHJ6
	yn5oIlR4UUiuqnFL6qK6buksSmDteicU=
X-Gm-Gg: AYBFou1CVIlKJI2GEi2P6wiEKbQ1kbLAqhTbuIM//+3FzYfvZghrGUqSYPWCI/e6jrw
	iqjcF0FyGkshKvW1AmB2F8ci9jJGjxM2bdf5B0yx0y+g8eskIVIY3qGzl7nrG5bUdkMlBGEIc3Y
	A+i5TNFMZjSsE5Wlvz0STAS0iguwuUkfC63lO+htKbK+F4Nor3iIfcZ6qOLwXEDiyhy9KPAKXc4
	MAWbMpzkglSvYms/AZY8Sl4xNHeF25kNdUsjqhK7+jHXT3SdsNv4pSIJrm66auIND1J+9IGi/36
	JUGW8EhbXRvxYKzXlbSrz+aWkRV8pY43dxRHnUQomtTBRPEIW1gF6B2u75XQ1lCveg==
X-Received: by 2002:a05:690e:4012:b0:674:139f:2450 with SMTP id
 956f58d0204a3-67683415fd7mr591950d50.29.1790771798163; Wed, 30 Sep 2026
 05:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com> <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de> <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
 <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
In-Reply-To: <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 14:36:25 +0200
X-Gm-Features: AclHuK8YPOdQOastRi1a18WPN6tYPPB7dTTORvevLwrAoFcXLuyzCP_Sv7ilYlk
Message-ID: <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:21=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> >> How does this feedback fit to other known guidance?
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
> >
> > I can update more information about the static analyzer (i.e., it is
> > experimental and its reported log) in the patch.
> > I believe this aligns with the known guidance,
>
> Partly.
>
> How many contributors would be involved in the mentioned software researc=
h so far?
>

Currently, I am the only one contributing to the source code of the
analyzer. My co-workers
provide research-oriented discussions but not bug reviews/implementation.
Regarding this, how would it be reflected in the patch?

>
> >                                                but I cannot provide
> > the source code links.
>
> Do you try to follow scientific development methods?
>
> Will publishing requirements grow accordingly?
>

Yes. The source code will be made public once the research work gets publis=
hed.

>
> >>>>> Were any more of your contributions supported by advanced source co=
de analysis tools?
> >>>
> >>> If you meant AI tools, then at this stage, no. For this patch, I have
> >>> used AI tools to help phrase
> >>> the patch better, but I did not use them for code analysis.
> >> Will this information trigger further collateral evolution?
> >
> > The collateral evolution will only affect the experimental analyzer.
> > It does not affect the submitted patch.
> Will opportunities be taken better into account for improved change descr=
iptions?
>

May I kindly ask what opportunities you are referring to? If you meant
that whether
future reports generated potentially with the help of AI tools will
credit AI tools, then
yes.

Sincerely,
Ginger
