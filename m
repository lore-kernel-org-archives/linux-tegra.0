Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6541A3A8D;
	Tue, 13 May 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168773; cv=none; b=pxjZZCwuG4MIUxoxjvsVwI31/xp1bMwdD3c+4TAm4iwTbpxRlzMKilFhxEwKzFZBiqYqL0l3XjGc4JdCxO24q26MT/4mBZJJM9RGNaGXUXDlBLwUwxS4dzEPbGWLsnlggiRiICNctPmaQlyhWdq7yAiBV8b5ekgn6NDwYGcLtHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168773; c=relaxed/simple;
	bh=ksJNTH6X3RjYqiQL98SxXN351ndMYSr8GsRLN552Nlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2+i6NSGxT//OCc/gO1RL9ZDfG5hD35fPRkEVcqqsU389+r/X5wlAwjVbj2XX8PZRglixb0YjEG58PE5DrB2Bz/Ga5rJXv/GnR3c6DFtyTwTbUnhpGG0e/+mD1kX8jQlEszqrZbXbYAqdsrfUc1U6ES+Pjv+JYyywBaHIAZenek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZxb9Nut; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZxb9Nut"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54fc9e3564cso6115319e87.2;
        Tue, 13 May 2025 13:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747168769; x=1747773569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksJNTH6X3RjYqiQL98SxXN351ndMYSr8GsRLN552Nlk=;
        b=IZxb9Nutfz9AODA9O17hGZflonD1pgJz8EhFnMKUkF20mdxThKRpBufnuP/JbdSZXR
         Wf8yIiZ6wYr31xmkKoyKFDdRcwGZ1um/51aOALjT4ynqMi5hyoc2oAf2ID3pDx0jS0iP
         lCkkHg39yyB1hq9bCxOly2SwnQxIl/LgXqAlDJ8l5syDz4PeJArHntTybKenO0QaCz5F
         46Mxx3Igtjt7RptpwRLp8J2sdLkzvrBjpGZnR0eTT6F/7KPAIwIhVRBx23M64lvWrPWA
         UhN0u1q4jFShYCVu1NSVQOo7591ryAls8qcffBCm6GqiQlT8ONCoLkMBZjnFvMfYuiEs
         Hyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168769; x=1747773569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksJNTH6X3RjYqiQL98SxXN351ndMYSr8GsRLN552Nlk=;
        b=T61BOV0JlYzArYQUMmuTXBWZ58pfL6fya5Veh9C0BU7deByzsB1LDvzzI0W8e994X/
         DAQ5rsw2ZlmfJR5t1i/imImYfA8BfwkoyKjTtEuVZsFodDXuZSaRfJOB+N/wT46U3nto
         /nJZCXZYTj5G+gYD6qnQHqSKjCJxWJ5gGkrrRjSh7Opt18d77oks2ChiDTxUnlyXo7Bh
         GKnSSgU/X/HjIuwL4OSyzyWUnqJQ3NAtnibHb8MhyfjqRnF9qeitBlWjFvGClniEnIZK
         KjeT2tRTTkOpZmvGCkTq4iyWo2C0VXMXveYE6BOdkq7Z1OZqZmYKqua5abQxLFa3o0Xv
         2Lnw==
X-Forwarded-Encrypted: i=1; AJvYcCUDLq2wuMfnqP5jrSi+c9sy+nwn8w4qDwrdhJzImRQipOBwYGb2qPFmeaTU0sVmyv/gbIRO/f3qmIgOIeA=@vger.kernel.org, AJvYcCV3uJt1UHs9RG2L+BVZQXfCq45FXJxoQwM2Mo8Txtw7jUF/5dpbpqUhCmKMMenagwvO9kpN5P9cBLti@vger.kernel.org, AJvYcCXxaiEDjl62iBQPk0bv8VMxqnXKOc2O8ZLnZ7z3MkGEY80OVM3cmelUo5Zfs+MeBB+QLthvLY44E91+3oaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw12nvMPE6jAs2fU5JyIkcQW4KbfX06HhSBZhyed/xT3QetqnZK
	4zkcrV5oZYEqygI1ojCFrb8eYYDtIQyQohvmzAPnrZCqiJJLD9Gp7sUXELg7rFfmKhQNeShPvDW
	6XnRXanfU6s8MiR223qpAGogoo4c=
X-Gm-Gg: ASbGnctt/8PTSrpyn6vZ8/fiMiKtBjFNOQQkmSsXe55JZ1HJIHmimfS+9h4M5mr0tyD
	rbNsP7HnIjZBDrnR9VUvSy+xXwOUfVC91/7DubIJsTyOeX+O3kTS6TQ8i1A0Jr1Oh+InT//pF0t
	q9gLkYY48NtSWH9UJje9fC6Cs2aVoW1RnYX6dbGIGhmEl5
X-Google-Smtp-Source: AGHT+IHlpggsf7tSkuboEZ0qheweBkapVbaswPCdkm9Yrbizxks2RoZhVMlZXCMW3/Tb4Q46u2G/WrBPGHOaUq4KOGQ=
X-Received: by 2002:a05:6512:31c3:b0:54b:117b:b54e with SMTP id
 2adb3069b0e04-550d61d9e53mr260629e87.57.1747168769279; Tue, 13 May 2025
 13:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-xusb-peripheral-v2-0-bfbe00671389@gmail.com> <660c781a-6923-4cc9-876a-f33ba782c923@nvidia.com>
In-Reply-To: <660c781a-6923-4cc9-876a-f33ba782c923@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 May 2025 15:39:15 -0500
X-Gm-Features: AX0GCFsMkFZOvG05DFLEN3AoDVmlIMlL72GNOhp5XXXvhhtU4WwM20L8uFJicNQ
Message-ID: <CALHNRZ9Li3KzS074dT0ytaEYx7NAMZHYYiuyeoFaBEOEKscR0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] phy: tegra: xusb: Default otg mode to peripheral
To: Jon Hunter <jonathanh@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:48=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> wr=
ote:
>
>
> On 06/05/2025 18:09, Aaron Kling via B4 Relay wrote:
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Add new patch to document role-switch-default-mode in xusb padctl
> > - Simplify code change, per review
> > - Comment in code why device mode is default
> > - Link to v1: https://lore.kernel.org/r/20250404-xusb-peripheral-v1-1-9=
9c184b9bf5f@gmail.com
>
>
> I have been asking our team about this and this is the feedback I
> received ...
>
> "By design, a port=E2=80=99s data role starts out as USB_ROLE_NONE.
> It remains in that state until a dedicated role=E2=80=90switch driver, su=
ch as
> the GPIO-based driver, usb-conn-gpio, or a Type-C controller driver,
> CCG, probes VBUS/ID or CC lines and tells the USB core whether to switch
> to host or device.
> The role-switch-default-mode DT property exists precisely for controlled
> use cases where a board truly only ever needs one role and doesn=E2=80=99=
t
> include any role-detection hardware.
> In that scenario, you=E2=80=99re effectively opting out of dynamic role s=
witching.
> In the general OTG case, though, we shouldn=E2=80=99t assume the data rol=
e of an
> OTG port.
>
> In his case, he should work out
> 1. If his platform has a role-switch component, then he should enable it
> rather than adding this change.
> 2. If his platform doesn=E2=80=99t have a role-switch controller, add
> role-switch-default-mode =3D "peripheral"; to the PHY node instead of
> changing the core driver."
>
> So I guess the question is, does your platform have a role-switch
> controller?
>
> The bottom line here is that we don't want to make this change by
> default for all Tegra platforms.

I wasn't familiar with role-switch controllers and that seems to have
been my problem. I wasn't loading the usb-conn-gpio or ucsi_ccg
modules which was why the current role wasn't being auto-detected.
After loading those, the majority of the Jetson devkits and Shield
devices I'm targeting worked as expected without this change. The only
failure I've seen so far is p3509+p3636. And I've got a fix I'll push
separately for that. So this series can be abandoned.

Sincerely,
Aaron
