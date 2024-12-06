Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5C8836
	for <linux-tegra@vger.kernel.org>; Fri,  6 Dec 2024 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443475; cv=none; b=tcLtfxFASz6igc1JyrDruHb1ZUnCUqLwhu1uX9nlAEpa9dKTP/72/t0Dxr721hu6ohu5tS5EoNzoKANevdxFxncH3bTTAfpH9ksp2Tp05y52XxNeceMubrDb6dI80ooNeUg8+zrh+oq2LbxwUWeoJbjSqjuOlzt8x6w2cCc7QB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443475; c=relaxed/simple;
	bh=tKUQOmQH04h1CVVIwdOHMWNVzndOvzHeIu10/JBL9VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImamiBPRtKX71pRQB4Bc9oBekezHM1g+SQz6O6FHQGpVIpLQzzaSyCUdVHc5Xy+rNP5K/CctQOs6RJGcNpTj8wCW29S6ndaNZbCYpA9AWJbN7Q8ab4GEdDNZZ2nZENZif0Tp9cChXUPotXuoaX2rzHdpjWc99XqZ4NgHM0l6qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pq2JbUK6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pq2JbUK6"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so12652681fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Dec 2024 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443471; x=1734048271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty80O3zcP5sqKHxyN7Pa4PvEryupRsClSqgrQkC4hu4=;
        b=Pq2JbUK63RS4AUxEkCGO5zUjJz+/kwEmLVbWM3vBAGFHSaf7n5jzS5Oyw5HR6dOIop
         YfAb1b8VuSQXdjpAMIXos3ubmaACbfIYk+qT1JyCD3ugnI1ttYgKUBu215if3FJ0nrYr
         DL2CkdAhzp35KbSc8h9BZWasa2pivj4m4guV2S9odDh4XXzt7RRGvIgkiNVojXICoGyg
         w4Bsc5hxT/r4WxfRKLS9lyEZzTvKpU2m4/63NqqGZMOYz6etEr8gikwLD7SC+08lt6OZ
         CrknbJ4N7LNpWr4LRufSUhgkIfVVBZC3OEGrbn4PlkXkk4Yle5VckdQH2LFRAsGUCmoc
         P0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443471; x=1734048271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty80O3zcP5sqKHxyN7Pa4PvEryupRsClSqgrQkC4hu4=;
        b=JJnUQYCjWwASbExrQuDbInV8yxkeQVw7eE2daGBrsBh+wAH+8mNFiGoC4zy6vhSWF7
         ASMVqfIp88ztCMPxllAYrBUkCdcktiG8+nG94kjUFrgYvlZOduX9rfdeu9iyBUOB226Z
         B373j/yk/T1MimRe1kc5/yogzBxX61BvjSoZQ8gCPB9Dn6e15olD7JMiD1xi4pWfWnEP
         1DzEZJVMFh8IORncFt0x4Uc7JhyVBNNfw+lEvGrdWXnkyKZNWEERwkDEh+6F3h9Kmnz5
         mZXt2Ex/Bhmfpp7k6mGwgKsVFebZFYcsnln4cbVmmcPa7HkFgAZ1DuBafNZRshPJxaoW
         M4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWhbMxUo0U5u4GBAdXx82jbzxu/Ba7abDXLQwXEK/AuBQ3NTjdKPhZYHyPos3YCj2sdlCRZn/WspL1avg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweyRwG1i7QPvMHWgLbBH7fRsLigya5MXrGQG5GU4UZbyps4YNJ
	0EZ+Bs0s/Vsh0T7iBqzVoofClOrL1XwDB2aF2bOsbqxNd1hycGAh2NNV6pYGNjF88qOvQZem5cR
	+OziNMlE1O375LBHpyS/3b+gyMfJKX0Jr0MxJ
X-Gm-Gg: ASbGncuHJBJXIFhlg5llrxNYRdGqYG6UZCLRT2TVVb50DAAVdO7UNxa7dHpY7ysqVpL
	W/lzBGR6IDS5/MgtaoImRHnpMX2wWmA==
X-Google-Smtp-Source: AGHT+IGWlM9OGtzjiB62Nm+XCJYbKxMdPKE02xF2kQ3bH+accJLYiyUrOBBi3t31hrUdhGH+VBOyjbTNxtoBv97yijw=
X-Received: by 2002:a2e:a10e:0:b0:2ff:cb09:ccbb with SMTP id
 38308e7fff4ca-3002f8c3e24mr2056461fa.10.1733443471249; Thu, 05 Dec 2024
 16:04:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221956.2249103-1-sashal@kernel.org> <20241204221956.2249103-2-sashal@kernel.org>
In-Reply-To: <20241204221956.2249103-2-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:03:54 -0800
Message-ID: <CAGETcx-qHfLBCfoPX4sbysbMnObvLK_b4rNeJuPySfc8Gb8GEw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 2/3] phy: tegra: xusb: Set fwnode for xusb
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

On Wed, Dec 4, 2024 at 3:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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
> index efe7abf459fda..7cf2698791a0f 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -521,7 +521,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_por=
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
