Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33421C9E5;
	Mon, 21 Apr 2025 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199953; cv=none; b=MkqZbmcgrb1Th1gLVCMZkeD1vfzXzUN3QsehzTzzyoGz9WeGjpLnTMuzMvTu37UhGS1QOaTW4tglWuQFkvnogU+WxhSKt7LJ7xufg/98FuTtcVy2Ax4y/b+KBu0SGjaGQ041LgyZvvwDHCG1oWsM3xpe4JQZ903xH/1wpgddONk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199953; c=relaxed/simple;
	bh=FJI3M/ikUXckIgrL7LsYmqw9n24CqCCR7ttW6QLxTJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2PEdCaIwALO3bDZSbB+IjqA4YyTwdnMeFc1Ye80KRjmFL1057sjaehw80wzrc2lAAZabgl1zbysS3DQmoMkDVqYg1cUUSQt4C3YXefp/HqJQ8j2fEU8aSWPAI7q7k+ySIf//uXLVzhIZr3dUQxM25xQEZ+jOd+qeoW1exd4bko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo6xVVJA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo6xVVJA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b166fa41bso4095092e87.0;
        Sun, 20 Apr 2025 18:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745199950; x=1745804750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlcAXEAOoA7rZxCFfDsCgU3ArJpLqYylP4zoHpggA6s=;
        b=Lo6xVVJA+a/NrrWdRx3JxD9uEqHI1/XzPQcrpIQOHFzeKdxJhyjs5SxjLBYwFc4aNF
         z0sLsPrsP+lkfYfuH5CIMPOaIjyot2DwUX0NE6uS0a8d8SzhVtS0u9RiHkAclfOO8lKj
         to0AWPQkURyYe7Sc+KNrKZGr0mOuWo/sJQBNbhA7gLtJsIH5SfCDWrScsH0fUQZle/IY
         VnL4RyuchTeq7cc2V/rQB8SXuZND8ZcP5WKRn7E1vo766v3HOxZs2atsk7WLL3VbCZfW
         Bqajwas81uQh7gvNmDTVzKGYv9x0wza/N6yAWDhZL+GEmBhISTtPZTKW6z8diXxZcH6R
         hYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745199950; x=1745804750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlcAXEAOoA7rZxCFfDsCgU3ArJpLqYylP4zoHpggA6s=;
        b=MMbjo2BhD7lrU9Q7b4NehyX1I0MZJIT8BViw40FSHbYfvji4hpPlaE1Fdtj3R/X5o2
         3UwBS58nVRqibD5bu+tzhVg4PvwrjDR4D73vYsiPPRn9yw1T5oXoxqlPqF6YRgzEsizC
         uArsEKLHuh+sbrT9Kl38kidN9mQJjV+HBCdHfEUvydnFe704z7T6ntMaEOAwGDUGta7i
         8OsDkm/aeZ4Sl9vhB7621moiUWlEArdJpOGqeNNOm7Cvs0sFjnsZ7/yiK1pVYQdlOvOq
         gdohns6OMcYFk05SQCRhyrs41dhtH+Po6KrOv02fTXq6MJEyBEYfURDlL2QgDpTn/gFv
         gLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfcSKcPe73pdm3faeogMOy4yGLgLliF/zgfmlpirX0IBkehXXexv6EGKf0iZKk0QuONRvzhe8tncK3txdE@vger.kernel.org, AJvYcCVoZO+00oGmK9uA3Z/9RUx903i23xy8AffMTxEQ6W0/0wBSliPkUcAHJrbOBj0rJo/QaMtJTZFulsvfzqc=@vger.kernel.org, AJvYcCXLQTU1alC+/3rU+ASuL6CJuYwMnC2c6PzhV++z6JCUwlDcGO9pAKK2ROpXoSuzkYqb4Ozo7yT+/XjN@vger.kernel.org, AJvYcCXLSzM2RHk4MFBD8Dh8cFHjV4Dy1KHd8KQsUVPHJq32eLk3gao56O4tikoPtVRwLNuBDry6y7z2RlvoSGQ8qNro@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0nnui/fncIzP9ITSOQ5xJWwOiPCPAsUhwyZt/N1im/t2CCTZD
	GrrNPAkbT+x6lObJv8bW9mw9IM8er6nTgbmmljMnzoCsYNKaMmAHPQM3XjjfFOQtCGqNKbC4I6K
	LA85o51M80qPSYTd+XQ0ImENwuqk=
X-Gm-Gg: ASbGncufkyDrJ9l+1tToXc4U+XxBfSXkImhEI/9xMeBA5GZB6/cUuKAFIDVwe5jpXdU
	Q6r7eV8jM0/U1cRHSGh5NEoGJXao5TzRcDd2yP/Thk+nvUlbUE1IgV6U0pkl0WvUtR3yhsezumX
	3CFkRWYiOvLR2CRs/n6z7PJQ==
X-Google-Smtp-Source: AGHT+IFBQfBYw22PzM8o7/nREt8zlqjUpMIN9iZSIffXu3l+y4m8uuWr7b3JOCxpH2bWv4EqRskLz48rHrJj+or776M=
X-Received: by 2002:a05:6512:3da3:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-54d6e6629e9mr3074930e87.48.1745199949444; Sun, 20 Apr 2025
 18:45:49 -0700 (PDT)
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
In-Reply-To: <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 20 Apr 2025 20:45:38 -0500
X-Gm-Features: ATxdqUE5cS0cyfAWO7a_dIJbYZH-kWofZzpENlP389VPo4SVaCMRPo-pnM6P3sc
Message-ID: <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
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

On Tue, Apr 8, 2025 at 3:49=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com> =
wrote:
>
> On Tue, Apr 8, 2025 at 3:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 08/04/2025 09:35, Aaron Kling wrote:
> > > On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On 07/04/2025 18:00, Aaron Kling wrote:
> > >>> On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >>>>
> > >>>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> > >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > >>>>>
> > >>>>> This allows using pstore on all such platforms. There are some
> > >>>>> differences per arch:
> > >>>>>
> > >>>>> * Tegra132: Flounder does not appear to enumerate pstore and I do=
 not
> > >>>>>   have access to norrin, thus Tegra132 is left out of this commit=
.
> > >>>>> * Tegra210: Does not support ramoops carveouts in the bootloader,=
 instead
> > >>>>>   relying on a dowstream driver to allocate the carveout, hence t=
his
> > >>>>>   hardcodes a location matching what the downstream driver picks.
> > >>>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address=
 and
> > >>>>>   size in a node specifically named /reserved-memory/ramoops_carv=
eout,
> > >>>>>   thus these cannot be renamed.
> > >>>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node bas=
ed on
> > >>>>>   compatible, however the dt still does not know the address, so =
keeping
> > >>>>>   the node name consistent on Tegra186 and newer.
> > >>>>>
> > >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>>>> ---
> > >>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
> > >>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
> > >>>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> > >>>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
> > >>>>>  4 files changed, 61 insertions(+)
> > >>>>>
> > >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra186.dtsi
> > >>>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd75=
4e42dd03f5a1da5079971dc 100644
> > >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > >>>>> @@ -2051,6 +2051,22 @@ pmu-denver {
> > >>>>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> > >>>>>       };
> > >>>>>
> > >>>>> +     reserved-memory {
> > >>>>> +             #address-cells =3D <2>;
> > >>>>> +             #size-cells =3D <2>;
> > >>>>> +             ranges;
> > >>>>> +
> > >>>>> +             ramoops_carveout {
> > >>>>
> > >>>> Please follow DTS coding style for name, so this is probably only =
ramoops.
> > >>>
> > >>> As per the commit message regarding tegra186: bootloader fills in t=
he
> > >>> address and size in a node specifically named
> > >>> /reserved-memory/ramoops_carveout, thus these cannot be renamed.
> > >>
> > >> That's not a reason to introduce issues. Bootloader is supposed to
> > >> follow same conventions or use aliases or labels (depending on the n=
ode).
> > >>
> > >> If bootloader adds junk, does it mean we have to accept that junk?
> > >>
> > >>>
> > >>>>
> > >>>> It does not look like you tested the DTS against bindings. Please =
run
> > >>>> `make dtbs_check W=3D1` (see
> > >>>> Documentation/devicetree/bindings/writing-schema.rst or
> > >>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicet=
ree-sources-with-the-devicetree-schema/
> > >>>> for instructions).
> > >>>> Maybe you need to update your dtschema and yamllint. Don't rely on
> > >>>> distro packages for dtschema and be sure you are using the latest
> > >>>> released dtschema.
> > >>>
> > >>> The bot is reporting that the reg field is missing from the added
> > >>> ramoops nodes on t186, t194, and t234. However, as also mentioned i=
n
> > >>> the commit message, this is intentional because it is expected for =
the
> > >>> bootloader to fill that in. It is not known at dt compile time. Is
> > >>> there a way to mark this as intentional, so dtschema doesn't flag i=
t?
> > >>
> > >> Fix your bootloader or chain load some normal one, like U-Boot.
> > > How would chainloading a second bootloader 'fix' previous stage
> > > bootloaders trampling on an out-of-sync hardcoded reserved-memory
> > > address? It's possible for carveout addresses and sizes to change. No=
t
> > > from boot to boot on the same version of the Nvidia bootloader, but
> > > potentially from one version to another. Depending on if the
> > > bootloader was configured with different carveout sizes.
> > >
> > > There is precedence for this. When blind cleanup was done on arm
> > > device trees, a chromebook broke because the memory node has to be
> > > named exactly '/memory' [0]. How is this any different from that case=
?
> >
> > That was an existing node, so ABI.
> >
> > > These nodes are an ABI to an existing bootloader. Carveouts on these
> >
> > You add new ABI, which I object to.
> >
> > > archs are set up in bl1 or bl2, which are not source available. I
> > > could potentially hardcode things for myself in bl33, which is source
> > > available, but the earlier stages could still overwrite any chosen
> > > block depending on how carveouts are configured. But even then, that
> > > will not change the behaviour of the vast majority of units that use =
a
> > > fully prebuilt boot stack direct from Nvidia. My intent here is for
> > > pstore to work on such units without users needing to use a custom
> > > bootloader.
> > I understand your goal. What I still do not understand, why bootloader
> > even bothers with ramoops carveout. It shouldn't and you should just
> > ignore whatever bootloader provides, no?
>
> Mmm, I actually don't have the answer to this. Ramoops carveout
> handling was added to t186 and t194 in cboot for L4T r32.7.3, fairly
> late in the life cycle. But it has always been in edk2 for t194 and
> t234 afaik. I could hazard some guesses, but don't have any
> documentation on why the decision was made. Maybe Thierry or Jonathan
> could chime in on why this was done.
>

Friendly reminder to the Tegra maintainers about this question.

Sincerely,
Aaron Kling
