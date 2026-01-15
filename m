Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FD242925
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768441955; cv=none; b=hGYuFwN4FDa45Ea12uXESLwvDhE0qLM5zMbBOr5FdYhhYgOHm7gfbuLve9WMJW4Q9c/0VMPurZbQ3hkpMDstoh+7DD6H1WD5n5pDLuYDmcWbsfCPOfcUgYVLkNKAiHDF51RX8ZRItdq0611PA3XMeeAvAv1Pr3LWr5oz0YQ0yUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768441955; c=relaxed/simple;
	bh=JsUIR/1OXo+BahiQ+lgaQs8O0CEy9G4etSPFreXSyck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMJ7iO3+pyVBh+/pa8Ap8VfBpyjNEFHSlBlXZO5M6kALIeKmMQUnh3Q99Gxe4Z6q+K+rN/Hd9dzwc6cexuSMUJ4bOtWawMDHsZs+/O48c239OaEAFFyGkMDqy85fWb8sFjhnrcGTh4yF9jSnqeFUySS+vqNh5f56x6UN0jYVwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4LXB4Un; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4LXB4Un"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1220154725fso308777c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jan 2026 17:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768441953; x=1769046753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=B4LXB4UnuNfZE4VXK89k9AvbTK5J++Mk1n8+hOvknD2J0osNcirzOmmboFeCgHsgft
         tdfmN2oamg/jbgKvzOwy4TEXXWpO9p2Lp9AB8zqziUZv7vh4hZP5Vh4hJqZtxkR5MOhI
         avGiOpYpEYo9xrI28y73YSdwFBQQpWCUYMbtR/TcOBdooTWoGX0hKamZtyXnRpqTnACr
         evkMtj5jVycmmgq3Y8cfM/LQCK+MDIcgVpUuFaQ8w7ZsAfniEx0IhV+fc/LcqDJT+wuU
         N9mNt1jJFjYkoHcmfTMEWnxtp2l+ovic0Vfmoyo5w9EcZDvnDKlzqk2s+LN2Eg6x6ZBy
         ypyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768441953; x=1769046753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=lQkrWaTtCLhKtpZlLcy8ilOXoQKRX59xKOiCI38po6hmDLyk8fJBOUzCK0MLkI6ruN
         tOTGfIWIDwgsFjA2M266wD3TIyeTcDK0vO6r7OeCnMfgqBVKypmXWNBeH67A9CHEMamh
         pNIq95iXPNLAByvIO2RS2xGC7VbzUVlieo8VUERNu8XVERUTroiImkZT8xWWzvQ4m3rF
         4OP4b9Tdc207eSKjF0dLPZAbJWDqd09hU2+OxQXjIvEDtGBzVbYLx664kCxNKAD5CNcm
         2bAOQdtvF86hF4v/jsXZGUzGRj8w9TD3cDXp41PGVo5LQXvzxwmgppaaOX5jv+TNSsJk
         Mnlg==
X-Forwarded-Encrypted: i=1; AJvYcCUx58YJ3rE3/nD4nocVabV3/2xSos0D60igbMiHoLQ90VxDF7sglY/O5ydJeoU/zv9jqFYKXq1tcSReZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9L7+UBTJN+1dmZk7N5zr1SPaWDMddkxVqOAy3kddfmCXlfWyu
	qC7XDvH6WbLUYBopoYKT5fsnnOLE0Jd8WUowtYXphGgoTUMy4bkMjEaU
X-Gm-Gg: AY/fxX6GpF4P+lQ3Pb6EQugLnCepVCeeOKjyBViW7t6haBwdL1PZSsSxIp6JCMCMuGD
	LgouWmUPaHyQnidyeNdqskM3lHog2WoMok7x5T5ag2MlkNdqce93KQoo7stPSlXo31y4xEU0U3/
	kswBPoBTZQB54Yy+LvpAgWW3gN2WFGi+rIv7LQXZDF8/DJ7KBspPlxtEIxjtLDLZqhNaE04uXrB
	G9hv1ote01CRAl60D05wQt0e4fxoC2Ncgx5u+aD2aMuRiar6yCyt5WPqWsXpeBa2hdv/dnRYtPK
	zbdFpVcPR4PgkLziXlXtSQoI3IzNCGV5/TOgYiXqZRWanWZ/UZmj0822fPCKFsROv1FsHroUDAT
	JGKmpncsLHUFXuAGgWszkZ4O2fOK5xjO2u2LBybVBU/aSTUmY9PvMRiKacCeFAdWyScyEnyuyhO
	GLWe34T27jUA==
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr1505698c88.22.1768441952848;
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32727140c88.11.2026.01.14.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Date: Thu, 15 Jan 2026 09:52:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Message-ID: <aWhIOYIWnJy7mhkc@inochi.infowork>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 04:30:04PM +0100, Krzysztof Kozlowski wrote:
> Remove unused includes from internal headers, because they do not have
> following: bit manipulations, mutexes, spinlocks and struct devices.
> These headers are included by actual C files, which seem to have all
> necessary includes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
>  drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> index 759c0e604acf..973ab9a38fcf 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> @@ -6,11 +6,7 @@
>  #ifndef _PINCTRL_SOPHGO_CV18XX_H
>  #define _PINCTRL_SOPHGO_CV18XX_H
>  
> -#include <linux/bits.h>
>  #include <linux/bitfield.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> index d481973fcf97..1a2b00dde1fa 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> @@ -6,12 +6,6 @@
>  #ifndef _PINCTRL_SOPHGO_SG2042_H
>  #define _PINCTRL_SOPHGO_SG2042_H
>  
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
> -#include <linux/device.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> 
> -- 
> 2.51.0
> 

Thanks.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi
