Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE821FDA82;
	Mon, 14 Jul 2025 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471340; cv=none; b=gsAfyQNx5WgnV/nibrHr0dORtIICFcObuxCMgGRRVFWBWK4kKHe3voW0FP57crDn2KS26ERj0EIhDaBuz3Lnt7XP+wWosQpnXRDTXcAsEXx2lqStT6FRQ7/2HdZkw7fELZNU9wCVABlfmvcDxFb6Z6YlizDLA1EB6J3DP3cf4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471340; c=relaxed/simple;
	bh=ngWILdYTOPdUmTCLXucvX91cTQEWbU7wfaAKzIBBPEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWT/g7DK2Nn9Z4SBI6nvmOc6gOa8xc+wnRARG9eRAQCT0M6wCT08k2G/ADYr/vS1gPBLiigYB5iGe943p15ENKqQyuTV8KxxIRjvEzLsv2pgHMHQmoTMB30lazITYKRu118/7nJbmqeqZmIOn3HKoAJpFCeqv3/qBOT1iyC4PHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBwuZEQ2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBwuZEQ2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so4836257e87.0;
        Sun, 13 Jul 2025 22:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471336; x=1753076136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTT2yBHfTcFyM4AF+LOcaGU3n4iWp5c18cO+9hDiy24=;
        b=DBwuZEQ2a+fGBOKZdydHxpjAg7gnlKHzzwMdoRSk50MYYgUBtAa5ZtLFSN5Fh4PKhP
         vLebwpZV64QV72wGMN4tW89hdCZK4RaP/7lA52mKkh633eSqRkZcN5/MPZVrwhQG0X1I
         a1pL6yTTlnl1co2TPBbVRJ0PlJEN/Qzu9zZ+AxKbZ4/5QNr64Mn+b/Fod0EwUE2UsMAg
         C/xzpy+2lTBwszM+9zhX1UE5QpaJqq1HUWIfrsSf7cn7jljYK/QkaxtJ8O3K6nM2DYIz
         l5GVNbOfGGiEM/aQZtuDNF5UrnbVuL9sIQRIy8Q4OzM2hSCO6Dex4+60uPpog6voIIio
         5Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471336; x=1753076136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTT2yBHfTcFyM4AF+LOcaGU3n4iWp5c18cO+9hDiy24=;
        b=WKRVkU+S/k5Yw3MitYKJK25xrHID97P8g+kXIg6kB2wkBGxCwWt4wVw6+S0Wcy+PaO
         YUnbQU9MlANWzaFx0gfsDpfUnd+1GxAKjcdXYOdhDxQniagb+O82cdLHOOtXfQJBDCzo
         L9Tra+qZY6dQa5MBZXmhiKZyq6l08lN1GFH/ioEA24MTEJ727Pv9GhHTthbxb25AkP8Y
         9lBIszq19ONtGmroo4u6y4nySoD8kWGEyaJfk7OGFTZaitF6pGKejJlcbB0sLv0WAZuy
         wrCR6qmLaGyKRvr4+nROdV2p0l+pxSSj+9g8lQc4/nmxxAChywxO8wQwQj5HlfEbAtxd
         ir7w==
X-Forwarded-Encrypted: i=1; AJvYcCURHYKUxO86yz5veS0fTaZppc0N+EwVkTZJwb/Fc15EWdbwi7eLFJV51Ln/KsfrYF2mSntLz3Mnv5UXR77k@vger.kernel.org, AJvYcCWpdDMFgzSXQOK+HZgoxqoAAUEmDgkvSf17lJMvf7q3b9LuzIv0tthpO73QDh2QpaGl+lgD/TGh0igt@vger.kernel.org, AJvYcCXAPqupT8wAc8z8yguDkjrPucHb+BRbhTI7O0nvtbeLOgXCufiGgnhG8yXfC2oTO2emd3OrF74cZzoFPps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiVxeb/hsnboyFOCHQAuNMwfJ3blb23qh2hL9oQgUACrE8ezsD
	l965I3d7pJz8BDefeuxCReKbnj3Ube4To/xPV7Z+frT/dM18wTwHXIXn5+fB2G2jXGXvLLKuWyx
	iQNcSdIxmQIsaRS3NK9G5eLUOp3Fb6gQ=
X-Gm-Gg: ASbGncsC3JPpKFSqXJxwEz1cvB3NblqLeTRi7NzYXYpRSn5BsUu0NbfhJLFrWZ4gTdh
	6uG1Jcjr66NeMbl1Ct8QYRUcqI59oh3ZYSb2zndyDScAMn++xYqa7vk/tWEeOj9aUfVEVXr9r7n
	ryM/1KwUOmyBh7zAR3auhbOgn2jIGMlCeOUu+P/dzhDR2v6rUbkk60zKtpnLiXltpEHZGO6pXSS
	W4QpSI=
X-Google-Smtp-Source: AGHT+IHV4fBmRuHWERCERtBKF1vv92N3FV47ypgAwaO/xCEjquF4Mr1IdqtvKl7DD5jfu1N0pzIimlXWvHYl+LIxWiE=
X-Received: by 2002:a05:6512:1585:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-55a04674d99mr3458275e87.50.1752471335671; Sun, 13 Jul 2025
 22:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
 <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com> <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
In-Reply-To: <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 14 Jul 2025 00:35:24 -0500
X-Gm-Features: Ac12FXxE5aZV5SkxpxM5fRk6baNQBIAxTa-fub-NXK9zqdd4H9DfiBgmAlp_UJ4
Message-ID: <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:27=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The p3509 carrier board does not connect the id gpio. Prior to this, =
the
> > > gpio role switch driver could not detect the mode of the otg port.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-000=
1.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355bbc=
b691ef99b0d0c9d504e 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > @@ -669,7 +669,6 @@ connector {
> > >                                         vbus-gpios =3D <&gpio
> > >                                                       TEGRA186_MAIN_G=
PIO(L, 4)
> > >                                                       GPIO_ACTIVE_LOW=
>;
> > > -                                       id-gpios =3D <&pmic 0 GPIO_AC=
TIVE_HIGH>;
> > >                                 };
> > >                         };
> > >
> > >
> > > ---
> > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > >
> >
> > Friendly reminder about this patch.
>
> Re-reminder about this patch.

Yet another reminder about this patch. It's been over two months
without a response and many other patches have been pulled in the
meantime.

Aaron
