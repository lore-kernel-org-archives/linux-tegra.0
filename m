Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788192676CD
	for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753998567; cv=none; b=mvj+D2xx56pYKJjHxCUq9aVn6EHVKZEbqRVWQXQAQq9NE9wWPMq5ICHmUIJ2SexbBQRK9YIx+d+bQ9FebalIjenxcdXmC5L3niNg5ebh2FxwIIrdIQ6jaxh56KYJa3qoRsQAE6TC8U6NFN1Bgs59dsxLFyCdKZIg7gCvYTXzkvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753998567; c=relaxed/simple;
	bh=TxD+9rojK1RgzdLtnmu4LcUnXijBj9O4CO1tWf7eoKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5mB/OCyyyAzu+cvo6uNldBHr1YKwLkl5MTCyiv2SPTXx5ahPtwnheQPP6lunzgaeZg8+G5fnnSCR5MtybZ/KrjzPUprHw/weF23J5FOy+T6Ti0OY5bPoIYdFJgFs/LNgeJlRvyiV+Do6Awm4wRLJcC0KOTS1ik2g6p0yRUcJfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV9yLurG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV9yLurG"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553d771435fso1461263e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 31 Jul 2025 14:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753998563; x=1754603363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c29f/vxp+ZpDvU68i/43QALO7bFZz1jNRt6jP0X7NA=;
        b=QV9yLurGs7i0GiuVLiIKrdn3/F3a4ZR4MbnrGtRFpR13A3GPvOJWrZ1Vlntrsff8DR
         gm/h+9+pvAw/wVPr4Qpd/ecBPpDFv7wd5YGf35lMd14KwqBvRCEg6pj+tYSZNv1Ifi0p
         NW6K2EhmuBc1bnDQwfw+5ypQhCE9OLhRHLLZgLFxT8bqNCeUe79+2g18tNMtiH+WhOKP
         s7J69v88E9Rj4C3oGYjyx52x1HFzk8IHDVlcR2zXyPkILSAUPrRsr1z/0nKI5bxE4FfF
         mGxLt4/bFTK65vknehiFKWKAo/nYFzrW2zzl6GXURAye62LQtp8yt0KxugMXHTtI/0zE
         jXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753998563; x=1754603363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c29f/vxp+ZpDvU68i/43QALO7bFZz1jNRt6jP0X7NA=;
        b=nQ67uAm5FPKmvn5OjNXY8cPlUn7PZl9RWxIsas2tfpsb+42IhEjgda115C4JeJy1tv
         cC10qR6dNfC2a9IRphPe6s2Gt1X3+/5WzaQ7HnRKg7H13VH9L5clJE+7kG7rTnUAwCnE
         NM6WKn4onOZZLXMHjCMa3OHTAHfUHFbqlN2lYToDL22XhsCpm49UPgofgGNgsxQSL1xf
         uA6J7DDeieQ0+KcmAOfPYiwvVQlt4UYv9xYASqcWrzjVofw9UCDzOkFVSiXPKdidyqsa
         ywBaWoMvtuwnFwwMQ63Xw84q974V67QoRCz5iRZmOP0DHb5n2cdzjS+Z2S0EwQWGcdQt
         dEBg==
X-Forwarded-Encrypted: i=1; AJvYcCXWTBWd2TuVvrddfwqSVdL9qOwKJfly0mxBWTArEEYOdGM/HNIzwLM99uncT/+T/Uvb4dpaEmi268cy2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxopSZnt07EeKB/IHuPKvSyykvx3jZvdS+HX5P76u7J8zhQGpw
	oNxBTfXj/8QX8oNsg/bf0cBk7aWHba98kDlxRdHqxj8tKTrW0xoT7j5OjajebPc5ppSbx2r3i7i
	uh3YzkOyHO9EHuyydo9EVCgr0M2nVGxmYl62taUY=
X-Gm-Gg: ASbGnctTf7DOh86ASg25zAnfPxQS+Wf3aEfHQ2/xok0RoopcbnhVWxPt6QWPzV7ImgV
	uDplSF6qfMorWT0ofLacjVKJJ+BLDMHWUVXMKOuwutfUwijGT8mpGIk6W1HVoNxmlzAofNBwCRE
	4zaTfOJGEROVBGw+BwatyGdtGIj2hgrCaVIvLJmnYnXU7HWvjD0icd3rKOQkfCYAJTKwBBF5v6h
	08yfT0=
X-Google-Smtp-Source: AGHT+IF8D2sr/JiAiNQTvCUOQZFl5OBjpor79Ab1Io8iaTM5luEmiS7GuwPXDeGMqChiRY13xfc1+DO2GGb+vvD7SCo=
X-Received: by 2002:a05:6512:3f0e:b0:553:522f:61c9 with SMTP id
 2adb3069b0e04-55b7bffc76dmr2724433e87.1.1753998563396; Thu, 31 Jul 2025
 14:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>
 <73cbbuahttztsfkz36ndl7mla5dswo4wjqvzvuuajfuuxdo3gn@eiq3q2jniajw>
 <CALHNRZ_Tf=EPpPCpc60SF=um1oZ7gDnWdBxCfD=GrXUo6sOwOg@mail.gmail.com> <CALHNRZ9FE-WppDo02u3SkYjUkgtEpxj=H1V2pT_Stmtze3THpw@mail.gmail.com>
In-Reply-To: <CALHNRZ9FE-WppDo02u3SkYjUkgtEpxj=H1V2pT_Stmtze3THpw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:49:12 -0500
X-Gm-Features: Ac12FXxf42lpDlxks88XBTIlM2tgKHzzS6Sc2FtLG4xCJl4cCq_xiZCx6tV9Jd4
Message-ID: <CALHNRZ9LPpkwwVy517DdzOuHi4zhFuxdkYS5sQJsiSq9vuohhA@mail.gmail.com>
Subject: Re: [BUG] cpufreq: tegra186: Denver cores do not register
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 1:21=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, Jun 30, 2025 at 2:39=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Tue, Jun 10, 2025 at 4:20=E2=80=AFAM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > On Sun, Jun 08, 2025 at 10:09:01PM -0500, Aaron Kling wrote:
> > > > The boot logs when using the L4T r32.7.6 boot stack without u-boot =
show:
> > > >
> > > > [    2.648162] cpufreq: cpufreq_policy_online: ->get() failed
> > > >
> > > > I have traced this down to ndiv [0] being read as 0 for cpus 1 and =
2.
> > > > Prior to "Share policy per cluster" [1], this would also fail for c=
pu
> > > > 3, one of the a57 cores; but with the policy for 3 being shared wit=
h
> > > > 0, the driver no longer tries to read its registers directly. This
> > > > issue has existed since at least 6.1, which is the earliest I've tr=
ied
> > > > to use Tegra186 on a mainline kernel.
> > > >
> > > > I've tried to compare this driver to the downstream 4.9 version, wh=
ich
> > > > does work as expected, but I do not see any differences to the
> > > > register offsets being read. If I hardcode ndiv to 35 for the faili=
ng
> > > > cpus to match what the downstream driver gets and what the other cp=
us
> > > > get with this driver, scaling appears to work properly. But that's =
not
> > > > a proper fix. Does anyone know why the registers for cpus 1-3 aren'=
t
> > > > read properly while 0,4-5 are?
> > > >
> > > > Sincerely,
> > > > Aaron Kling
> > > >
> > > > [0] https://github.com/torvalds/linux/blob/19272b37aa4f83ca52bdf9c1=
6d5d81bdd1354494/drivers/cpufreq/tegra186-cpufreq.c#L117
> > > > [1] https://github.com/torvalds/linux/commit/be4ae8c19492cd6d5de61c=
cb34ffb3f5ede5eec8
> > >
> > > Adding Sumit who usually knows this kind of thing.
> > >
> > > Thierry
> >
> > Friendly reminder about this question.
>
> Re-reminder about this question. Even a 'I don't know' and 'works on
> the regression bench' would be useful. Though I would have followup
> questions if this issue doesn't happen on the benches.
>
> Aaron

Re-re-reminder about this question and the followup question.

Aaron
