Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0E328FD
	for <linux-tegra@vger.kernel.org>; Fri,  6 Dec 2024 00:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443644; cv=none; b=ATlg3tz1ZPeas3+isUeAGA9mV72TB273rVUAPAu1Pp9nEx//oD40A8ABuYcReWNwDs75UHkZm1ynWBJkmIqdARtwu7aGXhjoZv40jrNl85FRYsAM4KDmiDpygOj1Tr+rcTixdBHAufT32jRHJpTY7bZSeW+Gx7ZPIyIRTM+LExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443644; c=relaxed/simple;
	bh=nnjHDCzFaTWveVGNkcYt6mZ59RAWSQSdYXvcFEVAsxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXCFswkE2Ab4gtsswHRlzvIOxXvQgtpWD9LFCSsGhc8EVVdWbufABcNFspZQiLabiPAp7goKo0Hn+wWe0y2c/tNsN05usVLS+F/u8o/Qg5dleE9IN8yz/iZumtNGrnvoQFEm2FEk8/hJAVQbrL/4G2C6iNCwegQcCH+naaSYJEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v3zWvSwZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v3zWvSwZ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so1567273e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Dec 2024 16:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443640; x=1734048440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2doDvxK+CULFQ2UnwWf3U8VWA/Vt0nltw3QZqY77uc=;
        b=v3zWvSwZ+VuGrp/xBvBrH4JQt1CGti8k/lm9SfdyctuGPwTCTbIpq6+j8Q0B8eGClK
         Zk1G/0L5TckseiYkejjlhM6JVhK83Mnj+NBq4Y8QX2kr07tTmAIV2euZh3EwsSPpCnLe
         I3ArIDDqWevqWMFvMRIgLp/LCydxH7ZIauP+gDxLr7TTDB66BUAhQNVt0vNAXXoWHpyy
         QBklzaLYV+oZrA8008ow7eXS2vAn8isMUp6eGlTJu5SBGv8ZtYqDkayA0nsVmuM2b7E1
         hmteKs9siXGKSZXrtZqMT7w+8gHwpN1+rwE8pp8vcL68aW2LRxXIjHa3479eGUn1ITtk
         ZCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443640; x=1734048440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2doDvxK+CULFQ2UnwWf3U8VWA/Vt0nltw3QZqY77uc=;
        b=M03sowJlQ+CpEcApUDou8YptV7xmj/NGTZopB52tpIszSrwT6mzO/BLdw+L2aRaLQn
         eACvJo295ACeid2NkoAu9gr7MOx09jjvroYSAAPVEbp4oAZotYfIPoy31atg8vszAxEb
         Sc+Pm+WIq1G42ULnoSaVNn7w68P7HGxxB4QBkxKPdvmuOYbihHHG3yJoe+ATaYP4Tnoy
         3jVnn6QHdqPlINEwTv/YRP3GNIvB6z9s4SFpMznP6UJjO3yakKNjb3kHevuFIBTbXIaE
         2pxQ2uDAy/hRl0+YwxHnI+KWjxSSs/uVgliWWKuCd83BdFE80WBmB2S9gkYul9AFHnyN
         GYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWG1MRQUYllpTjzEb6nWPJFSxvHeuUEnlWPcfhMi4qCyCBko2pMpJfNmL2LbQr8zgiou8cSrNTCh2E6Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6u5+y2bRwbNl8trM6IHe5NyqqTF/ZKcV1hW8k1mNbZlWtuzKA
	XC28tb8a3zlpKOH1mhwXZPyRTcVNuDu422knEwDwqKAuSxv8+FzC67EDPAB3S0GbX1bYKNNaQMN
	gP/Apy47VVGPiJPVRXJ6tWIMU9aObizSHt431
X-Gm-Gg: ASbGnct6265RlCx59jMc+NNHQDT+brmTyt5cpO66puGCmCSIj60GIRdcjjVllz4t5Fs
	m9wtd0ycZOo00Kxifmme8ta9c1gLzbQ==
X-Google-Smtp-Source: AGHT+IHaI0AVY5lyobeFZl0k/V7TMSyEVv+jXjth4KpfJSRJPLcy/jwR6tpenWO36YP212k6Vdyuntsp3cqW2ONz/SM=
X-Received: by 2002:a05:6512:10c5:b0:53d:d431:74fc with SMTP id
 2adb3069b0e04-53e2c2b4b93mr245681e87.10.1733443640385; Thu, 05 Dec 2024
 16:07:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221627.2247598-1-sashal@kernel.org> <20241204221627.2247598-9-sashal@kernel.org>
In-Reply-To: <20241204221627.2247598-9-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:44 -0800
Message-ID: <CAGETcx82X2bYd4kMuFo6UXpw9qv51iUL0M-vyYKYOpL_J-auXQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 09/15] phy: tegra: xusb: Set fwnode for xusb
 port devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Thierry Reding <treding@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jckuo@nvidia.com, 
	vkoul@kernel.org, kishon@kernel.org, thierry.reding@gmail.com, 
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 3:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit 74ffe43bad3af3e2a786ca017c205555ba87ebad ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) wi=
th 1-0008
>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nvid=
ia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-3-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I'm okay pulling this into 6.12 as it's recent enough.

-Saravana

> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 342f5ccf611d8..d536998288acb 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_por=
t *port,
>
>         device_initialize(&port->dev);
>         port->dev.type =3D &tegra_xusb_port_type;
> -       port->dev.of_node =3D of_node_get(np);
> +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
>         port->dev.parent =3D padctl->dev;
>
>         err =3D dev_set_name(&port->dev, "%s-%u", name, index);
> --
> 2.43.0
>
