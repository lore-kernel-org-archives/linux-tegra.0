Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA57262FDE;
	Thu, 31 Jul 2025 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997884; cv=none; b=j16228zU4IieiIu4EZdFh+OKoZnGl47GYM+8JkSigXD/kBxRIuzvAS607x7q1Z64u1PiViJowIiNKH7utQg0G4Hua21HS/FrER8AUmLySxQCovCWo3jCWzFLOC+xw4DnJ47MlWJxrlO+pBJFlOO0yoyWo+k+2whlhiye9GpaFCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997884; c=relaxed/simple;
	bh=fxQhyH81gMDusUgkzNvGxXbmdOqw1108QIrqJNCo7tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0ooG6Lec6X7q3zRQoOZki5SnD42AJErnE9+UbqnTt7u9ZPiwVP7eUSHdosm0KKXlbPY62KnJH2rEVJomtpo34UHbTr6nFUSlq0CuE2LrGzrXIA14zd4swjkJKX1VJdNYP9qAtVyMwl1Y1sjpfQpvMmddG7AwZz+HIN37ZybyyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+dUY7r/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+dUY7r/"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-33216091f46so1873261fa.3;
        Thu, 31 Jul 2025 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997881; x=1754602681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxQhyH81gMDusUgkzNvGxXbmdOqw1108QIrqJNCo7tc=;
        b=F+dUY7r/B6FWiiPJpdmymqStWIvTARsc0s07aU7XZZwzzAJvG5U02Mb8G8ngtzdTKj
         sNxwbqhONvixKcqwBCYpcO/q8teEgtV14NYQt9DtQG3pQn58LCJJJscyFUdNHk51XN5E
         V/n9sYCdGhuYH2VblCze2baZHKO2hJ7bwDnP6UPWtZGZ/w5agQKUtV4HD2wRMCARX15u
         PkvT2OGdFVqd9TeFOFDDDfZTJt+gaVubKpm6N6TUAuRwlU7NKg7jm81ZuAnZD4pQf3FK
         mVynRb3WJywUAfaTCGCV9NcD500sltIrviTPI53YTlQVz7VMwJMYIUg0ADrrmsC2ujpJ
         6WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997881; x=1754602681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxQhyH81gMDusUgkzNvGxXbmdOqw1108QIrqJNCo7tc=;
        b=RSOS4Lz1o6ommVe58Du06NvFHLmBuW4L4hmUrQpMQK8XQT+rAih5QrzlZUzEKMTdt/
         G0weZnitEWiUSZZEwc52dAmPl9g0Po/dYU/Sz/6jKaQ1y/HxB5+Xto8l2/R86/P70CWg
         uxjjVlctYpq6TOLkrblc0lIYMHlHwMdAbOcquVjwK+rw78qFC/SLr6ekcvsR9fUpEr5Z
         jKcbs1AlHkTHDkAmvTj4LL7qcU9mEFB8wkHsHWkm6NXXNtcliWkTnSU5sa34C0218ZIz
         G0QUJfKIKhh2oyKDFX5oYDcGLX0Wj8wT/ajTD/5ohLKyvyGR8SZiI25zw0uQCCZPznKS
         9FhA==
X-Forwarded-Encrypted: i=1; AJvYcCUE9peoNYG0ChHZigmTyhd+87d0/FYr5pFEio5k9oNcgmRicAKwrVPCC1lkgr44CWq9M4QOwWPDSgGkCwA=@vger.kernel.org, AJvYcCUPszLxvcqs6zVSL5bPvx+T5+KWW3la0Ynxz0gFdoa3ypTASH3CcNgLv6YKW/9LOeim25gm+0IWWf/T@vger.kernel.org, AJvYcCWJ52QQQI371pCn6lPzU4OHmCTJYfsgPnB6IAoyCqgqnzvm284GjzsHHxk/kohk+jooGPFBzoz3BpX9pHhH@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUX/9iKQl1UzcwVP/AEkaeb8J2HFj9Nn+RX+oe7jdK5jIx0Y6
	kTd8uVOB7wWXBf8+CxqOb3MuqLNDRwaYhxDZCfNcDtaJ991rBaRhLOIncJZNXa+F9+VU6nd8EX3
	gxCkq3ynSftxfyGvpJv48X+08cze4yz/9s0p3/E0=
X-Gm-Gg: ASbGncsd6REK/RQOVvtPtsJqALSUypIXuvGDFLRjAXe6Gn1roVPZWii3Bpr7ObPyWMy
	uQLWuWd1FYIDdHyueSruyZkCESl6/v2LmFkh5+/GFikonFV7QVS4woVHB1tCgqEAivTI2sQhvs3
	oAOkH0jIoxfw+cPhD1Id0VJEFDvsAgenfWS65v7oOYmQhzJyfnXCZWmjHjXc/Ml2J4wcwejY8ql
	6d3rCs=
X-Google-Smtp-Source: AGHT+IEJCT2qxDgw3SpRtOydXhP4DiKpGRWhxMHsHHLZ9RzOEqJLVTyJVvXMGxwl/u4CxLBc6c8dDaMh/+lNPWCy5wY=
X-Received: by 2002:a2e:a593:0:b0:32a:6aa0:2173 with SMTP id
 38308e7fff4ca-33224bbead1mr30607341fa.20.1753997880741; Thu, 31 Jul 2025
 14:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
 <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
 <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com>
 <CALHNRZ_T_-FDOhLsjr7Vm3V0ekKkLCtv+Lt0x07133Cq+62cfQ@mail.gmail.com> <CALHNRZ-133F5-AdqLdnyXac3tFRir2+zamUXaSamUiw14aWwVQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-133F5-AdqLdnyXac3tFRir2+zamUXaSamUiw14aWwVQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:37:46 -0500
X-Gm-Features: Ac12FXxrizWOPdtFFaCCT26YQOnvoCLA-GZ1xPWytkCST3pYZOBHPx2vG4KdIP4
Message-ID: <CALHNRZ_6Kf3wGkSY7_Sb9UpFX0qnrPEvKcvMxdRk2dNjj=gxPw@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:39=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Thu, Jul 3, 2025 at 11:40=E2=80=AFAM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Thu, Jul 3, 2025 at 11:24=E2=80=AFAM Nicolas Chauvet <kwizart@gmail.=
com> wrote:
> > >
> > > Le jeu. 3 juil. 2025 =C3=A0 13:00, Thierry Reding
> > > <thierry.reding@gmail.com> a =C3=A9crit :
> > > >
> > > > On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> > > > > On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > >
> > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > >
> > > > > > The Tegra210 L4T bootloader ram training will corrupt the in-ra=
m kernel
> > > > > > dt if no reserved-memory node exists. This prevents said bootlo=
ader from
> > > > > > being able to boot a kernel without this node, unless a chainlo=
aded
> > > > > > bootloader loads the dt. Add the node to eliminate the requirem=
ent for
> > > > > > extra boot stages.
> > >
> > > Is there any particular reason why this applies on jetson-nano but no=
t
> > > jetson-tx1 (or any other l4t based boards ?)
> >
> > I answered that in my first reply to this patch. This does also apply
> > to p2371-2180, aka the Jetson TX1 devkit, but I don't need it for my
> > use case because it is supported by the android bootloader. To my
> > knowledge, there are not any other supported t210 devices that use the
> > l4t bootloader. And this is not a problem on other archs. If there's a
> > desire, I can replicate this to p2371-2180 and send a v2 without the
> > rfc tag. Probably better to do so for consistency anyways.
> >
> > > I wonder if it would be enough to boot an upstream kernel with the l4=
t
> > > bootloader (and no chainloaded upstream u-boot) as I cannot do the
> > > other way for some reason (using fedora based upstream u-boot cannot
> > > boot downstream l4t kernel anymore)
> >
> > Mmm, I'm not sure. I can boot a mainline kernel on the l4t bootloader
> > without u-boot after this patch. But my use case is android. I've also
> > booted a simple busybox initramfs to do non-android verification of
> > changes. But I've not booted a full Linux distro.
>
> Reminder about this series since it wasn't picked up in the recent
> staging for 6.17-rc1. Should I mirror the change to p2371-2180 in a
> new patchset or should this get picked up as is?

Reminder about this question.

Aaron
