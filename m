Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF1221DA0;
	Tue,  8 Apr 2025 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102168; cv=none; b=aIBOAeME/LmFzGYCbBEYIeLDWc/x9tF9O18+hgdYSFxywiIMD6W50CmcFW9VJv6AzQDUnnI5ARVTbSsrE7WmufZ6bCyFO24Gk7d9rCqoWWEAymeshjIoVExtKLhRhN0qI7Gs0BtindvZC0/XRy8g+auqDVBfyVdaEthlDPj6FGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102168; c=relaxed/simple;
	bh=/oi0h+YxGjSj0Amrgd3zkGZvok/zMIeGT22vwxuw0xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKJrrF7MkhLjPKOk7qPhtOpZXwrCsJHNHF2/2XzR1HSWWvDb97pcfQ9otocmm9cwejE8nMk0MqTmHJ69W9zQ44CCBVbBCE1SDmvSZroS79i1bLvizfBrwWdANEcaUe/LwqZkwoYRsRvJZN9b15g1ilT0eYIw2LglCf4z+i2gi+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F34BNLh/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F34BNLh/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54298ec925bso1675178e87.3;
        Tue, 08 Apr 2025 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102165; x=1744706965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLz6PIQLrX7WAvTgN7mKlzbJuOZCZNXq5vbLEn5vmhw=;
        b=F34BNLh/V77HHZ0mSwg4yanme41aqOwp4+33aLzTWhVhGe6HR3qW+9BjBIfc4ezwPc
         ug6DjamhNrxaVeSN7DdKVxF4REOJQOiwwECTBn2aUX+wSjFOkbAtFYLzND+1x8Dnqe0B
         O8Z/HySipzQH0zJBGwA3pcLtOWPsuge9KnOPejZ+zs+VPrdCYaESQ/OsrWf7eKQd+oHr
         +lLSbHCmbO+fKUGtW3QoQAPp+NA9Ww6OsZ+wA85BvvHjq3Fx0sD67FRVlnty9aBlqeXl
         fBe6rSUADQl6z+MXtSZO3Zy4I4wBVpN0sxK6B/3ETSSUwmwfWOVZSF8I/vdNEuoUJpMz
         lK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102165; x=1744706965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLz6PIQLrX7WAvTgN7mKlzbJuOZCZNXq5vbLEn5vmhw=;
        b=avZLWhZuAij+EF2kK5E2wECVpcAPtZi6HhgxdQyj1b+h2YO68zNRmWmAyFiOWE/4GF
         o2lkQCZYzCrzvYtN/2mjvwC8mPgT3sMQnvvmq9FdPG6cDuqsVZQ0+inv0UvhOOqnW+Os
         Ie3wdfsnalll7Xngya0k+rOIHtXlZz/fQVb/6r7VSjxEleB25EfY0hgZOGlo/DN9E5Yu
         cxDCqWWe0N/72YkeNXo5cn5ymKHE2rZ5PhraWeTelw2v+oiCgN4+XNiMBtsxZdabp+Nq
         ntq/0iCpBtP6rWDZbxVWnX62YR58lr25eqMQBWSSt+DM5qf4H7M2WXuJLQTmYsL8AKb8
         fj9g==
X-Forwarded-Encrypted: i=1; AJvYcCUc3kQ59cqL1L0JCCGz6pGiWKHNPpJ9hBLfPw8bflgISgu+G3G8lG2FpZK3H4c9LjT14tf/XCixc/PRthY=@vger.kernel.org, AJvYcCVdcoZMfGS7hk4Ju6+N+8HOI6xPMw9oKtfaCjLgsd27ghSXumDkg2SGwoXnqCslJz7dzCYA6AO7lxLqnmyy@vger.kernel.org, AJvYcCWWxwE8acrkZHBM0hr0THrY/coNIyL7kgsIKIpMGR6pv029N93z8Zc1dtlxrstbePkgbXNkG1AKKInv@vger.kernel.org, AJvYcCXM3KDvigMP6aILJla6J31eUfHreOr4IoFPGVrOHgneeMwUUrPmcqRHgd+uxneU1UY3eAO5XmYN0gQP50GU28Xh@vger.kernel.org
X-Gm-Message-State: AOJu0YywO7pR5vAXju5hoEiEJ4CHMQPwW3Oy+rrvxMMoo1KM32IZtaC8
	8rOpjcpX2HEECWFN+d/kdi4tf/NbQ+SK9BridPAZbKbqJPq1Dq6FMTvJOjhA6oNozM2xJTJZ86i
	otxUalq7FOE9rXI8KSA8+S6YzkWQ=
X-Gm-Gg: ASbGncvGTio1eHTIwAjoVG82AX/rC60n82Al2U8NWeGVz1BDltGcAI1Yw7/WM7At4xb
	DAXYvwC+kGFeYNqgRa8hPlWxO4KEy20hb/o3yv63Aw92wda9WBWBfppLbyqrJ+Xg8UcWFlP7T6I
	qjdyC482vtEREwZ8/7qWB7ts9fLw==
X-Google-Smtp-Source: AGHT+IE+JJyjApRSjTK6zCCcuyEkxu6Qm3vnoWNWSqKZ/kXpSOIJZWdovVbmT7GRh38X03m8OMgFhs3vFURkhxl2cy4=
X-Received: by 2002:a05:6512:b98:b0:549:b0f3:4391 with SMTP id
 2adb3069b0e04-54c233470ddmr3538766e87.38.1744102164993; Tue, 08 Apr 2025
 01:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org> <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
 <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org> <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org>
In-Reply-To: <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 8 Apr 2025 03:49:12 -0500
X-Gm-Features: ATxdqUETOFGFn2EHri9F9_4eIfOQKPNEzsi7Q-YJUiQd95xxiBDN67yuVyhCAbs
Message-ID: <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/04/2025 09:35, Aaron Kling wrote:
> > On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 07/04/2025 18:00, Aaron Kling wrote:
> >>> On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>>
> >>>>> This allows using pstore on all such platforms. There are some
> >>>>> differences per arch:
> >>>>>
> >>>>> * Tegra132: Flounder does not appear to enumerate pstore and I do n=
ot
> >>>>>   have access to norrin, thus Tegra132 is left out of this commit.
> >>>>> * Tegra210: Does not support ramoops carveouts in the bootloader, i=
nstead
> >>>>>   relying on a dowstream driver to allocate the carveout, hence thi=
s
> >>>>>   hardcodes a location matching what the downstream driver picks.
> >>>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address a=
nd
> >>>>>   size in a node specifically named /reserved-memory/ramoops_carveo=
ut,
> >>>>>   thus these cannot be renamed.
> >>>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based=
 on
> >>>>>   compatible, however the dt still does not know the address, so ke=
eping
> >>>>>   the node name consistent on Tegra186 and newer.
> >>>>>
> >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
> >>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
> >>>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> >>>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
> >>>>>  4 files changed, 61 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra186.dtsi
> >>>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd754e=
42dd03f5a1da5079971dc 100644
> >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> >>>>> @@ -2051,6 +2051,22 @@ pmu-denver {
> >>>>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> >>>>>       };
> >>>>>
> >>>>> +     reserved-memory {
> >>>>> +             #address-cells =3D <2>;
> >>>>> +             #size-cells =3D <2>;
> >>>>> +             ranges;
> >>>>> +
> >>>>> +             ramoops_carveout {
> >>>>
> >>>> Please follow DTS coding style for name, so this is probably only ra=
moops.
> >>>
> >>> As per the commit message regarding tegra186: bootloader fills in the
> >>> address and size in a node specifically named
> >>> /reserved-memory/ramoops_carveout, thus these cannot be renamed.
> >>
> >> That's not a reason to introduce issues. Bootloader is supposed to
> >> follow same conventions or use aliases or labels (depending on the nod=
e).
> >>
> >> If bootloader adds junk, does it mean we have to accept that junk?
> >>
> >>>
> >>>>
> >>>> It does not look like you tested the DTS against bindings. Please ru=
n
> >>>> `make dtbs_check W=3D1` (see
> >>>> Documentation/devicetree/bindings/writing-schema.rst or
> >>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetre=
e-sources-with-the-devicetree-schema/
> >>>> for instructions).
> >>>> Maybe you need to update your dtschema and yamllint. Don't rely on
> >>>> distro packages for dtschema and be sure you are using the latest
> >>>> released dtschema.
> >>>
> >>> The bot is reporting that the reg field is missing from the added
> >>> ramoops nodes on t186, t194, and t234. However, as also mentioned in
> >>> the commit message, this is intentional because it is expected for th=
e
> >>> bootloader to fill that in. It is not known at dt compile time. Is
> >>> there a way to mark this as intentional, so dtschema doesn't flag it?
> >>
> >> Fix your bootloader or chain load some normal one, like U-Boot.
> > How would chainloading a second bootloader 'fix' previous stage
> > bootloaders trampling on an out-of-sync hardcoded reserved-memory
> > address? It's possible for carveout addresses and sizes to change. Not
> > from boot to boot on the same version of the Nvidia bootloader, but
> > potentially from one version to another. Depending on if the
> > bootloader was configured with different carveout sizes.
> >
> > There is precedence for this. When blind cleanup was done on arm
> > device trees, a chromebook broke because the memory node has to be
> > named exactly '/memory' [0]. How is this any different from that case?
>
> That was an existing node, so ABI.
>
> > These nodes are an ABI to an existing bootloader. Carveouts on these
>
> You add new ABI, which I object to.
>
> > archs are set up in bl1 or bl2, which are not source available. I
> > could potentially hardcode things for myself in bl33, which is source
> > available, but the earlier stages could still overwrite any chosen
> > block depending on how carveouts are configured. But even then, that
> > will not change the behaviour of the vast majority of units that use a
> > fully prebuilt boot stack direct from Nvidia. My intent here is for
> > pstore to work on such units without users needing to use a custom
> > bootloader.
> I understand your goal. What I still do not understand, why bootloader
> even bothers with ramoops carveout. It shouldn't and you should just
> ignore whatever bootloader provides, no?

Mmm, I actually don't have the answer to this. Ramoops carveout
handling was added to t186 and t194 in cboot for L4T r32.7.3, fairly
late in the life cycle. But it has always been in edk2 for t194 and
t234 afaik. I could hazard some guesses, but don't have any
documentation on why the decision was made. Maybe Thierry or Jonathan
could chime in on why this was done.

>
> It's not the same case as memory, where bootloader needs to fill out the
> actual size, or some other boot-specific properties.
>
> Best regards,
> Krzysztof
Sincerely,
Aaron
