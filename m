Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686620;
	b=DP5O8DirvDHvsq8dSyb43xRIY8bXeautcymTlaFj4nlUSbqc/9Ti9DvofsZSu5nCm6rK
	 VMDZriunG6VzjWYdyn67e0pZgKWb4MyqmD/wrM4RGbvox6pu/eew0aibTsfwxhpixCeWe
	 6clMOGtmp8rtP2BPxg3ewkL9XnVYWEZEKjBT/FcFA9Y3SWiXKsnQHbvwZleM/FbvPRg7u
	 bhkl55bY/qjZv4nO3DwcOr9xXegQUkYhyywsAD82DzQneRF1usx7hWl8VX9rr4NeaS0NN
	 hNv8gLhxDTB2zNfjnlIGrczORAnIUBgRfwEzHFmNi4hHrGQY8+hDuVJGqwK+M+bHrSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
	b=gjtH4rTBRHwfAYIShW5vCZmhXI9yVNkmDwLCmHTiNhpBM8uOT44LmO39u9iZ/2AOcvLZ
	 Fo2Xn6vjzzGWs6r/VQtKJ3HKzvVfJHti6TcNxVDXZ3fLHxZMaoKyIztHqxZHJ9q542PWC
	 R/pgZg/E2b45QwuzQFs6mxSRH4cX+tOqqk54FsvVvUmDfIsmjujJJJtiBjPJcnYPCUr26
	 kscE/6WkgTPrFTfoHjkueFFNjs7RtjO5Gi2kdq/0gnu59y0K0w6AL/swNdlQGH6kM9a3c
	 Kk3K2cMM2+f2MyerWVI9XOlSLL0Ej+Pb8PLFnMrlfNslKnpCabf4uKf0EK3NlWvVCIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggG7WReS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B3606A339
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 06:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 049B3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggG7WReS
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c7b00a75fso45721636d6.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Nov 2026 22:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793686619; cv=none;
        d=google.com; s=arc-20260327;
        b=nwzEwMP3jqOgLFgBcyjWzayO5ZaIiEvA+f33IGH/rKZ0HDLZ1vN4PgKVD66H9QDT5f
         E4soHitbA/R3U9DWKm4JFwlv0KuDYvJt0xta8GZvvzAckmshBlWFfcbQooDnv4KQr+lM
         FgpKez3my+Xts8MjA99exmLkeXZEYNF11OSIdDCxB+aBGvZafyYJ+dx+6wNRoZdmRaWc
         E7//WoF5SkQvzUyh94pc5YJIm5xgjpP9JpbNWXjzaFO4fcIXthm8ZsZXh/DSPeENJ9QY
         3O3vK6IfZHA+qiUEw+Y7yaYKcVC5Sj7jRxMQv7EZr6KY8NmbWb4qoPNNN61CoFUsIcAm
         US/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        fh=q9qYkOaVMkZjmz06eVCw1LbBxVr6KiuEFGkydjuEJCI=;
        b=NiWCp4IrMfgU5sSmrOEJ2hUV0g5wPjysYngASFbpk6oISeKtnhnQhL173HH0RyS+pz
         MSGJS8a49AdUA6EkcByIjoRRMoEpvNUuFSVqMOFWI2fF66VLIBV9uLVttJCAUgk1weXM
         cZO1LhHTpFI7B4x8lVIbkhHKCrkeo8DeQECXMCIO9ckSDgm1RgKjDWxbdlwqm9TSik5J
         d7ifffVT42BwnqjF0wbvdLeq2ayPezVReBdANTYxxPocX0VJFxFCMdrRxb65n7qJlQcC
         EtxKWAtW3y5wPAQ6ATC/lYy9YqOweBdAjlBCFuPbU0yeUfu0onR0/gjb488gU72vX1zx
         MfFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686619; x=1794291419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        b=ggG7WReSSjYiZc8egHRr3yORSA9vmHTvuRcNLhgObTmj4FyavzQ9qjR32UJmnQJt4X
         7pJ+ZlY3InbU5ma5q50MF3GARosdc3bQTkJzhTRnbTOPAvCYqR+qKHGl+gVI0E7tJcFg
         RR9Na1sHcqr8VCfp5Gy143eZ46V0ERbWkJy+ZlNCGW1wBwadBWDVOLL+Lf0qFs+w9bG5
         KwMMEVu2NUmDaWIewXCtXWnhMtHZaLuc71i++n3BS7FGT4MwqjJih7LND5jbfV85L0EB
         CPryclfjGBIhxWCtCbkIDD66Yl2GwFnN9Q60l5m97g39tFRcnG7nW++6QbOOmfOp3AIs
         61KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686619; x=1794291419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        b=nR+El0XEzyXHaAI8JDRxMFwckF0dIMc9sheGQ4rQ8y/y3MpTYLTjSQffwoTtzGisnE
         HJySs+yyTpT73/LTYRMsifcC2drOAY90iDl8GhDlbAgU9w3mi9sCoLQAxNtg5DlTDQR8
         Rv3lOrsi9CBmR1k5DcG03QFKHAkeMzsLj2dTxvRvtWWCPHTGOtxAaj4f7XewIF+10AE6
         gMAaJlskClDXX3cFiA5+QsDf7oaXNsx7Y4CcPjv5qmhCFtuTaN1EC3KKvFxCOt9NXUsF
         kNK9zSUhNV4DcuzyUz2jUpfxfRy05+Dxwc3++/7UQquc4fVLKi5o5g+7e39QSvsaBDhX
         4PNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIVFLXK5LJI7HLSnUkdVmZvNMfuOf1Ds0PGkf77OiW79paJA9eCBsNlRbjndsIh4Nd8xmG82G512fIPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Cs0u6sxfvN050eQRxTsbFVczo0E5sq7UbuWSgXd0CjzBKfJT
	0Rv283fliU0vz4ESX5phSAquzx2N2IWOwPSt6e/92PbN3AhFf2409xhlZJFRjjTb2N0NuUTlVDM
	ZRUAoHUloTyPEM3l0zgZgbzzs2y9Qg4Ptzwu3
X-Gm-Gg: AYBFou3PebdBPuh/v+VIAmPPC7b6Wx6mtKxoQzSY+X/ecSMQkYyA68DXPnGlX3m/gk+
	74gkJ/Mjmn689cFPDElgmXfhY3isodVKAwcU6fwg7kewDnfDPI/mFhAg5OpwmZ5hTDv3F1T3TPn
	GZs1oVcmv9leTozMxzSavFK0Xy/GUhQxhmw8HIkKV4lEsTM2yoD/i1thUslIB01yBqsitboCCk7
	c7BKKnVHSwbVYoJhzBPL4ug6N5YO0TtvoAnPszXSH5gEUq2ww4eYVCP7B5OpICvodegJCYaZtAy
	C0XNyqHiTALgeuUHlZh3r5XkYwKm4ioNZd+cOB0h9vQCvxAYyEk2Z+0lAiSeJ6vDCOrutnMBdGP
	5MqQb4MZxpj0kTlJio6UYan0xnhMNWq0Fm56PEux75orsElQjIRmcX1pqjTSScNyOZ/4wWVKdWz
	EDqo8q9DaSFduTeQLpWm97Qd7PE+N4bt0Ha0cRF2nWLJZej98pJiYmTRTSJH3ZRfC7o1Hl
X-Received: by 2002:ad4:5cec:0:b0:91c:273e:4fa5 with SMTP id
 6a1803df08f44-91ca4badc8fmr209856706d6.57.1793686618829; Mon, 02 Nov 2026
 22:16:58 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com> <20261024055055.602558-1-austin.linux@gmail.com>
 <2T-GACGvSDOWv7aIZ37w4g@nvidia.com>
In-Reply-To: <2T-GACGvSDOWv7aIZ37w4g@nvidia.com>
From: Austin Schuh <austin.linux@gmail.com>
Date: Mon, 2 Nov 2026 22:16:47 -0800
X-Gm-Features: AclHuK_rxvwx-oxtrUFzGyyxWEarVbq8HBl2KDSkLQPCh9cTIpyOb-qam44wAX8
Message-ID: <CABsbf=HAJXq=gmQh9Kc22fuThYVHWNShD58TkttQG1qm8L1TGA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: tegra: bpmp: populate debugfs in the background
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Aniruddha Rao <anrao@nvidia.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:08=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> No need to explain what the userspace can do. Generally please compact
> and unslopify the above. No need to explain every possible resource a
> driver might need from BPMP, or details about the patch that lets you
> disable the mirror.

Done in V3.  Hopefully the comments + commit are more direct.

> >
> > Measured with initcall_debug on an Orin Nano running 6.18.39 with
> > NVIDIA's patches: with an earlier L4T release, the probe returns after
> > 1.2 seconds instead of 6.36.  With the BPMP firmware from L4T 39.2.1 it
> > returns after 0.51 seconds, and the mirror is complete and renamed 2.2
> > seconds later, about 1.3 seconds after init has started.
>
> This paragraph is kind of difficult to parse. Please just say which
> device and kernel you tested with, and what the change in time is.
> A recent upstream kernel would be preferred.

In V3, I've got just the numbers, measured against 7.3-rc1.

> This seems a bit overkill. We should be able to populate multiple
> instances in parallel, just avoid removing the root unless there are no
> users left during failure cleanup.

That's an easy change, done.  I started with a mutex to keep the
exclusion simple and easy to reason about.

> > +
> >       root =3D bpmp_debugfs_get_root();
> >       if (IS_ERR(root))
> >               return PTR_ERR(root);
> > @@ -818,7 +821,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpm=
p)
> >               }
> >       }
> >
> > -     bpmp->debugfs_mirror =3D debugfs_create_dir("debug", d);
> > +     /*
> > +      * Fill the mirror in under another name and rename it to "debug"
> > +      * once it is complete, so that userspace never sees part of it.
> > +      */
>
> 'never sees an incomplete state.'

Done.

> > +     /*
> > +      * Mirroring the BPMP's debugfs tree takes several requests per
> > +      * directory, which on Tegra234 adds up to seconds.  Nothing else
> > +      * waits for it, so do it in the background rather than hold up e=
very
> > +      * device that depends on the BPMP.  The workqueue is freezable s=
o
> > +      * that system suspend waits for it instead of failing its reques=
ts.
> > +      */
>
> Something shorter suffices, I think --
>
>   /*
>    * Mirroring the BPMP's debugfs tree can take several seconds,
>    * so do it asynchronously, on the freezable wq to ensure requests
>    * don't fail due to system suspend.
>    */
>
> Or such.

Fair, done!

>
> Thanks!
> Mikko

Thank you!
  Austin
