Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410832AAA8
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697048; cv=none; b=Fcf9FIygcQ+WMbfyYSBbFXTxoeFdTS9E8XytPXWfmXESdVzaQkcv3gbME4i/EJeWYp1vFakzgMsAr/lfjoXTuF1mf82HKmBfWjG2zujyNfJrQ2l8mbK1VFMci2T7vDSD3acyB2GqavMKklWHVgp69gSOWZnxVtPGnik/RmtWm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697048; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvgh3N7lmE/cB3wH58vPkUbm8bLVJqJ3k6dSqaBfV7jfcd5nT8s10IpcerD3SCDPSAJ+o6Ilrdf9a43UheINkLX8fkUAGS2WYsBcIEXaG+2yFoSfDwoENqN6hgaMBmFibZRSOU3nykR5qMRXyu+3X73vCm3FZz1EIcWSgTQ5XUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so28775806d6.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 23:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697046; x=1773301846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=B7Fg+ZvLg2St+7nWKEobR4SPUVrGGYNLy6xYiPp+w97SzLTECK/GqvCi2aSdoP4DWK
         dZky5KhfsOQyKWx/RU6pmSiXGnDWhNmIKWiUVWxUzBfpTvFfJAEyW34JZE309LEaOXMU
         Eb3ofuLYWlQHEcsF58sbPSaVMuEVOjORBKaEB7x6p11jjYKEq/bs7QUX4WOP+CC49hUp
         j4Q7sVaYGxicBNIQABB0p50v1H8KIvBi7oiiX3VCUAhDKisNt04SuzTUFT8EevC18GGz
         G5DWKBZ5kcEBsfx51vjNW+deAUDrKRuZ8zDJWYOlu13Un5hlERVod0JgpMgiinNTd+2m
         5IpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtrADkJYA3NCOy8tNs9hedCETL1H0pRUdrMw6CRxoUNlVzNtyS5+X08yWhh8HrCX/z2Tx9mG+NZnU3Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0+5aUyjf8YJ+YZtwpPps8rH1NI87er/n2gBGzuVFGbwxnPJS
	NooBWzxIZgZcreaAH7o8q6rdVWvyg6pm+eGWPKGjd56i8WWCG+S9qgFVZoLlB7pz
X-Gm-Gg: ATEYQzxMqmqV74uobDzD9H42nR2ypjZ5bhQDUTW4qqjrAySKMm78Rf80e5rQT5uRLgg
	E7yyhTfv5UvdRxIQAoAZdly5b/rQKx0bVvBK3Z/ghC6p384v3sA2QoOAGM+zt82rbbnY/qWcc8L
	smsNKl0ueKiuikpGJPjYj2FDa1bYn/q6bU13iSRxLQAWF21WURvMHssyQ59z6gMzPSIdbLcnHwx
	grfy071kDX2skNGz/FBOwNy96oAL8hYnNJvz9hOuse3uCCvkr/7Z3rIoMIAT5D47LL1pvGQvYkU
	EooZnLoqim8QYqUhRqaUrXwgL6EkSDh0H6TnroL8TME2cX1kP3iUekSRljpI6eav+9XVnYxoC5j
	gV1JJwysdaFKRmRyBw83v/0w3nKXQoH1N3adX9TyW6alnJk+U3t9G9eUmWB/MG7ilS3CH4PchyG
	HV9rZUfDEaieT3AcxTdCWvbKXVs4XQ4JkY8iWCxt8lx09c6I/DoXL/2Z/wNx54
X-Received: by 2002:a05:6214:262c:b0:899:ebc3:cdbb with SMTP id 6a1803df08f44-89a19aee5afmr72598376d6.35.1772697046305;
        Wed, 04 Mar 2026 23:50:46 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a1fecc2bcsm21785926d6.42.2026.03.04.23.50.46
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:50:46 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so28775726d6.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 23:50:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNSi0pzMlgckD7uLX9guwEajbcmLciEAMi2w/xfVUXwH2BXzYzxyxi6deSNYKdUqYDbY/BsS2D92JFWA==@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
