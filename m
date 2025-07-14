Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A81194A60
	for <linux-tegra@vger.kernel.org>; Mon, 14 Jul 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752474110; cv=none; b=adg+goQvsRnXYd+HNWbWOczKAbcLVrXNreDAzwAJmXVC3zbQ2p0ZKKeMbgs6MqCZ6mtEMeuJ3jxlyt+r3MV9onogGhpJiGZYHo/OobjRZc72ZyjFl2fh+b5oX/xihANQOP7QVNnsDxuw627BmOVppGmTwq0S2csey/t4w8D/7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752474110; c=relaxed/simple;
	bh=/iHl+rhXPlidkDSTTehzr5QIvE4hvjYKuG0VZN/dHAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbihOsESTfa3Pkc75bVhobJMzKIsKoOdTvAnbGSM6yFgJ0zRJ37gCvJ/N7KLLhD/qIzzBrplusfw0K/xmbBdO/CVF3m0AO1+IeyteKgMH8T+Vkf7ZLPOZvuyk+RxJ1hLUNic2lcku95/h50366VVDBsTvWi+m3oDY+GJ+huXCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwPZVDGk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwPZVDGk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342fso3522655e87.0
        for <linux-tegra@vger.kernel.org>; Sun, 13 Jul 2025 23:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752474107; x=1753078907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMcDFrszB7BFuQatwGIR7E8jzDiCC9l7KQJ0Bboywxk=;
        b=QwPZVDGkOsmixMndKgAB7NOgCKjWnW14AaXtRfIOQjheUnbrIpcKEmCj+BrHxaBZw+
         0ZuCB467EJuWIK53L6tGc6P67G23UXlibA7rzEbOI+5QT2ML4qywbDPUKM7QYTIMMUC1
         TH0RTewx2EJEwqwPMHWJs8vSs8dCqcMbHRK7zQYiDALXi0EB1tQcmVOUfAgnT6s4ho3j
         9vsSZ8qcRmlzPz4nNoaxwFCcwRk422MJe+oVemmWvdx2EkfvxoPZ9T9rsCRrjKqKsuDe
         TTll3CUlTD8bvyI7YJ0ZQ5RhAf+e3SgevOcDe1k43OpjeIJcscba38aGL6oOvkkMjps9
         hDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474107; x=1753078907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMcDFrszB7BFuQatwGIR7E8jzDiCC9l7KQJ0Bboywxk=;
        b=ROTXyC5SKbfLF3DStPrpUqc0cnElF6+4BEsB/mpVJY1geven3rIpYj+za6cLiBb6Jq
         qwstgBIkiO5B3C24oIuA0OVcc4dlguLV+XoCZ5DBt9+ozpDjUPlc3leuSJzA/qYdwk9G
         7/VTGv29n7VNfXn+BmWLGhIVwz2EatgXUbO3+HV5FIULaWCapRxaL7P9xTlMFwksmLCx
         YxhdZynY3gTT1jVyvu0HkiwtxY316uqioCi/C4PKl00qMP9HOhjRs1/qamy5dYT2+Kf9
         LVqXMNW1F6XQ9SgcanIYUyZyhpLMbP4U/gFHyjJQMWKkRxQt5h2BYPrsCfa/boRU36J7
         1cTA==
X-Forwarded-Encrypted: i=1; AJvYcCXMvN0ihEqhQI8GsUGwJTa5NyRR6dcFkzO+W5tS6nITCa/KuUTDybRI/EhF+NqZUxEamSqDubgkcIchSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRKA32szi6P0vd+WSpjweK6gbzO4I6hzZfHv7XI1ukNDvvRo2
	2ajfPc25sjzHaKlVfuVhn4UOQsy3KgHLIuFhOc+XIywloVrG/3ilbjadmSdIXHybpzd6uzknz7n
	h/YZZg6eBUcaGMHcUfXyt4TBnRCn0/O8=
X-Gm-Gg: ASbGnctdiSZfypME1SAcP7FQyuAVRd9D8dwOEV6UMOQ9zsjuUCI9gFWoKvD70oGkYNQ
	Grus+RE5X3xfO/rFVK/80f2ScDgcDRHnxJsg7QoDFtjzKEpyxpHXY16w5inRjqdrlnhrUlfIz/v
	9K4aG3BuymF/lIX9dvu5lbHuBtVSk4xNwwNBZpMmGVCxJd4ocXvyl+N8qhQqiG2LFibDNNulkCV
	Xjh6ro=
X-Google-Smtp-Source: AGHT+IFWVz8WAEdY4MFLH6mIRktnZV2UUEvj2vW5u3GVRS/LRLOe4YVWhz2OUGtIppThjVjmKfTMUPvfSa1uTIrvDm8=
X-Received: by 2002:ac2:4e04:0:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-55a04647c67mr3428833e87.50.1752474106887; Sun, 13 Jul 2025
 23:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ98_gh5dKw_GoayG4ieU3TWYAFFt29=495g4+dNLzwjbg@mail.gmail.com>
 <73cbbuahttztsfkz36ndl7mla5dswo4wjqvzvuuajfuuxdo3gn@eiq3q2jniajw> <CALHNRZ_Tf=EPpPCpc60SF=um1oZ7gDnWdBxCfD=GrXUo6sOwOg@mail.gmail.com>
In-Reply-To: <CALHNRZ_Tf=EPpPCpc60SF=um1oZ7gDnWdBxCfD=GrXUo6sOwOg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 01:21:35 -0500
X-Gm-Features: Ac12FXxHhU535sSxGMqj8HLKTWwZ2N5D52tbVB_NOD4AK-HpBsFTa3Sx8NU5Oic
Message-ID: <CALHNRZ9FE-WppDo02u3SkYjUkgtEpxj=H1V2pT_Stmtze3THpw@mail.gmail.com>
Subject: Re: [BUG] cpufreq: tegra186: Denver cores do not register
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:39=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Tue, Jun 10, 2025 at 4:20=E2=80=AFAM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > On Sun, Jun 08, 2025 at 10:09:01PM -0500, Aaron Kling wrote:
> > > The boot logs when using the L4T r32.7.6 boot stack without u-boot sh=
ow:
> > >
> > > [    2.648162] cpufreq: cpufreq_policy_online: ->get() failed
> > >
> > > I have traced this down to ndiv [0] being read as 0 for cpus 1 and 2.
> > > Prior to "Share policy per cluster" [1], this would also fail for cpu
> > > 3, one of the a57 cores; but with the policy for 3 being shared with
> > > 0, the driver no longer tries to read its registers directly. This
> > > issue has existed since at least 6.1, which is the earliest I've trie=
d
> > > to use Tegra186 on a mainline kernel.
> > >
> > > I've tried to compare this driver to the downstream 4.9 version, whic=
h
> > > does work as expected, but I do not see any differences to the
> > > register offsets being read. If I hardcode ndiv to 35 for the failing
> > > cpus to match what the downstream driver gets and what the other cpus
> > > get with this driver, scaling appears to work properly. But that's no=
t
> > > a proper fix. Does anyone know why the registers for cpus 1-3 aren't
> > > read properly while 0,4-5 are?
> > >
> > > Sincerely,
> > > Aaron Kling
> > >
> > > [0] https://github.com/torvalds/linux/blob/19272b37aa4f83ca52bdf9c16d=
5d81bdd1354494/drivers/cpufreq/tegra186-cpufreq.c#L117
> > > [1] https://github.com/torvalds/linux/commit/be4ae8c19492cd6d5de61ccb=
34ffb3f5ede5eec8
> >
> > Adding Sumit who usually knows this kind of thing.
> >
> > Thierry
>
> Friendly reminder about this question.

Re-reminder about this question. Even a 'I don't know' and 'works on
the regression bench' would be useful. Though I would have followup
questions if this issue doesn't happen on the benches.

Aaron
