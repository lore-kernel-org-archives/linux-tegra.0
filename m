Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D761DED49;
	Mon, 30 Jun 2025 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751311668; cv=none; b=a+GiTFSHPAfSlFcvPLnx9MujBTs5ulUjHSYMur5cDN0KqoBSZTseBuL6RsTgNEXibjhOtogZa04K6FK+b1KO/Q5YW2INRroZ669IOJYQgayIbwHPxiqtHNulo/g3/gv189slpzDMwDA5IIlt8fmkjOjyOj0j/B7EWd+OW+fjYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751311668; c=relaxed/simple;
	bh=DfDX/O7xP1nZjrC1FK+4ob51GVWC+vd6Yf1nZMDZ5Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2h/A1Y8/EraIDur0FR+7cEHBW3gIGgkRj7WiK1tgxqFN+kA95szhnE/fjYoVD4RXpgrzB4ZvQBQeg5U3wJyk0DJPC7Py2OK3fSvlSsYsYs4YjpKIP9V0+gkY+3Dg96bceIi7/CXYKVaPCFNO+6qrtXWXFp/Krl94SUX4bLI8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koxDoWj1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koxDoWj1"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso46975931fa.1;
        Mon, 30 Jun 2025 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751311665; x=1751916465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKxhp32ZYS91rGBb5JyVKJ/KNyC65qKnN6o9z2cXJKI=;
        b=koxDoWj1nzVw8nveFGMpYfFiy7i010mVtgyuJX1+e9iCuPEWyl8mmABNsbPd/EEQkd
         vzxyOQ8/kyFd6i1xTvgDMxqPXWJmHH6q2hlNULl2078k9BvULefIO9SRzI2s4I0AVhRk
         0WrlzuVcWiIDNY6bvu4WbdJ+Qepie8i1ASwN1TsjQXX7V9B/W9ze1NyfOSwKT//BJd1P
         mzwMXktBrMbftYvtupxpMQ+Qx6npMx3+3NGizayZNdfTbRljgCX3NFkQDETy8ewBCReF
         4lx5wexuLHUrm5629qs+jeHyWMtTCSBZ3TCCJxhQJ2ZGAG7rohDWGcrNdTOU7GAZndHc
         DNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751311665; x=1751916465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKxhp32ZYS91rGBb5JyVKJ/KNyC65qKnN6o9z2cXJKI=;
        b=eydY9h400kP13vwIduCE0pI08xB40irRBG5c/3Yg9gZ+fPvCsMvycWddoN67Xm/+yI
         jKPBK0DYOfzU0r6SC5gcvkLiGROa2Avp6SKxdrGarU7OfKlwCWBXeMIL1Jrc2+qKWd2w
         cCosVJTUDR1YHADJP+rdxrfwNsTiLMVapLD3s8K6n3IqfqqrMq6ytWc9O78yijYAWqpu
         Rc17QAXpUzwHjcvxTBMrNWLrR5yqsYF1XoM0l31K8u1DrB2nqApa/bIK2Ml1rXZfES9b
         9em4p7rw1uNSl87peGtxxuscT+vLwkA91B8djAsV/CuW6ADvQWwDgqNarB/Qq5e3571H
         9E9g==
X-Forwarded-Encrypted: i=1; AJvYcCUsX9Hl5i/J/YA2bP47qI3Y1S76rrLbdM2ZdCS+iPdLRf2wBd939bZJyW38JqrbK7RuXoh7KRp4uZXb@vger.kernel.org, AJvYcCXRl59qKeFTTbO5FsBqZt9Fr4NQ+jdcHyEmQP0d0sY7z+M/r1bX6Jd7gxLySObun634n+O5/wW0x9BiEyY=@vger.kernel.org, AJvYcCXj5BV7Df3aOxdWN0wl+ItqCjMqbWnGcRo8qWQ0iPCACePhWfnFKtrQTYUkuzJ6FLB3Z3KQ3X7zcJM0S0qP@vger.kernel.org
X-Gm-Message-State: AOJu0YzkCh8OHrN+p9hEq09ehphJ03DiE0ZorZKIsnxeCmzYUEusypQu
	wfDu97eUTYYgrZx1naAVICQIaPaqNru5Jv2vgkXhD2Cv8eKW7DiQg0YNfWf7ir31CUcBe92wUQr
	qIx5ezdD2xn7j86dTgfDElbCI7jN8Oj8=
X-Gm-Gg: ASbGncuqOVtthN7lLaTJ1m2zS9769TR4p9yk3QoBTzTUME3cZnXeyWQmpQbSatj+X5/
	msCSNf7CKudf5ha7lu3M5j6I/gEhk6rD7rbww/08SdwxYw8F7fzzHo45kMBxMpez4jf76heZLX8
	D0bg50v/tBdAZljubK/6WpMiaFCKYC8Yst6DGbnRYQg8I=
X-Google-Smtp-Source: AGHT+IEa0bNLNvvrJxIYMARb2nqo4t1aBB768pKUvFh6Ri7+8kEYthBndyHqVBBh2Z3GuscfGkAJNF19gpF1An4OS1I=
X-Received: by 2002:a05:6512:3d9f:b0:553:5135:69fb with SMTP id
 2adb3069b0e04-5550b869ff8mr3999969e87.10.1751311664459; Mon, 30 Jun 2025
 12:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com> <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
In-Reply-To: <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:27:31 -0500
X-Gm-Features: Ac12FXwgcp1mOdSq1DPjTVmz-A4VQy9yAvt_bxE2ebJGEwUsbFsdGO2-Es8pcY8
Message-ID: <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The p3509 carrier board does not connect the id gpio. Prior to this, th=
e
> > gpio role switch driver could not detect the mode of the otg port.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.=
dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355bbcb6=
91ef99b0d0c9d504e 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > @@ -669,7 +669,6 @@ connector {
> >                                         vbus-gpios =3D <&gpio
> >                                                       TEGRA186_MAIN_GPI=
O(L, 4)
> >                                                       GPIO_ACTIVE_LOW>;
> > -                                       id-gpios =3D <&pmic 0 GPIO_ACTI=
VE_HIGH>;
> >                                 };
> >                         };
> >
> >
> > ---
> > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
>
> Friendly reminder about this patch.

Re-reminder about this patch.

Aaron
