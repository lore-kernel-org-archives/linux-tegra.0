Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9508B2D0636
	for <linux-tegra@vger.kernel.org>; Fri, 19 Dec 2025 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766167444; cv=none; b=OlBkPplGPvQo/0JwTjBBP1fMhatUig4rVQc0RX8eBRXYAc1hzS0HW2FxvssBgVEu5PKVrmkj9qEr7rLpvZ6ZjNBVA1+nxCjxH4R8UJR1IBI4QC0TrQoChYm7wSKqvnMeRKl8XXpVL1YKywbZIxfBgpbOXNQXXjdCtmOgVNdXLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766167444; c=relaxed/simple;
	bh=9mnXsvRAr1aOPh+owI9jNGJldgt66fK/Jo93oaXt28Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYlU+KgxFGhfxYFDLsZtrGSYNwwSwXZR7ZhcdVRgfXo2HGqb4fEHGGNy4K5LdIkPGXrBh5ArNK3ijxws0t6HLrMQVR8Ls+t/BwWbAemcmWqBKfa0W5LAJFZAfe6D2SN2OggDnvAvSJ/2vX3NuqsUrsBCQlTVYldnh7ISzPzmTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVxyNpqr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVxyNpqr"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b96cbd875so16617681fa.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Dec 2025 10:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766167441; x=1766772241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/V0GdR/KX4hQyzHp9M/qZtPuhDJKGMuj6R6bdVKIn8=;
        b=fVxyNpqrBhDjU2VxFoR0qVlnxjkNk89/hB0MZi9CduvDY8/Ff7w+sO61HulwJK+b8f
         VepfAOJ8g1h3CMgqDzR56dosybJepndbR7PzoyCLLR0g6eR4DemPJZO+fP53NlgJJb1+
         qdMfW2BTr6tzZnkycpU4BqRpjdrxCt5XV2ZgiQCTuDXC1+7HXt8tvCS+5EaokbnYXEng
         OF5Wf6TfwS2K7BZHf1X90M52NokKNF/a6dstPYOJgXm0RAqEDlKf5ADABxOHL2wwHGh4
         8e292KVphrxQgElYbKxf/9po3ihA4hMyRfEMrPWrKHL8UdCvWMG8Dfl8gKZoPrJjkrK9
         mcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766167441; x=1766772241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/V0GdR/KX4hQyzHp9M/qZtPuhDJKGMuj6R6bdVKIn8=;
        b=XoqQe132nOVVL14Ochf42qIAREvbwsjamj8pyTQrFUFVTBYI7BJBTrLG7HO9RY1LSR
         o+3dxc7P7l9dHjjTvEuJzwudnCLxdTKq3UaR+69r6wJnDqNad/8etk+cbC8Kppd+XVKE
         CGbuWSGOHcZpbKSf2gDzyn1/vVIxL9J2x/ySpDh0mXLFtDyeaS5EO3zdH1cPi43kjd2L
         lEXfLq61tC6AkoztkZ6YvN4wi1P8v75hZiyJcUXBSwzi1lr40j/9lmSgIQ0PqMrW1P0F
         7qo52RRCxJQLwll/2EbztKm4xeqFfNYoNUdbQidsDWK9ZqBYBXXX9HB1W6odSUXWFzl4
         w03Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiN8fxk57TXIWR9LvPQa673qIrQ8/Igipqg1JpEsw3HeZlSiq5UnF6Aitzhp7ASmeUGyFG2chBT5fiWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxseWOPyBQemdlEUfuZYSoypiefcYGi21jnuU8jnBc+w+h6eMi
	LDd2pSfRUQa3QwLPkUqC5JezS48HR6/sFlirUV65G8RIYs19fhQD0NGz7X+kFsFTeX0dzNbChQU
	fF5eGo0O2dbkAMnM4Pnovgvq2+24BBBU=
X-Gm-Gg: AY/fxX4pYEGFO+w/J99y42opVnr/VF/3MHdXfWGftBBpc7uZwtdmk0Eu6AfJO9hhfw/
	AXpY/sE9ygv5hs0KGK0KQl/Ki7xOSvWBruWRkCa32O7ReqAY5XyRZHoyDSxkkvEW0mQEeyIbKBY
	LRR9o+ktoGyj3MGUUNgzn7DDmzipesYfI1IUn0wxipCYrmgCgGpZANBYl1hjgxZZSJY83ZVuGAe
	uJ+sp32t5i/iDpO6OMluP46vQH0aFmmLlShhUesdY742AmSvbibeKsALBSo0eBPENpm6E9380R6
	UYEFjVpeoqtb5i8CGimuTjEwpVxq+FQujHAfRUDfJliPRXGvjRuc9h8+
X-Google-Smtp-Source: AGHT+IEbnviA7IBanuP5qxQGYh/Vd05ZwBK5sKHe+n9bqwvH7LzyoOm2YySlVGgFsxHZIPAllbiRd3vbFv23UA3WIjk=
X-Received: by 2002:a05:651c:549:b0:37f:cac3:c27f with SMTP id
 38308e7fff4ca-381216552efmr12322531fa.33.1766167440280; Fri, 19 Dec 2025
 10:04:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217104744.184153-1-jonathanh@nvidia.com> <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
 <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>
 <aUPsDeFmxAJ09Tk7@orome> <CALHNRZ_vjSy+A8ZW7E1A4B5yQJ=GgvbNmafU7gjtGv-xjdfhPg@mail.gmail.com>
 <0ed3d270-b0be-4431-8a46-a7eea29598f4@nvidia.com>
In-Reply-To: <0ed3d270-b0be-4431-8a46-a7eea29598f4@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 19 Dec 2025 12:03:48 -0600
X-Gm-Features: AQt7F2rJS0K8HHzWkRZdrqg6_ZDdphO6J-nuYlVYstXpDV3y3m1Ji8ekIyscID8
Message-ID: <CALHNRZ9GW-rWh=u6m6v1sp1dLZebWeY66-r+FjMJWt9X9f9C9Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 4:59=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
>
> On 18/12/2025 19:07, Aaron Kling wrote:
> > On Thu, Dec 18, 2025 at 6:00=E2=80=AFAM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> >>
> >> On Wed, Dec 17, 2025 at 02:42:58PM -0600, Aaron Kling wrote:
> >>> On Wed, Dec 17, 2025 at 12:20=E2=80=AFPM Aaron Kling <webgeek1234@gma=
il.com> wrote:
> >>>>
> >>>> On Wed, Dec 17, 2025 at 4:48=E2=80=AFAM Jon Hunter <jonathanh@nvidia=
.com> wrote:
> >>>>>
> >>>>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> >>>>> Tegra210") populated interconnect properties for Tegra210 and this =
is
> >>>>> preventing the Tegra DRM driver from probing successfully. The foll=
owing
> >>>>> error is observed on boot ...
> >>>>>
> >>>>>   drm drm: failed to initialize 54240000.dc: -517
> >>>>>
> >>>>> For now revert this change, until a fix is available.
> >>>>>
> >>>>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for=
 Tegra210")
> >>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 -------------------=
-----
> >>>>>   1 file changed, 24 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra210.dtsi
> >>>>> index 709da31d5785..137aa8375257 100644
> >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> >>>>> @@ -202,19 +202,6 @@ dc@54200000 {
> >>>>>
> >>>>>                          nvidia,outputs =3D <&dsia &dsib &sor0 &sor=
1>;
> >>>>>                          nvidia,head =3D <0>;
> >>>>> -
> >>>>> -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0=
A &emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0B =
&emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0C =
&emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAYHC =
&emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAYD &=
emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAYT &=
emc>;
> >>>>> -                       interconnect-names =3D "wina",
> >>>>> -                                            "winb",
> >>>>> -                                            "winc",
> >>>>> -                                            "cursor",
> >>>>> -                                            "wind",
> >>>>> -                                            "wint";
> >>>>>                  };
> >>>>>
> >>>>>                  dc@54240000 {
> >>>>> @@ -230,15 +217,6 @@ dc@54240000 {
> >>>>>
> >>>>>                          nvidia,outputs =3D <&dsia &dsib &sor0 &sor=
1>;
> >>>>>                          nvidia,head =3D <1>;
> >>>>> -
> >>>>> -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0=
AB &emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0BB=
 &emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAY0CB=
 &emc>,
> >>>>> -                                       <&mc TEGRA210_MC_DISPLAYHCB=
 &emc>;
> >>>>> -                       interconnect-names =3D "wina",
> >>>>> -                                            "winb",
> >>>>> -                                            "winc",
> >>>>> -                                            "cursor";
> >>>>>                  };
> >>>>>
> >>>>>                  dsia: dsi@54300000 {
> >>>>> @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
> >>>>>
> >>>>>                  #iommu-cells =3D <1>;
> >>>>>                  #reset-cells =3D <1>;
> >>>>> -               #interconnect-cells =3D <1>;
> >>>>>          };
> >>>>>
> >>>>>          emc: external-memory-controller@7001b000 {
> >>>>> @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
> >>>>>                  nvidia,memory-controller =3D <&mc>;
> >>>>>                  operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> >>>>>
> >>>>> -               #interconnect-cells =3D <0>;
> >>>>>                  #cooling-cells =3D <2>;
> >>>>>          };
> >>>>>
> >>>>> --
> >>>>> 2.43.0
> >>>>>
> >>>>
> >>>> A little bit of documentation on this, should someone read the list =
to
> >>>> see what happened. The original report of the failure is here [0] an=
d
> >>>> only occurred when the tegra210-emc driver fails to probe. After thi=
s
> >>>> report, the related code change [1] to tegra210-emc which registers
> >>>> the driver to icc was silently dropped from -next, but these dt
> >>>> changes remained. So now these interconnect routes do cause tegra-dr=
m
> >>>> to universally fail on tegra210.
> >>>>
> >>>> Aaron
> >>>>
> >>>> [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0afab=
@nvidia.com/
> >>>> [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd22=
7d676@gmail.com/
> >>>
> >>> There may be another option here. I'm beginning to think there will
> >>> not be any way to set the icc routes for the dc's while the emc drive=
r
> >>> can fail to probe. The next best thing looks to be just dropping the
> >>> interconnect nodes from the dc nodes and leaving the rest of the
> >>> original commit in place. Then reland the tegra210-emc driver change.
> >>> This should put the no-emc case back to where it was, while allowing
> >>> actmon to do its scaling when emc is available. And I will move to th=
e
> >>> dc icc routes to downstream dt's, where I tightly control that emc is
> >>> available.
> >>>
> >>> Does this sound reasonable? If so, I will go stage the changes and
> >>> verify that it works as intended.
> >>
> >> Let's go with the revert for now, since that clearly documents where
> >> things go wrong and it can be easily reapplied once the root cause has
> >> been resolved.
> >>
> >> It's a bit unfortunate that we don't have a way of making these
> >> interconnect properties optional. If EMC fails to probe for whatever
> >> reason, I think the assumption should be that it doesn't do any dynami=
c
> >> scaling of the EMC frequency and hence the entire ICC stuff isn't need=
ed
> >> and should just be no-ops.
> >>
> >> On the other hand, other than the patches getting reverted, there's
> >> really no good reason for the EMC driver to fail to provide them, henc=
e
> >> I think once that's been restored we can apply this again and then tha=
t
> >> should be the end of it.
> >
> > Except that the tegra210-emc driver fails to probe at all if the
> > bootloader does not copy reserved-memory table node? Which per Jon,
> > the Nvidia regression bench does not do. And neither will a normal L4T
> > install using a mainline kernel and dt via extlinux or u-boot. I have
> > to put the mainline kernel on DTB and use a kernel in an android boot
> > image, which causes nvtboot-cpu to set the dt table reserved memory
> > node directly. Which is perfectly fine for my android use case, but
> > not so much for anyone just trying to boot a Linux distro.
>
> I am lost. I was not able to follow the above. Our current testing
> simply boots the upstream kernel + upstream DTB.

Per the conversation on the p3450 mts bug workaround patch [0], the
conclusion was reached that the regression test setup does not pass
the emc tables to a mainline kernel. And as I described earlier in
that thread, neither will a normal L4T install. Which means the
tegra210-emc driver will always fail to probe unless the device is
flashed in the way I do for Android. If there's another way to get
that reserved ram node passed to a mainline kernel, I am unaware of
it.

> > I have wondered how the reserved memory dt tables were verified when
> > that support was initially added. And if the regression bench can be
> > set up like that. Because right now, emc fails to probe there, meaning
> > there's no test coverage for the driver.
>
> We have limited testing, but it is better than nothing. We are always
> open to more testing. I avoid the downstream device-trees because of
> compatibility issues. And avoid the bootloader making modifications to
> the upstream device-tree. I understand that might limit some features,
> but as you can see those have not been supported upstream yet.

This isn't about upstream or downstream device trees, it's about what
the bootloader sets to the in-ram dt during boot, namely for this
case: the emc tables reserved ram node. Which is currently supported
by tegra210-emc.

Aaron

[0] https://lore.kernel.org/all/00c5e342-50c7-44e6-89d3-3b879742c204@nvidia=
.com/
