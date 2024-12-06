Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47672634
	for <linux-tegra@vger.kernel.org>; Fri,  6 Dec 2024 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443550; cv=none; b=K9jdVhGgps4ke2a9eVM9nqqENzmrdCmBp2KZtEAmJ59/jOoaVMAFB3NL1dDuQuFVsx9RwuLs6aJAfKURH+kHQ5gBG/PfjOFDcdeNxhEwz4sronVtBDhgOIA5xwmUk5iF8GYJr7HNHy9XtCMb70g5iDlWwm+M1uDV5jdCcUFp3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443550; c=relaxed/simple;
	bh=IZa1TwuZ0fRCXZHnUNYF7MN2+UwYZmw9P75FhGdbfJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtqssTdDR0INeUuuL5qchwaTBHx7lhx0hxOwXMeD/MwgcKwWmqjWM/XsaywM6TAwMgYLTBgAt2F0Q9AZoF9Og8DZl/zBowQ7PAZkUKANJENNhdAR6eDCfY1VmCg7G1pb3sJls8tSWMo6tACZUPWCI/HpBXFMFJ8iQ5MMBrn249s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICuYsex3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICuYsex3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e22458fb5so1333961e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Dec 2024 16:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443546; x=1734048346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3/q1ekefyKSw21VhHKqxx/fV6+Xb8BjKlvjw8MK6pw=;
        b=ICuYsex3FatpBJPBHT3r8Vz018vxszEEKhEGY+aQ/pk2Aw9QQGyI/DbycsW63s5Bgj
         llJLCzUu+QHb6aqgHTkg1J2qGzmeq+SvtFE6xLhQA7xclKZSHumkxXjE5MltFIpv/mzv
         YpKKkXAxWGrv0KoK6U+nAs3nbGppCkjVJEpCcjeKSr6Nf4lo7Z+5Sjf+TSnc5Ogbors9
         iTDGxqzkfGi+bFlr3M1KLnOKbfyARSHZ/F0xL4pZ10vJPiLUZrD29UoZhCcotOJ1ukK8
         shUcNgd4edZ1DHCdHwnUs/1gd4JbB8Rf+dAnGX3R9yj1Zn7MdsXfENYti8nTQso569iR
         z4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443546; x=1734048346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3/q1ekefyKSw21VhHKqxx/fV6+Xb8BjKlvjw8MK6pw=;
        b=WnvyMu1Q6Tj+1nFMGbwEhVP18IjPeVvvX99A9v+RtxahhVhGRsqewsJgPqjHh1KJvI
         eLdG0Un0LVMtyhlcUJo23YhbMWSsdAN6RCbC6qRjqMJPqcq/1+HuyEi9r3DXZ70nz6MI
         1zFwusGVkREFmf0WC+RhtiDCWLGamrhzH9NXlYfCh36lKSTwRXu275MWaPNOH8dxO0Ga
         62Jne5qVyBLHvqZg9EWsTbFQ8bVmkXwoc+ZS945E7VO5V4Wc2Lc0LJky5IUUOpfGrAsa
         xa9WPf/QaoJPAtnIGsp14hWN398oQmV9gfjTHsjIQjyDiSliTe9B0Fi/GXJOUct+V9gw
         qOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFRF8iZZg4KJuPhRHFEUQ+htKcoL+q7YEIglEcc5D9zMAV1/2c6yx+beZ2b7fl5xYrCaI2dt4HY86X5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OzWiSBEH5tAX42rimjftMsSKv7KpwbE97ToWQ0Jupg6mW3J/
	Qa+vufNzE7mRg/MdezWNH03QnuyIEQK30W8KImeFkUSZ+kWot+Mze+ykS8CMVMChi5t+48qC/a/
	H8o5+Z5jAO3nEawZENM+QMoKlEUBM77WIrCMC
X-Gm-Gg: ASbGncuA0J81Oie3J+x7xGZS6Ll38gZK613dR64R5k6p3UCCqQTueVSoXID376a0xJs
	70wGUaPjSQn7qFExoUl/KisNGOfunrQ==
X-Google-Smtp-Source: AGHT+IGD47hfGvANCdu/H98cv4C8vaKdOhudEJLTzTOk1DJNMSQxpxDwRVMeaHp270RuqHTe3e6FAhnpSV68P4d69tg=
X-Received: by 2002:a05:6512:3b06:b0:53d:ef60:ca9d with SMTP id
 2adb3069b0e04-53e2c2ededcmr230836e87.55.1733443546368; Thu, 05 Dec 2024
 16:05:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221820.2248367-1-sashal@kernel.org> <20241204221820.2248367-5-sashal@kernel.org>
In-Reply-To: <20241204221820.2248367-5-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:05:09 -0800
Message-ID: <CAGETcx-RPvWq1DMGcuEneovA7Gs2WRp=pVQ9W_+A_Ywriq7UBw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 05/10] phy: tegra: xusb: Set fwnode for xusb
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

On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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

As mentioned in the original cover letter:

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Is there a pressing need for this in 4.19?

-Saravana

> ---
>  drivers/phy/tegra/xusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 983a6e6173bd2..765ae53c85664 100644
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
