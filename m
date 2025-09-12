Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3D26E6F8
	for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660889; cv=none; b=GZmQ7QcnEPLxtqk1EN5BMW4TuiJswdwu4HNT8NdLW/s849apJ3fGIXJ7HS/hrTjbq/wT/LRZyfF70U/+djDlVhMpenZ8bhaRbNPoghMi6aYHN4uem96/lemA0wMr2JR4/nClDHs/Q+V/SwreVRSxXZKDPMFdQuMjDrN8iqJEy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660889; c=relaxed/simple;
	bh=W7sa4dPPTPYoYuKBZuN8JhwzRLpV6rUI5E+79YIK4mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4gUINHLCym55oPNYER1gMhUca4mneq6ALyC8qhzuGkxkH6gVTttQ6iiulU790zQQYg+ABn23tJxivI8Rfp+u1nu8YpOGroe6otKjszcsIOlm1zObiEN201vVDUxtv5iGRmO9R5e9AcnsqpcbubD8Ptj8dakq/SO1JLVaYb4cwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFfgNx42; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFfgNx42"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-352323388b6so1285521fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 00:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757660886; x=1758265686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7sa4dPPTPYoYuKBZuN8JhwzRLpV6rUI5E+79YIK4mc=;
        b=JFfgNx42pHrehxboUrLkwAHNW1nPOCdRvZ+7dO5Pdx9CZF4ce3nF8+F9jCdnRjsmjo
         XZ3S9PJBuQzuL4H7uv0iGjeBeGXad6i1lZ7icaf+IRQDo06hgSc830pVPUY//t5/KU2u
         iD9onufV1WGWLTmRk+poRz4r3yTQAnlEYB2i9ZlvtDjphfF1zqO0/Q/pQjSgaQTEs5JX
         rISfc33TOzb0fLtM2+wyiAVl6uv8XxxO8e5FS/rOQJylNIzCBuqj91dvk7AHJeLe0Uqf
         gs5jPip47+/eH/ll7eft30ru2aoq4ciRaYF4W+qnVciWGTktbYRJI0YlvuvCcW58HjcS
         i28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757660886; x=1758265686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7sa4dPPTPYoYuKBZuN8JhwzRLpV6rUI5E+79YIK4mc=;
        b=Xt19lc+15Imrv3p0gg82BSH5DvtJsvng5n/XNXnsZagKj68KKza6svG08w7ItcOy/B
         cjnDeFUr7xwVQ8QhkYooKC8Zpe/2teN5Pq5+Nj/aBMwkvQbQn//9abxD6oYb6Cx1mqvY
         VqlfLvtxwThgDUU7DPC7oTFbrvmiJR46q02MG3YXp5ZBUe22lRCqDGlO1E+aCyfoYaCP
         dNa81q3GHhrirhC0fQS6q0JOCG8h7XVu8Yig5WVe88FW/xPwrHJwAsOHk1VjqThTWJN7
         yVmOMJByh4MsUeei54GH0JOXGwGsMlw6IviUnqABRpckXctbWO2tqbNyQ2mTlNbGscxv
         dFrg==
X-Forwarded-Encrypted: i=1; AJvYcCX5O52859xYmubLGNPstZ/aUDLm7+K4ALjFCHrWWtoODMqXnClCzZ7k1n2lDAf3Xqp1p4QRmUovxK7MpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyANVoGRfhyYPpmaplYu6CdzhkVMhdiwjC/MhuzygpM2DQDjj82
	O+051v/05/Q/jc+fYFFdkIYd2SXtf0c5coxOVfyH7mSf47wmxc8IQ6tKGRB4TlBCOUXedN+28Jr
	SZ6y6YxOSfrfA3bKEMREYsXnzat/+YQA=
X-Gm-Gg: ASbGncu2xeGAymf3ry8LlR6vtCUEjXgFuSzdXk8e6H9Evkh3wpxUAJ9WgpETkyqrp/x
	TxFub/T0l39FO4mPaw0pm4qkv5hMQHprM75aL38AsAJiWPYW7dmvrRrH9joX6iGEa08qnytjQ3L
	KHHV0Xmvkh0klrFbjBfBnwL/cfvz5lsBLHCzrDlFfXYIZ6NDSd/RT2BleqG9T7hm2OY1NaebMhZ
	FeNXIA8x6EQn8JqxQ==
X-Google-Smtp-Source: AGHT+IG0a/RzAkySA0zv4GtRtoMgb7fMz40QqFaDmGNUnRd1h2GrriKeQPDg7VZPJxieR37sFPCZyvmxOEUrMUgnUno=
X-Received: by 2002:a05:651c:542:b0:32a:6aa0:2173 with SMTP id
 38308e7fff4ca-3513fc37bd3mr5450921fa.20.1757660885920; Fri, 12 Sep 2025
 00:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831-gk20a-devfreq-v1-1-c25a8f1169a8@gmail.com>
 <4f3d9122f3fe552f94827b83a7dce5d3bbdc23e2.camel@redhat.com>
 <CALHNRZ-h2ee5pyOx2YDDBDQzFnXxDFX5EzhjX5+DT25UbKj1MQ@mail.gmail.com> <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
In-Reply-To: <rvfjkkpsqvk3uedaahzhwrao7bgnxvbn7hdm6goa2bn6co7ctk@2hbiwwvn6y2j>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 12 Sep 2025 02:07:54 -0500
X-Gm-Features: Ac12FXwznuijRqzCnopDIstfQghwKQCFmHybp4tbVUQN04WRkgdFV7WmBtzwMqA
Message-ID: <CALHNRZ_hZ5rjGpt4rDmMvxcBBcW2fK6Q2Z_1oKzj+eBi6U-1+g@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Support devfreq for Tegra
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:05=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Sat, Sep 06, 2025 at 08:01:27PM -0500, Aaron Kling wrote:
> [...]
> > I should note that I have only actively tested this on gm20b and
> > gp10b. I am currently unable to get nouveau running on any gk20a
> > device I own. I am trying to target consumer devices such as the
> > shield tablet, which use the android bootloader. I can boot the kernel
> > just fine and tegra-drm works as well, however when nouveau tries to
> > probe, it hangs the first time it tries to access a register. I have
> > not yet been able to figure out why.
>
> These types of hangs typically indicate that the hardware is not powered
> on, not clocked or in reset. It's odd that it would hang during register
> access on gk20a because nothing significant has changed in any of the
> related drivers, as far as I know.
>
> One thing that you could try is passing the clk_ignore_unused and
> pd_ignore_unused command-line parameters when booting the kernel. If it
> works with those, try finding out which one of them is causing things to
> break to narrow down what we need to fix.

The ignore_unused params didn't make a difference, but this got me
looking closer at the power rails. I noticed that vdd-gpu for the
jetson-tk1 is set to always-on for mainline, which it is not on the
downstream kernel. Mirroring that to ardbeg resulted in nouveau
successfully probing. One of my other devices needed a pwm-regulator
for vdd-gpu, after which it also probes as expected. I will need to
double check the rest of my devices as well. Is there a known reason
why if vdd-gpu is a pmic regulator, it needs to be always-on, or is
this another unsolved mystery?

This change looks to be working okay on gk20a. It does a couple
transitions on startup. I'm having other issues getting full rendering
started, though. Kasan slab-out-of-bounds in nvkm_falcon_v1_load_imem
when drm_hwcomposer tries to start up. Looking into that separately
now, but that shouldn't block any of my open patches.

Aaron
