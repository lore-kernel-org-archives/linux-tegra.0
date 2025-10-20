Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A21C695
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988691; cv=none; b=bGPaEEiP+cXQ2riL4r1vEc6klBBWDzWg9A4tPtHW1NpYrIOlj0FmL7Bqbo1UJQtdF3aBe9jUBIqx2RMqWxQwXrVkEOdEfvILD2pA5woQbm7kIl2u9BPHN+Sn06rskSH3+PWQkXUZSXOE0Ptuxzu/HP3bsmJUj4g8m3bsoYKSpqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988691; c=relaxed/simple;
	bh=aTcaRUS1UlBkq+JExmVgQCLsZRPKUNCnlYRfvsA4aNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcmC8o7DkfB163Fa1/4D1mSp666Vs5yjgsj7G69ksNYk50+NW1TDuoqT/UYtBXrJW7BJyOegggI4XcU6YNl+uEs+xcurDXwha89wHpSZSpswl3nXGrvmEfPfMcuDWjz8yU7kWenO++0hY5ZvSuskBPkPRF52ueFKc6bV+AgoQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5f2gyqc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5f2gyqc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-58affa66f2bso5611891e87.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760988687; x=1761593487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Mdwdpp2f/axMvp/dEbL/3UQlTUav37QZe40IGTcygk=;
        b=W5f2gyqch3zNrZZK4hCIFifX5ZNHksmIb3tThS6TYOvAjj5baykWb+bkc48kS4Ro0V
         g6s7i/chiwTn66nw1Vb9roDwMVKpNp7sblClPoAarHIu0hVZ5F398abQw+9OZG9b4d/G
         XcJI064dyQYflDo91Kx5DmgDz1Og2PEDUrThzMDIEHFDrcy00unfrf/mCAqusUsovvZm
         qVr/Rt/+x3n3rcNwYv4F0taaytXi4Zc5oNE1j+nA5tEpFpj7RqE7I3ww7aVteJWi86MZ
         7mPKsHe9O6FSHoYVnJWv0im5uvkZErHQJ4moCFjv4jOXTmv0zVLnlJRlfW1OuZYQZNMh
         AJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988687; x=1761593487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Mdwdpp2f/axMvp/dEbL/3UQlTUav37QZe40IGTcygk=;
        b=mVKSnKIZSBjHZ8zGcXBid2kUN3m7oqg5c0t6AiYBV+rH5bqiNDl+YhhPrVr/b/2ZhD
         PL6JiNhG4sgAaOURDwt7qsEDjkILwl+Kf8FG+wzhf+MPWVpX1FWlX8Mc3KnUIaG3vsCW
         H/LKf4NtdbJeOIfYxb5XJ4zUfluSi62MRbqYKqhrbMIruGKLrYDahnlL0nhVf6RNBw6+
         bpDSH7kgF22isGUrwCxqOPcJ1hrEuTz/WgO/9Ogg9UXDhPlhIDgQYIy4az6DLDhbi8kU
         agIkO1QsaSJIJD7nEYr6uB3UcYgOm+Il732Q3EYzyRQxLVs7zWV8Kn3kz0AifU1IXzdU
         B3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXwbKz/IQVxta2EyFVzHIeOdReRorRFTE+ZuUbNQxgtML+HnUI4y7znB1E9PvjS66Ukdpr3UwSi5j4HXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJq3w0BnasFWihEgwwTQfYFU9YwMxAdOp1w0Iy4ED/OnzNgNo
	xwddUeXmFIQNTxtUN2dlnksEjnn9tlhTikKlxsJgzI/QpHSohw7iHGBr8ZHaGK2UoIBMkliXVUR
	po7IPzirnm0n0qx0omdHwQC+50esgh68=
X-Gm-Gg: ASbGncvnZtwUvsO0CpItZ6qJ4NFCY1TkyqRdDRX522xYdL7hGhnp4dj2rwwOD0EV11Z
	4rCwk9Cv+bZRCFzP+7VQE0l7YPhXbcr8wof3fXTx/cHdDnbnCaSo3wD9MZC3ZfEtCuCDfL7hyPx
	GZJhRoDvWN6d/1zBNwFZON8/1z5Mm3WIXxm3/78/c8bvltXzzjxGBVgRHUaFPgbbrdmulLrJQ2O
	PKiodX713UUPtmP7sk+i05BmWwakCh46MKi7yavacT5W6jUvo+WaScg8zvWZQw6gnpmiVXusLiY
	SLm2HomlM1DCLi8EK43FuCZuBjap
X-Google-Smtp-Source: AGHT+IHdGwIKt6MJuzuxrsoOY50td8plGo6SoVslGHkoluMxGkCxNGFJX1kD08wOSpAr0cRn/WoTptP7RBokhdk2X8Y=
X-Received: by 2002:a05:6512:33c3:b0:57f:7baa:b9bf with SMTP id
 2adb3069b0e04-591d8533c8emr3937465e87.23.1760988687245; Mon, 20 Oct 2025
 12:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com> <CALHNRZ9tjJo3LRmpaGsEsf2=Him0O2J-ZaJf4UZ8bcbz1119BQ@mail.gmail.com>
 <CALHNRZ-mUb1Yv6WTeq50ddBS209uWUkv2ivdEMqfBBUtw+SU2Q@mail.gmail.com> <CALHNRZ9H=kPLAJ-YZN8n307uAMbGYOHF55-Tc5=uN_y46USYBg@mail.gmail.com>
In-Reply-To: <CALHNRZ9H=kPLAJ-YZN8n307uAMbGYOHF55-Tc5=uN_y46USYBg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:31:15 -0500
X-Gm-Features: AS18NWCP4zTcV1mtQIKq9eumpUifV2HKRJ8W3men4P7dGM-jZ393xwdpaub5vUE
Message-ID: <CALHNRZ_QFsqhtR4ME9TcDUc8oLqjv0uSdrzv5HdA_0wzTta_Ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 4:41=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, Jul 14, 2025 at 12:36=E2=80=AFAM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Wed, Jun 11, 2025 at 1:53=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - Fix usb power supply to align with downstream power tree
> > > > - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to a=
void
> > > >   conflicts
> > > > - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7=
e4310@gmail.com
> > > >
> > > > ---
> > > > Aaron Kling (2):
> > > >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> > > >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit suppor=
t
> > > >
> > > >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
> > > >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> > > >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++=
++++++++++++
> > > >  3 files changed, 66 insertions(+)
> > > > ---
> > > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > > change-id: 20250513-p3452-059708ca9993
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Friendly reminder about this series.
> >
> > Re-reminder about this series.
>
> Yet another reminder about this series.

Another reminder to review or pick up this series.

Aaron
