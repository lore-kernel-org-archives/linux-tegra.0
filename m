Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4E13E3F8
	for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713947485; cv=none; b=lKCW9n8DgbERyVk8UUxxABt/fZo5exgjahPZM1TZcdcWrdt0a3OonUrKotsabEcfaaqRAiMG61x88pZF7WeH7qRByXSZaEQ5du6QDVfQU+SkWclacAu+sk55kkruukH4TfeuOCkPJ3gPcgrc9hKe0msO2Iue8EBWMKYj/UhA7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713947485; c=relaxed/simple;
	bh=IjjbvorUSg6P4VFZn7dSqLjzf30JrNYIj5heKyHMN6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/5RzTH2mOizia+0/C+Xh5fcn2Sz3bIVEj+KgIEftIYfD111sGiW69uLiDpf7JhqU1c0HPJvxjSFK094jeMoLtg6OMPTYO2eElhFLTh3PyC8GN8qh0BhJ19X8r8UQl5rr+6vY8nAAn+8RTJn3rv2UAFe0gCmOFBR7zt6yMCmTPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w+Id9W/P; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w+Id9W/P"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so8543640e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 01:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713947482; x=1714552282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJGoWBDSb5fGAuDy7m4mg3bWQD/UzHjf/v/1vmc9dmM=;
        b=w+Id9W/PgBlMXw4lM5uq+21DzoXXQW08FZFhJP9jHxL88u2/Ab1eAMg/6OHzzEx70/
         x77k/1eX6MBEw+D7mZN/Q2JCYxkOs1QeC2uWiuZ68mFaZS7qoOU1LdxEAHlSTzQzzJ+M
         fPg0ObSmd2fgkIUj7zHryuQenW78nnCUyrS4ZCB3R3XT6BICbxPkhAiRtX+jPeJemIu9
         s2B/CfZMtrxdjQxJKsboz4XDpJkSCqXmeatxkM67ok8vDWqX+3yR+8McSjcemUocHi1v
         3YkNmcm/NFEzPzwV5aLEaObkNz15z6v1hZN6iVSoCusgtaEFZXMVwqv3J4jz1JCz5wy+
         622w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947482; x=1714552282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJGoWBDSb5fGAuDy7m4mg3bWQD/UzHjf/v/1vmc9dmM=;
        b=NKM5SlfOkGtHhIWQbf7p4GdfQzvPphd+JdbrGRlAVxJYcYc8uh6sCxMnXg1TtamQS7
         g2dj1DFEObaNOnjGlll4YdoOKqGuB22dcCZ3rEiGlnL4O6xE6Gpg9n+0H1wMTuxsT65w
         wOp/XUwUGvOitk/IH/wcgn9Dut4BOl6/0m0AiScP5hZEx2me8rNkFgHnFfHWLAwEQo06
         pxyQs9Z8idnC1B048DSuW3oeFpAzeKBvArgspcavhfGKJwB5ZTsa9+lLgjqWufXyZ8gT
         aCyi9e9vgWkkqjpWyjHjf4psSOJkPGd1Fbk7kqQB7ouxE975UnFl4LzduUXFiutvZlHO
         5+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbZ59Mu+uaa4VBnw+aJQ29Gow0fKVbLHYOTRj9Tod5B+1Dkw9yiexr6OHFcIolTH45GWBOcC58B5JmH/nxWF6k77ymOWjcPdOV40w=
X-Gm-Message-State: AOJu0Yx35+xuUu8m6dH6gJ+ZjvD4pIsFP4ideJDTkVlD+K+8TslySFuS
	GmORTK86Eip+zCiVfXwsozdx20oHARkis3yHFMbEJCt5gbnaP0y4zqdx3LC2rIgvTD4ANM8nFUn
	ixkECKa3kgVt2tFzEUJ/AjW6t5/WZBVzpprfoOg==
X-Google-Smtp-Source: AGHT+IHeUW2RFaYOi3EycgzRf3cpJgpILPKKGH3hJf5GGNnk7Y0P6bC+UwOLzxXOL/FIEabzxw0/mhkkL0RbdpCF7HA=
X-Received: by 2002:ac2:5492:0:b0:516:cd83:71ce with SMTP id
 t18-20020ac25492000000b00516cd8371cemr1176615lfk.31.1713947481572; Wed, 24
 Apr 2024 01:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACMJSeu+fUdYoxue-q=DxFdvtopgshQY+i2kpZMP-RGOTqMu_g@mail.gmail.com>
 <20240423120011.21554-1-pshete@nvidia.com>
In-Reply-To: <20240423120011.21554-1-pshete@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Apr 2024 10:31:10 +0200
Message-ID: <CAMRc=MfJokORpEOMkOmQdzTuZxcUAcnmpdEyJWKqvT0gCpuzbg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Fix tegra186_gpio_is_accessible() check
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org, jonathanh@nvidia.com, treding@nvidia.com, 
	sfr@canb.auug.org.au, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mochs@nvidia.com, csoto@nvidia.com, 
	jamien@nvidia.com, smangipudi@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 2:00=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:
>
> The controller has several register bits describing access control
> information for a given GPIO pin. When SCR_SEC_[R|W]EN is unset, it
> means we have full read/write access to all the registers for given GPIO
> pin. When SCR_SEC[R|W]EN is set, it means we need to further check the
> accompanying SCR_SEC_G1[R|W] bit to determine read/write access to all
> the registers for given GPIO pin.
>
> This check was previously declaring that a GPIO pin was accessible
> only if either of the following conditions were met:
>
>   - SCR_SEC_REN + SCR_SEC_WEN both set
>
>     or
>
>   - SCR_SEC_REN + SCR_SEC_WEN both set and
>     SCR_SEC_G1R + SCR_SEC_G1W both set
>
> Update the check to properly handle cases where only one of
> SCR_SEC_REN or SCR_SEC_WEN is set.
>
> Fixes: b2b56a163230 ("gpio: tegra186: Check GPIO pin permission before ac=
cess.")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---

No changelog since v1. No Thierry's tag. Please resend.

Bart
