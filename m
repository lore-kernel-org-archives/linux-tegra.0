Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA438D005
	for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260123; cv=pass; b=ANcGbsvjYqseboAZPC37Pc8zUE1LAMPllpXqRVGFhJ8ATgaieJqygnobWbHiK8HzKSlH0wXKWBcapgWH1HAv/Yt774S57KXn8lwAEgE6rETxwP2+xzAU0ws9ltOtHQcM5ADXMExmZrlhMeEt+ucw/dENXE0rzWOCP6PYx7IADX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260123; c=relaxed/simple;
	bh=qCUYBGAUOheU0nTCcMZyCl5y4dtCdasyHwmyMVbOBCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZKhW+fzym6EVpgkZYrD6cQRCSvhfE5MKoP2FfZ0H0adEV3xclxv+2Het6RKmPRHarRzMzxM4K7rBKXwR2Qqe4Cgo4mzHQzEKUOc1I1e9GKKG7Hrf9Mfi5aecIKer9FIwhVpXTevlkUYsHOGH5W2etaFyG33NcbTF5h+fEexG6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWe/prAY; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWe/prAY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso34932266b.2
        for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 13:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773260121; cv=none;
        d=google.com; s=arc-20240605;
        b=UfIh5BeCjHj/nfywMxi3mE9zxPZKuOUWBLiI6r6QeHiAZnh0U3n34OdmZOK+q2JeR0
         ZGLMWqZ1fA8c3x0lplQasDW87ZCCxw7sjpss2CmMNNt/5zyiEpanFrStukLlg4g4lf+Q
         TdWgmBS7J1an77Vj/wVfmdyasGI9L13+JWSW3lp6svnD9ieh55sVSq7TKNduagcTdQXj
         p4ZsdwsHP2N/jh6skCqMpjPrG90etjyWBCNYirmw8NX2Uh/8MtjNjGU8a29559COlzLT
         alwm48tAnawYNjnZPX7SPkCD0h/YpspokHNKe0rcdlu7oeTZgIpXWJDumoxIAAjVzDbi
         JmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        fh=bh7njqTEg4CUxcjynFbGw0NKwJ2FCywdlPb821Dip10=;
        b=HSJONBx5x56N1Z36fbXqyOWdBNjvt477yrUs9K/a38X+6PfJlrfyZLssdlb99REmil
         LN2572aK/vkS47ikPHLY/DC+Wnaw7yZshoGKiOr38N5Ar4XFoXNEoJQ7GdK4Ql1wgyN2
         Rzy9D+XWV3Md2z0BW/YcjMYPncmPjFEifvBgWtxCKQyaMF5FxvOa5l4B3+KI3W3UoBrh
         IM7NMBK9F9RUaI/Wvx07TdlfWqLv2dPwSb4PQ2VrNTiIaZPfQG/TAmKIq/yyTbVutwFi
         jAQ2klbjGDT2Jf6QhUjz1aumnl0AMwhjB7Jz/BOfxdc2tx1NrDGo+a8T42gXeRZNc1Ws
         E9nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773260121; x=1773864921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=nWe/prAYzvBDiutVXiO6S+1K2vIf87NlcJjxfML+QuWQ2JitCchpJ0EET506sfrXvv
         yTqYq99l9QF3PfHVikdeebx8GwUPquPD9q449ZlwFS+Gmq4WtrvtfFwT3NRZxQL5R5Vd
         LmxYUDee4Gq/dzzYlZixAwza8lw7PWwWTa0XW8fQ13XWdwmB4OjH3rBvrsIz0DPh8/Vt
         opkVQQY1LGDxOUs5vestd7+UHQ24SjLdOTWKX1ix7I+rEA+8wEqUpk2vVsZ4FZCgoY7R
         k1FrYcNQAn/VR0SG2J+xoY64k5Hkt2owRDbGWJ29GCC34FAy65MIdVnhQhXTBbMWjhCg
         QFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260121; x=1773864921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i6F+UW8vpaPOSbe+aow4A6qQsDdfkrJCugB1bxi2H3M=;
        b=w418QJRgOpAa7Jwpnl8W/Me8MmNoJ7kVclq36ztCuodKs/2XaiimdnhkWZ2GNSzBKC
         hMwokcuOb4APNcT1c13476Rr2pLpdjxmMar5sY/YgtQOQP9PTkE+MpimKUkj1AqT2XR8
         CmJZ0t6dEvWFa8Tq9JuDDhSmcwtK+FklQFUqeW1NZ/s6TgVkr2hw7WRd7tqTFc/YDvKy
         Iq7+3655RPzX+r+rSgeTRkJzNzLCzMKyReIEwj+O7Ra8O04WJYAFkP8dN93OfaQvTGZ7
         pF7Hy2m1ozAlkRaTnEMK+fpaI+u+mNnejULsYfp0Ait0uonbCM25WTeqFk7E9/sjWSBa
         OIiA==
X-Forwarded-Encrypted: i=1; AJvYcCWHrlzwbQufVrS4+7ZqUm+XBuaQf52L5WL+rcypNJsNeg7A0X3i+opu1nVsLEQOwno67TlG/+QuZynxsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO650xARCuW1SEgfHuVh7eELEI1phIMb9Ceg4Z7/YmAzFhsqfU
	dyVvNC0y3ASU3FZsjUOgWjbEDUK/CUyxAAPFi/TlFl3ij7vVfCwcim9AnuPH25Yi5gsZyoLutZ+
	lRNPWM/9p2tPwna7PgcFsAorzFMNeNYc=
X-Gm-Gg: ATEYQzyaaysS367Q0ZZYyu6uR45SttVJZkaXSw/QY0ui9sCZqZCO6DNG3QwImFLoLn8
	zaclwqa4RfHqGkIicjGOorodOKWlLL+s7OwSR5GwhxbVK6zn/d7e4YlBa3+FvrVH1+zL5f2HVHx
	64aDtctxr4TU/6qymVdHDSB6E/l90XJM7V7JIFo53k4vxRRa5wyDAr3IuEDFDy8RwUHs2eNMP/C
	RvEYAO54D7Fu0DXUXIOpBX3pHtrBfXlSAmRnEqytFb0JT6RmSGhsL5Lub0/Jgg//9lOxyByIeE3
	YM3r3xgddPG1v/NxDAqCbumboEJ3uFSYwkZC3Fg2x+14nPtpHCWcvj+mtUg64hMtomttc+GRgDL
	/0/VI0Wa43qy/ix1cLA==
X-Received: by 2002:a17:907:fd17:b0:b94:1df4:3525 with SMTP id
 a640c23a62f3a-b972e20f6c9mr213172366b.1.1773260120699; Wed, 11 Mar 2026
 13:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
In-Reply-To: <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 Mar 2026 22:14:43 +0200
X-Gm-Features: AaiRm50gZlAiM-5_F_zUlx0D2HjCtugUtf3WuAOsTMIp9Wv8sMtNxrZngwvWk-o
Message-ID: <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
> On 12/11/2025 13:55, Bartosz Golaszewski wrote:

...

> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> are assigned a index by the kernel from 0-163, but these GPIOs are
> not contiguous with respect to the device-tree specifier.

If I may ask...

Why? Is it sparse because there are pads that can't be used as GPIOs?

> For example, in device-tree, if I have a shared-gpio with the
> following specifier ...
>
>   gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
>
> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.

To me it sounds like a bad design of the driver for this SoC/platform.

> This is greater than 164 and this is causing the above crash because
> 'entry->offset' in gpio_device_setup_shared() is greater than
> 'gdev->ngpio' and this causes us to access invalid memory.
>
> This is what I have been able to determine so far and wanted to get
> your inputs.


--=20
With Best Regards,
Andy Shevchenko
