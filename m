Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412CE341AAF
	for <linux-tegra@vger.kernel.org>; Mon,  5 Jan 2026 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644876; cv=none; b=bTJrKUAXpycWeqn8Gfwo/X88AupjCe0FQytllOo7QYTCp6yaVGGG/yc95IzbUM4yGopXhYWUHuNy6NZMCQmoXZFoLlqwDI4S47RF4/e17lHOn2QvxHjbavqnlmqMuJN5h+xAGEWVweIqJykZYfviYjetBu3SBbclv8RvG9CyQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644876; c=relaxed/simple;
	bh=0uN3Wo6LZBpp1d1dhVK4xy+EEuxFeubBihW9fQCdBSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npMis1kSPubR+xRz5aNEkJnfjk4sW3PDoXPAdaO9gxTcb8zfIuXDcujV0gNB8TO/+OeHGB/daGIkSOf28LEHjxCTZ6S0cj7oztQPH2mHsHxr11WKftNbIJtxSsTol8DNxK6/H+b2f1Pc8kUaAzyNdRZJOi19zfZAXZ9pv86l2lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lah/12/l; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lah/12/l"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso248637fac.1
        for <linux-tegra@vger.kernel.org>; Mon, 05 Jan 2026 12:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767644873; x=1768249673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3XI6bCAKsQriYzRbveh+mjiUOtBWkyunD+Ai7lEq4o=;
        b=lah/12/lW2TBtpooBLBz4mEq3SEnPAz7ShB8qw1jRMNqIHHTAo/AxWXrvuuWY8VEgB
         h72eUNOUAvMJIKqWFmoHejWn8pQjJLbeZ/xA7aYIeGbWzHc6LZDT5UI6ERTQj1Ud9NqF
         s2fqSDXzrUlLyGIeYbqY6KFoNlKKkHjemrVGB0gIBfne4GIksCYeYfCVLu/MkCSFcSZ8
         aAzK88A3eX1/MGddIHhwNlaIinzVTTzDnYqDiHkNoQpuZoQSY7g8Yl6Ht9HTAJ8UiUVP
         CavIEcCNO9JumiFvQuLgEE5GgStk9VkhQpOXUNlUUkRRujitovLtkud343lgBI0HKVvx
         lxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644873; x=1768249673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3XI6bCAKsQriYzRbveh+mjiUOtBWkyunD+Ai7lEq4o=;
        b=h9xD/OuYZalfjhYelYITk2PrwNrK1ETYEtKIq/fT1vVYAnmujkiHHotv8uvQZHMwD4
         V0y+Vy+2nS61ehjoPnz6s4FAouoEXmVautCkZshKyoRyAF3s4yH1GxCP7VqFl4+QeAKv
         CHRUlxvP4j8kizRjHrx8x8vjG8lDzGgbFJPn89VIFAtH9TzRicZfCCtywxaaOgYHPgbP
         VSEbDZs6mgcudj6OmFXVRubSaeWXVGpWPCrJ+DUElLx+sp6qMkYg+DSyk7npMKB5TeKk
         471KtRyMh4ZcTX049XTOV5LvoEx6BLgc2TYsggEO24cc/LPXxdNo1BenuhEuViN2P2GI
         DiFg==
X-Forwarded-Encrypted: i=1; AJvYcCUXnYeAdKOBn6pF0KeClzeHkw/gFbM+0WitcmVZpWiqBaoBLBIp8OYlnaDO5peXpjgr++2jJn7klhsbIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQX9ePa0edUkkJoiG92hhx3IuqxBh5hu3ySO1UWtAPgN6ELMc
	8o/KGA3dSIFb40ybzidO/X/pEhrgs4+jfi49Iy26PDoSR7pYNbZz8Iltj1Fuoy6tuVSey5IGnNf
	htuPa/uWKDxrZXEb/oB0Yr1OCXMe7vHs=
X-Gm-Gg: AY/fxX4ajtXXYmDmaf25oDE+U/6lNf/sLWOYsA1ijxaRDvpNurbfRlaVB2UYFR1B+WN
	BR8WX8yt4dpYATPjPBLYSrAj7kCEVLIFTxnKDeFUuIUNjDnT5w5LRKWvGhytv21JsGMABwwK155
	ZDwi+GAdGn4NRjdRTSyh87w+CXNR7al/MMU7Tn3hl/MTtKN14rJ8xjYiK4UaUuBN5dcV+xm1vyZ
	Pboura3HyvmxEtINXlMBn7Qj2JHLt7PzSn8H5hLml17XFEteZD4wuy9n2APB8Xw7XMT
X-Google-Smtp-Source: AGHT+IF2hy8CWGiM63Y8+xwznLyk+dEhUwULq8RbSM+Ot+KLkkBkNlFdi96vM/UOxnG9LbCQdGQJFn9fKKtzWOAYnz0=
X-Received: by 2002:a05:687c:20d3:b0:3d2:c44b:4d13 with SMTP id
 586e51a60fabf-3ffa0c3a41bmr406448fac.32.1767644872797; Mon, 05 Jan 2026
 12:27:52 -0800 (PST)
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
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Mon, 5 Jan 2026 21:27:41 +0100
X-Gm-Features: AQt7F2pzukyDqXFFMneREwdyQLcQgIZ67s8zaem85yct0BWpUjKo-8ufxgCWm2s
Message-ID: <CABr+WTnyKz7y-KKv6yQOfPWDf4iB2MarcQPetZ+OT1=3WqdH5A@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for Tegra210"
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 d=C3=A9c. 2025 =C3=A0 11:59, Jon Hunter <jonathanh@nvidia.com> a=
 =C3=A9crit :
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

With this revert, I have tegra drm back on 6.19-rc4 kernel.

But I also have this error that did not appear on 6.18:
"tegra210-emc 7001b000.external-memory-controller: failed to get
nominal EMC table: -19"

My boot flow is the latest L4T 32.7.6, upstream U-Boot 2025.01 and EFI boot=
.
U-Boot mentions:
Found DTB: nvidia/tegra210-p2371-2180.dtb
copying carveout for /host1x@50000000/dc@54200000...
copying carveout for /host1x@50000000/dc@54240000...
copying carveout for /external-memory-controller@7001b000..

That said, comparing in-tree dtb and runtime only shows few diffs.
(are more changes expected ?)

dtdiff /boot/dtbs/nvidia/tegra210-p2371-2180.dtb /proc/device-tree
--- /dev/fd/63    2026-01-05 21:20:39.956415634 +0100
+++ /dev/fd/62    2026-01-05 21:20:39.956415634 +0100
@@ -2207,6 +2207,12 @@
     };

     chosen {
+        bootargs =3D "BOOT_IMAGE=3D(hd0,msdos2)/vmlinuz-arm64
root=3DUUID=3D9bdc914f-f5c9-42cb-a4e9-9f3387f8d480 ro
rootflags=3Dsubvol=3Droot console=3DttyS0,115200 selinux=3D0 fbcon=3Drotate=
:3";
+        linux,uefi-mmap-desc-size =3D <0x28>;
+        linux,uefi-mmap-desc-ver =3D <0x01>;
+        linux,uefi-mmap-size =3D <0x528>;
+        linux,uefi-mmap-start =3D <0x00 0xfb568068>;
+        linux,uefi-system-table =3D <0x00 0xfed2bf80>;
         stdout-path =3D "serial0:115200n8";

         framebuffer {
---
