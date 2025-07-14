Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6241FECB0;
	Mon, 14 Jul 2025 05:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471595; cv=none; b=HBKrtHnK7vG5z9fBtkJwnRbW8smD7zaG5kIcGYRIdEpqJd45ywvldDaRrgqREznldfFt4G9Vsv0HzC5tTRQm9SoC/nco1yfmFU6/3HxSSUdfbgMqXBPeK0xcELh3AuC0FQ9vc2KzCroOiquIG+gQa8bPnr+OeRFNksva/mJriXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471595; c=relaxed/simple;
	bh=DoxbNNAtVhUXmSD/g3K6LEoRjeLgUEemoDSZQrIbwL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNhUAUVA68Zvrjv2ZFY21bV4dmQRXR0v0PsqVc99dswDDoPI06JsNm5VonoX7+Uj9MYBWDr1Lkz3/zV+nca3l0qiTd4Tu5RvMPY4AJnF6iA+hb4UiMUn+wGc/oHUhccu+nAosapEpagCbiXTgPk4hAh/PMOa8Il7f93k0vrO8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+nylDFY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+nylDFY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4422451e87.0;
        Sun, 13 Jul 2025 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471592; x=1753076392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoxbNNAtVhUXmSD/g3K6LEoRjeLgUEemoDSZQrIbwL8=;
        b=J+nylDFYcpJFxh5wXAeuxKPrtf6pdJdFhZpH4Hpl0juHNw1TS3Mjv06g0eaKbIkPe9
         zXpf+SXviAjXxDo303im8m92VD1nlq5h32svSo5FMzG3v1E1k9TsPUxvCbSHw4j/63kt
         +6d5fR2FCzV2icAgSVfJ4It5/wGcDvqn/w/C+qq3Mt7riWV3llVvipjVK2cwngi1QjXr
         +G8AELoxgSGKb7EjJ8CraOibM3eEqq0Rgicx0ak4PqrWou+e8ISfYXsohl3cZuis11xP
         7TsIv605xu8mjNyB7vwhtGB5n2CpNTutGr+4n4/MEHWZbHdhXlLk27PafmZM3G/fFVxH
         YmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471592; x=1753076392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoxbNNAtVhUXmSD/g3K6LEoRjeLgUEemoDSZQrIbwL8=;
        b=MZPs+2UO6UEJd/Y5woSAZ9r6jF+zIvygHGEyj4MnhSnF342j6jeTpYD+z08pzkX2t0
         6Qhnrem9ATFL95iyCrIAq7DPa9LxQp46/7/FVO5UcD9vlnTaZkTTQEAmxRzAMwtj8FFa
         C03Fzb91mA5A5D/jQBsv1tTrilZsVd8b6RD+/mweNnmzoxIVo6K3p1MXP0iPhWeTO0xl
         hE9v+E6ElqddB6xfhH1j9qodUrJtAD0SHm1Y8RFRj0R7+fvfysOvlmNAFj/V+usbxS58
         72YfhK5DR0JMS392VsaB4vWyAIgGD9plre5W+Fr7GLqqtCtFS1Y6WFlgh7VEqkdLWYjX
         /Rfw==
X-Forwarded-Encrypted: i=1; AJvYcCU38c3AmN6UUAuGQmgWsqU4BhH0EkmG8yFZjeHwkbuikN/oxqGJr8gqF9Nwj2rUshznEBHIEnmbIBZ8CSg=@vger.kernel.org, AJvYcCX+uCw68+fY+Hm43A7YB/YHaufROMzX2m1g+Ess1yzqSsp/B4dtNVISIIdvn1tA9MskOak1PK8j4d4hmeRg@vger.kernel.org, AJvYcCXAJAIUh4vKBzwAlUsqj5AO88HISBBaScTeEp6utLPGj76J5MrsOud1GxdSIMbhzpXNiV668hKN9DJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpqtBOL430iADmQFDFpSqhmDIOrs9uk/sSN6ShPna3Wkwcnqy
	7Qp3kokBvaIcXJOHHRQwgoFlPYKvyhe16IBh8dzhZyxqUOCEOY5W3/s2/4z7gutwNGKW3WFRw6C
	/8evNfpc4BhNjzAVxOdDSjxjtvPkhcBs/LXyI6WU=
X-Gm-Gg: ASbGncuIep6oLLJp3WBm2a6wL2xgUf68iYRfQG3B5aUPscvnaDNm3hhwCaSXErfnPjt
	sHTFAtBxfofuumin4RyPF0URsItub5iAKqmznlvGk7aU7duWL4tk7OmoACMyZ4jCOZNxmeZda0h
	AYwbcRk2r9bWpWqu+OuNMDshShFSoiNx5qNJ1VLTu5PtqcN8SqOQuCbHpaozjhtIVK9D3gVexNi
	4qJz6U=
X-Google-Smtp-Source: AGHT+IHIJdfJc7xmYH20VYX1k1wNu51osjHn5Sfw1OQmg00Ng27EMY+ZhoorAhXoTjg486xZK3O0H2KvH8U5lk4jNHQ=
X-Received: by 2002:a05:6512:687:b0:553:cfa8:dd25 with SMTP id
 2adb3069b0e04-55a044af230mr2966763e87.3.1752471591657; Sun, 13 Jul 2025
 22:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
 <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
 <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com> <CALHNRZ_T_-FDOhLsjr7Vm3V0ekKkLCtv+Lt0x07133Cq+62cfQ@mail.gmail.com>
In-Reply-To: <CALHNRZ_T_-FDOhLsjr7Vm3V0ekKkLCtv+Lt0x07133Cq+62cfQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 00:39:40 -0500
X-Gm-Features: Ac12FXxPyKTY0gJ66WAu5BlL_h1AbTiQ-CAXxbqBxQv03khTJ-8m9x4ehjXwSXs
Message-ID: <CALHNRZ-133F5-AdqLdnyXac3tFRir2+zamUXaSamUiw14aWwVQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:40=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Jul 3, 2025 at 11:24=E2=80=AFAM Nicolas Chauvet <kwizart@gmail.co=
m> wrote:
> >
> > Le jeu. 3 juil. 2025 =C3=A0 13:00, Thierry Reding
> > <thierry.reding@gmail.com> a =C3=A9crit :
> > >
> > > On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> > > > On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > > The Tegra210 L4T bootloader ram training will corrupt the in-ram =
kernel
> > > > > dt if no reserved-memory node exists. This prevents said bootload=
er from
> > > > > being able to boot a kernel without this node, unless a chainload=
ed
> > > > > bootloader loads the dt. Add the node to eliminate the requiremen=
t for
> > > > > extra boot stages.
> >
> > Is there any particular reason why this applies on jetson-nano but not
> > jetson-tx1 (or any other l4t based boards ?)
>
> I answered that in my first reply to this patch. This does also apply
> to p2371-2180, aka the Jetson TX1 devkit, but I don't need it for my
> use case because it is supported by the android bootloader. To my
> knowledge, there are not any other supported t210 devices that use the
> l4t bootloader. And this is not a problem on other archs. If there's a
> desire, I can replicate this to p2371-2180 and send a v2 without the
> rfc tag. Probably better to do so for consistency anyways.
>
> > I wonder if it would be enough to boot an upstream kernel with the l4t
> > bootloader (and no chainloaded upstream u-boot) as I cannot do the
> > other way for some reason (using fedora based upstream u-boot cannot
> > boot downstream l4t kernel anymore)
>
> Mmm, I'm not sure. I can boot a mainline kernel on the l4t bootloader
> without u-boot after this patch. But my use case is android. I've also
> booted a simple busybox initramfs to do non-android verification of
> changes. But I've not booted a full Linux distro.

Reminder about this series since it wasn't picked up in the recent
staging for 6.17-rc1. Should I mirror the change to p2371-2180 in a
new patchset or should this get picked up as is?

Aaron
