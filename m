Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50C2D7387
	for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084889; cv=none; b=Rj4Im7W9DxnIOQ6hsPGuXrYop5vxUSUUTpH5bwFWXDchu4MvyeZrfw4CQJM9vSDeQKLRRHECHJKSZbUwQxdQroFD63hD/77CZHcZ3XwLlRtrBiSF2zMuHZNaj/pFQen/Lm8A4mi5hvbnEHuKvnspQraU/QhsO41P7kd4wVlzjVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084889; c=relaxed/simple;
	bh=IrPgklRGL2IRoMECvOwkqFaG3C+ScQfQVzGtrc8fmM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REWTY4qyl+j2+QxUTsJNRzw9hD4uumhUQjg6Rn5r0chjyABaTCWdpe4IshL4nt5NhEI/ilUDEX4jt2saF+erOpbPKRXP024Ysa2jmD4LqqY/LRnF2+SONkMNmpnYNwz6HDKXAsZSZtB6lH6FzaCYcjPztxfA4snj/igoFoqXifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjleOM4r; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjleOM4r"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5958931c9c7so1135917e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084884; x=1766689684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ6EMtZaY8/x7+h2gpyLYnuALUZdOTDKUPE8xbGL5wY=;
        b=XjleOM4rUnzfy7Tt3cwbx4Y72znCmOfmSnv5jZbU7lT2c7/4fopHVQqkGZiTP7xtJV
         6NimnAr1jzSHf30t3wMj9Vxl8xLzFrC6YCs9B8rjc47vx3R6nAJYKDRCzOQlYBuGa9cq
         3MSBUyXdkCIf2zzRTe2l8CQjE65ybHIc4IyWZkN3iXv3ktYIBdtTIOGgLzrAV7HtbSiS
         NzcHvjyLDY+6L2lcSKubR4GgXyR6KQPk3ld62GXXectQxEx67TNceu5Fr+O/uj0VUI6t
         XKtIEY+C0L1QcHByygL3vkL6RaammF4t6FTTtDkK7823egb2vev5f9dbqmwyqlNZapSh
         CtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084884; x=1766689684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bZ6EMtZaY8/x7+h2gpyLYnuALUZdOTDKUPE8xbGL5wY=;
        b=gJsa15jFGXbssD7t36vKQyJoXvMC3nHDablS0MboWMQwxxamPhBX58TRpN6YK6h7fn
         /R9CYiWDkPk6FZhlUiu6Tvlbb9CRmoYHT1y+8nYYukrFrPSPvJmk2XzeqV94mlJKwzgd
         7arqExaS/LlU5d6WqckurZniI/mdQ8fC/6Ihz0iHg4ANAXnmZQlBQhWeWsLmax0+EX/B
         UmVnX9lvhbkT+LUIPruXVzcp0pSjjhiFUdC8Sp2mB/HK8C9m6Itpvzw8g3hOChjl5csy
         xfHjjIhXNEZix6aicElS70J3ZyQZGOOid+FvR8apOxJxpt5EGKCTBXoXqlCSt5KmlZsn
         xZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ygA/fjJ/yMVIQ7E8JslAc246qRzTLZvhQD2s1k8kNpxJYV0SSvKmx498Qipl29pSzxfeNnet788wKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxl4lZdkQejdTAQUxPAq/wVrwdzUB9dir0k22tH2QawfcyIAhw
	PFnJ7BAYwBnAQPSOowYocb0DJSWhezNxg1qHTPIHuiI0vzNGRz0DConHKkL644UDb+DcAAOtjBy
	H+/QaCSgEWh9TdW+OsrbJq1NK8nqRg1c=
X-Gm-Gg: AY/fxX7+ercNGbCCYLvrLSkKALptFYW1TnpJKLMbfTytIHjcE5cyjMfJaxC5VlWOJB2
	lqmoN7MKAKeXuMlRhYmUUfVOOBCX7b1TS7OBmfBMx8uRaJb8uxFF1ZJq/DB+FvrFkqFzPYE+HLA
	tK31K5FD1AnHTGNWYuFXV7D51t4I32DjimyqA1p3x1v+m1hl1VQOatZ/rmrOvFNgD2/iJSHjb1E
	MyLmf/CFHipGHNvVf26EH12Fb+2gTqt9ozP0gL6wJgj2o+9F32peJfr7604r2zQNuXnUds=
X-Google-Smtp-Source: AGHT+IFmaVqU6xZDCbAEgfw++4K0heVS5xvvcusXRu6LwjW7KJkGjeP/JAbdmiH60qGFAMGnyPP46AalH/wiQ40XrOY=
X-Received: by 2002:a05:6512:e88:b0:598:fb09:5360 with SMTP id
 2adb3069b0e04-59a17df5ec2mr165727e87.53.1766084883768; Thu, 18 Dec 2025
 11:08:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217104744.184153-1-jonathanh@nvidia.com> <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
 <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com> <aUPsDeFmxAJ09Tk7@orome>
In-Reply-To: <aUPsDeFmxAJ09Tk7@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 18 Dec 2025 13:07:52 -0600
X-Gm-Features: AQt7F2rZaDEJQjyHAZZ0JkWaV3knLbFsUugTOOxQYIF1v4JX1I2zY4UaQHv-uF0
Message-ID: <CALHNRZ_vjSy+A8ZW7E1A4B5yQJ=GgvbNmafU7gjtGv-xjdfhPg@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 6:00=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Wed, Dec 17, 2025 at 02:42:58PM -0600, Aaron Kling wrote:
> > On Wed, Dec 17, 2025 at 12:20=E2=80=AFPM Aaron Kling <webgeek1234@gmail=
.com> wrote:
> > >
> > > On Wed, Dec 17, 2025 at 4:48=E2=80=AFAM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> > > >
> > > > Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> > > > Tegra210") populated interconnect properties for Tegra210 and this =
is
> > > > preventing the Tegra DRM driver from probing successfully. The foll=
owing
> > > > error is observed on boot ...
> > > >
> > > >  drm drm: failed to initialize 54240000.dc: -517
> > > >
> > > > For now revert this change, until a fix is available.
> > > >
> > > > Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for=
 Tegra210")
> > > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > > ---
> > > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 --------------------=
----
> > > >  1 file changed, 24 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210.dtsi
> > > > index 709da31d5785..137aa8375257 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > > @@ -202,19 +202,6 @@ dc@54200000 {
> > > >
> > > >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1=
>;
> > > >                         nvidia,head =3D <0>;
> > > > -
> > > > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0=
A &emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAY0B =
&emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAY0C =
&emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAYHC =
&emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAYD &=
emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAYT &=
emc>;
> > > > -                       interconnect-names =3D "wina",
> > > > -                                            "winb",
> > > > -                                            "winc",
> > > > -                                            "cursor",
> > > > -                                            "wind",
> > > > -                                            "wint";
> > > >                 };
> > > >
> > > >                 dc@54240000 {
> > > > @@ -230,15 +217,6 @@ dc@54240000 {
> > > >
> > > >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1=
>;
> > > >                         nvidia,head =3D <1>;
> > > > -
> > > > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0=
AB &emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAY0BB=
 &emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAY0CB=
 &emc>,
> > > > -                                       <&mc TEGRA210_MC_DISPLAYHCB=
 &emc>;
> > > > -                       interconnect-names =3D "wina",
> > > > -                                            "winb",
> > > > -                                            "winc",
> > > > -                                            "cursor";
> > > >                 };
> > > >
> > > >                 dsia: dsi@54300000 {
> > > > @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
> > > >
> > > >                 #iommu-cells =3D <1>;
> > > >                 #reset-cells =3D <1>;
> > > > -               #interconnect-cells =3D <1>;
> > > >         };
> > > >
> > > >         emc: external-memory-controller@7001b000 {
> > > > @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
> > > >                 nvidia,memory-controller =3D <&mc>;
> > > >                 operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> > > >
> > > > -               #interconnect-cells =3D <0>;
> > > >                 #cooling-cells =3D <2>;
> > > >         };
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > A little bit of documentation on this, should someone read the list t=
o
> > > see what happened. The original report of the failure is here [0] and
> > > only occurred when the tegra210-emc driver fails to probe. After this
> > > report, the related code change [1] to tegra210-emc which registers
> > > the driver to icc was silently dropped from -next, but these dt
> > > changes remained. So now these interconnect routes do cause tegra-drm
> > > to universally fail on tegra210.
> > >
> > > Aaron
> > >
> > > [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0afab@=
nvidia.com/
> > > [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd227=
d676@gmail.com/
> >
> > There may be another option here. I'm beginning to think there will
> > not be any way to set the icc routes for the dc's while the emc driver
> > can fail to probe. The next best thing looks to be just dropping the
> > interconnect nodes from the dc nodes and leaving the rest of the
> > original commit in place. Then reland the tegra210-emc driver change.
> > This should put the no-emc case back to where it was, while allowing
> > actmon to do its scaling when emc is available. And I will move to the
> > dc icc routes to downstream dt's, where I tightly control that emc is
> > available.
> >
> > Does this sound reasonable? If so, I will go stage the changes and
> > verify that it works as intended.
>
> Let's go with the revert for now, since that clearly documents where
> things go wrong and it can be easily reapplied once the root cause has
> been resolved.
>
> It's a bit unfortunate that we don't have a way of making these
> interconnect properties optional. If EMC fails to probe for whatever
> reason, I think the assumption should be that it doesn't do any dynamic
> scaling of the EMC frequency and hence the entire ICC stuff isn't needed
> and should just be no-ops.
>
> On the other hand, other than the patches getting reverted, there's
> really no good reason for the EMC driver to fail to provide them, hence
> I think once that's been restored we can apply this again and then that
> should be the end of it.

Except that the tegra210-emc driver fails to probe at all if the
bootloader does not copy reserved-memory table node? Which per Jon,
the Nvidia regression bench does not do. And neither will a normal L4T
install using a mainline kernel and dt via extlinux or u-boot. I have
to put the mainline kernel on DTB and use a kernel in an android boot
image, which causes nvtboot-cpu to set the dt table reserved memory
node directly. Which is perfectly fine for my android use case, but
not so much for anyone just trying to boot a Linux distro.

I have wondered how the reserved memory dt tables were verified when
that support was initially added. And if the regression bench can be
set up like that. Because right now, emc fails to probe there, meaning
there's no test coverage for the driver.

Aaron
