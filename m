Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E446433C4;
	Tue, 29 Apr 2025 01:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889731; cv=none; b=HRXLwMQZ+cvw29wA/Mi9K7WT77LbaNeI//t5w6stLblvZjuhVEet8nmM3x20mG44dx2N//rW9peAq7r9KDCUa6feqrygRoCKvnrMwcluQGt7tYOBpbPnjcYUfx2iBxGjVEGlZQ5dwZ/Po8t1fUzIbv2hwuLfT7bepAkR/h4OFVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889731; c=relaxed/simple;
	bh=cVg5GwXF+As3agQ4in7fyi3zb96mbkAD6agfPrPwiKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olpEFp6YQV2a2YtdZ83xs0lDQvYK7uUEsTjcVAN6RYU8HxeMJlF1cBUp8DTydDOP+HmzTSaewxoUy5nz8neQVnwKWqmzoCySnF/7fpN4dB1uHIoEUUfLrLGCwNfWOMc/u5aYUDOxPNszXkfFJ7YJHg3XftRFHaQezA4+yjshpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2aw+Gpp; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2aw+Gpp"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so60188731fa.2;
        Mon, 28 Apr 2025 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745889727; x=1746494527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubb+K4fWJbldGK6UGeJkIvEmFdoGer7C910vjm4ulPU=;
        b=Z2aw+GpptSsiB8KBQBLxHp7q+cWXE1CFFd5vEjfIO4jjDjb+kaK1hORMsWkgLQt6Yh
         IbXjxq8KRKfMnGir5UT3ugBi6f/TOSte0wbq6FJ/5vbrIazNlu7iGWTFFjKJEJdk6vd1
         FvT6k2kQqQPXpUx5KO9HpuWYPNoh3tytfTvIa6h0h/WpdxME2qcBubgnO9HH08+CBe/c
         C42mdS8FdbJsxSDLpY7lH03W60+XlZ1bbgJQ33DCkl/JntRf8Si7MntpTXx8ZFWYe4YA
         5pY7D1xIIvBhgc/dXwmzvLogPJKRVx0sx8HyT8XvEyiFOqB8Rb2x3Gfh9V/znM33xdWI
         153A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745889727; x=1746494527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubb+K4fWJbldGK6UGeJkIvEmFdoGer7C910vjm4ulPU=;
        b=qV24x44NM+a+o3bDm/vt5rSWNRpVp/1+cnMchqAkHm4wEuEPp8qje2AEYfeqQEK0O/
         cy2Wo8wjh6KjCbvqtmAFk7woZWe/1e3BYb6JQX0j8Tz2KOACxCkQRbMf8/qutzUi5Cjq
         PnHBeEim3O7IvIJQD73ymonRplnOmK1/oxHt/Zz+lQIUtRvsOrUg6RXNakTNoS9U/wtw
         p28OOYyIgoMX/YgoS0QwY1bYIpoqLv450oA7tb8+KPwb9Iqoj8Mw/YNFtldpBQqcL7Ps
         XXtbv56/X0PIT/zdFibW1rjP2I8tmLd1D9zUq4NkmpOqbRbTGL2Faf9jXeI1tjuNC/vb
         YVFw==
X-Forwarded-Encrypted: i=1; AJvYcCU1XWIDIEmumQyd9rl/VOz64GIZJEO3lwjYVimpvDV4pcS8qUyleL/axY70yl7LIwwuUnLVtsQGRqbMxTc=@vger.kernel.org, AJvYcCVawOdyKd5RtDe3S7qzuYBEFtZgTmB7r9KlYLdsZDwgDlUqpeaYTxxGE2BdbS1MadX7CzEj3QWvMKN5Jd6f44Lo@vger.kernel.org, AJvYcCWb2iU4FlvlcAKIXWlpEIPViAd8bonUWh5vzMneAoxAHYlB7XrMMkDjZ7zgQIUmCSB7znCZpwA+Y5JZjTNt@vger.kernel.org, AJvYcCWlKvaq39Sdoq3mKp8BGThrLs0RoQoXhHcQ0QXmxsGmV3haKWLapcjDUvE9eiUz4PfuHmsKspXINFXM@vger.kernel.org
X-Gm-Message-State: AOJu0YyxA2f+cOFMFWOduXpendcg9LFhJNviE2ee1y/WbwhWGburrsMd
	TJGxeG2GPLo2mZ9X1Q7S8noMtlwreNwXEYn20XNUEP+ZoqQFqRw8s04cif7dv0X7K9d5ow/7eHl
	Q4R0SJHc74IgVeXniMbDL7PY1wdtT7ivsrn+Szw==
X-Gm-Gg: ASbGnctwAYYga6bi+fwA6LkkCWdUSf/EdhORtcEn7J6xTMgZ9VliFppbSQA9MvT62ld
	eRZNGg7RoelnU8LAxvYom36vf99rQpE9G9zDDcDORlvpwisIOx8OgbVoC9ua+/HJkcqC0R71Rbq
	4OlOR+JULeQSzoLXce8ZtFBQ==
X-Google-Smtp-Source: AGHT+IGnkjEigT4yy4paszArYbJh9yCH5Txz4mV4DGyIa5fE9bALLBqfcFcgPDPkgfc3ub7dVNlOGmA8zR6Oo9YVCMU=
X-Received: by 2002:a05:651c:1142:b0:30c:2e22:c893 with SMTP id
 38308e7fff4ca-31d34c6104fmr4626501fa.23.1745889726849; Mon, 28 Apr 2025
 18:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org> <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
 <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org> <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org> <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
In-Reply-To: <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 28 Apr 2025 20:21:55 -0500
X-Gm-Features: ATxdqUFnRPs_QMsfLRvY1R6ZIrGYNdwq99bfTGl5CnY2zOSdxheyqbcR5pFPcek
Message-ID: <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
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

On Sun, Apr 20, 2025 at 8:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Tue, Apr 8, 2025 at 3:49=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
> >
> > On Tue, Apr 8, 2025 at 3:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> > >
> > > On 08/04/2025 09:35, Aaron Kling wrote:
> > > > On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > >>
> > > >> On 07/04/2025 18:00, Aaron Kling wrote:
> > > >>> On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > >>>>
> > > >>>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> > > >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>>
> > > >>>>> This allows using pstore on all such platforms. There are some
> > > >>>>> differences per arch:
> > > >>>>>
> > > >>>>> * Tegra132: Flounder does not appear to enumerate pstore and I =
do not
> > > >>>>>   have access to norrin, thus Tegra132 is left out of this comm=
it.
> > > >>>>> * Tegra210: Does not support ramoops carveouts in the bootloade=
r, instead
> > > >>>>>   relying on a dowstream driver to allocate the carveout, hence=
 this
> > > >>>>>   hardcodes a location matching what the downstream driver pick=
s.
> > > >>>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the addre=
ss and
> > > >>>>>   size in a node specifically named /reserved-memory/ramoops_ca=
rveout,
> > > >>>>>   thus these cannot be renamed.
> > > >>>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node b=
ased on
> > > >>>>>   compatible, however the dt still does not know the address, s=
o keeping
> > > >>>>>   the node name consistent on Tegra186 and newer.
> > > >>>>>
> > > >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > >>>>> ---
> > > >>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
> > > >>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
> > > >>>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> > > >>>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
> > > >>>>>  4 files changed, 61 insertions(+)
> > > >>>>>
> > > >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/ar=
m64/boot/dts/nvidia/tegra186.dtsi
> > > >>>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd=
754e42dd03f5a1da5079971dc 100644
> > > >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > >>>>> @@ -2051,6 +2051,22 @@ pmu-denver {
> > > >>>>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> > > >>>>>       };
> > > >>>>>
> > > >>>>> +     reserved-memory {
> > > >>>>> +             #address-cells =3D <2>;
> > > >>>>> +             #size-cells =3D <2>;
> > > >>>>> +             ranges;
> > > >>>>> +
> > > >>>>> +             ramoops_carveout {
> > > >>>>
> > > >>>> Please follow DTS coding style for name, so this is probably onl=
y ramoops.
> > > >>>
> > > >>> As per the commit message regarding tegra186: bootloader fills in=
 the
> > > >>> address and size in a node specifically named
> > > >>> /reserved-memory/ramoops_carveout, thus these cannot be renamed.
> > > >>
> > > >> That's not a reason to introduce issues. Bootloader is supposed to
> > > >> follow same conventions or use aliases or labels (depending on the=
 node).
> > > >>
> > > >> If bootloader adds junk, does it mean we have to accept that junk?
> > > >>
> > > >>>
> > > >>>>
> > > >>>> It does not look like you tested the DTS against bindings. Pleas=
e run
> > > >>>> `make dtbs_check W=3D1` (see
> > > >>>> Documentation/devicetree/bindings/writing-schema.rst or
> > > >>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/
> > > >>>> for instructions).
> > > >>>> Maybe you need to update your dtschema and yamllint. Don't rely =
on
> > > >>>> distro packages for dtschema and be sure you are using the lates=
t
> > > >>>> released dtschema.
> > > >>>
> > > >>> The bot is reporting that the reg field is missing from the added
> > > >>> ramoops nodes on t186, t194, and t234. However, as also mentioned=
 in
> > > >>> the commit message, this is intentional because it is expected fo=
r the
> > > >>> bootloader to fill that in. It is not known at dt compile time. I=
s
> > > >>> there a way to mark this as intentional, so dtschema doesn't flag=
 it?
> > > >>
> > > >> Fix your bootloader or chain load some normal one, like U-Boot.
> > > > How would chainloading a second bootloader 'fix' previous stage
> > > > bootloaders trampling on an out-of-sync hardcoded reserved-memory
> > > > address? It's possible for carveout addresses and sizes to change. =
Not
> > > > from boot to boot on the same version of the Nvidia bootloader, but
> > > > potentially from one version to another. Depending on if the
> > > > bootloader was configured with different carveout sizes.
> > > >
> > > > There is precedence for this. When blind cleanup was done on arm
> > > > device trees, a chromebook broke because the memory node has to be
> > > > named exactly '/memory' [0]. How is this any different from that ca=
se?
> > >
> > > That was an existing node, so ABI.
> > >
> > > > These nodes are an ABI to an existing bootloader. Carveouts on thes=
e
> > >
> > > You add new ABI, which I object to.
> > >
> > > > archs are set up in bl1 or bl2, which are not source available. I
> > > > could potentially hardcode things for myself in bl33, which is sour=
ce
> > > > available, but the earlier stages could still overwrite any chosen
> > > > block depending on how carveouts are configured. But even then, tha=
t
> > > > will not change the behaviour of the vast majority of units that us=
e a
> > > > fully prebuilt boot stack direct from Nvidia. My intent here is for
> > > > pstore to work on such units without users needing to use a custom
> > > > bootloader.
> > > I understand your goal. What I still do not understand, why bootloade=
r
> > > even bothers with ramoops carveout. It shouldn't and you should just
> > > ignore whatever bootloader provides, no?
> >
> > Mmm, I actually don't have the answer to this. Ramoops carveout
> > handling was added to t186 and t194 in cboot for L4T r32.7.3, fairly
> > late in the life cycle. But it has always been in edk2 for t194 and
> > t234 afaik. I could hazard some guesses, but don't have any
> > documentation on why the decision was made. Maybe Thierry or Jonathan
> > could chime in on why this was done.
> >
>
> Friendly reminder to the Tegra maintainers about this question.
>
In lieu of a response from the Tegra subsystem maintainers, I can only
hazard an assumption, Krzysztof. I presume the pstore carveout is
bootloader controlled because various stages of the boot stack can
dynamically allocate memory, and this became bootloader controlled to
prevent any of those from overwriting pstore. I worry about hardcoding
an address in the kernel dt, then finding out later that there's an
in-use configuration that overwrites or corrupts that section of ram
during boot. What are your thoughts on this? And is there any way for
this patch to proceed?

Sincerely,
Aaron
