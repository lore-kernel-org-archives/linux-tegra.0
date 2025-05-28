Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC7D28DF04;
	Wed, 28 May 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454178; cv=none; b=PwaxbWRlyvsGGfi4MvorkROB8y3YOZ1lhNlS296XcLnWgWDaohLox+AKr4lU5uGTAwBRT7BRowGegrlL743KCNw+qmR7OYt6DxOMrmtNvllmCDkWBaXrd8jjiIkC8psRaEa297D+Y4rfQVlBXj+36kDm9OVnJXXHSUR5OkVXDt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454178; c=relaxed/simple;
	bh=2YDjtS0/m1db/xCeODn4kUX47SCzZ9Mjb6o+4HoExpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sP//iXcCpnU1k4L/MKs2jXPztXxtF445ihDZZ8H9pZgSlvF4mygMN1J3Q5n7aoeWDogC9F2xC5xK811GJ3rtX1lLbp8XKZtCmy8cy2nkT8MNNtspQaPaSEV/gO222nJE2xwciU5N+5QzJjjCp5IMla4qPi/j/tHG4O6h4XTWw6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdZST/k5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdZST/k5"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553331c3dc7so870386e87.3;
        Wed, 28 May 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454174; x=1749058974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peMrqfMc+7wlRfgY2FdKZ0DpMq6c8tEVqwm2fUCWmc0=;
        b=IdZST/k5Ay8qRO10qMZE2q1W3kg6rsb4Cn6u/nTzTY9Wa8gmrl1Qd7WoRY1VnpzrD8
         iyAGpq8pkvVVXgNU173KMA8ZkB/fTG2M45rDXsrGzpwKLUegVnBET/Gy4EjELfo/D7TY
         HLLBwiuRmWYAfh6i0cKlw55qxTltCrVTRGDMrI0gtoWutOxygiuPpyhlphuylAuk9jnp
         w2FvYnxdCaGo5Q392tgL2KMy6KqB70tu4QV3Rq+TQUDabaCagyxzW7Hm7pV6B4EnVCo1
         6ENUDFwyg+sNQXfbkVyKuDHlfpRGlFrDDXhzyjG7ttsYsWSHN5mTiqi9XjMIRnncXNkW
         dpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454174; x=1749058974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peMrqfMc+7wlRfgY2FdKZ0DpMq6c8tEVqwm2fUCWmc0=;
        b=TNK/FoVhX89SqXE8eNsHhMgzJPNCqDNI99srLSlWqfoTOzIy9OhATjg5l7xXQn8psr
         RjvUZAe7Ydb3ZOlGF88t7vP73CXL0zbPp19qgCsRXf782i4iqqzijj0I0nuxanP0//aR
         0Y398cCsPIt5TkXzoIN3pfO3Mcg4ul/rUlbg/F4capkb5jBB9OjTfy74adA7/82MjSSo
         zNN8GGaQvNdSYS3fMK7G9IjCGJ9/uasGSU0CQ7lRxCfQ+UBfP0zk3pyMcarjiKhRdya1
         rh6pIayvq7kxhNnDogLUUoWxhCoiWJrPGTkoQ3nQIUUp4uAmJ6zBeq01MidyObI8dJFZ
         1EbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsrh6K9KaX5WBWFmCLVDe596iNLVT5XVhTnGgCfwoa4BDoiatIzw4iWqsdNZHY474IdrRWCMEFIbQpLTor@vger.kernel.org, AJvYcCXHpXyUHy89A7i+ZoBFp/IJnfcB88CdWTEUriBgd5L7LmOHXTFvz/pWQWI5xGFJUxG9nOEpn9f4IJeRJeg=@vger.kernel.org, AJvYcCXX4UvhEs1kvfuijoayUOAKAGJJJ8Sb9Y+a1nP3uKiFVW8aH94gGxwivBKg2RcmSpNYzsYnvW1gWMIX@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDXRR9j5pmdV/t4VyJefpcnQo/FO32W2rbmKLW8vs9exIxgVC
	5AoIH+IktaUwR7Q3YJu/JjQwIkvcBXeo3eLOlTUNLvV4lTi/mR8te6QWP/h0GC0azs/d/qGKV4a
	/RawcKq9aWOTQJh/mpBApd+vEnrqWPVE=
X-Gm-Gg: ASbGncveauUNMW/LfLFNlHGXUiWx3+VEtDjjJfXCShsiueiW39S0qu0MOBOfyzRE/Lk
	vXvrMP7T0yzsRrF/6T2UqXcIqgb2AaVsmcU5L7L+APVc6lnCMlnl4sLO/haf8c4iJMx0a5FVGQo
	oDY7zqdgW9Gy+sr9Z5KDtQHWn0/FhgQSKt
X-Google-Smtp-Source: AGHT+IEePaTsDSCKQBBx+1XNiTRQdexhn8T5e5qosTlyR5OHnM7zWzUrWU28KqeHhk3p29C8BI5RVlENeH9tCjY3YLY=
X-Received: by 2002:a05:6512:3984:b0:553:32f3:7ec4 with SMTP id
 2adb3069b0e04-55332f3b345mr795836e87.29.1748454174283; Wed, 28 May 2025
 10:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
In-Reply-To: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:42:42 -0500
X-Gm-Features: AX0GCFtvYYh5Pgdr2LmUYuuaCJ9OV-l6idPcpes18X0OD4m3akqThi_BvBA8_DQ
Message-ID: <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The p3509 carrier board does not connect the id gpio. Prior to this, the
> gpio role switch driver could not detect the mode of the otg port.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt=
s b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df355bbcb691=
ef99b0d0c9d504e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> @@ -669,7 +669,6 @@ connector {
>                                         vbus-gpios =3D <&gpio
>                                                       TEGRA186_MAIN_GPIO(=
L, 4)
>                                                       GPIO_ACTIVE_LOW>;
> -                                       id-gpios =3D <&pmic 0 GPIO_ACTIVE=
_HIGH>;
>                                 };
>                         };
>
>
> ---
> base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> change-id: 20250513-tx2nx-role-switch-37ec55d25189
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Friendly reminder about this patch.

Sincerely,
Aaron
