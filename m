Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F91E491B
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328011; cv=none; b=jCOESbwj1N+FcYr+BbWJq2wYHmxETEFDijP7jzTs5H4CQxp52YSxaMaNxBf1sWgjnNqNz2cFoPuCkz6BgFyjq/DrcTzSoUDBRnEi5iVi9YQtOx8nSqsCpDNmjxEKIgVkMdfbLP/cqjlwbjqbogObkAyO3l2gz5U+sqb0qw3MH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328011; c=relaxed/simple;
	bh=K6zD0dyxA5X3dz6tOjR3SyTpnMhYisRl3NWIn5tca+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9YHdy/iL+rXhUxMG2SBhbuAQyw+/9s4DzmU7UumFblmIMooGSgnVGH/7Kt31+Qgt9omBMh1ZsGenY63/CNwNoTiyWHtkuZX6uDKPWNXYXJpNzOBduCHjQ5jLkpfyuB+5faWuoDR41NcdYsd3iO0Kb7lX3N47qGljyQfvhpE/m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2PSQDOp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2PSQDOp"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-592fd97c03eso1040206e87.1
        for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328007; x=1761932807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6zD0dyxA5X3dz6tOjR3SyTpnMhYisRl3NWIn5tca+s=;
        b=A2PSQDOpNJJx+gPryK0V8miuxc1723Fpmx3o+U/zSdlIcTwWUtXDwgH7ZWmhmUq5I+
         DlpVST5ir0ElBFlCd67Uuw1KeeHSQqDO7wtG2cHY/tonBJXAERUmUrGmgIxzuyrX6mFI
         2xGgLdDsez5UBtAA6Vvpha2JLhHbZXfiSA+hRpVs5na1g5pJg5R9T1T/omVF3IIsb1A4
         oCfHVqFwS/pDDC4QNEbV73yBSwBkD9ctbTSsgGMZtyl/BBe/mB5KTR2irML1atFuvFcs
         ilaWNzm+StFZ7b+BevAqZcIV3pebu5SCenPbQ2wtE7tn4D9wtMkRV+zVDFQ8FkEo61Wf
         4bUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328007; x=1761932807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6zD0dyxA5X3dz6tOjR3SyTpnMhYisRl3NWIn5tca+s=;
        b=VRzUsazR44TYe1nzbaOHUYBFyHgVbUA4EWqvCBw3LwsYCHeZVUXnLAGtQIG/0jFy3a
         OMKcz/n1OgoDJ6FWMYPEVFgCS8Uh+R55WhFp2TEjWARbQ4n8CO2kJMdjJlJScraUu7Nj
         PuGu6yakvVumUxrb7H5+Ey2sv/Sz3Lu42EtUrdcx+YO24nspQ6zpKz+Yt9rUSYYhEbrW
         WFlkQbblcqmJlFsoHI1mifsIuSm2wIttVlBbPprVn2cZUE2L3rjpFe/Mw9HNJdeHtj6f
         ru2CDKs3mlSAK8BIcGsA+RLFuXwl1X1YTzy13JPSvsYBI6hRzFsQrS3uQisOh8D1FrQZ
         yDvA==
X-Forwarded-Encrypted: i=1; AJvYcCUlgi+ZqIxf79SiEMhKG0VAC1vPGG3MKSc6mUvzB22Fu7zZKgz0DFLc8PK3ZK4RyqDOFj1ZO4Viw6fWFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mflHGs9GeXHl4Aq6kinq033PTgM1ancqbyOJDtSe3zcWbrnS
	OPMz8yO9woIjWE5cEydEOe9tWfFKYwIV/wH45o+4uDEUCBWYxNnh+f1WPIIkOUrj7oKO1923c52
	i0rJy6lxyugKo8AWfbsDEvMQAWhC5BY4=
X-Gm-Gg: ASbGnctKz0s0X/swpslnqK9Bb3Cgcij1IdGflov33k3sqtzZnZkzhLYw1pHLJU0uilL
	xQWKtSbZCquUVomfQKf4QQC4CclQe3sHq+7wFau/ejGrhnH5h45ZO0+Qqp74WUyJbm36p5Nub1z
	VMnBYwhmscr8YR68x92kV+LxMISP4+3E7H3gu2SyEGg0tzhXS2DUxde9RKJWdNJdjNWvhZSyzYJ
	6pMQ5YnLjdcEtZ1xN9r9iQTMYoQvI51l9t+YrRVmp/jDJS/95aPU6+OTXVb
X-Google-Smtp-Source: AGHT+IEKMTxbFcAqJJs3pqOOQTiDsnpDKsflXjiTlx5yaR9ZYhjteOY9GsHf3z7fyVR7qJSJg+QljfP1XDamHWUqjvs=
X-Received: by 2002:a05:6512:b84:b0:592:f9e6:a617 with SMTP id
 2adb3069b0e04-592f9e6a809mr1988690e87.31.1761328006209; Fri, 24 Oct 2025
 10:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com> <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
In-Reply-To: <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 24 Oct 2025 12:46:33 -0500
X-Gm-Features: AS18NWB0X2kanA5C8YSvXzeNGUy0EwS1NgCtJrnfR3pQ1y9nZ6F33BdAn_oIim8
Message-ID: <CALHNRZ86NjcNJhRJd+jtD_7fRTFJ2szPFAAN3HSad_xwnVrHWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 11:16=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
>
> On 04/08/2025 04:14, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Tegra210 L4T bootloader ram training will corrupt the in-ram kernel
> > dt if no reserved-memory node exists. This prevents said bootloader fro=
m
> > being able to boot a kernel without this node, unless a chainloaded
> > bootloader loads the dt. Add the node to eliminate the requirement for
> > extra boot stages.
>
> I test this platform and don't see any problems. I assume that this
> would prevent the board from booting.
>
> What bootloader are you using? Is this from a particular L4T release?

Please see the longer description of my setup on the revision v1 patch
here [0]. I am specifically using the cboot prebuilt from L4T r32.6.1
as it is the last version to support usb input in the fastboot menu
[1]. The rest of the boot stack is from L4T r32.7.6. The partition
layout xml is here [2], which requires setting odmdata bit 11 to allow
reading bootloader partitions off the sdcard. There is no u-boot
involved, only cboot.

I've had another report of the same issue, on a pure L4T r32.7.6 boot
stack as well. The Nvidia downstream u-boot won't copy
external-memory-controller nodes, namely the memory-region ones, from
the cboot dtb to the kernel dtb unless the phandles match. Nv-tegra
gitles isn't working right now, so I can't link directly, but on
branch l4t/l4t-r32.7.6-v2020.04, file arch/arm/mach-tegra/dt-edit.c,
see line 31. Which means that such only works if u-boot destination
FDT is the downstream dtb. Using a mainline dtb causes the
memory-region dt tables to not be available, thus the emc kernel
driver fails to probe and emc clock stays stuck at 204MHz on
p3450/p3541. Hence the user from the report trying to cut u-boot out
of the mix in order to get emc scaling. And then hit this issue.

You were able to boot with a mainline dtb on the DTB partition and a
kernel on LNX, without u-boot and without this change? I have not been
able to do this. The boot flow will get past nvtboot_cpu, but falls
apart inside cboot due to the corrupted in-ram dtb, never getting to
kernel logs.

Aaron

[0] https://lore.kernel.org/all/CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8=
Jg_3itwQ@mail.gmail.com/
[1] https://forums.developer.nvidia.com/t/cboot-xusb-support-broken-since-r=
32-7-1/243534
[2] https://github.com/LineageOS/android_device_nvidia_porg/blob/f52038d326=
ef67002185dbe04e9ff1070db2be4c/flash_package/flash_android_t210_max-spi_sd_=
p3448.xml
