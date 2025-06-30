Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59A1B412A;
	Mon, 30 Jun 2025 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312257; cv=none; b=lj3PwCzThYW/kANvAncMuN0tJ9VgERwSrdceDySBHN3lDGnwvObeArIQfzyIFwF5M0NOGuxs6e0PAE7NWi3dlAvPWPpCIg2Cx8s4sQ8cbQt4H7ZBlscBNVaSm4vJh1m/poOXy7BrOKJCz6u4JNVOEq3w5Rx0nmUoyEqMgmb6Gns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312257; c=relaxed/simple;
	bh=gfdqgjl0iB5joHg1i2gcIR6fqg6/sWQjvGEHoJAF0Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEjn4NPCApl/Q7knA0QYTjmrPVB6h6xKyI0ZPyMwnC8zAfaeszbMFIdaH4hOwSgfTuKOkNORLOolfI4CbWatg1PH6lJx1yvkyOQigxu0aI8K/c0vsdfP95O04zf7FPsW6v8uaxceM+nw9ytqDbplJLybnK8oGAo9diPYqPSw2Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwYHtPPb; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwYHtPPb"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b60de463so2937829e87.3;
        Mon, 30 Jun 2025 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312253; x=1751917053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io1IRL9x7R219XfORTg5XLg0wb8gKj5Er5Jhdw3UXD0=;
        b=PwYHtPPb/Hhcp5eepUiAYaJGArQ3Tfni2cEtqsYrBna9yW3fFl71epVxeKsxfP/3Hp
         2HvcGPGvFor8mFx1NwuotglU7xau+X4sL1etMeLt/d7ju0QdM7iaVWiwjkeK1U1f1GCH
         COxgWj6gJJdtufTWqtOM+WW/f+tTakqxoRI0NFfvMptjd5nmE5EkptYI0ud045LCOmlx
         +ypl7IDuJPvdT3uS2JBLWX98a5wrvNPj5CEkwvFPnahOP8PSqTAcBVUYTDkgCdY8K+pa
         SIulnKS512pKPHhh4J2bEhn544al+eSpAyu4IbVt/KY6YUXE0N1OdxCQffcweSX8/AB7
         WD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312253; x=1751917053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io1IRL9x7R219XfORTg5XLg0wb8gKj5Er5Jhdw3UXD0=;
        b=UcH+sBGBkQpGxnq28n1VFXoohbicEvT75x+W5B2hMa5+kDcrLpSx3QSmGCvl/87eTh
         QHEn0jpzjWdfgw1NdCOSMo9SerF2/lsAUGgWWbu0rksQiLnuVsvUPFuhYLbRut53K8c8
         2HOm0n/8fypcjjhM5P4uEVmIqbpUisxmDOnU+cGi50TqZzS3+phHNJZfQYu1e5pa3DOI
         BCwiSmObXmgIoPaKm5DpdKe2rn4IjDPa7XVg3D+ZelhEwR6F1W4LLZ+B4v3/LEdQXGhP
         gznFi1lW3tAK8t2tGewUuxOuoxdYy3YZHE7cMmLMqZPHiE4IM/Tj73QqY1oi1CAufDYz
         eVyw==
X-Forwarded-Encrypted: i=1; AJvYcCU9jTYBN/95PuvtLWB8lcXBy1VQhBXeytn+8x7tsL92sdzhXDp8Bnu6uXb3cTXTh8puJwsU+oc4s0npqtc=@vger.kernel.org, AJvYcCVACDjhe99ez7Ekm9oQmn3Vr0IdPaDyLvnx09W7gf9ePUo//uZ2JnidDdzjwW8SnrtIdfxtwfxAXbGaRT+t@vger.kernel.org, AJvYcCVYbyFNqXT1DtYJijBt9c7vv+uXgsAgJeSEfoWEql+M2d1kC5HohmNcVoafpGtNYjDS4PY0hzGL5dWe@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbmgjFPh68plgS9xOx1UmFwC08irP2W6Q49z25IH1EztbTSnc
	PgnMTBvESKi7R3UEf1bcNLhngooFh5d4TsqkrDwPB8r24rzddKJ6iAbelhTo+p7VodVfSB3/aUl
	K+T6i06acPH3/6Fo7ykrQrMfQidsA/Ow1j6AW5V4=
X-Gm-Gg: ASbGncssDag8YSPdTbO+WW49hAXho1Oio9I9Q2QfcxVbpTgBj6ZBC5dh1kIXr5VM8hP
	wMGOkY8KrcNTxppmmkTaTD8khsq/pLNb6M65rb0Rzjo14KNDXICcqbFaeR519Q4GCTFwEVX/lT9
	GG07gXvylEBeVNQ9lB7WHPNsSTlLNfvrXJ2LEOca5Q230=
X-Google-Smtp-Source: AGHT+IFHAl6Wmn5tKfgNiiRAImA891AM/TwlgsDYZD9CYlNCw/EsEqAbvFca3Im8a1pS66orO3qEU3Z7VXTHT60dPxI=
X-Received: by 2002:a05:6512:132a:b0:553:2c65:f1ca with SMTP id
 2adb3069b0e04-5550b868609mr4111137e87.19.1751312253256; Mon, 30 Jun 2025
 12:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
In-Reply-To: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:37:22 -0500
X-Gm-Features: Ac12FXw_9IoS7hqCMFNVMr53CaFw3dwiUXobN26FZrCcytJ6Lw7isswzQUpst14
Message-ID: <CALHNRZ9tjJo3LRmpaGsEsf2=Him0O2J-ZaJf4UZ8bcbz1119BQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 1:53=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Fix usb power supply to align with downstream power tree
> - Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avoid
>   conflicts
> - Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e4310@=
gmail.com
>
> ---
> Aaron Kling (2):
>       dt-bindings: arm: tegra: Document Jetson Nano Devkits
>       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
>
>  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
>  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
>  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++++++=
++++++
>  3 files changed, 66 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250513-p3452-059708ca9993
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Friendly reminder about this series.

Aaron
