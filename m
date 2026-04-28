Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05464
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 04:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777352245; cv=pass; b=NueWN4W/c1CP2G+ZMsMGjsSGPpXD1DXJj9oIGVJF795rcP7ig4dNd7fSzj096Ox1aGi+xdWSHFmUJSzc6ga9uofVaS9PGNRqbS1njD3Cv4YyqnhhrubYSbSmI2Ax0fyhfsCfUfAQJgLHY1jx8oJNtsiTgx9ojoXpzy8VzHfdnsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777352245; c=relaxed/simple;
	bh=ncWWGMcEzmJUe2TRqBfOnes/WYshovyl3IhN3Cy8Ooo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0PsMWUdxFjO12IsV6Ir4qeIOQy9r9EmwT5iH2/XGT8bK8ST5qZ3atvzNtn5MIDvRMgcIj72h20X3mbQmsZHJf6vHrgah9ek9VZq/yiGS/+syeJX5r6rhrwgjvQrMko9sr0Ue7mLqX/wRT8YWxsUwReEcATPEOvsDx9gqnRo17I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaHglJh/; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaHglJh/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe608cb92so7390635f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 21:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777352242; cv=none;
        d=google.com; s=arc-20240605;
        b=iIw4B0OiocYgM/okKrXIl5ylJtxJqi84xiuqdaRtX1N0h1GppauEZrzfmMOc7ay5qF
         X7KXgim+SJHACyqGDIqsrNJHiBBiZTp6AeQAUVEKY84vR86/hxWrdnAVZlXR5HduK1JD
         uSnQ3WMjCZGc8H1pJgnpB7OT9q5snaiWRSkeCV5BCXeucfmzbKLMwQZRtUI2JapcXo/Q
         5APEBLM3Az/kbFdRleZDqnHwYMxWwR3+/XpHjhshav/iVGV8ef1XYE9e/5B4wxe62T2q
         ZcGZ2hnuddeX3jklJyKwEzCdVRYq9AvPyKKguApASfe81D3USCEjBehdCQH2g9WClWzQ
         6coA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nd1/QqzjArDnTXh+sjQgJCmnUECsah1/qdKQYQu4dDg=;
        fh=A/D06L+fRp7ycI74gkLAPlyPxl+Jx37zhEN/0cABjuc=;
        b=JixpTwUtJLqT3IctrZX/37mwIA91yw4Lzv2tXClflfWmtcGYdTX2galCzjjQC7kPY4
         WG6ViAphh4DRljs2HTOYB8xuUENOq0ShuGFTcIguVcoEkcbB1X+Kv3i5fH9rIkjcQKLE
         DSVv9JaMPmKFtqug0dnZSydkgfEVnViuESWD3DCY5W6l/zqMmjZeKAENSLoOJxq6nA6H
         Y0Kpd5SImUOsSv1zez7yx6cG140mj00OtWg4+hWA+GYlos3SAs0mjcNeMkccJws8RXBy
         o3voooPHJM92y3+VlI/yAaQROTILwQEuIrjG3BV0mWzlrEOdAOiY7pQrqfmqBaQ10lCs
         NVqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352242; x=1777957042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd1/QqzjArDnTXh+sjQgJCmnUECsah1/qdKQYQu4dDg=;
        b=SaHglJh/rhs7rOR8MXEmRoG8PYoawiP0fzPknR30jnet36r3rfnrWg/p9Cz81o7Bcx
         yn1FwjqVIgr762mjrWoctL1xcSpZXFHSHikcvy3+e0YFzqsaPYXc/P1FXRSzXcRc3cx+
         ye1SAEvhoSQQzbTONbkg7jf4gZKrTmC+8VrarL2/sumZ11sneTCW5lmfWZOIhjVzpOHw
         6d0Exv26mTU2AU+My1cq7JyeWFhdccc1BW0dII6sH96k9/7KO894d/s3NCpVvYMIpcyc
         +98lLZdVwsfNs6I1/PTCJpgKwl9x6WGgPjmDkGsuaEiGKJE/xdm97LYyX4Bv0XAVAo0b
         AnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352242; x=1777957042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nd1/QqzjArDnTXh+sjQgJCmnUECsah1/qdKQYQu4dDg=;
        b=n+fIEo46iXfoA72oF9wgQboXqg1r0R1sMhkIlmt5xvqurAvNzXHGraQAH25Qc0kXM3
         iv9nr8q878wfdlfGJZ4DNrMfdgXyFIXHDKVCPcVGv9JzVL2z3vKpnBDU87iVCKGx9tQs
         0fvlsaxzZpMVSWaCNFnz22wDXzuugAsTTfEIw/kzrh/aP6j6UKiTF2N8jSJ065bO2I6l
         oCHpVHkC338N9zYtLbZUCMYUwXdP1EhyKs8epCXHZc/fTlythjSfts6OC5qdgi45ap6P
         ibsuHYEzG3DSFmGR4nCLIg3fm4ks6gqthOFc5vVXN78+uhCCONbaKN9y6d/a9YAgrF/+
         KfTA==
X-Forwarded-Encrypted: i=1; AFNElJ+KRojYfc7Ipe/sA6DOGHQbflOylYC2H3vmW//1QNImERx/vpCVkW25zOnCFfaNyTCNdCfInvn2rd3SRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKU0JfDj08PglmZNwAxrU0Ec7kOAZ9QiSZJ3AnVKVTNrJNmyA
	BnXm3hdh4rNDbgXzm/0am85JgtKpH2nHrO0tdYloic6pHNDHLjN7BfHen13AOyKIi6TzUfp1QV5
	qxIudid3echMj6pqjNoa52GlS/5GKseE=
X-Gm-Gg: AeBDietc/VWI+/kBu+WB+GTUtZXRI8ZWsgKY+IH55y1a3GuhAKYuX+0Wi+V8G3Rlmr/
	k32Ta0hg+KifFk1ZwHG1p5MYaxuiXY5M2ddWz7cybEv010RTTmm6EMGXFRQRpCca2udaIL+3+Yp
	s3uyQrNbckpJdWpm8AH8GOGyklbEd78UAoUMDoWNRHrpgStJtYZqn0ezT4ONv4IyjYFDTf+eY7O
	Dlvph1pSHD9+xG8d78/EEJPAnytF7OPlug971T2OyYL5GHmK0LdNQPJbXnlDz4T/TzxZzFCog4a
	PQ7oov//YZAMSyAWs4E=
X-Received: by 2002:a05:6000:240e:b0:43b:4136:1e6f with SMTP id
 ffacd0b85a97d-44649c9973emr2630806f8f.38.1777352241852; Mon, 27 Apr 2026
 21:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427075856.85208-1-clamor95@gmail.com> <20260427075856.85208-2-clamor95@gmail.com>
 <gUUml1BmSZiZjQ7gY5A_cg@nvidia.com>
In-Reply-To: <gUUml1BmSZiZjQ7gY5A_cg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Apr 2026 07:57:09 +0300
X-Gm-Features: AVHnY4LI76aCvDtWfafVdfCQxyDNR500_itc7PsbVg4RhSzhSUX-qsfcx-3dp4A
Message-ID: <CAPVz0n0q77SVN7=47fEQR9ASQUnLoEgaGh3tJihxLSe9UhrPaw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to gr*d_probe
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:5=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, April 27, 2026 4:58=E2=80=AFPM Svyatoslav Ryhel wrote:
> > From: Ion Agorria <ion@agorria.com>
> >
> > The gr*d_remove() has pm_runtime_disable, this indicates it should be
> > paired with pm_runtime_enable in the probe instead of being inside
> > gr*d_runtime_resume().
> >
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/gr2d.c | 8 ++++----
> >  drivers/gpu/drm/tegra/gr3d.c | 8 ++++----
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.=
c
> > index 21f4dd0fa6af..71f092d59d65 100644
> > --- a/drivers/gpu/drm/tegra/gr2d.c
> > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > @@ -286,6 +286,10 @@ static int gr2d_probe(struct platform_device *pdev=
)
> >       for (i =3D 0; i < ARRAY_SIZE(gr2d_addr_regs); i++)
> >               set_bit(gr2d_addr_regs[i], gr2d->addr_regs);
> >
> > +     pm_runtime_enable(dev);
> > +     pm_runtime_use_autosuspend(dev);
> > +     pm_runtime_set_autosuspend_delay(dev, 500);
> > +
> >       return 0;
> >  }
> >
> > @@ -367,10 +371,6 @@ static int __maybe_unused gr2d_runtime_resume(stru=
ct device *dev)
> >               goto disable_clk;
> >       }
> >
> > -     pm_runtime_enable(dev);
> > -     pm_runtime_use_autosuspend(dev);
> > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > -
> >       return 0;
> >
> >  disable_clk:
> > diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.=
c
> > index 42e9656ab80c..33e88ca4d4c5 100644
> > --- a/drivers/gpu/drm/tegra/gr3d.c
> > +++ b/drivers/gpu/drm/tegra/gr3d.c
> > @@ -517,6 +517,10 @@ static int gr3d_probe(struct platform_device *pdev=
)
> >       for (i =3D 0; i < ARRAY_SIZE(gr3d_addr_regs); i++)
> >               set_bit(gr3d_addr_regs[i], gr3d->addr_regs);
> >
> > +     pm_runtime_enable(&pdev->dev);
> > +     pm_runtime_use_autosuspend(&pdev->dev);
> > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> > +
> >       return 0;
> >  }
> >
> > @@ -578,10 +582,6 @@ static int __maybe_unused gr3d_runtime_resume(stru=
ct device *dev)
> >               goto disable_clk;
> >       }
> >
> > -     pm_runtime_enable(dev);
> > -     pm_runtime_use_autosuspend(dev);
> > -     pm_runtime_set_autosuspend_delay(dev, 500);
> > -
> >       return 0;
> >
> >  disable_clk:
> > --
> > 2.51.0
> >
> >
>
> Oof, looks like I had managed to really bungle this with my earlier
> patch. Thanks for fixing it!
>

Hello Mikko!

Thank you for taking time and looking into this patch. Don't be so
harsh to yourself, PM is easy to mess and hard to set properly. This
patch does fix gr*d access but it does not resolve the issue itself.
PM should be set in the init/exit rather then probe/remove. I have v2
which fixes this and one more minor issue and I will send them later
on.

So for now this patch should not be picked.

Best regards,
Svyatoslav R.

> FWIW, I've been working on adding some nightly testing for Host1x/
> TegraDRM, so hopefully we'll be able to catch such things easier
> in the future.
>
> Fixes: 62fa0a985e2c ("drm/tegra: Enable runtime PM during probe")
> Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>
>
>
