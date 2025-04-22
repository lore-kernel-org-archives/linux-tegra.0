Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF119ABB6;
	Tue, 22 Apr 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337545; cv=none; b=HkDDCtZrNjraxHatKXJNh6BiuwVY+uit38YEGDk+ukXMU8ErgHHi1l5pVN7eo+04/hbGLOT5RUzKTcWGhuusz3QTt2myzg3NgLnCAIDdwx5I8izZgHqlEbMwwqP6GXge+U1DVdg0UD11xeMLqBhMerDcuABowEw/T/Gz/rnQTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337545; c=relaxed/simple;
	bh=lnd9254tLyB4tDweSMgFvtABXfEUVEra/aiVSRDp8Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSh27vqlZ2pn7NhMTUB3labXYao+Zf4fDh+7lTSl6IdjKxZcZmN99zqa/fPKLZx2zl5uZOrC6MZ/Q3BOFpfuA+eNELEPvYgeBGPNGfVdlCHTwioetqtjLlfsN0uImMMtDHyp8D3yCLFeHCoRb9CjOaWNmMHgZv47U9F7N8KNZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEC0aWcU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEC0aWcU"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3104ddb8051so47985191fa.1;
        Tue, 22 Apr 2025 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745337541; x=1745942341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P95RfQEOnb0c2BR6K6QObHOaYZy5sb19nz4J8BmXf8Q=;
        b=SEC0aWcUFmu+GrxhMf8R5rX13VawlwEe+5nxJk8CNdnF8L0E1SyOU1LfYnTwfyfsou
         2D+lcaoW/17TWbCJRHyk3Bu1+gYYwFDSn6CgI/IYUbZ+qNt2iau6pCtyIsBhxdqJL5am
         DDfmEDnGHa+91NTj2M87plDqhTxhDKNBzNszqpVXdUKLV/cln5XSIeU5/D1RgnF3pG86
         wea4T7b5GON4EW2ccKTfmi+/RiLt0DL53iV4g7z/ZhW0zWei30RcWiieNlFpAHNIyXMc
         iUG6bz6/Ea7aPwkqJBbLogAg6bGQ0DvoHG+DnrTx7OKLG0E90rda1NtU6Cb0UVgXTWAf
         p7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337541; x=1745942341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P95RfQEOnb0c2BR6K6QObHOaYZy5sb19nz4J8BmXf8Q=;
        b=wHw8m8bvfy7lLL0e4FMCdul8WqDOrPXpxUDke7CHiryb5+rP4r/maaafa3/Qqgvhrc
         uZWy9LqiLGL932zJigNmL+UWxtalUQMB+Z+QZlTJXCHshtOy2tVcoJDpgOP8xeabsC6q
         zxX0FISk9eT31fzk3FTJUzLFa4gMpPRFxSvf3Unvk9NzVu9+hUWVX/bAtqgjtW4MVDBg
         bjuD6i69r/a7yv8W+X28B/bxGC2Z0aDrGV0j00z8ba4DpJ3s3xoIPCHqNheNuNtq+q7U
         kbPWsxi2Mb3R0SSBztgbE256KwwpUBLtva8ZRGTvgivG66jZwwOgeR89BTZ+jGowpX2N
         WdvA==
X-Forwarded-Encrypted: i=1; AJvYcCUjA/DOz/aVEJrbJBB+O7hV+rekxvbdXHuPbLqtaMLB9qN0IsCIj0xJPxfnBGdcWhhCDO/f+hQeFwfF@vger.kernel.org, AJvYcCVdkEHN13tccxkzEfpjk2fVMniu27lRcdhYiXBlaOvxXf+WOsOGfbmiNjNT9hjveJ/i5ouVDlB+0ErSnbc=@vger.kernel.org, AJvYcCXQ3+JQ4qpn0GDV6uSwE1E3xQefsVFFSn/6ld1y1QjmqYx//C11S/FZfM0uit0KzmAnIx/1eQGkEDOQpHMA@vger.kernel.org
X-Gm-Message-State: AOJu0YxT4Q/LSUL/rgR8ijrOYj0cnVX6rgvS+APl5aSaquwxqqwo+B/2
	ojKtdXW7F+uk+NTf/k4el0oSpQ7ekeFjcrDMEG1bhm6H23o2ekWn5S8MWEv7vwyMd2Hop3YK4Ee
	vlPhGaqm92hKDxW1sGwojQCMFdpA=
X-Gm-Gg: ASbGncvFfPpQAhK0A/E6ZXpG74CIKZpuhGp68Irf3/hB6XB2vbngfxWdnUd2qIyp9ck
	er+eb6Cs8B8j372Ard8dZJQ2ykt903iv+vcYLG1BkC3X6SjYW5wdKY8R3jhSPwVCbCB2H+j2qg1
	sAUAjwob8nYqW+GYDzeak7Re6DKZ7Iosgv
X-Google-Smtp-Source: AGHT+IHKgcdmILgvUVpncrj//ODq1JMHClCH1kVZRazRm5jxoTJWPHIfWhHjDuVHUsHNkKtQU34Ao2kGXyWLUr7HxTE=
X-Received: by 2002:a05:651c:210b:b0:308:f860:7c1 with SMTP id
 38308e7fff4ca-31090556ab0mr53568471fa.30.1745337541131; Tue, 22 Apr 2025
 08:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com> <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com>
In-Reply-To: <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 22 Apr 2025 10:58:48 -0500
X-Gm-Features: ATxdqUH0WevZlJR3IBcYgltJzhkm5svybFPJXfp0ABMbamr4Xh6jcse-_SS3tzY
Message-ID: <CALHNRZ-1wY2D4FOauh7tD+2QKBfhtfdJcvpV_B9Y0tEpE1kTVA@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Tomasz Maciej Nowak <tmn505@gmail.c=
om> wrote:
>
> Hi.
>
> W dniu 21.04.2025 o 00:42, Aaron Kling via B4 Relay pisze:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This is based on 6f78a94, which enabled added the fan and thermal zones
> > for the Jetson Nano Devkit. The fan and thermal characteristics of the
> > two devkits are similar, so usng the same configuration.
>
> Does this work on Your DevKit? Doesn't on mine, the fan won't budge. Mayb=
e the
> revision difference? What I'm using ATM is [1] and [2]. Because inverted =
polarity
> of PWM, not submitted since that'll need the driver changes [3],[4].

I would have sworn I verified this before sending it in. I've had the
patches for some time. But you are correct, this does not work as-is.
Maybe I lost something cleaning up for submission or just plain
misremembered the verification. I will send a v2 once I've fixed and
verified. Apologies to the list for the bad submission.

For inverted polarity, listing them backwards already has precedence
in mainline, see the Banana Pi R3 dt. This makes me want to double
check the existing Nano pwm-fan entry in mainline, though. Cause I
thought all the t210 devices were the same in regards to pwm fan
inversion. And it doesn't have reversed entries.

Sincerely,
Aaron Kling

>
> 1. https://github.com/tmn505/linux/commit/a78c520ec94aeab2c9dc8e1f46597c4=
174ff957d
> 2. https://github.com/tmn505/linux/commit/99beee4f0cd5d3a6f30e1829d823c11=
cb8b54bac
> 3. https://libera.irclog.whitequark.org/tegra/2024-07-19#36707118;
> 4. https://libera.irclog.whitequark.org/tegra/2024-10-14#37145211;
>
> Regards
>
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++++=
++++++++
> >  1 file changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2597.dtsi
> > index 83ed6ac2a8d8f403fb588edce83dc401065c162f..bc02f2eb14bcbd99627c58b=
398bbf43061c8110b 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> > @@ -1623,6 +1623,14 @@ key-volume-up {
> >               };
> >       };
> >
> > +     fan: pwm-fan {
> > +             compatible =3D "pwm-fan";
> > +             pwms =3D <&pwm 3 45334>;
> > +
> > +             cooling-levels =3D <0 64 128 255>;
> > +             #cooling-cells =3D <2>;
> > +     };
> > +
> >       vdd_sys_mux: regulator-vdd-sys-mux {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "VDD_SYS_MUX";
> > @@ -1778,4 +1786,56 @@ vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
> >               enable-active-high;
> >               vin-supply =3D <&vdd_5v0_sys>;
> >       };
> > +
> > +     thermal-zones {
> > +             cpu-thermal {
> > +                     trips {
> > +                             cpu_trip_critical: critical {
> > +                                     temperature =3D <96500>;
> > +                                     hysteresis =3D <0>;
> > +                                     type =3D "critical";
> > +                             };
> > +
> > +                             cpu_trip_hot: hot {
> > +                                     temperature =3D <70000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "hot";
> > +                             };
> > +
> > +                             cpu_trip_active: active {
> > +                                     temperature =3D <50000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "active";
> > +                             };
> > +
> > +                             cpu_trip_passive: passive {
> > +                                     temperature =3D <30000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             cpu-critical {
> > +                                     cooling-device =3D <&fan 3 3>;
> > +                                     trip =3D <&cpu_trip_critical>;
> > +                             };
> > +
> > +                             cpu-hot {
> > +                                     cooling-device =3D <&fan 2 2>;
> > +                                     trip =3D <&cpu_trip_hot>;
> > +                             };
> > +
> > +                             cpu-active {
> > +                                     cooling-device =3D <&fan 1 1>;
> > +                                     trip =3D <&cpu_trip_active>;
> > +                             };
> > +
> > +                             cpu-passive {
> > +                                     cooling-device =3D <&fan 0 0>;
> > +                                     trip =3D <&cpu_trip_passive>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> >  };
> >
> > ---
> > base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> > change-id: 20250420-tx1-therm-9fb3c30fa43f
> >
> > Best regards,
> --
> TMN
>
