Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B924676B;
	Mon,  9 Jun 2025 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443168; cv=none; b=EVyB/TXv/FGhBcG/xJhUyMcMDicw7OwHKAIUk6pwvPvjVJOIVeu9DHDSXZrLmwnCfG0AyeAb7cViaZ42pozj12vr9sIsPSGBHYsvzE2xlbfsRqNf6cnvf7mDno58tBsGIz9FA5P/2sSaafii90oNL/zETbuqllbe9C/bJxx3rWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443168; c=relaxed/simple;
	bh=JFEO9n1+3PQZ4EPiELOW7qo7HqgYcU1fQn/Lp9GM3DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ab7+MeLRr6QMAmX2gJAbZnNqJtSb4bPZB3qevEAyz2jIF4b+pPLXeXUxcqsC2gpYRtrmRtSPQEjUAYc4udHVQ0t7Rd7BF8nuIg/ybqR70+JoZahMHwn1NTApQbyHySAqkRTPSkqqc5vdIfqQd6jfBnxEO49/4nsYcjWlXcVcolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKL8U3Ym; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKL8U3Ym"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553543ddfc7so3777353e87.0;
        Sun, 08 Jun 2025 21:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749443165; x=1750047965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/ExlTIP6aOUJhuSG+JNysn/YwTbsT3mA6t9B26O85k=;
        b=UKL8U3YmFu24cbZ/o4zNO2WmkzKXv0KCvhF0nkp6+upQZ9eTcdm5yR0qOOFUuf210W
         IEfa5oQDJcgb9k/bTQrG8AVgMwORNTRiqwCRVT3OxUMsnI89q2B7Rme3Y1e/X6b1KYAz
         1fZT58gLj5sN8Z8gqJcWnc43ztGQM6KfCbV0+0jGSt01Tya10om3XtPiPh5g5/AaRbJc
         sN/+F2/ceTrMmCVVnoW6JdKttD7yEDZadwZ5PUPOOLlPc5zhs53pjfYFAaI7RolI9vm4
         AtcRc8H7QPqjEjHhgKFawVMKY8F6JqjkRJlitY4h0Tj9GH4DiakU+zybBHoCkOcKA2Yk
         Jiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749443165; x=1750047965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/ExlTIP6aOUJhuSG+JNysn/YwTbsT3mA6t9B26O85k=;
        b=i/oyvWpXdANd6mrz3kEMv+VONnQzRgVmRqCWY4wEQYaOiqdxetDq4foRPF+kxDQ9sS
         Ba1sfRn2H3Jn+ZcJVEruYshyfpgwsjEKQGtgFHzOsD84qUzIX1+ZI+gG2d2jA2B5q+L3
         wo/SvKEz4BRBP1X5PT3THLhtPqmS5BMOvDn0P/GBcXzQcT7h8mGaImuHWK0e1+1K6a5v
         InHMsMbl/p6WGt7gD73QmSjUgpEyYHDuC9kS32fOqqst2CkzkM01moj9V7SlYzjgYx3Z
         imuq4/VqJUihnTsNQuTI1TkVr6Yi+Da53T+LCTw95Y+AlzQO50GRzWKapav6RxbMI5LT
         z+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUGHZ5b4xVEikGdwcphk2aR/hTFWpOHDQwCfr8IeftwQx6O2+v5Ax0AYFHp3YTbeSkeQGmVxgBUzpeApVxs@vger.kernel.org, AJvYcCXCnFv4GZ5JmcRdgktMpWzmoueeF9OFUBPa25vePVrkSTSviCcJkx7b7OcxvDuvCFn/TiLmnbKBjPPhgDU=@vger.kernel.org, AJvYcCXLyNwv8uvPAdgTelDWlnYukiECitAcmK02gZiNGw8EVRH2nJ+XFoTWD0KgO7A04X2Or+VqC4XeW17i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz28Lac1qv9txcFHEhEcDdDSzd9ORjRaCwzuEU4f1MK9u8SecZL
	H+ma8VMg2bfLRRNCOWJjGlmkB+87ehq3qXFa4OT+NlQewF2AyxT7HbNtUtsAMjvC6mNleVxPU1V
	+g4NzBI6VPf2ymrWNGYyrYnweRuqR3zc=
X-Gm-Gg: ASbGncu49FrOFCPkl51c06bA+RYsXJDQdwPJcoc4LH/RupRtADYioXlwtYhbZeBtTE8
	sHn3aO+N6dFa7VbHUPjCwSow2GKO1jonqFFwyuFFdUw8TjOLV0PzyOEF7Y+eDgBRac/s2gJUYlU
	yHW5efA3zJRlyd4h1XHHxs9i2yOJuz3Y1xSHidlAYwKm0=
X-Google-Smtp-Source: AGHT+IGpq0wXD904VwT/L0I441O1rQElKdvc0iIsIHfdsRjkM3QflASIpjJH1MUJwAyYGUdC7zXQLYi06b7NvDvWEC8=
X-Received: by 2002:a05:6512:4010:b0:553:2034:802b with SMTP id
 2adb3069b0e04-55366bd803cmr2736153e87.1.1749443164904; Sun, 08 Jun 2025
 21:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
In-Reply-To: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 8 Jun 2025 23:25:53 -0500
X-Gm-Features: AX0GCFu2iEkctooz4rvvxCSQcMx-pD2DCrywqkiVjM7mupXMTPNudJ3QHuT9zfI
Message-ID: <CALHNRZ_Zo6w2KgRTEPcJuZi93bOqQD4Spzr4+YfqnxJZVnUPsw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Aaron Kling (2):
>       dt-bindings: arm: tegra: Document Jetson Nano Devkits
>       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
>
>  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
>  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
>  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++++++++=
++++++
>  3 files changed, 50 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250513-p3452-059708ca9993
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

This is sent as an RFC, because it doesn't fully work. In my tests,
this boots and everything I can see works, except for hdmi. The
hotplug detect pin never changes, regardless of hdmi plug state. This
works as expected on the downstream 4.9 kernel. Based on the
downstream kernel dt for p3541, it's almost identical to p3540, and
I've mirrored those differences in this series. Things like the hpd
pin are the same. I'm failing to see why hpd would work on p3450, but
not on p3541, when using the same boot stack. Does anyone know why
this doesn't work?

Sincerely,
Aaron Kling
