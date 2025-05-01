Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB5224253;
	Thu,  1 May 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138704; cv=none; b=kANubVzgT6a6/PL0rSHx95xhparLJOm10F8X/43Ej9vI658kIV8Lsl82bNMG4qlhVkE8arY69o/jtoPe1cNoy6USzqKuZN8ckVHJW/NTikuTVD9jLmWZL4dUO98wna09M4Smubs0bhzgYlVYwN8EeoewEo08g+797+VBSFDkySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138704; c=relaxed/simple;
	bh=IUmOmh23ffVW5ccEnUJXO1QpsOO3VaSdH4ENaa8xDEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hybrc8L4Csc+xSVCSy07N4HGlTVUykdl9gJECsnCjQNvvQ0qu3EP+4FI0KYHdRoB37RfYKBChDIjexU3VSMRo/rf/Lw0BVihJ8FO1ghfUV3BuCv9Uo/IJ/vTHW/5CJuim/DGAF3vNR0Rl3EsJIYe0NNovAU8VmjTHSJQ7uw/ItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+5O5tGQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+5O5tGQ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso13384751fa.3;
        Thu, 01 May 2025 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138699; x=1746743499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WhLnGgrZK9KgJDLutiME2etA44y+MbfNDEIYfSdOas=;
        b=M+5O5tGQbwkwVHLBpoZJ04ukCBdrA3EtmoSlj39yDV5HM9zknJvr7slZOLcc74Q60I
         uaTV8gbPjIc4y6nBX1RBLeazKDDO0hTVEDHR8bZa4FNanmV6MhQLolw/2gUVuXcGag9V
         3QkdCdqOwieLP7yyy9jxEnthwPnYCd/zdtvW4QWgU7t8vST34GKxprYrGFtcU4tng9k8
         Pt3xw1CAJcLyLhL9fizvVH6LBUobW7OXUOJWJqwaqUOitoYshzp6AsD2Ilga8TqLG50x
         qR2aBPxfif9eUqSMT95vvRz3KAZUGXxpJUkRKHoxHQikZFAvzXOY5CFAq6pkQR1+DDKJ
         lwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138699; x=1746743499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhLnGgrZK9KgJDLutiME2etA44y+MbfNDEIYfSdOas=;
        b=eqNLPQIEUMHDJP8DDfiItAT6KxUizfxb2oV5ulmTetUVEPKT+bY83a4Zu+rFSpRdXw
         C59VaCfeKME0wneLHGgs1N7ev1sxn1ZJM0+tCcTxph8GBhVIJtz5AZLAnAG6tkGn/PtL
         tQ/PZ93RzZE1OmVq9jQSfUwM5FhLs1Fi0rg4tRZVnDFov8f6v00XoF6ySRjOPtX9lFvH
         Gz2RIZoiDrwpizqo9m8tUV1jqoReJH6CPl5epsxo908hR32pAbsce3jthzFeCRhuhLGH
         /cLcFA/GML9F9+ynh6Z6/2yaBJ19ubwJYOqs/Ge4fokvIsUO7QcH76vgC09s2GvRairr
         urhw==
X-Forwarded-Encrypted: i=1; AJvYcCVapa/ySnCmtO2I1YYQMo8Y2MMX0wd2dD56xva9/dHl0ozG5hcdpdCNuRaeCT/9yeyXqZY4X0eOI8v4@vger.kernel.org, AJvYcCWVWNDqQ+D9F7/z0t4Dp+xvNS53hLgWAuWVp5pp/koPPI0lz988Rds4IY6hozS2C5bszVt/ZozB1fLo7LM=@vger.kernel.org, AJvYcCXyaSIGve95xd8ZQSjfrYcr+JbIwS/axgwqoPgLR1wo/KoBUgqzTtVcXO7xYSUdBoR4aLF726YGohuP0oC6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2cDifH8uZLjX2vpHdX60aT2Csj9aQyd3AIsiskd/SaWoiq20
	hKj9ryJuA0/fzsWJycrsDWw8Ld4X90D/XVcQjRE/RbJ7UAd0YA+7VmC1pdutmx8S/L1hBF6A7rE
	rV+wxOWm7TJ4mu6bZaaxtQHy/cvR9nP2MUBk=
X-Gm-Gg: ASbGncvnnbR8ENDXy4+5qTbuEVktq3yFKUMC2p1qImidawuN0vC4IWBuVllfuu9S4X3
	1B80FJqshRJX2qqUkuU5P0/gEs71MhGOu25Gf6I5I9d7aZ3yfuv8JU1fEPplLQ6myXP/ANtIkik
	uGD47kdFbiuT90VCfEjqaf7Q==
X-Google-Smtp-Source: AGHT+IEYmFe5HB0Ycsl/5Rt5LMxC6ZnTanDjyMrQmJ8f+Ih6DUxHbiydzQUNZDruV7nSLfeDs1Pp/LcyUxabvAcgV60=
X-Received: by 2002:a05:651c:548:b0:30d:e104:b593 with SMTP id
 38308e7fff4ca-320c61bea9dmr1057501fa.39.1746138699095; Thu, 01 May 2025
 15:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
 <d0da9dbd-7ea7-4047-bab3-22f416c45938@gmail.com> <CALHNRZ-1wY2D4FOauh7tD+2QKBfhtfdJcvpV_B9Y0tEpE1kTVA@mail.gmail.com>
 <03de9272-dbcc-4473-a267-c3a32e3fd844@gmail.com> <CALHNRZ8i=gOrHfgjhL5X_mqM8=1KeW_cXpp2R32hmT5wUjkw5A@mail.gmail.com>
 <2eb90841-f10c-4524-bbf8-10a2095ecde4@gmail.com>
In-Reply-To: <2eb90841-f10c-4524-bbf8-10a2095ecde4@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 1 May 2025 17:31:27 -0500
X-Gm-Features: ATxdqUGrMNTj7xaG2iCFPJ4lREoHnf4_qjs03MsfW90lx2iInYnOxaWVxwrT6hU
Message-ID: <CALHNRZ8GCBwjVOFoeGrP3Rbcy2NVzkahi_i0gR8qAYr2tA0SOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 8:21=E2=80=AFAM Tomasz Maciej Nowak <tmn505@gmail.c=
om> wrote:
>
> W dniu 23.04.2025 o 06:31, Aaron Kling pisze:
> > On Tue, Apr 22, 2025 at 11:19=E2=80=AFAM Tomasz Maciej Nowak <tmn505@gm=
ail.com> wrote:
> >>
> >> W dniu 22.04.2025 o 17:58, Aaron Kling pisze:
> >>> On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Tomasz Maciej Nowak <tmn505@g=
mail.com> wrote:
> >>>>
> >>>> Hi.
> >>>>
> >>>> W dniu 21.04.2025 o 00:42, Aaron Kling via B4 Relay pisze:
> >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>>
> >>>>> This is based on 6f78a94, which enabled added the fan and thermal z=
ones
> >>>>> for the Jetson Nano Devkit. The fan and thermal characteristics of =
the
> >>>>> two devkits are similar, so usng the same configuration.
> >>>>
> >>>> Does this work on Your DevKit? Doesn't on mine, the fan won't budge.=
 Maybe the
> >>>> revision difference? What I'm using ATM is [1] and [2]. Because inve=
rted polarity
> >>>> of PWM, not submitted since that'll need the driver changes [3],[4].
> >>>
> >>> I would have sworn I verified this before sending it in. I've had the
> >>> patches for some time. But you are correct, this does not work as-is.
> >>> Maybe I lost something cleaning up for submission or just plain
> >>> misremembered the verification. I will send a v2 once I've fixed and
> >>> verified. Apologies to the list for the bad submission.
> >>>
> >>> For inverted polarity, listing them backwards already has precedence
> >>> in mainline, see the Banana Pi R3 dt. This makes me want to double
> >>> check the existing Nano pwm-fan entry in mainline, though. Cause I
> >>> thought all the t210 devices were the same in regards to pwm fan
> >>> inversion. And it doesn't have reversed entries.
> >>
> >> That Banana Pi R3 reverse levels look ugly, but if it's permitted I'm =
not against.
> >>
> >> I would assume they fixed that in Nano, since PWM controller doesn't i=
mplement
> >> inverted polarity in hardware. Looking at Switch [5] it seems the TX1 =
DevKit was
> >> used for developing, since they replicated the issue.
> >>
> >> 5. https://github.com/fail0verflow/switch-linux/commit/b23e8b89081415f=
2a63bc625db041c8092e2a8a2
> >>   >
> >>> Sincerely,
> >>> Aaron Kling
> >>>
> >>>>
> >>>> 1. https://github.com/tmn505/linux/commit/a78c520ec94aeab2c9dc8e1f46=
597c4174ff957d
> >>>> 2. https://github.com/tmn505/linux/commit/99beee4f0cd5d3a6f30e1829d8=
23c11cb8b54bac
> >>>> 3. https://libera.irclog.whitequark.org/tegra/2024-07-19#36707118;
> >>>> 4. https://libera.irclog.whitequark.org/tegra/2024-10-14#37145211;
> >>>>
> >>>> Regards
> >>>>
>
> [snip]
>
> > Mmm, so this is strange. I am currently unable to get the fan to move
> > on any t210 device. But it works just fine on t186, such as the tx2 nx
> > setup supported by mainline. Tomasz, does your change work on 6.12 or
> > current mainline? Even if I match your changes on the tx1 devkit, I
> > get nothing. The pwm duty cycle is changing as expected, per the
> > debugfs pwm listing. Gpio state for pin 4 of the tca9539@74 matches
> > the 4.9 kernel when the fan is running. Best I can tell, it should be
> > working. But it's not.

For documentation purposes, I figured out why I couldn't get the fan
to work on any of my test devices. I'm using the Android boot stack,
which apparently doesn't do the pinmuxing that the L4T boot stack
does. The downstream Android setup does pinmuxing in the kernel. And
mainline support has been primarily designed against the L4T boot
stack, doing pinmuxing in the bootloader and not in kernel. I've
worked around this locally by setting the pinctrl name on the p2597
pinmux node to 'default', so the kernel does pinmuxing. Which matches
things back up between the two bootloaders. I'll be sending a working
v2 shortly.

Sincerely,
Aaron
