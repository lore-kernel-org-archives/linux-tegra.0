Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93A4657C6
	for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786987064; cv=pass; b=IjVRlxSj3dsEy699j2Fh70jAk8TpOHM+qwehKM1HAF20JMnXOX7Jbd3B77oXNETnoxpyVtZZtOeca3RyEcuXMHBbIKfUjHmh23UZixfQvV2mnc/8BhYFd9gjgiabu6Zg57uHg20bxHrOfqjxMlotgeeoM/JaMnSavkt9j1tXt/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786987064; c=relaxed/simple;
	bh=qS8FjuGcZsqwayWcruQoAo5WrtmHKMr+fg2KnaGAy30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUmW+MvthSljnFkHlumFF02WV/GeW2+Lr7g98Du9mk9Q74lxZCjNz5azcLuoi+5lv7VOqHcjtIpSuRxtWW63GkVL6tWVxk/JLK84soOy//Jo/K33VoECt3UMNQVV0tvnvHoTT3rLRPyjJtWr/bbnqvqsAHY7v3s6eEphAyQIjzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVwxIbSE; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVwxIbSE"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b29599b81cso5117767e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 17 Aug 2026 10:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786987061; cv=none;
        d=google.com; s=arc-20260327;
        b=mXnaELoXR4VzBIu1ukSq1v8Y05H3NLltJ+oPMx03CjAg7juWtxNYw88XsFJRM1tgv9
         INDHOFa8ngQQkWF0W/6Wk61qDND0rSSCKV3DuoXtFakzblfS4oOgg8hPFYfYsqav6zr0
         wi76UWDQbF8AWlocqdVxeS8mKM25PoJF9toI0A3kI2rbMGzhYNrK92DRrFLmbQQL+TW5
         xUZV5WpocKLSqbvMEyvfvauckv4PFhyAKX87YrB6ppkMfoMrK9IsnXIdN7Dwjov6/YWE
         j7ILgYalxkXt5CtumAQv4Xet0MUtAoZoSnvfR4o6oPhQw1buYZwebWfOCGrrk0fJJHtI
         0G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qS8FjuGcZsqwayWcruQoAo5WrtmHKMr+fg2KnaGAy30=;
        fh=67J7YsBjs0y0v+GD7yF7FQegwcZhyp61kOMUaHIrVmE=;
        b=hP69NZBS64kuB/o7M8j+N+cfobh8TxrrIQJYYQK2Lq+w3FSQLBHyDnesx75g4BtO9N
         5Ni1WgQA+Jl5dRNbAEfOokUxOKA+qRLFLw+KySzkNmcuzGue+IUKeBijxV2OXHiesm1P
         6dVA0eiGS3O+7zbCwx3Pj6+SB3fZcWeSORZsQo1tF9jhqJz0Mi/TekCZO2HMzFL9prVX
         U6R/PxCW7lbG0tHOih8w5fOCsZ9FPQowlmWyYA07ot2OLktMdkVloXpBEsPg2+vNT06t
         T06d0JwOmsqAhC3gR9RdVwZL+35xLqIG/ysRbZG9mBp+5R74qlhV+SwQZrXrh9Pyru7E
         VX/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786987061; x=1787591861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qS8FjuGcZsqwayWcruQoAo5WrtmHKMr+fg2KnaGAy30=;
        b=PVwxIbSEam/DVO9qgd65fL+HJjjAwBbjr36rAldygpMVPpmgR/mVkkoBXtuhkuIZtl
         wvH0y91lf04LES8ADFP+QzqAYeHzWzXdGvDGQGUjbKNVi67gIVxHzEGu/EQRzRbr3EHu
         RHqaaVjjYpfuLFxMb5o9Lgmh1gas0L+q7Ur1p3t403/+N/5YmMOpE2hnKQDL+MMk7P8+
         05dwF+V123iMViEEzySmh35x5bNfaYBb4VUn6W/hfKw1FvdZKiFOV8OuwNtSYu16xE4z
         YZfHQRjNqOzphogr3NThx0hFarjak8pKKkac6Qomu+ZaHk01gpr2GBmmqz+rlL40V9tm
         cLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786987061; x=1787591861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS8FjuGcZsqwayWcruQoAo5WrtmHKMr+fg2KnaGAy30=;
        b=FFfmPSHr+069UGMRVbDHQ3cnO8OolJVom/vJFHlORfYMF1r7gbu0RFDgLvYhWtRm0F
         IfJIpawN4R8PQfqCKbX8xmBB0Zk1cFlFpl1t/Z2wR0bzeRG1i3924YxzYw+M+P52TKD5
         3bmUnU78Ek8RZgXvaa6ejizMtY/O075L2MhR0Few2NxQIe07Mqu0PS7SuT6gu3C3Y2dV
         a6YA+UcS2gTUXSB9dZ8Jl0varXIyqAJZ74wRCCZxRngV/sCa5Re7qx6Sq3ClaNkl/fXF
         Y7pmMl5Kv9jBVtWy+QbVXPVzqA2KyiuBuh+GCP/k+7D4XNnR18z8aDzr1zutQ++IxfiC
         RM1g==
X-Forwarded-Encrypted: i=1; AHgh+RpawgQPcjb6+EOSiN/xl94aH2B3xtA4Yzq4rRA6WdG+8IC3b0yHTydPAQ3lpAoIhWrYGqLr9BS7SWC5nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqYumvMAaaHRHXURFt95FbVa/l6NrTur7jV4fciq6B9rEbUIb
	wYby8UJj372sSf9b4JkEV+E4xUMq4LOGcnD0NoV0EGyBjJjABp+sacFth3VLcBFP/ekmjeb19ld
	HcWJ2VjBY5Oo5XM7624WCR9SfvSxvSKTNEw==
X-Gm-Gg: AR+sD12G6xcCpLZ/OEgM/Iwwegmh1N05OYaZAQe68M7LfOaqFDuja22jSws4mz2uMCB
	Nfvn0xVl0z1p8Y8kmdGdY3+XvOxvt0k6Yd0dQn6atH0jzxl8VHPNkMvcPBCQQ6kxEkwCbqSy6Ra
	SBojY9jCg9v7DZfqwi8OnPKdNkfny+MYEBkmErluHjd0M4cF5Y3csJU7eWWYzL4zg5A2GisWG2n
	RjDhSBohf3Sjwhk7L2drQ2GOD9oBBOaNeYLt2RIIqgRpXA5mI28bPUs/2XlfxfNAJdzLlWTDkcN
	O8KUY8UXPq0/sTA3VfMwV/UcBIZx8h2iufftOFr4YtlOXsgdrxUt+apmr8qgxmU9K0lUd4R3mkc
	hOvCl5O4vRlNb2FWEGzZwtxVjW8UbdsRf/n4EuBh3
X-Received: by 2002:a05:6512:138c:b0:5ae:a0b4:5013 with SMTP id
 2adb3069b0e04-5b4590c5726mr4413509e87.0.1786987060324; Mon, 17 Aug 2026
 10:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
 <CALHNRZ9152Ox=Y230zmFM_eywsOtr0Z07CYLKZH+hGbOhRmF7w@mail.gmail.com> <78vIAjaWTgyGORO7lyOZcw@nvidia.com>
In-Reply-To: <78vIAjaWTgyGORO7lyOZcw@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 17 Aug 2026 12:17:27 -0500
X-Gm-Features: AcwNN1VjLKwXQ1TYIa-Ojkk1DYHmd-uSc4xEvQ0nlIRmWll6HEle_MzmocIWG60
Message-ID: <CALHNRZ8PcnQ7mHwpvJwk29N0FvTh2vqZSBhfE4ckf=78NkKEHw@mail.gmail.com>
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > > This was originally discussed on the freedesktop issue tracker [0=
],
> > > > > but there hasn't been a response there in 6 months. So I'm reopen=
ing
> > > > > the discussion here.
> > > > >
> > > > > * Nvdec firmware. The driver has been in the kernel for over thre=
e
> > > > > years and there's still no available freely licensed firmware to =
use
> > > > > with it.
> > > > > * T234 vic firmware. The driver has supported the arch for almost
> > > > > three years and freely licensed firmware still isn't available.
> > > > > * Nvjpg firmware. The driver is awaiting final approval, probably
> > > > > worth it to release the firmware with everything else.
> > > > >
> > > > > * T194 nouveau firmware. This does not have driver support, but t=
here
> > > > > has been some interest in working on it. Making the firmware
> > > > > available, even if it isn't merged to linux-firmware, would be on=
e
> > > > > less blocker for someone that doesn't work at Nvidia to work on
> > > > > support.
> > > > >
> > > > > Aaron Kling
> > > > >
> > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > >
> > > > I will continue to look into this, but it'll not be high priority. =
Too
> > > > many other things going on.
> > >
> > > After some discussion with nouveau developers, it was pointed out to
> > > me that the gsp on ga10b doesn't do much and the setup is more like
> > > prior tegra gpus. And that it wouldn't make sense to support ga10b on
> > > nova. So I would like to expand the request for gv11b nouveau firmwar=
e
> > > to also include ga10b. Perhaps not directly pushed to linux-firmware
> > > until they can be verified working, but made available so driver
> > > development can happen.
> >
> > It has been over eight months since the last response. Nvjpg driver
> > support has been merged in the meantime. Has any progress been made on
> > any of the firmware releases?
> >
> > Aaron
>
> I have the multimedia engine firmware files on my todo-list. I'm
> planning to send these out after Tegra264 VIC support is ready to send.
> Unfortunately there have been some delays in that.
>
> Mikko

The Tegra264 VIC series has been picked up into -next. Is there any
update on the firmware release process?

Aaron
