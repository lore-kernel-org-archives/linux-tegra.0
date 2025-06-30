Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6111A23A5;
	Mon, 30 Jun 2025 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312113; cv=none; b=f7bfZex9PypdGhJl7eCKvV4Z3Yy4eoiFbYyexmi6lZEU8eC762FR5tvBUQ6WJmK8n3LxqIlKeNwttx3EoLR6W5fMqryjO6NmZJ4HIRPE/neEQm0RkUJG4oIUcETJIO6LP2QAfBJgMilHfYz28YO+9xFo6VwiiimkO1J8CrkZ0Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312113; c=relaxed/simple;
	bh=pCe0UWQj5p0UjomBq3BotCN6hd9SYCM6I5RJj7dfTfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTS1RmfdicdIf3YxdjYSIRac2U+z2CUEoEu41oxskrJR6Wz56kIjmWBS4whk+xK4nXkXTkVfRGegdmEpQAG1OydFPG4ZcZ9f1GYHV4qzA9MW/Eem9jGKY4eTzIy59iJ3Z4zWNJCni0VMpau9CB0sUe3GqPJteX7U1pguGAKJ374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Felx1SCr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Felx1SCr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5551a770828so1685474e87.1;
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312110; x=1751916910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OglMbGQ+Y/qJHraGlD7x6aapMaYudTkxwNEgY4J4Ewg=;
        b=Felx1SCr9CvKhvfX2rE9u3JjYF4qO5v4qL4P3T5RE5STeXES7plX7jshAHtGkvljH6
         +XjeiqrPyqz8zehSUQqQGQDIvkt6AuB+xTuOxftWClCn/kYbazTTaw0rjYCbBmnGC/yf
         NWNSoSXVCLoN/VKZBQl4cdw9JCF23bJVHFdNTI8BnMdR8a6VKyUfDL2bKrRot0se2VPv
         IsvLqs1Su4C0jbongiuzS/wJHjUSxJRvGHz9ODGM2YDKVtmSzc8Jo1cQsBqKp70JqYvV
         5FkdfxZ6sEE6m1gFmTMsp3uowczMeCXD/4PgY9UgvaJb0p2ZS3+CQCljUro+rOaaeKLW
         lIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312110; x=1751916910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OglMbGQ+Y/qJHraGlD7x6aapMaYudTkxwNEgY4J4Ewg=;
        b=jmFiBDVFdrPXo6ECKqjurvvNooVvK/zHlwkEOK3tTQYrTvp5a7/8yXP2onK3Brdu8t
         yOKoHBqD2P42VmlnP1pO37MMYcVEnh83Gphk+fXNaQrWgSxLbhNk0QB0VdJHDW5KlZs2
         vTdpgEgfTJO4TCLfpSUNqndcoB6oFnoo6vh1jzhDykfbIv81qWZku23wFVnXes2KVEu/
         kkfYcVIPZpsHsgj9oL9DyuUzLbSSmgnhhqnXiZ8dDyvzgSYtx/IRB7OH/Z+jJuZraNNp
         7O7H9vUKJzOoJSavne79L+cI0fu40InweqptyP0trrhXaUOUMlZudCHNqu5D4ATZzehW
         q3bw==
X-Forwarded-Encrypted: i=1; AJvYcCUdWaAZqpE2mOWes12kzuqd+s9iKZYGKEePDRhHhldMGIxZdIH/qwA6Foi5mnoQyY+FFJYE/cuRKD/V@vger.kernel.org, AJvYcCUppjSKUxgqOU3epRClpaf1g5mv0JPLkZfPiSfAESyaypTj/qMi3VCZHT9PpdlyzplwbY7qupsOFZDu7EUW@vger.kernel.org, AJvYcCXi4Svo+XmF4MaoUjCQz6srpK8aCvKFMOkZNlqCEkHxgU5nlcpVrP0XGczqJLnJqClfLREUwxBn+kla31A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmWofLVr5szGyXJKKHoSfXFEUgjD17LIzsph0WXP4J2jgUPG+
	ClsbhRyvHb7pADInTf5AAagCDiwiAZFUvG1X5NLMnWmrzIicpZblN7OC0pqKEYbtwHYUwYQq+nu
	z14R3tTrrl4lTshDUNorfluyMUUvXYI/Bv/QcrPY=
X-Gm-Gg: ASbGncv+jAPzA7rIBquNvhjna4fs3sHqaRROouZx08J4MM5rd8s4xhrQpY3Cy3F1lUh
	q3Zv9hoNXQitW60ieK4Gq/gyTjVsJ4qlq4b52xJV1fmB/pwq+ENEL0am9JfsZGpz66n5nWsAm+i
	yrByVFx3IWHoUqhrnHtasvdVaqFJ/Zl/QPkpjyUVNUH88=
X-Google-Smtp-Source: AGHT+IFthP3fIFTbr1jHVDjh5GjZDjDXJV+6FmRWZhCwU9Tk0eHFm8Y8SYay9LxMwKPSLoRHVpx8oAKlgfQjJWWV7y0=
X-Received: by 2002:a05:6512:3f1d:b0:553:aadd:1987 with SMTP id
 2adb3069b0e04-5550b9ee8a2mr4745009e87.30.1751312109880; Mon, 30 Jun 2025
 12:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com> <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
In-Reply-To: <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:34:57 -0500
X-Gm-Features: Ac12FXwRTWfAZBRnWky7vBCy_porlzvhHwzuTdc1h8-WwX9HAH84biN0zTIrW2M
Message-ID: <CALHNRZ_+wU3saUR025HynpiRps_3ace6769NcKfQDOAS2owPHw@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:07=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> > dt if no reserved-memory node exists. This prevents said bootloader fro=
m
> > being able to boot a kernel without this node, unless a chainloaded
> > bootloader loads the dt. Add the node to eliminate the requirement for
> > extra boot stages.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/=
arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..8fc995e71696f2ef5e662a2=
1feb96ea771c7a53f 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > @@ -22,6 +22,12 @@ chosen {
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       reserved-memory {
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <2>;
> > +               ranges;
> > +       };
> > +
> >         memory@80000000 {
> >                 device_type =3D "memory";
> >                 reg =3D <0x0 0x80000000 0x1 0x0>;
> >
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250526-p3450-mts-bug-02394af31f0a
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
>
> This was sent as an RFC to see if there are any better solutions to
> this problem. Mts in l4t r32 for t210 tries to copy the training data
> to the reserved ram location provided by the kernel dt. But if that
> node doesn't exist, it somehow corrupts that dt, causing later stage
> boot stages and the kernel itself to fail. Since software support for
> this hardware is EOL, no fix for the bug can be expected. The normal
> Linux boot flow on this hardware involves placing the downstream dt in
> both the bootloader-dtb and kernel-dtb slots, allowing mts to work,
> then u-boot loading whatever dt the kernel expects. However, my use
> for Android does not need u-boot, as nvidia's cboot can load a
> standard android boot image without the extra complexity of additional
> boot stages. And I would prefer to keep complexity to a minimum. It
> should be noted that this affects p2371-2180 using the L4T bootloader
> as well, but since I am using the Android bootloader there, I sidestep
> the issue.
>
> Are there any thoughts on how to handle this problem? I know that it
> is typically undesirable to add broken bootloader workarounds to the
> kernel dt. But it would be preferable to have a fix upstream, instead
> of having to carry various workarounds in downstream forks.

Friendly reminder about this question.

Aaron
