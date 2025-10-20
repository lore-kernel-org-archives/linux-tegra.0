Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BA2D7393
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988832; cv=none; b=VUnsAwjP9SN6L/lrYR2FA+HRHyQqhrelklSJ6Oy92k+caIvCElTIqxwlMdlTUBfNkdgbmCwyof6cHtGS1shGEX8T9jnhxl5prM8DE9PHmytl4knwfEyd7lv7BV8nft3n63aGz2srEtukpumGkClp5WXKFiGF/nr98RteFspHH54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988832; c=relaxed/simple;
	bh=m4RGynpIughTHkD+PB1z5lB1bY2hDb2eCFbfLzPsofo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikAetWoQNIkSWIl0ttQhB4wdAEfN9jW8DLypxvz5lZxRu5cKBs8dTU1+hwLthT1Sximp+dkXvALGWzKMwFU+CwK3U8GZ0I1HIzdP2GgmhxyxFrO51fgSkSeKktQiDgEmHJOP1sB+NyMP7cQjiWcTEQtU/9dynbukRvszlt2+iWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCEYthJf; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCEYthJf"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-591c74fd958so6001116e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760988829; x=1761593629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOZrEQGvFr32CqnxYimuk+C7dEMMeQPJQMGMDm8/JmQ=;
        b=MCEYthJfQGuDqXzN32AHTC1bM/vjZM6f1+Y3ma+UJa0xxY+VvYLSlvT+4mZ7YX5Uiz
         vAf8GcexbfYqHJXD2aafQ9GPtVaR5koaSxKfL9sfPlnFhSlet9eI1iwtzjy0Z9rYSY77
         iPbEG41s//uEpjcyTAE+zro3WZawX4rbow0rGiBcwlNV4BIAQYt7JypRpus2zVnza03l
         JEsytCxAxEr0GK1Xg9tIxacNtRpkTzXpnz/MNB+emHo61L4BfVG+8BfInrp4LPcIWdkY
         lihjKXLgJM+pce9FupvWJ7o58Y2lAdgrcYpPabd+wfWUbwucd9c47i7gb1H3FKRfgDmn
         l51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988829; x=1761593629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOZrEQGvFr32CqnxYimuk+C7dEMMeQPJQMGMDm8/JmQ=;
        b=raMJxnKuAzXmR6wLhIJqz5rrPohU0SszIM2kxUsTLUKVvCp+JhINoq44vAEastUrEO
         6NJ603PRe8LmWchEWnNboFt1pv8tpFUMQRO0lqXHJMOt1MkYSdsA9pIfuaX2cp3n/hFI
         APesz82SWZzH2Jr9r/4/JasmsQ2XcAq165yzDmp2oj3fVSe2P5M3S45zu1hod+06C12C
         nVu+v5f2n51FihucVQjGyy11VD20vga6Bz35Y+jPqCNZ7X3O6/TtgergkTSYSiWxpp/M
         Sz0W/hrWO0K9bARpUhJ3799Dju7cKY+Kr26XTYiKbEjfiu4/UvRL2rAyW4vcKkSPVZgT
         5O+g==
X-Forwarded-Encrypted: i=1; AJvYcCWBjgvm/rHsk1HLHuvARicmohw695fhapmUr31bO+sB8FNDHVvWZcvLcvxmpKUajHVttKDzCQtkkOpd2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/8xOqYWufIhyDa0PeZiiTlByTpKZYMV+FlpNP7CpAOfCKh9U
	umoIhiNCoaBRx2PzyRK9z28Z6td0ZOZ3jYAUN/6nhVpIPTBTQaTAQ/wC/WFWT6sQi8UT3Hdajsj
	NAd4ItAZaWrjRa2mz1sqUww7ojOCs6tw=
X-Gm-Gg: ASbGnctn1qmTl5aV2zWihRZZZgRsMxe0lLSx/uaK9Kv/Nfdm6E2X4JbCvhWMkdBatvN
	/InF3uJHA2mhydxZU5m5Eg8Kp81PdYWvzQ+LLPqBHueInOmHLYkCqG/H0AEUHc8qkHTOW8n+lHR
	9DWutwa/6GiHSEzbGUYqDd7fW1Tdqezm2TK2aUULWdWzlUTpWgmqZf7Ia7RO1JZZAQ//XbBx2jV
	t6bz/saFxKVNfHARxbwaBci7i2GWlaw4LzPqX41ER1u/I/EdAC8SFA04bAhsofmNH57vxfzHGjt
	IfllnMKdAl2Pr01k3A==
X-Google-Smtp-Source: AGHT+IHyTGZaPo3S/K25PKLJguJnxMhZ/EEoaJso13PfVnZvGhvkHIZ7OJAroNHBm4G74WPgdMcadPoHbwdva7EW71Y=
X-Received: by 2002:a05:6512:3406:b0:590:656c:d106 with SMTP id
 2adb3069b0e04-591d857b65bmr4459273e87.53.1760988828589; Mon, 20 Oct 2025
 12:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com> <43f48d63-7bcb-47f5-814e-dd95fdf0b246@nvidia.com>
In-Reply-To: <43f48d63-7bcb-47f5-814e-dd95fdf0b246@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:33:36 -0500
X-Gm-Features: AS18NWBaJbZyWBa5YnvuCdCG0my8mvhA3u_5SZarMD7eJUrtWS681KWxAhho7Yg
Message-ID: <CALHNRZ-48T+ZuhTLeQb5w1sAdTtnMP6LX=MrWiE+Qze4tii4FQ@mail.gmail.com>
Subject: Re: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 9:55=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 23/09/2025 17:58, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> > code supports 11 ids and nouveau supports 5. This aligns with what the
> > downstream vendor kernel supports. Align skus with the downstream list.
> >
> > The Tegra210 CVB tables were added in the first referenced fixes commit=
.
> > Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> > supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> > Overclocking should not be the default state.
> >
> > Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> > Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano"=
)
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
> > all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
> > supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> > Overclocking should not be the default state.
> > ---
> > Changes in v4:
> > - Check soc chip revision instead of speedo revision in speedo id
> >    conversion
> > - Link to v3: https://lore.kernel.org/r/20250903-tegra210-speedo-v3-1-7=
3e09e0fbb36@gmail.com
> >
> > Changes in v3:
> > - Drop all patches related to limiting cpu frequency from a dt property
> > - Link to v2: https://lore.kernel.org/r/20250903-tegra210-speedo-v2-0-8=
9e6f86b8942@gmail.com
> >
> > Changes in v2:
> > - Define units in patch 1
> > - Update patch 1 commit message to better explain the need
> > - Pull all downstream sku's into patch 2, which eliminates patch 3
> > - Update patch 4 commit message to indicate the limit is due to thermal
> >    constraints.
> > - Link to v1: https://lore.kernel.org/r/20250816-tegra210-speedo-v1-0-a=
981360adc27@gmail.com
> > ---
> >   drivers/soc/tegra/fuse/speedo-tegra210.c | 62 ++++++++++++++++++++++-=
---------
> >   1 file changed, 43 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/teg=
ra/fuse/speedo-tegra210.c
> > index 695d0b7f9a8abe53c497155603147420cda40b63..a8cc3632977230fbfda0f8c=
3bfa7b7b25c2378fe 100644
> > --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> > +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> > @@ -65,27 +65,51 @@ static void __init rev_sku_to_speedo_ids(struct teg=
ra_sku_info *sku_info,
> >       sku_info->gpu_speedo_id =3D 0;
> >       *threshold =3D THRESHOLD_INDEX_0;
> >
> > -     switch (sku) {
> > -     case 0x00: /* Engineering SKU */
> > -     case 0x01: /* Engineering SKU */
> > -     case 0x07:
> > -     case 0x17:
> > -     case 0x27:
> > -             if (speedo_rev >=3D 2)
> > +     if (sku_info->revision >=3D TEGRA_REVISION_A02) {
>
> The dowstream changes just have 'revision =3D=3D A02' here and not greate=
r
> or equal to. That said, I believe that A02 is the greatest revision of
> this device and so this should be fine. Thierry can make a final call,
> but otherwise ...

Reminder to review or pick up this patch.

Aaron
