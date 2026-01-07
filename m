Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A7219E8D
	for <linux-tegra@vger.kernel.org>; Wed,  7 Jan 2026 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815454; cv=none; b=e0M8SFUW/LL8rk2gLFvKLmuLjjWKi7GcRFf0O7wr3oI3Fr1NynZNrZq9UCbVG4N7ZOpwXHjrfVTYQHUuK1UFOB6y/pqLhC2sNbOvtDmdwh9kLOh2qLfHrdQfXZpTuFs72ODlckDwtp3NNNEJJjm8+TTNQ8t3dpsc5RV1suxbjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815454; c=relaxed/simple;
	bh=y2cPhch0gTQU9+1cj4Kf+EUu2HgHqe9oPNW2+Voe+8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqRlest6fcESuoKkU1cqVWGU/ufPiOFrk6s5/+6w2lvm69MGm9ff8eh2trGHbk8SqaZmQDlyCvT0/0TrSdSV9P3eCDYSycF88S5StTpaHm8QlVzUe3Uyom4thSuReuHEn/ZUGm/eS9+HO5qmSRjPWdlX1SFQheJkHkIBWJ+Ub5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV4JMtLA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV4JMtLA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so1679136e87.0
        for <linux-tegra@vger.kernel.org>; Wed, 07 Jan 2026 11:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767815448; x=1768420248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsStFACs3iGKkKtZ/RTorfyJ4c229hhuF3PKngzrS7Y=;
        b=BV4JMtLAMCQifqzlJQbDH13NbPPEUnmimgkrtg+xlIuagadx5WE5NzcOwY6HGAXgG8
         05uLN0cc0KD+W00eM8u6vFPj6f5ZaRyJTQAhrve5DSpOKyjwQInN+HTDeTf3eY/ZuR59
         BTmtj1RhEivR+gJhM/fdhi3nw4K9NhV31m69DPrikqLy/wqrSitIiDYygWmYFu8z1W+e
         8Cy3+j2U9QYVq/2Kg/TjiDuQcwPvV/aG6jiQi7bqtHNf/yhvSBUf2pwHZ93JgBDw3+Hy
         2HadwV8qhhr/b16yxyAa75Ok3VVkGovUyPW3jtjtg0pYBIw+BXAc1voLotzgvnD2t4P7
         I4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767815448; x=1768420248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsStFACs3iGKkKtZ/RTorfyJ4c229hhuF3PKngzrS7Y=;
        b=fVMPc8Xxmsuwg2R5MgE112uss+P5CPywqhbs9rPry2NI2e9FiBgQ5DmmSH6aeWQ6kV
         FkAvMvjxjSnVSudkrwOm115Fdi9zHw4vS4TCX8oFjO2HUcshCe04YYNssBHcR1lInhVn
         rxFo1XTOAUi5JWkRDY4JJDrZWpxgJVbB/NJjYXVBhdgGFq/yyNyh+QWyH77mNRfSC7Lb
         Lq5Lo8Yn+p6Tp+o2LoQF2Gh4zTwi3nKpjfsnCllLTUHDzGEV/GQMJJc4mDVP2I1/vrn7
         HJEY4N8PDtQONK1UH/4H2Uq3QzlCgnIiImXuJx6n3hECVpIvi37acx3ywRQbDozahFeU
         hMsg==
X-Forwarded-Encrypted: i=1; AJvYcCV4bprGTUxu/cH0UHAJ+uVsN2kR8nrlK9arLKLlOBDMZ2KEadl2s2JZs5ZEihGAvAROKFXOE9DpPZp8+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj4GmzAskj4x7h3QZR/drOuwps7nHJR1lYczLNjnQW8rRFpF8S
	b/+iHPKUbchadxhkXxg2tW7S245IpTkzVFtetxX2W4gVRisZOKQzviJHh9RFQCEGrq2ItxU3Jd5
	3LhpCnu8tR3rin50m9fxp58M+Cx1dM1k=
X-Gm-Gg: AY/fxX6wXk2KmVfYPGOy0B5J4i7C77EbK+93SBs5DX+pd12/pjsyaQOHl3oO9Kc1EVP
	mWV5xW0Q7VL+nGEN/ArmYx1vBVDYLdlDNNLgSMzt4Hb/WmbDAS3rHxcNA9K0zgyiJq/MfEKlaNE
	TFWpD9FnqE7Z60vvdC+cHMA7S9oHSkgEFshowu6Cq9UkgFK3RAWpbxryvCe2bPhuZCAO2l8Urn2
	2UZUmheou7P74QG0+I+u9ALhSix1OYC8wGrlQOqhCemaAAc9n/Ccm0r6Qcmt5PWDxfMHQF4Dhf6
	pciGwh2K0Z7lzQlcq1pUI1qgcA2C6ffJHpyK9Ev+QJQCwbhlPg4DmfI8
X-Google-Smtp-Source: AGHT+IGiBhHTB1tG7ggsMqwUtKIEXXDjb+IhM4su4rS0l/0So60Izvdrpm11ZfyT+pPmTB6EAbKhyFdUFAc79fR8erI=
X-Received: by 2002:a05:6512:402a:b0:59a:18fc:c00 with SMTP id
 2adb3069b0e04-59b6f02d186mr1461865e87.31.1767815447574; Wed, 07 Jan 2026
 11:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217104744.184153-1-jonathanh@nvidia.com> <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
 <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>
 <aUPsDeFmxAJ09Tk7@orome> <CALHNRZ_vjSy+A8ZW7E1A4B5yQJ=GgvbNmafU7gjtGv-xjdfhPg@mail.gmail.com>
 <0ed3d270-b0be-4431-8a46-a7eea29598f4@nvidia.com> <CABr+WTnyKz7y-KKv6yQOfPWDf4iB2MarcQPetZ+OT1=3WqdH5A@mail.gmail.com>
In-Reply-To: <CABr+WTnyKz7y-KKv6yQOfPWDf4iB2MarcQPetZ+OT1=3WqdH5A@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 7 Jan 2026 13:50:36 -0600
X-Gm-Features: AQt7F2rjeq_ePos9uWPYiSSqPbtDRfdQoJ1cADeufnqXFi8qesuEFizzbLBCc_c
Message-ID: <CALHNRZ9JTMEWy8qgfPiZOPbOC3BdK8UbB01ghG+jC7+DsQS8Xg@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 2:27=E2=80=AFPM Nicolas Chauvet <kwizart@gmail.com> =
wrote:
>
> Le ven. 19 d=C3=A9c. 2025 =C3=A0 11:59, Jon Hunter <jonathanh@nvidia.com>=
 a =C3=A9crit :
> >
> >
> >
> > On 18/12/2025 19:07, Aaron Kling wrote:
> > > On Thu, Dec 18, 2025 at 6:00=E2=80=AFAM Thierry Reding <thierry.redin=
g@gmail.com> wrote:
> > >>
> > >> On Wed, Dec 17, 2025 at 02:42:58PM -0600, Aaron Kling wrote:
> > >>> On Wed, Dec 17, 2025 at 12:20=E2=80=AFPM Aaron Kling <webgeek1234@g=
mail.com> wrote:
> > >>>>
> > >>>> On Wed, Dec 17, 2025 at 4:48=E2=80=AFAM Jon Hunter <jonathanh@nvid=
ia.com> wrote:
> > >>>>>
> > >>>>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties f=
or
> > >>>>> Tegra210") populated interconnect properties for Tegra210 and thi=
s is
> > >>>>> preventing the Tegra DRM driver from probing successfully. The fo=
llowing
> > >>>>> error is observed on boot ...
> > >>>>>
> > >>>>>   drm drm: failed to initialize 54240000.dc: -517
> > >>>>>
> > >>>>> For now revert this change, until a fix is available.
> > >>>>>
> > >>>>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties f=
or Tegra210")
> > >>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > >>>>> ---
> > >>>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 -----------------=
-------
> > >>>>>   1 file changed, 24 deletions(-)
> > >>>>>
> > >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra210.dtsi
> > >>>>> index 709da31d5785..137aa8375257 100644
> > >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > >>>>> @@ -202,19 +202,6 @@ dc@54200000 {
> > >>>>>
> > >>>>>                          nvidia,outputs =3D <&dsia &dsib &sor0 &s=
or1>;
> > >>>>>                          nvidia,head =3D <0>;
> > >>>>> -
> > >>>>> -                       interconnects =3D <&mc TEGRA210_MC_DISPLA=
Y0A &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0=
B &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0=
C &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAYH=
C &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAYD=
 &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAYT=
 &emc>;
> > >>>>> -                       interconnect-names =3D "wina",
> > >>>>> -                                            "winb",
> > >>>>> -                                            "winc",
> > >>>>> -                                            "cursor",
> > >>>>> -                                            "wind",
> > >>>>> -                                            "wint";
> > >>>>>                  };
> > >>>>>
> > >>>>>                  dc@54240000 {
> > >>>>> @@ -230,15 +217,6 @@ dc@54240000 {
> > >>>>>
> > >>>>>                          nvidia,outputs =3D <&dsia &dsib &sor0 &s=
or1>;
> > >>>>>                          nvidia,head =3D <1>;
> > >>>>> -
> > >>>>> -                       interconnects =3D <&mc TEGRA210_MC_DISPLA=
Y0AB &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0=
BB &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0=
CB &emc>,
> > >>>>> -                                       <&mc TEGRA210_MC_DISPLAYH=
CB &emc>;
> > >>>>> -                       interconnect-names =3D "wina",
> > >>>>> -                                            "winb",
> > >>>>> -                                            "winc",
> > >>>>> -                                            "cursor";
> > >>>>>                  };
> > >>>>>
> > >>>>>                  dsia: dsi@54300000 {
> > >>>>> @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
> > >>>>>
> > >>>>>                  #iommu-cells =3D <1>;
> > >>>>>                  #reset-cells =3D <1>;
> > >>>>> -               #interconnect-cells =3D <1>;
> > >>>>>          };
> > >>>>>
> > >>>>>          emc: external-memory-controller@7001b000 {
> > >>>>> @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
> > >>>>>                  nvidia,memory-controller =3D <&mc>;
> > >>>>>                  operating-points-v2 =3D <&emc_icc_dvfs_opp_table=
>;
> > >>>>>
> > >>>>> -               #interconnect-cells =3D <0>;
> > >>>>>                  #cooling-cells =3D <2>;
> > >>>>>          };
> > >>>>>
> > >>>>> --
> > >>>>> 2.43.0
> > >>>>>
> > >>>>
> > >>>> A little bit of documentation on this, should someone read the lis=
t to
> > >>>> see what happened. The original report of the failure is here [0] =
and
> > >>>> only occurred when the tegra210-emc driver fails to probe. After t=
his
> > >>>> report, the related code change [1] to tegra210-emc which register=
s
> > >>>> the driver to icc was silently dropped from -next, but these dt
> > >>>> changes remained. So now these interconnect routes do cause tegra-=
drm
> > >>>> to universally fail on tegra210.
> > >>>>
> > >>>> Aaron
> > >>>>
> > >>>> [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0af=
ab@nvidia.com/
> > >>>> [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd=
227d676@gmail.com/
> > >>>
> > >>> There may be another option here. I'm beginning to think there will
> > >>> not be any way to set the icc routes for the dc's while the emc dri=
ver
> > >>> can fail to probe. The next best thing looks to be just dropping th=
e
> > >>> interconnect nodes from the dc nodes and leaving the rest of the
> > >>> original commit in place. Then reland the tegra210-emc driver chang=
e.
> > >>> This should put the no-emc case back to where it was, while allowin=
g
> > >>> actmon to do its scaling when emc is available. And I will move to =
the
> > >>> dc icc routes to downstream dt's, where I tightly control that emc =
is
> > >>> available.
> > >>>
> > >>> Does this sound reasonable? If so, I will go stage the changes and
> > >>> verify that it works as intended.
> > >>
> > >> Let's go with the revert for now, since that clearly documents where
> > >> things go wrong and it can be easily reapplied once the root cause h=
as
> > >> been resolved.
> > >>
> > >> It's a bit unfortunate that we don't have a way of making these
> > >> interconnect properties optional. If EMC fails to probe for whatever
> > >> reason, I think the assumption should be that it doesn't do any dyna=
mic
> > >> scaling of the EMC frequency and hence the entire ICC stuff isn't ne=
eded
> > >> and should just be no-ops.
> > >>
> > >> On the other hand, other than the patches getting reverted, there's
> > >> really no good reason for the EMC driver to fail to provide them, he=
nce
> > >> I think once that's been restored we can apply this again and then t=
hat
> > >> should be the end of it.
> > >
> > > Except that the tegra210-emc driver fails to probe at all if the
> > > bootloader does not copy reserved-memory table node? Which per Jon,
> > > the Nvidia regression bench does not do. And neither will a normal L4=
T
> > > install using a mainline kernel and dt via extlinux or u-boot. I have
> > > to put the mainline kernel on DTB and use a kernel in an android boot
> > > image, which causes nvtboot-cpu to set the dt table reserved memory
> > > node directly. Which is perfectly fine for my android use case, but
> > > not so much for anyone just trying to boot a Linux distro.
> >
> > I am lost. I was not able to follow the above. Our current testing
> > simply boots the upstream kernel + upstream DTB.
>
> With this revert, I have tegra drm back on 6.19-rc4 kernel.
>
> But I also have this error that did not appear on 6.18:
> "tegra210-emc 7001b000.external-memory-controller: failed to get
> nominal EMC table: -19"

I'm not sure what between 6.18 and -next would change this. I would
expect your setup to see this on older kernel versions too. Does the
emc driver fully probe and does scaling work for you on 6.18?

> My boot flow is the latest L4T 32.7.6, upstream U-Boot 2025.01 and EFI bo=
ot.
> U-Boot mentions:
> Found DTB: nvidia/tegra210-p2371-2180.dtb
> copying carveout for /host1x@50000000/dc@54200000...
> copying carveout for /host1x@50000000/dc@54240000...
> copying carveout for /external-memory-controller@7001b000..
>
> That said, comparing in-tree dtb and runtime only shows few diffs.
> (are more changes expected ?)
>
> dtdiff /boot/dtbs/nvidia/tegra210-p2371-2180.dtb /proc/device-tree
> --- /dev/fd/63    2026-01-05 21:20:39.956415634 +0100
> +++ /dev/fd/62    2026-01-05 21:20:39.956415634 +0100
> @@ -2207,6 +2207,12 @@
>      };
>
>      chosen {
> +        bootargs =3D "BOOT_IMAGE=3D(hd0,msdos2)/vmlinuz-arm64
> root=3DUUID=3D9bdc914f-f5c9-42cb-a4e9-9f3387f8d480 ro
> rootflags=3Dsubvol=3Droot console=3DttyS0,115200 selinux=3D0 fbcon=3Drota=
te:3";
> +        linux,uefi-mmap-desc-size =3D <0x28>;
> +        linux,uefi-mmap-desc-ver =3D <0x01>;
> +        linux,uefi-mmap-size =3D <0x528>;
> +        linux,uefi-mmap-start =3D <0x00 0xfb568068>;
> +        linux,uefi-system-table =3D <0x00 0xfed2bf80>;
>          stdout-path =3D "serial0:115200n8";
>
>          framebuffer {

For emc scaling to work with the current tegra210-emc driver, a
memory-region property needs added by the bootloader to
external-memory-controller@7001b000, pointing to emc-table regions
that it added to the reserved-memory node.

Aaron
