Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A937137923;
	Wed, 28 May 2025 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454341; cv=none; b=jy/p2Ps7NQbDQTaz0ZBEA9xUEdp91PCozcxOnfXKwC9efKPdxi8vblt0xzC8Em90mXJabhwgOoa4WpfCtHrFSN3dQYjOlqTLQPw2CZg6uy/GEcu7T4Oe0qKGS1eHaFRDxRHoRNV4xdQacxLIyAUsoannSlmHwMotUxpHGRsjlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454341; c=relaxed/simple;
	bh=60APgDZJxBk9xro71MqYiSmTSeDZs9bMdWJV5wfWH1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxpDEV6zG3URBTgoFQfRLfz4ziNbkYO6PhKhcysjV2h6gemQMbV9OqZOP6TjZp6IYJT7TBxynOftFdkfgGvXv1s/QWmjaJZCOJ9gRaIfm7Y+TomPDUmiyT+WVxXnfL9U9tw/afc5GUMd28t/fpiQu0QUXzZSSO5oRYSNvV+Zkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/ylC1KB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/ylC1KB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6137144e87.3;
        Wed, 28 May 2025 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454337; x=1749059137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfbvcUyjsrPaltQIZdnZTuOiypSudH36zL4/KM7+5qI=;
        b=C/ylC1KBxFtXUIGBfFA297wmgjdritfIVIdkNIgMYJsLYzZX8kvTC0XcBRoQksE4nr
         nKn1JshinJIjXlWi0Rv0migwpb6GajLKMLB7xTrGRTuAu84dPOqHYiSalgqTYsRVfJNs
         yjlffVVnY0xndv5S+MQbnaMtVMLO+DNiVQZ7eeq6uzeEB28teMR3/CdFVnlwpyWBY3Ab
         gKBVpKiBdW7Ozedmuy21EaVXVE1eOmLX7iHiatzY4Z8DmGZ2XA2UlrbkSLvhj5FKNmiP
         oAwXzKM4WuM2ltid42CfIDqUUfu2V+dhpPPRYqOJhl+BU1NFkVtiHg9eMGHkW61xCW9b
         JoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454337; x=1749059137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfbvcUyjsrPaltQIZdnZTuOiypSudH36zL4/KM7+5qI=;
        b=Qvj3OBo75H+fLiWefEM1yRffsQM7V54QzctheeW+jYO+TatrItsMt3RPJrkO33evRS
         5DyzIRZ4LOU2rfZjMtQ3J9o4zD2rJQYSDLWz2G5jekz5wbEaB97VjFMaZOskFevV4lj5
         W8LPipxzZ65FBDjLDcz4ARfn1L17YHKwiCt872SfIsmN5FEmeMe68G/Czr/vZJnyMGQu
         +T3wV7l/xN8KbnebMKu5IUUqWVAom21YBVH9/6KtiBIYRI32caJLNEc+nBoyY8yUuMaj
         1zfiMRWbcUBVHWcAzCUR6qQKDYP926aPgOOMJmfmezIquP1mWhtcUYx2o135ZugwsBVv
         8b2A==
X-Forwarded-Encrypted: i=1; AJvYcCWoQwJjVx1HoT/TVZCQKAvjApIJgZAX+9dFcurtzT+XC++tsBXSA4Xj7pYbtPX+sE0xG0EMb0ZSXPAaqLY=@vger.kernel.org, AJvYcCXUYtsTd+LKrQ0g5tkLu/h4dTn3tIjN9npzmqBjXHt3X0trTdzBrxNiONkNZz5Wd0xRKlhJ5yE+IlLARDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8d1Wrp9SUcPFnH4I79CaVpvdCHolwasohK5NYcN4cFZU4mHR2
	dufFxcLPNmw7ce4aXNNBpHUPi2HH9mryO/iHhvFTa5stiXZRcLulxs3DO7sFYYICxC5/pKnB/fv
	t3IYKKRaDEX3nl3nDOpbRYvwkSsjrv84=
X-Gm-Gg: ASbGncuUl72xl9yH3842bY4IgBGsRyS6Da8YyT6B8RDrRLA8oh+1lFs65U4nlDNEWgz
	+BOchGYjP6KlV0vog//X0WL2Th8OyFKaQCKfU87dwAcHLz1WFmN0NInSRzh7D4kJq9PfTNpXw7j
	3mNw2lFTdiGD7UPlfT1KWqq7cMKNVSUH2AbPN00838Zz8=
X-Google-Smtp-Source: AGHT+IE50d5cC46kRAB7AG1Wvgv40PQ5flcgNy54WFeoBt+wY7VUUu4UH+CR4hMgrhhgp1YCMK5/SyewZvJ5ZJUiAgI=
X-Received: by 2002:a05:6512:3e04:b0:54f:c101:4c04 with SMTP id
 2adb3069b0e04-5521c7c47a2mr5617350e87.46.1748454337119; Wed, 28 May 2025
 10:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:45:23 -0500
X-Gm-Features: AX0GCFtw6EOz4hp5YkRpjgPCO_GRJV-z3wAN2pksjWiT0dZd5iq6XbMFR1v4t8M
Message-ID: <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:11=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0f1=
c2ad69d6e5c14f2 100644
> --- a/arch/arm/mach-tegra/reset.c
> +++ b/arch/arm/mach-tegra/reset.c
> @@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
>         BUG_ON(is_enabled);
>         BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SI=
ZE);
>
> -       memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
> +       memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
>                         tegra_cpu_reset_handler_size);
>
>         err =3D call_firmware_op(set_cpu_boot_addr, 0, reset_address);
>
> ---
> base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
> change-id: 20250522-mach-tegra-kasan-fabd0253f268
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this patch.

Sincerely,
Aaron
