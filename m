Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA0119CC3A;
	Wed, 23 Apr 2025 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745382720; cv=none; b=njO5HMPxY5yn1rz6veijJ4r+73vTIboTjKO3+RdZPCa2owiJIwcF2sJSzY73Nqks3WLImMqEMiv05kJbiyOuaqWMxMvZ2fASQb2sXDMpSmQWFHoBirqtUA9nmz8D93UIu12aqYeXWTeH6sGNdbK36AEA2pj4cj7IQPiTilX7qEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745382720; c=relaxed/simple;
	bh=P1w1LWSbsZN3WyeYHfmOFNLcHEWldP9/sO4hdjzrTik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3cstDlIBfoeWfG90TbeyhPysqYseIlwx2YpkS9Qswim1Q5DbiJMEuP+QGfv3TIIco4jN5vzemmcgkmgApeDtGeaBfJ2nfyKfPIjttD0mmHaDxEwY0a5yqGNyL9UZnNrCSv0G9zvD3XsSGpUvfkLKcZMUig8rpinnWgLbpH7jsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfG8CBr0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfG8CBr0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6699696e87.2;
        Tue, 22 Apr 2025 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745382716; x=1745987516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfU6WjNv7EhQ1b3F1YgcLr0oW56464U4m7MZVKTAVBM=;
        b=LfG8CBr08Ag7up2WOUrO9ycPp1fgAFnEmJr87Bycd7SWBhEuwUu3N3PL9+Oj7bnl6a
         tAN3wPauilv9ZKkP2ppsbZen8PCs/IVlGg0SitdBov0+7oj5W09T0/5yp1BgRjDV9xxs
         2krf+jzDYRdjKBg1ds3conn5ztZM1t4ggw0dkyziXqQl8as4Q0AgE/Pc3nHg+QKXovoo
         cqdQGAA8VxZhsnMNBz11LTvJaSCmiUvXscgTiebXulyahSXfZ8CbOLm7ukoKKX1iRb6m
         5g+DLaA7QbiESAA/OeA4iqv6M2bjfX2+A2qVqG0BOrCR/k9tAnurM8yb0+K2XqeFVX/V
         oaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745382716; x=1745987516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfU6WjNv7EhQ1b3F1YgcLr0oW56464U4m7MZVKTAVBM=;
        b=rPfx8TCuLZWIu9j01XkVwfhjZaXjx7Dawc7gVMCaR636Y5yXp6la7yzBiBF1Xoc3Re
         RHe6vmuZyf59crMX95JTswx6pPBDUdO4/S3R0adwxHg9TH5tWCtbWqI186ijKY+eRm4G
         CsPX69YhymstziMemQaZp//PRV1xD97NgQ0+32QlAQmIp9qekbyKXbhd3BQNn3p/mAcT
         Ula50TYr/P5vZdkdgyvnVj9S71Ix2Ko/DqQLXXVMswMaliZ7Ky7mSOkOSrj7dbaKS+e1
         8B++Y9XBOCPVX0mkQSj6D+85QMYjIXA2sER4KFF3yUfT+5Q8Gxtb2Vqx9UVUqpdvq8BV
         ZbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2NwznDajgu7nLRv5wiT4GhZFB4z3NoQoAXaKPFat7ojCgB/zB2PFC6NDkzoA788L2tu/TZiA3e5bK@vger.kernel.org, AJvYcCWG3OnWH21XqCO6tFzEqsLmikj63mHEwGUFNkcwLOx9oh98/oQIeyOM5E0Mtr91G/GzbvZstYu1UWzGoYZI@vger.kernel.org, AJvYcCX5d9Y9V54fXTeISog9p/0pLLEpNyvHDA+IJmArjJpS6KjZyLxJPwTyfwaSiCyoyAiPekaNNigvvAtn/5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQk7dMYJhvUVFWArmsPHTMroYrVca/fv2G/UnZZj4MP2pMVdh
	I+QTMrCiRtceOXu5X7VUirpMYUxlUcW4z9sbsG4hvGnD8CynU/1PjwwPVAUUunfwKVncMSSaa6T
	CrEVyr321js0RvU97UN6GDSpXD/4=
X-Gm-Gg: ASbGncsR61chFjzyrg/lEjQxZONryojDm7jo0XpIWfmDoK40OJRMMLnrdJfHrxTwSwr
	irtnggbVdwztlvYbR/T79Hqy5mD+DYRbtFhCe0mAEBkbjMDQg2hJAQl1DpXl5/eKdyRQ/JlPXiK
	nYtYMN1dD5WaOTGBYWIJkZGA==
X-Google-Smtp-Source: AGHT+IHrhTx/MdAoqHZhA/XltNRI8gY7Qpv0iUa8fCoTK3yi48+MnrjeKBXmmWBDH2fdMJ2UBb3ov8ARoW/15k3JAeQ=
X-Received: by 2002:a2e:be9f:0:b0:30b:d44d:e76d with SMTP id
 38308e7fff4ca-31090553fb7mr54534981fa.26.1745382715958; Tue, 22 Apr 2025
 21:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
 <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com> <CALHNRZ-1wY2D4FOauh7tD+2QKBfhtfdJcvpV_B9Y0tEpE1kTVA@mail.gmail.com>
 <03de9272-dbcc-4473-a267-c3a32e3fd844@gmail.com>
In-Reply-To: <03de9272-dbcc-4473-a267-c3a32e3fd844@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 22 Apr 2025 23:31:43 -0500
X-Gm-Features: ATxdqUFNNymFd9pSDXZBQVufkK6hibgt7Q7sXOUNoBMMd9XRCOgNUOfdi-xI_IU
Message-ID: <CALHNRZ8i=gOrHfgjhL5X_mqM8=1KeW_cXpp2R32hmT5wUjkw5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 11:19=E2=80=AFAM Tomasz Maciej Nowak <tmn505@gmail.=
com> wrote:
>
> W dniu 22.04.2025 o 17:58, Aaron Kling pisze:
> > On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Tomasz Maciej Nowak <tmn505@gma=
il.com> wrote:
> >>
> >> Hi.
> >>
> >> W dniu 21.04.2025 o 00:42, Aaron Kling via B4 Relay pisze:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> This is based on 6f78a94, which enabled added the fan and thermal zon=
es
> >>> for the Jetson Nano Devkit. The fan and thermal characteristics of th=
e
> >>> two devkits are similar, so usng the same configuration.
> >>
> >> Does this work on Your DevKit? Doesn't on mine, the fan won't budge. M=
aybe the
> >> revision difference? What I'm using ATM is [1] and [2]. Because invert=
ed polarity
> >> of PWM, not submitted since that'll need the driver changes [3],[4].
> >
> > I would have sworn I verified this before sending it in. I've had the
> > patches for some time. But you are correct, this does not work as-is.
> > Maybe I lost something cleaning up for submission or just plain
> > misremembered the verification. I will send a v2 once I've fixed and
> > verified. Apologies to the list for the bad submission.
> >
> > For inverted polarity, listing them backwards already has precedence
> > in mainline, see the Banana Pi R3 dt. This makes me want to double
> > check the existing Nano pwm-fan entry in mainline, though. Cause I
> > thought all the t210 devices were the same in regards to pwm fan
> > inversion. And it doesn't have reversed entries.
>
> That Banana Pi R3 reverse levels look ugly, but if it's permitted I'm not=
 against.
>
> I would assume they fixed that in Nano, since PWM controller doesn't impl=
ement
> inverted polarity in hardware. Looking at Switch [5] it seems the TX1 Dev=
Kit was
> used for developing, since they replicated the issue.
>
> 5. https://github.com/fail0verflow/switch-linux/commit/b23e8b89081415f2a6=
3bc625db041c8092e2a8a2
>   >
> > Sincerely,
> > Aaron Kling
> >
> >>
> >> 1. https://github.com/tmn505/linux/commit/a78c520ec94aeab2c9dc8e1f4659=
7c4174ff957d
> >> 2. https://github.com/tmn505/linux/commit/99beee4f0cd5d3a6f30e1829d823=
c11cb8b54bac
> >> 3. https://libera.irclog.whitequark.org/tegra/2024-07-19#36707118;
> >> 4. https://libera.irclog.whitequark.org/tegra/2024-10-14#37145211;
> >>
> >> Regards
> >>
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++=
++++++++++
> >>>  1 file changed, 60 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/ar=
m64/boot/dts/nvidia/tegra210-p2597.dtsi
> >>> index 83ed6ac2a8d8f403fb588edce83dc401065c162f..bc02f2eb14bcbd99627c5=
8b398bbf43061c8110b 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> >>> @@ -1623,6 +1623,14 @@ key-volume-up {
> >>>               };
> >>>       };
> >>>
> >>> +     fan: pwm-fan {
> >>> +             compatible =3D "pwm-fan";
> >>> +             pwms =3D <&pwm 3 45334>;
> >>> +
> >>> +             cooling-levels =3D <0 64 128 255>;
> >>> +             #cooling-cells =3D <2>;
> >>> +     };
> >>> +
> >>>       vdd_sys_mux: regulator-vdd-sys-mux {
> >>>               compatible =3D "regulator-fixed";
> >>>               regulator-name =3D "VDD_SYS_MUX";
> >>> @@ -1778,4 +1786,56 @@ vdd_usb_vbus_otg: regulator-vdd-usb-vbus-otg {
> >>>               enable-active-high;
> >>>               vin-supply =3D <&vdd_5v0_sys>;
> >>>       };
> >>> +
> >>> +     thermal-zones {
> >>> +             cpu-thermal {
> >>> +                     trips {
> >>> +                             cpu_trip_critical: critical {
> >>> +                                     temperature =3D <96500>;
> >>> +                                     hysteresis =3D <0>;
> >>> +                                     type =3D "critical";
> >>> +                             };
> >>> +
> >>> +                             cpu_trip_hot: hot {
> >>> +                                     temperature =3D <70000>;
> >>> +                                     hysteresis =3D <2000>;
> >>> +                                     type =3D "hot";
> >>> +                             };
> >>> +
> >>> +                             cpu_trip_active: active {
> >>> +                                     temperature =3D <50000>;
> >>> +                                     hysteresis =3D <2000>;
> >>> +                                     type =3D "active";
> >>> +                             };
> >>> +
> >>> +                             cpu_trip_passive: passive {
> >>> +                                     temperature =3D <30000>;
> >>> +                                     hysteresis =3D <2000>;
> >>> +                                     type =3D "passive";
> >>> +                             };
> >>> +                     };
> >>> +
> >>> +                     cooling-maps {
> >>> +                             cpu-critical {
> >>> +                                     cooling-device =3D <&fan 3 3>;
> >>> +                                     trip =3D <&cpu_trip_critical>;
> >>> +                             };
> >>> +
> >>> +                             cpu-hot {
> >>> +                                     cooling-device =3D <&fan 2 2>;
> >>> +                                     trip =3D <&cpu_trip_hot>;
> >>> +                             };
> >>> +
> >>> +                             cpu-active {
> >>> +                                     cooling-device =3D <&fan 1 1>;
> >>> +                                     trip =3D <&cpu_trip_active>;
> >>> +                             };
> >>> +
> >>> +                             cpu-passive {
> >>> +                                     cooling-device =3D <&fan 0 0>;
> >>> +                                     trip =3D <&cpu_trip_passive>;
> >>> +                             };
> >>> +                     };
> >>> +             };
> >>> +     };
> >>>  };
> >>>
> >>> ---
> >>> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> >>> change-id: 20250420-tx1-therm-9fb3c30fa43f
> >>>
> >>> Best regards,
> >> --
> >> TMN
> >>
>
> --
> TMN
>
Mmm, so this is strange. I am currently unable to get the fan to move
on any t210 device. But it works just fine on t186, such as the tx2 nx
setup supported by mainline. Tomasz, does your change work on 6.12 or
current mainline? Even if I match your changes on the tx1 devkit, I
get nothing. The pwm duty cycle is changing as expected, per the
debugfs pwm listing. Gpio state for pin 4 of the tca9539@74 matches
the 4.9 kernel when the fan is running. Best I can tell, it should be
working. But it's not.

Sincerely,
Aaron
