Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76A37881E
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702656; cv=pass; b=WXq9qY8aW+nW+Dg6LKIcuF4hO7aTTLdas48+qvOW61kqMWClXBly72L4AK577sflFweqjy4OEed2SQ8fHdzXHJztL9RVnDipgQWgzRxnWOkk0vvknuK76Se8u82RvDsyOluECpyfa9QcxuvZCJHx4KXqqAbEil0LzeW2b+XnRGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702656; c=relaxed/simple;
	bh=fzjMnKx5Dmvaj+/abZHnJr4+kb8ctg0Lcon//6mFsgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXBx+iyc4aSkv623haSbh2xXkeUeoy0u0TwwB3q029lT7BO/IcujBaxQoKvWeGlzWTqIeORT0u8lfd08tHy8nEOXGZh0mU1+kd0fEQ8Ohn8wLaf+XRX8N8OsQ4vAru64XcrA3DnKApgHN4E70mgGiWJkv6/CQX6BgmL/SXV1lfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxwJPA1O; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxwJPA1O"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439ce3605ecso403060f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 01:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702653; cv=none;
        d=google.com; s=arc-20240605;
        b=i7W2mmocJCdTzFsluXCZZ/VhSSek/UNOwrea1nqKshcdIGEewIYGEBdEo+DzReMHnZ
         VLFOJWjgcsOcDwrATfnIxa9p4MyUh38d5VpdRnN3MMiSTS0aVRYb3OJlvnmuLwrNWSQu
         qqseUk56x9yZ2DExFoUtr6TuiObYTRyoHzgqyUxMBvhVAaJTZNN5cVwVP5ieVw8omXoE
         KYpALdoD8V8kksO7/7R3kNelVYZV5AzI3ZaqOP9TkyK1BonuY++H4ky/nYHoE0/FWeDW
         8/buPvXywpt3OZcKTT3MrmT00C8z5S5ACC3p4ixKdcx5LUHvmo8/nFMrn4ML3ZPbzFLD
         v5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        fh=GXemPBhaE9PCZJFuWLbigZZxgvuOFA2mPQd9qjphwi4=;
        b=Lt+tQspxjcy2HtUxG6GpDGNWhUYQjYGvfj7TYS1yM1/jANE0QodNTSrFU+Cdao0o5e
         yZydmQ/eEs5N4Qg9P8daxqUKY7ckfFdrJqqEuqTVKm0DARlncITnl/VQiaS+MBfv8o0R
         YRGb+/L4tpVTbuykyUECSJzqQu8rY3OkZgjhmqVKPEbE2yHmtEfwJc1YmdrgC00iBMlJ
         +BxsCPpMxONQvjweBegUfElGCY9TW5UXKLTvvEUsKaABIKkQ6cszuJIENuGx3V9OsPO8
         GWJTI2AB6TfgNQgJeX8OBf5xOMOVJajN9HD/QQdEj/n7wgJzBnCsKG1MBdbUMjQfxDUY
         QU8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702653; x=1773307453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=XxwJPA1OgdiL/y4s+TLKMebUQQiZl+QkKkjBfPuxQlbRHUc/hJ1EX06v9FDiA341oK
         BuTs+CqvseE9KmLMKFSSr2yyzcZHfQ/rxJgI35dMeHQYAnyQ9vwNIYRIWjWcDSjMddF9
         JnZTs/WtQBA02btbzpz6Wz1OkJrO5xZ6ZLqcYhfmvlXzODQE9XcxLqQqpxM+9c1MCQzQ
         UOM5cH7izAhL+ulf6f/c9VIV/BN1um7cN1sLbi+nTEu71IQmXiPye6LFT6Pr3fTyGSAe
         Qp2LGkXPMhvjQNgYHw7Cny8Th0wYIIp6EU1ZsN/UDkj7yylwGmBiXf5DuTw87+BqsARa
         DJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702653; x=1773307453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVtS4eAXipKztll8obdgvYy3VuDflIV775VHJRcXCQU=;
        b=vk4MGpl6Nvdu5vqOzAVG91Ak2VhvCH1H2U+9qK2eNb3OIww1yLneNZHmWRZ5X1enA2
         ZvDJxQ+14HLaLQLqrT7QUy+WnLwLcJz7D13hQdjXAo+LPWDQwEpVPt13jcSkY6Lxde/R
         XpYjRH9My0JDjq5aP2NxAtHn5r/wFfdnfnnvPCCCEZvPmKChfFtx+R92coVvkmppfx57
         vAgua8cCy9+SYIiDqqW/ub+yp09goCR03hs1mOA5r9G+jrvw7vYJkMVXeZq1b9FF9S1F
         vkQ6P4Kugi3RUKWkFhYkIQ52AJNfrEV+KW82bm4v1BddrB708lwl33ZJd0lWeerc1vUK
         35og==
X-Forwarded-Encrypted: i=1; AJvYcCXjGCd5oIUOD9rp/rwTOi/LIXjSmLBeYghZWz+nGl5dnXbAl5uPgWJlgB5BjdcJyl2lD163phRNdrDpCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygwpwOc97kg7RS15TpmmSAv+Ofoyl3fiaNtpoOfKRQufg+Ru0G
	sNf+h51FCSoCPrcOR4r5ahgxqJxd1RNCgUtHK1V4s3UGvUC/YA9CfKELFY5UriBmJF2JYp61HYj
	AQqdgzKEyYtSGC366kRTE1A/Vx8L/VHE=
X-Gm-Gg: ATEYQzzKo6LEWv+4E095Pd5lmVeXqQoY8BtE/QasINUAR/Vnzdzt7auJvMzhUQwaU+r
	aKCMLgOHlaRIFVT3XNlLfdXexBQRtco8pwSbLreblzztZ2vZ1WG0EatWPFJra36OKwZZJ8e2pn2
	ZpatTgNBDXQXSYgXNxhpnTweRgBJK3Aji8fCGrpugFruLJKJKlJHyFuAerFK6LLuqL7SH7Vpvue
	NnySrFpSgE66oygZ3C7PgKhs0xZbUY/m448Eghzcmdna4u3eTb0PnNGJskOrDP8BfKXC8l1X7sb
	h31D8aHw
X-Received: by 2002:a5d:5303:0:b0:439:cb5c:b18d with SMTP id
 ffacd0b85a97d-439cb5cb1efmr5687097f8f.38.1772702652808; Thu, 05 Mar 2026
 01:24:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303084239.15007-1-clamor95@gmail.com>
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Mar 2026 11:24:01 +0200
X-Gm-Features: AaiRm52U1-rp7kxII13ghlYufHfzAUdiofPyz6Xw8QG4vZZsa74ZdbNb3EWlC9g
Message-ID: <CAPVz0n0+FDAsRxCaPy65_N5O0KKE0tQ=zQupEM6VAR5LPLuOcg@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] tegra-video: add CSI support for Tegra20 and Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 3 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 10:42 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
>
> ---
> Changes in v2:
> - vi_sensor gated through csus
> - TEGRA30_CLK_CLK_MAX moved to clk-tegra30
> - adjusted commit titles and messages
> - clk_register_clkdev dropped from pad clock registration
> - removed tegra30-vi/vip and used tegra20 fallback
> - added separate csi schema for tegra20-csi and tegra30-csi
> - fixet number of VI channels
> - adjusted tegra_vi_out naming
> - fixed yuv_input_format to main_input_format
> - MIPI calibration refsctored for Tegra114+ and added support for
>   pre-Tegra114 to use CSI as a MIPI calibration device
> - switched ENOMEM to EBUSY
> - added check into tegra_channel_get_remote_csi_subdev
> - moved avdd-dsi-csi-supply into CSI
> - next_fs_sp_idx > next_fs_sp_value
> - removed host1x_syncpt_incr from framecounted syncpoint
> - csi subdev request moved before frame cycle
>
> Changes in v3:
> - tegra20 and tegra30 csi schema merged
> - removed unneeded properties and requirements from schema
> - improved vendor specific properties description
> - added tegra20 csus parent mux
> - improved commit descriptions
> - redesigned MIPI-calibration to expose less SoC related data into header
> - commit "staging: media: tegra-video: csi: add support for SoCs with int=
egrated
>   MIPI calibration" dropped as unneeded
> - improved tegra_channel_get_remote_device_subdev logic
> - avdd-dsi-csi-supply moved from vi to csi for p2597 and p3450-0000
> - software syncpoint counters switched to direct reading
> - adjusted planar formats offset calculation
>
> Changes in v4:
> - removed ifdefs from tegra_mipi_driver
> - document Tegra132 MIPI calibration device
> - switched to use BIT macro in tegra114-mipi
> - pinctrl changes moved to a separate patch
> - ERESTARTSYS workaround preserved for now
> - tegra_mipi_add_provider replaced with devm_tegra_mipi_add_provider
> - reworked bytesperline and sizeimage calculaion
>
> Changes in v5:
> - dropped patch 1/24 of v4 since it was picked to pinctrl tree
> - added reasoning for tegra132 comaptible into commit desctiption
> - moved clocks into common section in tegra20-csi schema
> - added note regarding ERESTARTSYS
>
> Changes in v6:
> - dropped patches 1, 2, 3, 4, 10, 13, 21, 22 of v5 since they were picked
> - rebased on top of linux next/master
> - improved description of commit
>   "staging: media: tegra-video: vi: adjust get_selection operation check"
>
> Changes in v7:
> - rebased on top of v7
> - kzalloc > kzalloc_obj in mipi.c
> ---
>
> Svyatoslav Ryhel (15):
>   staging: media: tegra-video: expand VI and VIP support to Tegra30
>   staging: media: tegra-video: vi: adjust get_selection operation check
>   staging: media: tegra-video: vi: add flip controls only if no source
>     controls are provided
>   staging: media: tegra-video: csi: move CSI helpers to header
>   gpu: host1x: convert MIPI to use operation function pointers
>   staging: media: tegra-video: vi: improve logic of source requesting
>   staging: media: tegra-video: csi: move avdd-dsi-csi-supply from VI to
>     CSI
>   staging: media: tegra-video: tegra20: set correct maximum width and
>     height
>   staging: media: tegra-video: tegra20: add support for second output of
>     VI
>   staging: media: tegra-video: tegra20: adjust format align calculations
>   staging: media: tegra-video: tegra20: set VI HW revision
>   staging: media: tegra-video: tegra20: increase maximum VI clock
>     frequency
>   staging: media: tegra-video: tegra20: expand format support with
>     RAW8/10 and YUV422/YUV420p 1X16
>   staging: media: tegra-video: tegra20: adjust luma buffer stride
>   staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
>
>  drivers/gpu/drm/tegra/dsi.c                 |   1 +
>  drivers/gpu/host1x/Makefile                 |   1 +
>  drivers/gpu/host1x/mipi.c                   | 592 +++-----------
>  drivers/gpu/host1x/tegra114-mipi.c          | 483 ++++++++++++
>  drivers/staging/media/tegra-video/Makefile  |   1 +
>  drivers/staging/media/tegra-video/csi.c     |  64 +-
>  drivers/staging/media/tegra-video/csi.h     |  22 +
>  drivers/staging/media/tegra-video/tegra20.c | 820 +++++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c      |  58 +-
>  drivers/staging/media/tegra-video/vi.h      |   6 +-
>  drivers/staging/media/tegra-video/video.c   |   8 +-
>  drivers/staging/media/tegra-video/vip.c     |   2 +-
>  drivers/staging/media/tegra-video/vip.h     |   2 +-
>  include/linux/host1x.h                      |  10 -
>  include/linux/tegra-mipi-cal.h              |  57 ++
>  15 files changed, 1482 insertions(+), 645 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>

Hello there!

May this patchset be picked if everyone is fine with it? v6 iteration
was hanging for a quite some time already without any actions, I have
rebased v7 onto linux-next but no other major changes were applied.

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
