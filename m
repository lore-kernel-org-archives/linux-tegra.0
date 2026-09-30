Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9963C2796
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752244; cv=pass; b=pJyVTnupMpECf4nPekTwmse6ag5eVf9TstyOGWVkVcWmgQueEAzGyU5vyrxFwZgE4JTT1ajJHtbyO4XeGM+Anwxez14rAzonfJtTtAixOfLJZwYzvi3d4Z3XPEPahPR+yY/q+1r5mlqdN+wlorlvUQFJ7IHD1Cb/JD301jmM82Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752244; c=relaxed/simple;
	bh=4bW37f5ra0ZUNwTJ/45kz+L36QEIwf8+gHSRR0WSPFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO6fX2xezqlGhAupwU7NtcgNzPBwEa4YLRGvSgf5W2WTp7eorqqoCRWkDIUd4e9DMxEhW4ujxYIAeOIlbEZq3KzePQJMivMHYYfOoiqebVqIcCdYP5WzkqdLYvMcJFZjBWRSv/kugnru10KSoVCGLJVfFCuH3so1RcO88PSrCeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYO5hL2K; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYO5hL2K"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67583c777abso796767d50.1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 00:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790752242; cv=none;
        d=google.com; s=arc-20260327;
        b=pgsjCuJ4i8Q8wgxPo+zfOmHBZRqWgJylv6ATyWQ7ooKLf3Qsw6lxkdrHYNQsM9Gtbv
         MBwY8IVrFEK+7kV5my2csem8TuSEbp4yqKOw+REnLVeSqgvNV2lGQee34Nl026+X92vx
         r3gjH5tQkJU3hem+z1F3+IegH4iJvvFt8trUEgdbYB1I4Pe/vj2VilNg3zCpYi2rxCeR
         8sym1BppfC3cv13BTdgSdy1gLDX3v+16A6o/MRFBabuZicjtgOTaSQX9z/TFeYBSjUcH
         xrd/GYkDchiEuLzTF0JdZaGTw7LBlUmDaaU5fXVSPLpr46GLOBvy19G4Sv81Fp/i17QA
         El1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        fh=d0nW5ue8D+zAZivrcgwVqF5jR3+iPV16jz7Zoy7en3Y=;
        b=Fj3FXONRvF05be5yqFFNo7fzRNdYfhH7UIYYHG4qO+CcPPXUs9rDym+lp40kBYJ7Ec
         VMGEcCNQFxWLZmRjY34W+zfY06IMKEyyUFlGmcqrMqBRrWxKr8H4F7Yf53NSpG5Y7x+M
         lqaUOayvhvpW70jl5dWO95GBNgXl1j/Cxpsy8sVo+E7t1SlsEnuqcJfVVYc+416g39r8
         YBWc6MZ/gp6473cImat+BF+v4MS2vDnaQCAVI6m9jx/jCRfgUEhiKeZ5K1ntU0VqLgVv
         jA18riXkSHFBkqzqKTwEtV/3U/rkfOuXFVxoRqSvwDj0MPzfin4REydSXc4S5VX9AYQF
         NNVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752242; x=1791357042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=EYO5hL2K+mdt0YAFYJhZpbaSHjMGisYXZeo9vah/zTtT+URy8fwbBYCqfCUglzPssE
         G8hL3K8H+THr5OORtpl3WdfY/MGYcHxS00XqB6yCNcPW+uM6gygySDR+bda4fymL5PWB
         Bx3WbWSjQF+sV8EckwYagi1We2FfMVuytlKbhVZ0e71UkmSQhqBRgMzazLFP207MoAeg
         KbxjoBKTRA+f4NM/o1Cq6Zw/ZpIFMf1nxJwDG0zPbwjQ1UIh7CWMiJ3rS40T57Y4IjZU
         XXuif0JavXAC5HGWR43jQdwIgYegEpCpK89gvFlCCDD7iiJg+ZuAhXR+RPil7NpysChU
         sf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752242; x=1791357042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7jVEGjHXgo7KKiRaoFz99MQ7lhB8VYvddwKFIM2yig=;
        b=F+6X7VsCS6y04qcvveLTeOP1qeJHg/7KTpFPIwxRndptiK8d0nvcyfxlLjjv2X1F4h
         +vSws92B/1nRAyz6wB38pq+7ZAq07OFi1pqwpHnSWHv9/OqAPNppYrjAhLKPaLceS98w
         /3nPswzX9EuyV7hQtsWR9Eued4FeXZBqL+U6v6rWyHgaLFYJU/jLmyi0gc9UupOHvCW1
         /xl9dtBccqhNrVpnaWL66YkzXdf6KqiMgMRoucUmdEgDeFfxPf3Oo9uBmdfkExeUHdAN
         qnTjo8WoiyNO2xkTNZJihu4LXwItajmE7wOWAG6zVOPTEltlUB2cZrnLJPB7Dtl/MMt3
         UZpw==
X-Forwarded-Encrypted: i=1; AKwUvByJ6DM7/pOu6r3E/QbHEpgweNmhGEXREYKloACilpjmTwEVqIgdznIJAURDxvoiVyAZ3N+I3T+8u3WUxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMHXZshsGBmlT/ojG4cb08S06qHdW7h5ZkQeK8StnItKa2bpK5
	nvEqvseSHt/ZkrlFRZj1yTvRH/7enBqzj1rCWXUMb0Z1m2eTypJWW0i2QtkJatWJsnOiCFi1196
	tVFnSsUmUBB8JQQDISIdDQtthtoMmlhk=
X-Gm-Gg: AYBFou0ouqQsTUU3wFUYjeCzSp1D8jntLrL8OtfCzbosaxHYBLndeoIgvkA3LKm+BOF
	fthqt2pMtSH5WX+qhDaYPLetp0UAwUZE4rtaeBo1LY00sjUYdCps1d6I2tUyC9JeV7IG+dVPs2R
	usX0zelXA6h4X6YMzck3gheE2ZQ/Ff/gBfnW1eDrgkAjCChswtrFve4TKRoj//KRTJ9kpz6K8S2
	OS0fsWeQ4Dw3TGj4F3TYV7tL/6/P4vQdCbcNk1X6KP2ORgxoHjk9awwqBiTZE2gngL3U+Lt8QsB
	OnWNzF8nEkvNwxQPaFuiRcTJ/rravFPic9/Tq5pZbWw9IZEAdG3c2lK2nVPjQDXn
X-Received: by 2002:a53:d004:0:b0:66f:c1bc:406d with SMTP id
 956f58d0204a3-676835480admr161813d50.53.1790752241587; Wed, 30 Sep 2026
 00:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
 <20260929194434.29937-1-ginger.jzllee@gmail.com> <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
In-Reply-To: <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
From: Ginger <ginger.jzllee@gmail.com>
Date: Wed, 30 Sep 2026 09:10:30 +0200
X-Gm-Features: AclHuK-m06GLd90hWdFL-3PJbcsj0LD0PMP9uNnAqCpxpUvgBztAmWsFtzXywOw
Message-ID: <CAGp+u1bger=5W8eNyAME+3JppL2bhYiYYThQY_R3NcrJC+d_CQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it was detected by a static analyzer that I built. I will update
the patch to reflect that.

Sincerely,
Ginger

On Wed, Sep 30, 2026 at 9:05=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Read both fields while holding tdc->vc.lock.
> =E2=80=A6
> > ---
> >  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6
>
> Was such a data processing concern detected with the help of any
> source code analysis tools?
>
> Regards,
> Markus
