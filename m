Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E98634
	for <linux-tegra@vger.kernel.org>; Fri,  6 Dec 2024 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443590; cv=none; b=FOjzv/8pFjqN65xW1gNcJfxbu9qIKr5ZXVg39lYAs2E/Qyv0Y7u8TeNi+dpz/C9WCTPwRYYsuMTdx+P3nMhmni93XclAnA1Xa3vj9dmziZD4VYSwvoOrTQI0TRHQdrO7eGrOhK/OWgIwOGIErl754iX1Yjlz85I+uit8XwiYefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443590; c=relaxed/simple;
	bh=VhLlXBiezqna92814Wec6SiZX9+6s9NKhyd+wzaZ6D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gw4mfH92ZF7gMYcl6X2ch0OCsGZIYzxTmovyjEUB3E4J+ef8/ELeB/x4e6Vuodn+Livg8n2iXrAlUeCIS+na75EMBHTzPSeUW2hJKUZlreHnOLkCrz/VPNNE2FHdROzXNxobKIjgwUqupBckdPUaPVTBHUBvL38gxPFOVDpbRVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lb/I9MEc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lb/I9MEc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e1c3dfbb0so1427107e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Dec 2024 16:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443587; x=1734048387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UvGh6EOnV+tEG2ZRwFyVPJh9DPbnKKWL/LvEAvRqYI=;
        b=Lb/I9MEcLIkKIYRgOGfwd8nhCquDRbPrJqh3+tMk2OGujGeFeQEBiFeKKT7maMFU2Y
         n1jipi4s3QTWiuizAHuSfeGsiXHovZMoqmuzvgLHRYjBWTHIKMGRGymkWV8SYzFeDEa8
         ZRWC+FaismYkaAgK3KtGKta8eUgx2Ke7XsGcd3sqTEtX6bozhwJEpMs8ixur3p99Lbj0
         9SrlKWBQRcxFcY4cXDRLReXfbYRj++dFOxupD9Z+eIbkNuyc8Ksi1L0EaWMhlH9fvi9u
         Jppf1lUjbYRHlwIwAGGi3RO9eYVaPJuM831Ac+5QkTfe/4lfObxC2ynI0pV/Sj+Ne2s0
         xPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443587; x=1734048387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UvGh6EOnV+tEG2ZRwFyVPJh9DPbnKKWL/LvEAvRqYI=;
        b=IdWRG4xWDt+tfYjdHLtvnZOobYz/NMYbuUYpuhZEIhEur37IJB8yVXeHvYKU0L78dz
         +dAuKXw3CYoETKXGX4Wqq7cGinMhfaTd06uCDi4Wwz8CaGUbrrcHTOd9JfqakKD4a4Bb
         QgFsKLmscfxqolB8j7HXzP+/+Kk4+C9jRGMYkjG/+Xku/cWdki57kbJW/WxlT9MoKafQ
         oDnuc01yZWOrzUEaPQ8ajVR+lYMI1Qt4mBB251iCHMcUzIWBFpY8GIJ0j+sNGMtxC43K
         XO6/wbykI5P8wtlvuYH9B0qYetWCoIbz2ckZBiCTeXaBmg1USZnBT1aXiNrE6nm7jtXa
         cp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQOFL4YlxMJZxFZquXgauRT1X9QOTA8ufzAxl5miyBw/hAflCPJ1vYp75ZxWiuFjdj+ar448GK9u+rEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsN2bCSn+reEBVymhKxd8ZGcScyea4ilFeJ50wblDJMuM2+13z
	cbEICOSdp1UiPI/rG8C3afvV4FQVSQTpg1r4au9Bfmx9OA9UIbK6FjE5yrXYZpio1U12hgR2Ls/
	qXVb2ZIK0nOnxUyCj59fP/pV0iecT/4Uw8jm4
X-Gm-Gg: ASbGncvcw6wGHAJWw0rjsvK5XsAi8QqkNks8kNI9Z4bfUdLNB/rsiCUgVajWMpptjNs
	XhzhFSymvkgNEs/DRi9uxx4ZzGyTt8Q==
X-Google-Smtp-Source: AGHT+IHX5x8YT8vafN6ekk1TbVsmb+8aDHy7nFhJeilXsENAEenxd424hEKN6feA90avQyEUsRnxLsZ3M/AV3xsrUVg=
X-Received: by 2002:a05:6512:3c8a:b0:53d:dd4c:aeaa with SMTP id
 2adb3069b0e04-53e2c2b1ad9mr224016e87.9.1733443586479; Thu, 05 Dec 2024
 16:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org> <20241204221726.2247988-9-sashal@kernel.org>
In-Reply-To: <20241204221726.2247988-9-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:05:49 -0800
Message-ID: <CAGETcx9V_pWmgpX+HXC7tEQm4L1Fm6yghaXjJba4S-Y00um_=w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 09/15] phy: tegra: xusb: Set fwnode for xusb
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
> index cfdb54b6070a4..0a2096085971c 100644
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
