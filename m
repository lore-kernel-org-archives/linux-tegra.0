Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A6C332EBB
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439200; cv=pass; b=hjSgKTQ9Q4+5TowPEvqefsueEyRpgOTSILvZnshCxVQAXMqY6WvZCAgAV7Y0buUbm4P2BMtggL100sjb0gRH+rBB4pPCCOG4W9f+lyGrm0dH2TyJsXZSF1l+K66AECB59EIrQUtAGWzPLYq8WEscXLYkJwf9uIfX+DBnlh30VWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439200; c=relaxed/simple;
	bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5TnCvOGkDj+tp95DAOw8WHwhF/g9eBRffmvSLGSlU/pPbwtNM5Kt7+QHCLZIYF7m5UbiYJQxfqsMDYox3A95osLdZ+13nintjOQFeNjpCJrUFYgn3LKi2B4eiUZeDefzU16FfT98KHXxVaE4AsZ/qZEV5VDekTu+9VSXjNk4YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5YAcOi7; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5YAcOi7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b94a19fdso461929f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 00:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772439197; cv=none;
        d=google.com; s=arc-20240605;
        b=ELV5PCDf3vXLufQH3eX9JLFmyltYRWivvMvRUHBjZBhftIcCnPIFF4CGkiVyqasvAD
         jZ+5bajVDQZsQYoxGbRAWLcTu2ZxfjIm0374/azL3e86jugWR3L2K266NHnVHoUymnCy
         JChS/G0T7tRbIoD+gRP4jKI30LCSz4sZaBSVAFevMGPuUkHltRdO4bEObpcSaiOVL9Qz
         Qe/uHmJXbjiLn5Y4HgnBOmP23PPzc2ECHk3QlCsIFbWDPAYy9+Em+Xct1U+6xOLjdU6i
         YWxEyN7SCCP66G8WwGTVPlEedPB9r0DzFzRDUcMQX9hjlTLpD4hR9gGqxQEu8UmzMt+H
         bjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        fh=BxNIraFvYyIYYSnfemHmoky7yg2Pdbq/qGnhkhmBphI=;
        b=dBbIBT8VhDCKSClF0YOBvtp0M8hxa2j1O2AWoVWb+VG1CwvEVm+GQvD3lJr2XBVWNy
         X7frkZIfP4gTJjPNRCq9l5NyznRs4PYEjlf6foCTpfuP8WSJyn8r/Yg/5wTEb1OPnc5t
         MEBed9E9Xqb0ca4uaaUzqS8bDaFunUFE8REQciO136uw/nJ1Osahi2b4f9mxWUGft6ZC
         s3vB8VsHSzwvKzuLiMhc4Pcy/vmUHJQmIbiIqItFIFxbUa5bWwrdSP0cjUUIvhfGPzxA
         WOquf+0wVF7rQgxyBq8D/zj19pYt30SxUusw5fBPgEPgSUaMHB/TKcjts/rX93/5Xl3Q
         /Ueg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772439197; x=1773043997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=V5YAcOi7mztYUB8lv5ds0C1mG8Ld2+h8jExjDbvyurWopV3lqbGYlPf/K8NHgBUFiD
         XXqBBOPzEluwkIGbw8aXj1OVi6mMEowu5C8J2gM5wfARCje6voJbZ4hNuNBxyFvgb+bs
         KAygrpThVKLZeUAnU2CgxYQUPpz7MdftmnLpG6/e6PCtkPi419NBSwjaTZ4Df3l5YwMu
         vg2W2bpA8rnbKOoVLLawEVxuFv9oD7eETx58KhYGJgAU5Zvsp5sUgaaRTVMZ/DgLtS3B
         Ne+Z/XI+9s/2azipJhVXpysp13TqAyARpMfRBLcD7/yluia1UxmqpcB1LPOyJth3R0Gj
         zIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772439197; x=1773043997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l2mSkg7KkSm2uUTG1wCFPeaZJ3kB8IInsxSM3RxSchw=;
        b=Ot6Z9a6FsqI5DwA8AXmBPpi54eCKXPK2h1c92KClwarTrm4Ym6odrJgYsDDlPHtkjc
         Jc+Iroiqz+NsdImpzveYG6IYGkgue+oV011LWVtslT3h+8n071ZOMbfcgZNZ1pPf+Ftp
         kRDGIpEmOhtjsIT/IBNdDIX/Z5Aol8lJn/3mg9v7Va4yR/GqRvjQ6dP2Ivr4yt9+EVYn
         VIQCjQDUI/9LQj6wk82N/t7P4ilxYsnaGHA9Ytqi8k5o5nc5P+ql7Ev95njqMsNNsh40
         q2lxxdI+7UkaWJRIa+UG0y6HIKSpkHg+8w0oOXJJrqowUaOvqd1pb6VjUxKXZcrs8z1S
         tkeA==
X-Forwarded-Encrypted: i=1; AJvYcCV1dEOgsiQmSUm5MFg/z2sAqwlTYLpXdbjnf2ufNKL7dR2DtlBAdmUijn5L2/6u3wnMk9q0XcdVStNCOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMloLuQo6HWrT1T0nMdkZ7FD6iL9ejyLSffcTRNpzmHxhTw9b1
	GL9u2RB9O6hEfeY8qoPrrZWr/HZzEt8V9LjsxVi+j/jLkILscoGMLg7zXhgYodjGhMe6RrAZwpi
	V2ELtSU9cACpHmv+2IQz7JptIpG49WII=
X-Gm-Gg: ATEYQzzPK1IaioTHWN3ucYysXUlsmeCLLC6kijmEQ4BeJUKGxdLQSMbGGwYV3K7+3s1
	2RDtRyLIml2KSgDtW+HvksMwYZqiTs3Jd9lXNOzjBLQhD6OZIQ1HLja0JRaxRaDB1B6UNvJPB8E
	PH0xudP7ZNzU02gRbtwKTwXvSud0HJZ+xEB7H6VP0eWX61mX6E8DUCEyJch4Gzh61Vm0JheoIgB
	KpHug1sQTUZNcQkVf6hZ8IXlGbBuMMWktT6IKkEiWdJAM5KavWC1xZgiEh5jtQZa8rNgCg5wC67
	VFKMsvyi
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id
 ffacd0b85a97d-439b92285dfmr2649252f8f.36.1772439197286; Mon, 02 Mar 2026
 00:13:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130124932.351328-1-clamor95@gmail.com> <20260130124932.351328-6-clamor95@gmail.com>
 <DGP1SU17I99K.3QKZWHDPBB74H@bootlin.com> <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
In-Reply-To: <CAPVz0n2uiF_UHK5_7-dW+AjazxTsonQQsnf96QvRu5HgmsyGSg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:13:06 +0200
X-Gm-Features: AaiRm513PJ2Vl3yAaZ9EK2Cx-_p8na7NMdLvn762xKViUHPZp6XfmHs_ZYNwew4
Message-ID: <CAPVz0n2rv3aey+7dVdtGeQfdgVpyMczp=RTKeg8V5SxNPr5-Xg@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] gpu: host1x: convert MIPI to use operation
 function pointers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:09 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=87=D1=82, 26 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:52 Lu=
ca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello Svyatoslav,
> >
> > On Fri Jan 30, 2026 at 1:49 PM CET, Svyatoslav Ryhel wrote:
> > > Convert existing MIPI code to use operation function pointers, a nece=
ssary
> > > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configurati=
on
> > > that is SoC-independent remains in mipi.c, while all SoC-specific cod=
e is
> > > moved to tegra114-mipi.c (The naming matches the first SoC generation=
 with
> > > a dedicated calibration block). Shared structures and function calls =
are
> > > placed into tegra-mipi-cal.h.
> > >
> > > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paral=
lel camera
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > I wanted to test this series on top of v7.0-rc1, but applying this patc=
h
> > fails (with b4 shazam). Can you rebase and send a new iteration?
> >
>
> kzalloc(sizeof(*mipidev), GFP_KERNEL) > kzalloc_obj(*mipidev)
>

Hello Luca!

Thank you for still being interested in this endeavor. Sorry for such
a brief answer, I was very short on time. I have rebased changes on
top of v7.0 but ATM I still have a bit of time constrains and I have
to test them on my device. I will send rebased v7 ASAP.

Best regards,
Svyatoslav R.

> > Best regards,
> > Luca
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
