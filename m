Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC682E88BB
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317009; cv=pass; b=nv06KvE/I0cjtcmwKiu8Gg9wnvBcnSYZ5+xJbqh7dEl8Qjf+kcM1yTB1bBj6BKUlMiv2HzXLNRIKfpFaH0hyQmqi1rBaW+F87pSaOLn7WZz9A60q1r/PM3mMM4X90XWcUaMeCbMVobHksm1EHXWQtQKoq7zNkNHBzQfFw8gIutw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317009; c=relaxed/simple;
	bh=Q6+0GPJfuK4Fo9d0a8nwiUzprEer81r2OPIwD6CMeWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHVme01Dp+8RJVMU1LYyVLBMYRy6qw+zVXEZgro5Q78eifFdXQx1l13lo/9hU/rF0wrpCFVRfoXGtwBPhUrgaOBVWD39m3Dydh4izWn6Au05PmEsBGaw+26CL39J7YnDCvP8nbwmilq3X+c1rzBmpcXX9RyW6KvKXUZfk41y7aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSp/6vyx; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSp/6vyx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362507f0feso2562360f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 00:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771317006; cv=none;
        d=google.com; s=arc-20240605;
        b=GReiwfl4UjAkltzG8fv7RwYo0ZKwjciU/HKOOTg9a6SlrH89myOT4c3DAiGfkRz9vp
         RYGiR2+QEy2SYjL2WNvGi8KPuSLVN2GP29DtONL2N4ZAfgkttv6+6P8cJ+8mZUL1PGeS
         7yxt7hWbhLv43DjhkB7VbHXQKJMAniNSbQpBudRepC8LOLkrP0PmKDJGQ0T0jc7be4er
         6YA0tPOVp84fb1qT7NjBbLJiafqX4KQtqW09dxeRa2UZPemWA0O6iAvHzxNqNKtdBzQc
         LK/l6k8FyDgV2oZ/SIUoLV9qBMoIN2NXNZe6m61qmgcmfW//wRupCbkSMgkBuUaZrnGJ
         50GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GBysLy4Kokba6/2m6eyKbMi5kwkRQdw4C8BxtwLdIYA=;
        fh=mBjNe4imvvxw69QLWscjfe8R62lzkmqRI4SKLlrxBm8=;
        b=QZqqKOt+ljBW6rVNVRFQwcflVkEer6nwhLY+5yHjwD2nqTkdmVzZwr3D0/rXmluChC
         dblkT4bE2HriwaoiqMiFWKhaAVaLuhNWNpCtHAOw6vagCcuJ1UOLpmaImgeajk1EelLf
         vp9WE6DSU1zecTz2knNJQ2NsPg7IcMhikmzsicHHYLVnUxWwsKfdClSwAi8OWe4TFN3a
         zA39KzIecjWhRMpa70ptQzq+VPD32zYzLjJPBZqYnhIoT8kSq9tDqxoNetLfkYk/n/bb
         vbtlxeTFQtEcHgWkP67MqvqJxAwnsqklbtsW7gsREamt+YJbU2MMDVt6bHoaFBiQY2qz
         fKJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771317006; x=1771921806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBysLy4Kokba6/2m6eyKbMi5kwkRQdw4C8BxtwLdIYA=;
        b=mSp/6vyxKT+T/+QsrSC5LqSCClf9V0YcNQ+2coczmIv0uky7TSHlL5JLX775jzvX8e
         6DnHGivgOMBhEGtO+aS/YzOmYjzN0wVbQYfCrStNkz9+hdCgdUY21H8s93TukyFeSu56
         ujKWDSyrxqoNzMYOZKT5j+JdoO4lv1HPaEVZd/rQM+/hVwId8t/vbVvwN9xYfJYN0/fe
         aFza5QQh4IGp97KSyMOeDWNblV+C/TwLvi5J1Svj4PANgdZ6I82NvXf92CedZdiZxspk
         dbg/EJCUol1AhqadoOY4HBSYSjTMPYlfeoh0NMBXYQ7qsCzVxVTHUQNRar61QWtBgaya
         199Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771317006; x=1771921806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GBysLy4Kokba6/2m6eyKbMi5kwkRQdw4C8BxtwLdIYA=;
        b=noRVJvOjQRf5ENh4Hh5Fng+DTnK3rrwFw2nPv1XGJxD9VxFASTbUsP2E55Fw5BuDOR
         h19idKB9v9DKSCwYS0IUmxfQkhmPUQU4S7q7OuA/irQyJ7LGQ5Re8qR25Y9xN5yoFQRU
         kX8XPcIla+9QX3L8ZiBK7pcp0ZpmGBFz7M+8Rj5/BJJDvEI6xzoXOQLPsyHTtXB1QbA0
         t36l1ir8fETEGonndC+yem/7X0KZqYGRoR2HpaC1tWGRIfm8RH3f/X8hKpixKlmUt4Ma
         HpSs0/5CdC2IVlTYwnHBRHrXPs4asYsuydnZnDGGi3TkI1a6Kk6gTlfVfJq5cngm6GxV
         9lWg==
X-Forwarded-Encrypted: i=1; AJvYcCWyz0MnEN7TBo2Sf8CUrDcUSqeCZVMLApRbSrCIJlkAz5Bz0OwnSdnyn7nf4mmAzKasMjONOk0pQN0L8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzcerOWEscyLa19EiKObovu9S6dDCmpzW3Jeq59aOYrm6w+FW
	4VEeU8CHOVxESjILYU1SzX1lICoZq03wzpxLwlntYaMXPinROMbPpTxQnFCXvwN6RZDOfEDvUPY
	EcBrb26OoXUSoBREvi+ptf8PeN6uhQO4=
X-Gm-Gg: AZuq6aJ7b4f7iLEUQODyRPU/8C+spogvGpmce/x2zIxcPRrzh8YIKqL82qtQkeeXyKm
	b3OdoCKoERt6sBYDSeusl667rw0Yi+V3x/Ua35x/RPQQ/0uBiVT6vEVV+uH0JGzfEnooPyixG1J
	fzailatvpUhXNqFd/UTrXt5n06HGV458yotzBDQkX9unuV3LylstWSXPesFUc2oVIx85An5fLfi
	KUXeXCmLCdZSuz4NzJtHWshbQPCLcs5PQnrsDH1ypkNEXA+mXooKZTAYGzxrVihvLQXSpH/ntlC
	KyBqMP4I
X-Received: by 2002:a05:6000:220d:b0:436:d824:620b with SMTP id
 ffacd0b85a97d-43796aefa84mr21760521f8f.39.1771317005654; Tue, 17 Feb 2026
 00:30:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126190755.78475-1-clamor95@gmail.com> <20260126190755.78475-6-clamor95@gmail.com>
 <6f143fdd-1e2d-428d-9b05-cf1124b179e8@kernel.org> <CAPVz0n0Ep_YAJfm0R_PexKo5WwrTDbJfFKUbLVKtG5q1qLONUg@mail.gmail.com>
 <b19dcc48-33be-4eb7-8b69-d7ddebefe257@kernel.org>
In-Reply-To: <b19dcc48-33be-4eb7-8b69-d7ddebefe257@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 17 Feb 2026 10:29:54 +0200
X-Gm-Features: AaiRm52ZSngnxRGeGT0zXtzxjUwe-KozbWW2xmmEMv8DU6eXNJQzlcX3fDL4iPE
Message-ID: <CAPVz0n3ZS=VidMxX61mKxjCCgvArK-DWo=VUKoaMhbLAt_CE-Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] memory: tegra: Add Tegra114 EMC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:18 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 17/02/2026 08:51, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:21 =
Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
> >>> Introduce driver for the External Memory Controller (EMC) found in
> >>> Tegra114 SoC. It controls the external DRAM on the board. The purpose=
 of
> >>> this driver is to program memory timing for external memory on the EM=
C
> >>> clock rate change.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> >>> ---
> >>>  drivers/memory/tegra/Kconfig        |   12 +
> >>>  drivers/memory/tegra/Makefile       |    1 +
> >>>  drivers/memory/tegra/tegra114-emc.c | 1463 +++++++++++++++++++++++++=
++
> >>
> >> Please rebase on top of Mikko's patch removing duplicated code.
> >>
> >>>  3 files changed, 1476 insertions(+)
> >>>  create mode 100644 drivers/memory/tegra/tegra114-emc.c
> >>>
> >>> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kcon=
fig
> >>> index fc5a27791826..11e7cc357d39 100644
> >>> --- a/drivers/memory/tegra/Kconfig
> >>> +++ b/drivers/memory/tegra/Kconfig
> >>> @@ -35,6 +35,18 @@ config TEGRA30_EMC
> >>>         This driver is required to change memory timings / clock rate=
 for
> >>>         external memory.
> >>>
> >>> +config TEGRA114_EMC
> >>> +     tristate "NVIDIA Tegra114 External Memory Controller driver"
> >>> +     default y
> >>> +     depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
> >>> +     select TEGRA124_CLK_EMC if ARCH_TEGRA
> >>> +     select PM_OPP
> >>> +     help
> >>> +       This driver is for the External Memory Controller (EMC) found=
 on
> >>> +       Tegra114 chips. The EMC controls the external DRAM on the boa=
rd.
> >>> +       This driver is required to change memory timings / clock rate=
 for
> >>> +       external memory.
> >>> +
> >>>  config TEGRA124_EMC
> >>>       tristate "NVIDIA Tegra124 External Memory Controller driver"
> >>>       default ARCH_TEGRA_124_SOC
> >>> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Mak=
efile
> >>> index 6334601e6120..6b9156de4b66 100644
> >>> --- a/drivers/memory/tegra/Makefile
> >>> +++ b/drivers/memory/tegra/Makefile
> >>> @@ -16,6 +16,7 @@ obj-$(CONFIG_TEGRA_MC) +=3D tegra-mc.o
> >>>
> >>>  obj-$(CONFIG_TEGRA20_EMC)  +=3D tegra20-emc.o
> >>>  obj-$(CONFIG_TEGRA30_EMC)  +=3D tegra30-emc.o
> >>> +obj-$(CONFIG_TEGRA114_EMC) +=3D tegra114-emc.o
> >>>  obj-$(CONFIG_TEGRA124_EMC) +=3D tegra124-emc.o
> >>>  obj-$(CONFIG_TEGRA210_EMC_TABLE) +=3D tegra210-emc-table.o
> >>>  obj-$(CONFIG_TEGRA210_EMC) +=3D tegra210-emc.o
> >>> diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/teg=
ra/tegra114-emc.c
> >>> new file mode 100644
> >>> index 000000000000..789b8e959a68
> >>> --- /dev/null
> >>> +++ b/drivers/memory/tegra/tegra114-emc.c
> >>> @@ -0,0 +1,1463 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Tegra114 External Memory Controller driver
> >>> + *
> >>> + * Based on downstream driver from NVIDIA and tegra124-emc.c
> >>> + * Copyright (C) 2011-2014 NVIDIA Corporation
> >>> + *
> >>> + * Copyright (C) 2024 Svyatoslav Ryhel <clamor95@gmail.com>
> >>> + */
> >>> +
> >>> +#include <linux/clk-provider.h>
> >>
> >> Where is it used?
> >>
> >>> +#include <linux/clk.h>
> >>> +#include <linux/clkdev.h>
> >>
> >> Where is it used?
> >>
> >>> +#include <linux/clk/tegra.h>
> >>
> >> Where is it used?
> >>
> >
> > All 4 by tegra124_clk_set_emc_callbacks
>
> What? That's not how C works.
>
> There is no definition of tegra124_clk_set_emc_callbacks here in this
> patch, so the headers are not used. Point me to any symbols from these
> headers being used in this patch.
>

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/clk/tegra.h?h=3Dv6.19#n199

> Best regards,
> Krzysztof
