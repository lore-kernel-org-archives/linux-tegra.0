Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6D283C9D
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 02:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946048; cv=pass; b=MmhT0PPLFnntLFVkoZ/J0oEKkn6H/IMXF5TH4KZd4LfQ5YVSkpcv7dzxuLE6845BC3pMCPJ949V99t8ycc89fo8Uco3s3EHvO5cBtNC0JAv2uvmMoShpA7CvDR2e5cRDwZmqAwbqP0rVaigUlRhBV8c8uIaxmjjAnEZRKtNGypw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946048; c=relaxed/simple;
	bh=i3WtXpuXb3fWEJjJRlu3ksVmxxV/XN1lkRkXKelnq5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZtD4eTUX6VK4A2LxfEl3cdCx943a5+NLpQtbiO/IrdRRk2EXNNLEp86qAUbo0fApIqv9iQPWCcq1WcGXCtKrA+3OYD54BcDF0vznDEvjrNkMQqJhOeda2qspa+QIDQN0UO9GERcHR8qTXpK4FprE0a10lhWWk1v6Qf0sn9yzP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrqqBmOw; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrqqBmOw"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so5293101fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 19:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791946045; cv=none;
        d=google.com; s=arc-20260327;
        b=PUNj77dNXEifFJVNtTywiJCEAPOiWqOzIavpzyX3PBrMAyhsGWl2lJiCQwWVWmjbud
         tyFJxft/7Od/EaCvvnBW9/JjfdKYYtA8jptQbCjj950AlQ0FUxwSCrGTKIAeaPnPKcVi
         HUphhVefArq0AwZYHReaUJA1tckdSolnGUscN34Afr86iBpr4Vo3Zl+8x+0GUzVvA6xF
         tq8kxoOit9Nsgi/1w0uppFW6I3MZkem4n36pal+NwfSZMQBc5McPq+VoX7ln14OP/yb1
         7nSMsKL9csL04VEDigGA33gGIT5QPgHVq2t8ar+GyWBVN6Qphn4rq30VZmbqC59+OfWi
         Cj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkdltjV6GlsmVDCJlhaYgQO1Bh20wbgJ+DihXfiR568=;
        fh=E17SpFQDVI6KEZL427haINdwjFIdA4GCoPKKJgg9smI=;
        b=apRYgsr1FRuPNiZD2U63Rf3i0ljr4wnBfq3YylfKeWTbYL5oRbHBIJtZCiNxU8GrEk
         HxVqNP2z0Gqa8s52rfIhDJcKs9HtSZjs1jWwg/6Id2HID4raJ0n7AoyozdQskM8ft0T+
         Vgx/Rz1hGLRcikWzAITYjbPEo3uGuSUipoC7bKAhm+dI0yxr0ckcoVx0vU0pi9y8PuBy
         LYA5DyeBY/IvIJks+0t+BK2aMw6jjb6xqxKGSgHPOkVCCbikdhMnV0L1rDeoN+peogzr
         2YaUyeeNbPmcd1NO1Zoj8EBWFJqFun/xMDBFCoPwH3sOww7Q5s2KNSiwKcketOlKyaTd
         9NFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791946045; x=1792550845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkdltjV6GlsmVDCJlhaYgQO1Bh20wbgJ+DihXfiR568=;
        b=JrqqBmOwSTFMySYHvMpg+zKV/Wnn28K+Jf3+XYgFahhushT8D3XILv+9JLv4ag5H8R
         +bGqVMnD+A+od+UQ/r1nH87j+0POwi2z3WZtWjLyr1VTaFCQt9WJpPp4xSo2OwgSW+aN
         osq/w5mM/gM17P4czkoZN1d/bpewOPFBo9JzEyjCa6BSSZ0oVrvC/pHbd355Q3H59JR2
         u5JsE+67DgvtSapUtK/Q4//ivKh67cQJanj3wayUDMPjX32eyRfuhwLymrfOK6hBnj0b
         YzHY0hMH+p7C+vODG++gNQ23r5OFvgbEFaNnTbpf/8S0ipdvEx+fTQI/lfVAkXdrxSAL
         dnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946045; x=1792550845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkdltjV6GlsmVDCJlhaYgQO1Bh20wbgJ+DihXfiR568=;
        b=GCECJrfSdOXp/iWRYwkktythLN9abiQNbYhQs5TFhFpCv+Xc3TMJDi6J69LjjvYoFa
         LxobiU27gchBH3ZHw16BZ816fCExSPpbL4NQzN62B0vO8jLY/XB8usbj0Dbo4gRWq+kw
         H3OcDoOMJEwJLcmnFF4mGbUS1jkeG/ocH5qfgav9Rhtl6bPNYlNh0ATZaaxvMj6w0UXf
         d2lbrekSYvcoxGrFk61x/9yiHDLMlp/LvvKRyH9nJksyNXoHGwTMWpw57G/Ux4tAfAoq
         8/FYL9uvim7WtqAox4TgLAlUDzdB44w0h5Y1BEGr5y81F0rt5UUm6Pm1MUV8JySLMAUQ
         a+aw==
X-Forwarded-Encrypted: i=1; AKwUvBymQ1Q9H/KjC/43aIRRR4VVk+0PFBy7TCN9P7PkObkSPxQY6QWv7Ntop0TBAwGLVYQAukbbdvPz9YHeoA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7dZFUYlM8MRTBf5vETujP79Ev2lkAAtZzBc/Btlf9sEzLV5VK
	vWpu+3PXGyko6euKUarLBDcKce8GY+f36EthwfE9dbJxaVJ9TRjmPbZJvtJ+xcLi22Pojtqy8gg
	tweux+KMCG1eBGI+Qm/uNuHR1/g3k1G8=
X-Gm-Gg: AYBFou26mPtJS5LFICA864XQlqZ1Ss7ZR81J/w/DhY+VskZ99mHfq/pUdokmh6Z2jLj
	MkLR4mPiagOmLI/AZEb51zO66dvEKxyAAIn1OqmJb4YOQT6amfb1PLlmWK3Jhq9Vkv6zbvo3zjd
	LjK7Q6Q12c2eNAgehX1o4xpQ2Jnd+MN9+Q3vq3Un0hD2t0ROurHtJoP8tgjgjtbxeOSP5E2ltfJ
	0Wg1a7H3CrQWxOjVkttTEd5bPYC2sjbRgGbB7mxTwbaaEbotCoomi2q9tAMnqiLQ+BcU7riYvQC
	PjKYdAaYSuxJFdgNiCUk0sAiUh3xqHpWmYa0DkW0Npn/ad5yNnbBXQueGQwdM++THLYFM3m9CqU
	ZO436x2ph4hVlFGNrYzmGor1nlvN5PaziVzSEHU3LO/8=
X-Received: by 2002:a2e:a54c:0:b0:3a9:a315:a655 with SMTP id
 38308e7fff4ca-3a9c53b00eamr37923851fa.29.1791946044798; Tue, 13 Oct 2026
 19:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <aoQ4he4rBJSTPBbR@orome> <BMe1VOJ9Rf6tF74Mkc7tPQ@nvidia.com> <YuEtlKWiT96iasuBtZCX1A@nvidia.com>
In-Reply-To: <YuEtlKWiT96iasuBtZCX1A@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 Oct 2026 21:47:12 -0500
X-Gm-Features: AclHuK9HAogsFwfsI8NNpBGT9j9XrBXxJmk1lXriDwCRS1_FJJibxSVPw815MQE
Message-ID: <CALHNRZ-nBgurVhtHjRtz0W0u1oNJY2eQo7xRA6kaUPyfZv9hcQ@mail.gmail.com>
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:51=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, October 13, 2026 5:49=E2=80=AFPM Mikko Perttunen wrote:
> > On Tuesday, August 18, 2026 7:49=E2=80=AFPM Thierry Reding wrote:
> > > On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> > > > On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen=
@nvidia.com> wrote:
> > > > >
> > > > > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > > > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek123=
4@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierr=
y.reding@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote=
:
> > > > > > > > > This was originally discussed on the freedesktop issue tr=
acker [0],
> > > > > > > > > but there hasn't been a response there in 6 months. So I'=
m reopening
> > > > > > > > > the discussion here.
> > > > > > > > >
> > > > > > > > > * Nvdec firmware. The driver has been in the kernel for o=
ver three
> > > > > > > > > years and there's still no available freely licensed firm=
ware to use
> > > > > > > > > with it.
> > > > > > > > > * T234 vic firmware. The driver has supported the arch fo=
r almost
> > > > > > > > > three years and freely licensed firmware still isn't avai=
lable.
> > > > > > > > > * Nvjpg firmware. The driver is awaiting final approval, =
probably
> > > > > > > > > worth it to release the firmware with everything else.
> > > > > > > > >
> > > > > > > > > * T194 nouveau firmware. This does not have driver suppor=
t, but there
> > > > > > > > > has been some interest in working on it. Making the firmw=
are
> > > > > > > > > available, even if it isn't merged to linux-firmware, wou=
ld be one
> > > > > > > > > less blocker for someone that doesn't work at Nvidia to w=
ork on
> > > > > > > > > support.
> > > > > > > > >
> > > > > > > > > Aaron Kling
> > > > > > > > >
> > > > > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > > > > >
> > > > > > > > I will continue to look into this, but it'll not be high pr=
iority. Too
> > > > > > > > many other things going on.
> > > > > > >
> > > > > > > After some discussion with nouveau developers, it was pointed=
 out to
> > > > > > > me that the gsp on ga10b doesn't do much and the setup is mor=
e like
> > > > > > > prior tegra gpus. And that it wouldn't make sense to support =
ga10b on
> > > > > > > nova. So I would like to expand the request for gv11b nouveau=
 firmware
> > > > > > > to also include ga10b. Perhaps not directly pushed to linux-f=
irmware
> > > > > > > until they can be verified working, but made available so dri=
ver
> > > > > > > development can happen.
> > > > > >
> > > > > > It has been over eight months since the last response. Nvjpg dr=
iver
> > > > > > support has been merged in the meantime. Has any progress been =
made on
> > > > > > any of the firmware releases?
> > > > > >
> > > > > > Aaron
> > > > >
> > > > > I have the multimedia engine firmware files on my todo-list. I'm
> > > > > planning to send these out after Tegra264 VIC support is ready to=
 send.
> > > > > Unfortunately there have been some delays in that.
> > > > >
> > > > > Mikko
> > > >
> > > > The Tegra264 VIC series has been picked up into -next. Is there any
> > > > update on the firmware release process?
> > >
> > > We're still working on it, it's just taking a really long time.
> > >
> > > Thierry
> >
> > Firmware files for VIC, NVDEC, NVENC, NVJPG, OFA, and XUSB for Tegra124
> > and later are now in linux-firmware:
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firm=
ware.git/commit/?id=3Dbdeb9f0f93f18d10b281217e66e81838527ce55a
> >
> > Thanks for your patience. I was about to lose mine a few times.

Awesome. Thank you very much for keeping at this and getting it done.

> > Mikko
> >
> >
> >
>
> I'd like to add that I'm looking at GV11B and GA10B support and
> associated firmware as well.

Oh, nice. I've got t194 in fairly decent shape except for the gpu.
Getting nouveau support would push that into a very viable state. T234
is still giving me some trouble, but it's not too far off either.

A related question here, for future planning: The soc in the upcoming
Jetson Orin Nano 2, does that have ga10b or something compatible with
the firmware? And is the existing t234 media firmware compatible? Or
will there need to be a new release for that with matching driver
compatible additions? I would really like to get mainline support
going on that as soon as it's available.

Aaron
