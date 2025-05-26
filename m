Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE331A26B;
	Mon, 26 May 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748286471; cv=none; b=QxM1WR7QNlguGGTXlXpd15WrjcWh79wHrAuvF9xXoSTNPX1c1zxU6zhLStrJXLqD0oIM44q8tX78SNWvrlhtpYiHpvAYhvbmNb0UaDh3M3dLsybycsf+fiyhuxRX+hYtHp7Ujo5bf7Q8JT1Peqk13d2CpdBUXtgw3h1Pu4a9kVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748286471; c=relaxed/simple;
	bh=Jd5jTb4KmkWQCBRsrqLycpSlzwcrZp4vTtN+E/K/E7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoHanUM4rXLI1CaEra/qER9TK/yi15busFQyIlCoQrIEhtJLp+VkSNcZr5qX3vONstoKrcYVcEzenSjirG3MuZZ8Ek1Gs8+5hHj310UGiyZNGOerfPCgZck+y0bZ3rThFu6AJorbRwXcyc2M5rcHBOKT9UyTLhKOwilGH3s6fuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR9APU5p; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR9APU5p"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55324e35f49so991680e87.3;
        Mon, 26 May 2025 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748286468; x=1748891268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0j85VGtDTjpDFQCdwL+umSydJDHQws8qefJ7usHRh0=;
        b=cR9APU5pTV5RJpYzFZXleJ6PcTI36FQO0DsIp8hPYHfDl1I5LdQLv3IIeh7SXCzvqx
         uqbFIjLesQLzUF8SASZ6Nyq73tCF3LNo+8gXWS9S+ffYBNx697tDuFIHG/EyCGwz+E34
         9lteLVeIziksJa+zG82ZQMmuVTafHeNZwZV5Ax4f7QS/Ze9lUUWFrNmcYEdyoxh1QFEi
         mB5x2Y/SrSB8+4FvIPAlj56w5atx0cAV0Itkf65tXRiTa1vnGMMKwG+88fg38kolKsuN
         3uze9DAPNY+HW4TbnLk3B+h9eQ0l5Z3subIM9R99Av8lnYi2pSOtv+Ax61FwxckI1W6k
         CTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748286468; x=1748891268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0j85VGtDTjpDFQCdwL+umSydJDHQws8qefJ7usHRh0=;
        b=kUyay1tagBEARx1SBVysjU26kWg+E0rYgrSHdyaXFqzjUmp6hgtxu6Gn5yxgGgnuDJ
         2ZHQBs0yaEVpzvkRNjckuRctDkwxhUWUc8Og8yjsMvhqM0O7NHQ7HKMUYpfNPtjlWiXF
         r1gVo3K3qwd4nMwh02bbFSh34DU58vS+zSb+26yGyu1ug+t6Drkgvi5dc42qJwcGbMpF
         M5lmkrCJDj6RNhqDu+OtyuIN3PRgsWzpIgM4OrtEiC2WH3tV1dUNpPfLHQlVwkmq4DZ0
         67hq/TYOOShY5kr3XH839/Nu9d7UyCvxFZ8TViD2wRVpzQL5/0tOKraqt1JoHGex7+JX
         SZrg==
X-Forwarded-Encrypted: i=1; AJvYcCVz/EeTRSuGjXcvSQgyGBhljUr/3gHR6Z5zquKtJ9i1q0wmwEmgD/M5ZjPyZkuOJbGPTiG7rQe9Sq6mWJvH@vger.kernel.org, AJvYcCVz6DZXjWJWQKWfbPlH8ByDQNsQSNu2jSkwDWLhjWG2IbnsNY7r4J+3592Sm+ecL8G1uWuVAmjQGi054To=@vger.kernel.org, AJvYcCXTTmvVU53dWN+jueO7YtTupAlaZ0IZAFHWp2CsdufZMTukFHak0yUt0bXr0kbLveKAW1N6OloIAkNp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb8OBA6yc6Fx3QwtYwFbj6+9m7Q3fNZbeYSywCRg0O05OuF+nG
	8zmzwU4MhaMU0Ne/cxKYX10umeVzSMAytT4mkvoQ5CdLS8XVBzi+EIJCN+f5aDhLc8FBX9H/ss2
	WtQ3XSITrPjRIOQGKvPm90JQMrMykJq8uiBLh
X-Gm-Gg: ASbGnctxDsrxycNOSPQUUr1lln0T0F3h4PML/qejq75SeZ/xdQdBPs8SnpXEzfYriFP
	eHmGfYW+KL12vT2xeV+K7u+cRp5Mq7OnnlLMS2sd2WixpX/bKbTtOG3/otUQGtBqFdt4APBELG6
	v/5XH3Ba6ckhpWo7xUA8Ed5wiBNH3GV1yu
X-Google-Smtp-Source: AGHT+IGBz/w/5rnah0sIDj4vCDTjEr4lA7sqA0HCt87gTcEsaDVZe0Ku6jkV/I5g4XB7xN6664/V9ErwMbv3atJe3l8=
X-Received: by 2002:a05:6512:3094:b0:553:267e:914c with SMTP id
 2adb3069b0e04-553267e953cmr332285e87.46.1748286467574; Mon, 26 May 2025
 12:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
In-Reply-To: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 26 May 2025 14:07:35 -0500
X-Gm-Features: AX0GCFvz18DPCZiJnDMH4x7J9tXuLapmRabhAxjt2Es8KyNjcuMCDa2uLzBv8ag
Message-ID: <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> dt if no reserved-memory node exists. This prevents said bootloader from
> being able to boot a kernel without this node, unless a chainloaded
> bootloader loads the dt. Add the node to eliminate the requirement for
> extra boot stages.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..8fc995e71696f2ef5e662a21f=
eb96ea771c7a53f 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -22,6 +22,12 @@ chosen {
>                 stdout-path =3D "serial0:115200n8";
>         };
>
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +       };
> +
>         memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x1 0x0>;
>
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250526-p3450-mts-bug-02394af31f0a
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

This was sent as an RFC to see if there are any better solutions to
this problem. Mts in l4t r32 for t210 tries to copy the training data
to the reserved ram location provided by the kernel dt. But if that
node doesn't exist, it somehow corrupts that dt, causing later stage
boot stages and the kernel itself to fail. Since software support for
this hardware is EOL, no fix for the bug can be expected. The normal
Linux boot flow on this hardware involves placing the downstream dt in
both the bootloader-dtb and kernel-dtb slots, allowing mts to work,
then u-boot loading whatever dt the kernel expects. However, my use
for Android does not need u-boot, as nvidia's cboot can load a
standard android boot image without the extra complexity of additional
boot stages. And I would prefer to keep complexity to a minimum. It
should be noted that this affects p2371-2180 using the L4T bootloader
as well, but since I am using the Android bootloader there, I sidestep
the issue.

Are there any thoughts on how to handle this problem? I know that it
is typically undesirable to add broken bootloader workarounds to the
kernel dt. But it would be preferable to have a fix upstream, instead
of having to carry various workarounds in downstream forks.

Sincerely,
Aaron Kling
