Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564BE25D1F7
	for <linux-tegra@vger.kernel.org>; Mon, 30 Jun 2025 19:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312365; cv=none; b=Ko3ZbgK1uUfacBSxbv5ale9w+kiVM47vKJiJolVxyhLFFGfEu82JaQd/sl6+Nes9JoKE5EzMiHc1CMEVdEVKS8iBo93dyShn4UXWvh3j3C7AEOY4FWATcA64JbX1aD2jrBWj8VFQghoDbm7OXHKjHW56kGu5Qx2keOx11VJcdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312365; c=relaxed/simple;
	bh=Ju4mSYFGY7iyJ7UWu4/PwOi2SoidIFIoHU9dMubVzE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+hf8vFVHhLsicwfIGeTZZqfHROsXXz2Lro5taE11w5UuDU9DyCe2YE1fCxecEmPIZRx1VlsUXd5vDoIUEyfzhph1zG57qi8Llyi0Od3lrQH2AmJNAItfZG8UrGqZairU1u19te3M27FPOV6QPLNvZIn+SNQMuEyLAvzXhhut0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzJEOXDa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzJEOXDa"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5561d41fc96so675722e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 30 Jun 2025 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312362; x=1751917162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0alqn5beTszkqNXh92Cb5IoYDZQKEXBPWRCJulrMu4=;
        b=dzJEOXDaEd7IkGB+sxhEoctWjgYq0xJOpGjub8sbVoJEBVDN1DWdHpTNwZj+p3WkPz
         X4Y2vaEfrMOQwjFcHN4YnCytPP3ZaWRFm0NBe2bzgqaxjdbEut2uNbXfSMN4qglXjC+i
         ceMUhbCjMIqfUR5Y4teJhURCMGW2ZvWwOmwYy51/dc90G4wKGN9Sc6TTiRUXs/pC2yWa
         YOkUrXA4JTbI/AzoYtctA++bZqDuddbQWvzgNk3HBO3+7b/mIuifP/Cw9MR7IeaELxht
         T9v7THP3yQyUhcIL6P1uQmOwylowV05W7MHBT9gT1FtrpDqz3kZ4b5T465n8vWGxWGve
         Ss0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312362; x=1751917162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0alqn5beTszkqNXh92Cb5IoYDZQKEXBPWRCJulrMu4=;
        b=YEmTbJc46MnXOXEI8232VbvkE5LCrCB55kPacP1qZa0EsJLW57u7I0hYggLduPXiU1
         g/wPvXhaXysuksTTr2V6HuoWwnQwBX64ELDnFGKbT3UBBl4RtkHPwshiqtcQL/WMq2Gk
         +pA9Z+jsguXbvcLKo7WSwDvPVPrmcGerD/lWSktsVOgHk6axvd2Wq6BM5LCYLDfbqhR+
         nq0YIdl6YSyi2ogxGq01Iws9m+Mq41Hfcri4Rkyn5lPr37IZF9stOLJspmIyEMVuVF+G
         6drxm33IqySnFlb6+YJxgdjzrtixsuzJoBAxh7iTfypQevMqg2mgdPYns+4YodBSc4pT
         8n8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKcDWD3ZLYGwd4tCQoZtzQr9pcfOwz4Sw2m11EFm2/QTtvRGtJHPqXHg8Z7XueZQYFtny1xMhChlxhqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYk/DHd7E9WJlxz4qhDDvkZU5c9S8gQ7L7mrvIgCfmG98laDa9
	llt2FCBvl3O2H9kmpXj4AqPJg1KL9JfLmn7Dc6dJmY/n8Y2W553yRAGi9KpdN2AhElvGfcvIOXT
	xKB44h6WPONckpXtOlXj6GWP69SL/0HPK5Mz7ryY=
X-Gm-Gg: ASbGncu34Z2BV+L0buKe1e1v+DiFjgNXGtW3W4KmFBsxhaEhisy7IGx7xXe28KOtCOs
	yc7T617ee7m3M6L2LN2FIdjjpMZbyaCx/FU9NCpDgKuQeqyXMDHQS+LRqFFUZFNr2b9/R65bM4s
	JSc3ImWOKO+kgTeKjp/s9bP1hifJtPwDWkzokXVILhDJQ=
X-Google-Smtp-Source: AGHT+IFR9MYy0L1ZbZNpuFp61c2DKq9h6iQ5Uz85v/zMhftaQ4bm/yaISffKHbEncWu4s0TGMZbmRmzmaOswK1wDkro=
X-Received: by 2002:a05:6512:3b0e:b0:553:65bc:4231 with SMTP id
 2adb3069b0e04-5550b81ddc3mr4156151e87.21.1751312362385; Mon, 30 Jun 2025
 12:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>
 <73cbbuahttztsfkz36ndl7mla5dswo4wjqvzvuuajfuuxdo3gn@eiq3q2jniajw>
In-Reply-To: <73cbbuahttztsfkz36ndl7mla5dswo4wjqvzvuuajfuuxdo3gn@eiq3q2jniajw>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:39:11 -0500
X-Gm-Features: Ac12FXy2Gp8UHr5Eao_IIFxX_4IyaspA_g0AcGKWdek0dO_6VP7GhK8wVKFwKKU
Message-ID: <CALHNRZ_Tf=EPpPCpc60SF=um1oZ7gDnWdBxCfD=GrXUo6sOwOg@mail.gmail.com>
Subject: Re: [BUG] cpufreq: tegra186: Denver cores do not register
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:20=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Sun, Jun 08, 2025 at 10:09:01PM -0500, Aaron Kling wrote:
> > The boot logs when using the L4T r32.7.6 boot stack without u-boot show=
:
> >
> > [    2.648162] cpufreq: cpufreq_policy_online: ->get() failed
> >
> > I have traced this down to ndiv [0] being read as 0 for cpus 1 and 2.
> > Prior to "Share policy per cluster" [1], this would also fail for cpu
> > 3, one of the a57 cores; but with the policy for 3 being shared with
> > 0, the driver no longer tries to read its registers directly. This
> > issue has existed since at least 6.1, which is the earliest I've tried
> > to use Tegra186 on a mainline kernel.
> >
> > I've tried to compare this driver to the downstream 4.9 version, which
> > does work as expected, but I do not see any differences to the
> > register offsets being read. If I hardcode ndiv to 35 for the failing
> > cpus to match what the downstream driver gets and what the other cpus
> > get with this driver, scaling appears to work properly. But that's not
> > a proper fix. Does anyone know why the registers for cpus 1-3 aren't
> > read properly while 0,4-5 are?
> >
> > Sincerely,
> > Aaron Kling
> >
> > [0] https://github.com/torvalds/linux/blob/19272b37aa4f83ca52bdf9c16d5d=
81bdd1354494/drivers/cpufreq/tegra186-cpufreq.c#L117
> > [1] https://github.com/torvalds/linux/commit/be4ae8c19492cd6d5de61ccb34=
ffb3f5ede5eec8
>
> Adding Sumit who usually knows this kind of thing.
>
> Thierry

Friendly reminder about this question.

Aaron
