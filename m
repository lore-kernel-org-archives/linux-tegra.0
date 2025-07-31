Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEE525A2BF;
	Thu, 31 Jul 2025 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753998078; cv=none; b=TwFl3DIUSw6pSkuGhm3tJhxF0MIjnJyYvWNSCJ0Sjl/PyMcntIDzGTXp8c/BVggeHgfxQWE1x9CulPz3dcWDIgkcpHxni9h0xnjUoVqRpjIyOmhJcSD10fZs2SqZS+1XTpwxOupG8HxTyTzI1Upd7xOy4AE1VSIZCkLGcTgaYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753998078; c=relaxed/simple;
	bh=9mI4N8u3ScAJggIMZMmZ/Ya+KZ+m5teUXO1GFzmVIDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2m2At+Vea/pExX6XTxXKZFMc8GNzrccymZqERIu6OiPhZzNihTlrZdB84JZQQzTpmjO5fEQV+v4e8rY4wYstsNs23NeJGBZ1G/bb0fNmr2HrgOWTh0oNk+GAHVkcW6JQL5NImjxmMaz+IU47LH0vqjKqwUkiwFotUTw3GmBo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oo0sHqk5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oo0sHqk5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b8e6eb691so291615e87.1;
        Thu, 31 Jul 2025 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753998075; x=1754602875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gvf0Xa6p5M9PIWK0J0OeMh9XD7bPno2rlXopEdLIN/c=;
        b=Oo0sHqk5eI314WcMqRWQDNehjXn7SXAOlc1qBwo/3L4h5Wf3ZDEbdPVBs/YLq8U4O8
         cmrRN25PC0ZQG8qteIhug1dk9X6eXJ/nV+Cb6P8Shof3Xmc38bmnPlfbx/rafqxgYiiT
         Hv29+5b/s+nCxhs3ReZ9X8AapS8rTX6eD42SfE9uK/6noKBXaMzkx0bMFGBp/kQLYu6Q
         rSkwlsvp9GQcw0NGcd3cEHR3fRF3XMB/+qGnmmJRMA6s1UcACd6EHqPXEd8vRj6jwCD7
         mgmVtZqx7Q9e3y49PQJZCivBzYQE/+1+U9btKQ/r1LFHE6KZEz3iVlCzmgcSo0eQpOUm
         xCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753998075; x=1754602875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gvf0Xa6p5M9PIWK0J0OeMh9XD7bPno2rlXopEdLIN/c=;
        b=nAg2u0TTTi4mhop+WlGEM1J9a/6iKqsnWFkwEVSluhS+PROsRwwxbwuvIIfb3dFDAd
         KobD07Uh6j9HRYRnqXr0Ff0m434sHh9r2QR4xGjCX97a/INzw+AzYYGCgD9b1kwJHzYP
         h05zZ9PXDPbtAACghs2zuDkmg9NsFPz8h0Rg8XMutrhZGv0+cQkTXZtKt2ES6CkLT3QH
         0IY3N2BB8Phso38V+pVqdYZzGwAhKgLSeFkKk+pax/pSAFn2Z9OQasWa7x7CIp144kYZ
         Kxp0VFjLuQ3o8Mmk9AE4aBnNmSdTEs6UlCCPQ+Bz2/8aeh3W4dhV4V5QYs5nMxwqYLgN
         06AA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Kl/wwFJYFoL7Pm6x238UWLzjie//221v8c/048JTSOWExMttVNVCJbOZRf+4FcBgRomZ4yAkLI1e+pA=@vger.kernel.org, AJvYcCWajjgVVyt5G0iA9LyGNVGa01dObNwnTHH5jRbZ2IlJIi6Fi+VKJPZqnkPxi6UNBvHTXQqWEiBGhBE1mzB7@vger.kernel.org, AJvYcCXBbU6cCEDq9IlSNKOFlUzAl3avCQVGTUKzVaJZH3ASOVzEi0fMmb6JH8WhvnRGYOjuj9km1w1/ZRxN@vger.kernel.org
X-Gm-Message-State: AOJu0YzsI0YScMe2e81923hSLM1Q3pqqRArJz+9xseHh1P0pliwZXEr3
	7kQqcTMG15AF6A7k+wWVv7/Nmq6rlBeLHtf+dcfFN092JNOmgQrD9c+6oYGvf0kLkEeT9wJjhRg
	8iAjheswMgNy8xGSjNPdLE1YrA3P0oHM=
X-Gm-Gg: ASbGncuLQFW6Bt5tURvCa9l3lf/pffXhPQ1omyQhvt3ayuedovpnNr5DqJHpJsqRvZi
	zgA3I4PticgOSCFXbRHIg/zUIDFwOQ2b/xsvShoGbcM3t3g2J5OKdpnbozGCisY76MmWQArPT/G
	si1Uc+Lc4jZqlVoMk+IqitBX22IGpxAfHOl4HVeXaLNRtGZzGdO+UNUfkKBz2Fm0jYAwAVqaf+C
	Ikx6L0=
X-Google-Smtp-Source: AGHT+IEzhbXF5hB4kA6lGGKpx7iYWvGq6kBdJrcpVjjd1Yhw709h2IxteNo15t9eMVEXh4iscqM4v1KgRudKCQHUiFk=
X-Received: by 2002:ac2:4e14:0:b0:553:a77f:9c47 with SMTP id
 2adb3069b0e04-55b7c084834mr2238747e87.30.1753998074395; Thu, 31 Jul 2025
 14:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com> <CALHNRZ9tjJo3LRmpaGsEsf2=Him0O2J-ZaJf4UZ8bcbz1119BQ@mail.gmail.com>
 <CALHNRZ-mUb1Yv6WTeq50ddBS209uWUkv2ivdEMqfBBUtw+SU2Q@mail.gmail.com>
In-Reply-To: <CALHNRZ-mUb1Yv6WTeq50ddBS209uWUkv2ivdEMqfBBUtw+SU2Q@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:41:03 -0500
X-Gm-Features: Ac12FXzL93mWunH4cqtyZKP0uBS9ByxG4KjbmltB2NDeCi9ZRpI_e50ftvAJMzo
Message-ID: <CALHNRZ9H=kPLAJ-YZN8n307uAMbGYOHF55-Tc5=uN_y46USYBg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:36=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Wed, Jun 11, 2025 at 1:53=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Fix usb power supply to align with downstream power tree
> > > - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avo=
id
> > >   conflicts
> > > - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e4=
310@gmail.com
> > >
> > > ---
> > > Aaron Kling (2):
> > >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> > >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> > >
> > >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
> > >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> > >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++=
++++++++++
> > >  3 files changed, 66 insertions(+)
> > > ---
> > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > change-id: 20250513-p3452-059708ca9993
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> >
> > Friendly reminder about this series.
>
> Re-reminder about this series.

Yet another reminder about this series.

Aaron
