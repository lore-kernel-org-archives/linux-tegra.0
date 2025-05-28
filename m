Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572611F4E4F;
	Wed, 28 May 2025 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453733; cv=none; b=KCdX340gKYoO9GaFeW8kck9bIRZO4huSNXyT3nNGnH3wYwXIFDigNAHgs0hvT6CETi4hu2zie/J0uA45V4qkx9MSUAHs4LwXEwS3LRzfbvOvsQKxHZ//oVdRsiH7zQe9p6B71smLRnrEqBKgvPxzFT//M5Fgg8u54iU2xinMX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453733; c=relaxed/simple;
	bh=itrs7d2YdB95+jj/CJN3GF3X1vJf8HSkmGOfDoknRGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bj3IR+wMaV9P/isyAGruEqrE26mtE18NrTAboo9uUf1NlMbM1zjtXXfCz4Eq+yvUiYDNiDiwjZ0GJMK36vHh4aK/MWiufvDdHGcasn0vWna0ggGTuelEdwT45joRLOKZIxwTHWrO0xCHNNmXfM4wugp0SCu+hhHnzv/YQ6q8jlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSAztqM8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSAztqM8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d6f93316dso6143681e87.2;
        Wed, 28 May 2025 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453729; x=1749058529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkBRjqxyCqXXxfI/2vwtQAEpiBtmXiodfVIRt4U1ZTw=;
        b=NSAztqM8oaRUuQr2scsCRc+xGxJNKfq1VsnElbx9PMCc1mBS2+T3O5e+lE1/TVQ2NO
         +bRLBEI39oRzysakypgfuLXxxvRfu5Pffpxva6oHnUot1Q7vsvN1dyHJWs89c55MswWK
         ee+5pTyYEvruSeOlKsfmBimddBWUDu8Z0OP5k8LvO2I3wqV4QyLZTuqMjVyAFbL0E7XM
         V+M2td1WAVTobGAb5cJe0kULG4iXtxF51FW8YUnTfxnoQVe16MEgg7VkjvsdgZW3rR9x
         SInDBPxiakfyA7ZyWwejMTbASxDyyxtghrPiI6Od6lN1t4YRmHKAYhBle1Ox+Fu9pvFY
         /YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453729; x=1749058529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkBRjqxyCqXXxfI/2vwtQAEpiBtmXiodfVIRt4U1ZTw=;
        b=S5GVPv7XC9w2vmQ1ZluTWloN3O/7veNJ7iSlNNpH0F2toB9jvZJzyC3zp2Wq81BKum
         VhyILFrvmWt92BPEQixSYNA6EZSno7yFuBLSIbgALLbnD4gQ/EcRZ3vZnnGVNRooUEN6
         VUtEPIwaiwQDp2J8tBuEeb/1rSt/TB0OxBmyvfgXutITim2296v7UoCsHOksick6m8mB
         12k41yOOWB1aI/Xfb6/0Xwz39TMRU4KqDzHoFCXu0tTXRhyo7UJ9O7r01/1RoFPyXVMZ
         Q7G2YoXTVTx4+Y/t9ycsu6fNuozVFBbqrY4tkNO1EcOz+WYcZBVI2cMg68W3HJMYtXB+
         ITEg==
X-Forwarded-Encrypted: i=1; AJvYcCVYgQ2fiDzgvqOsP3P1dgPbwMzYYyd4r838CVVYCL47cMneLvpd15mca5ZUM3q1XM9WCk/UBDs9G0oeMvwu@vger.kernel.org, AJvYcCVq79Axr7Udm3i6pABgTI1K32l7DcmocSDDd3Wxa/8MNyi5uxvFnbYImc5ctwGSAWt5Z5bDS37LfK7f@vger.kernel.org, AJvYcCW9SrhkeRlaWbvRG8U2IEyorzF0hVs3/XuxlgvCOdo/QPLdX7jqd+YMir9nFL/Cu12xjLNjPwcuBNluk2rLy8V2@vger.kernel.org, AJvYcCWondaazLhTFpeNrB6tqVfNUUGcJ/uomuLbv2j5dywhvSZZ4/slKhw/jnWnFbkQzwrFaDnEF8uijFDoLpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLGICpR15bnNiX2rugcz52mQSluK8s+h3/2qe2jXMFOw0cwnm
	7g9Wd9wLDkav0KjyFhO51uliBMuU2JDjfsJy+WO9Rqzk1SwA1NpPgauKGFjJSWqYXgMTnnaZhG+
	DJOA3no80ELF8YkgtC9SwpGnuWTFjU4k=
X-Gm-Gg: ASbGncsD79+0m6JdLmPAq9KLUpvWitipf//IDyZ+V/SHFWRAydNrgKCtNGH7NBWSMh0
	SVYah2jcvazKCYfMJuyMv5pQLNWN0zD8a8orCtMrtRZSEMG4BxqmNJHrbFKkdfR3j1NqAReEFOi
	Svi04AqSPdzySw2txZWXIDirvyd6rpxSXg
X-Google-Smtp-Source: AGHT+IGTKw6zClBo5eqB8K+0a/cg2IicSc3zUkPVD2pgqdfqnz+KyoVBS1RLzfzMBFa7iS6949XPCRO4e3u5pA0Kmf4=
X-Received: by 2002:a05:6512:671a:b0:553:2191:d32f with SMTP id
 2adb3069b0e04-5532191d4f6mr3684316e87.44.1748453729228; Wed, 28 May 2025
 10:35:29 -0700 (PDT)
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
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com> <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
In-Reply-To: <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:35:16 -0500
X-Gm-Features: AX0GCFuWj7SeQ6mDUO11G55r0wDiicwxp7isA0ut-iK3MjYm86BCkS6KX2PoJZM
Message-ID: <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 4:27=E2=80=AFPM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Mon, Apr 28, 2025 at 08:21:55PM -0500, Aaron Kling wrote:
> > On Sun, Apr 20, 2025 at 8:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Tue, Apr 8, 2025 at 3:49=E2=80=AFAM Aaron Kling <webgeek1234@gmail=
.com> wrote:
> > > >
> > > > On Tue, Apr 8, 2025 at 3:17=E2=80=AFAM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > > >
> > > > > On 08/04/2025 09:35, Aaron Kling wrote:
> > > > > > On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> > > > > >>
> > > > > >> On 07/04/2025 18:00, Aaron Kling wrote:
> > > > > >>> On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <k=
rzk@kernel.org> wrote:
> > > > > >>>>
> > > > > >>>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> > > > > >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > > > >>>>>
> > > > > >>>>> This allows using pstore on all such platforms. There are s=
ome
> > > > > >>>>> differences per arch:
> > > > > >>>>>
> > > > > >>>>> * Tegra132: Flounder does not appear to enumerate pstore an=
d I do not
> > > > > >>>>>   have access to norrin, thus Tegra132 is left out of this =
commit.
> > > > > >>>>> * Tegra210: Does not support ramoops carveouts in the bootl=
oader, instead
> > > > > >>>>>   relying on a dowstream driver to allocate the carveout, h=
ence this
> > > > > >>>>>   hardcodes a location matching what the downstream driver =
picks.
> > > > > >>>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the a=
ddress and
> > > > > >>>>>   size in a node specifically named /reserved-memory/ramoop=
s_carveout,
> > > > > >>>>>   thus these cannot be renamed.
> > > > > >>>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the no=
de based on
> > > > > >>>>>   compatible, however the dt still does not know the addres=
s, so keeping
> > > > > >>>>>   the node name consistent on Tegra186 and newer.
> > > > > >>>>>
> > > > > >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > >>>>> ---
> > > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++=
++++
> > > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++=
++++
> > > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 ++++++++++++=
+
> > > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++=
++++
> > > > > >>>>>  4 files changed, 61 insertions(+)
> > > > > >>>>>
> > > > > >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arc=
h/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > > >>>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb95=
7dfd754e42dd03f5a1da5079971dc 100644
> > > > > >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > > >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > > >>>>> @@ -2051,6 +2051,22 @@ pmu-denver {
> > > > > >>>>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> > > > > >>>>>       };
> > > > > >>>>>
> > > > > >>>>> +     reserved-memory {
> > > > > >>>>> +             #address-cells =3D <2>;
> > > > > >>>>> +             #size-cells =3D <2>;
> > > > > >>>>> +             ranges;
> > > > > >>>>> +
> > > > > >>>>> +             ramoops_carveout {
> > > > > >>>>
> > > > > >>>> Please follow DTS coding style for name, so this is probably=
 only ramoops.
> > > > > >>>
> > > > > >>> As per the commit message regarding tegra186: bootloader fill=
s in the
> > > > > >>> address and size in a node specifically named
> > > > > >>> /reserved-memory/ramoops_carveout, thus these cannot be renam=
ed.
> > > > > >>
> > > > > >> That's not a reason to introduce issues. Bootloader is suppose=
d to
> > > > > >> follow same conventions or use aliases or labels (depending on=
 the node).
> > > > > >>
> > > > > >> If bootloader adds junk, does it mean we have to accept that j=
unk?
> > > > > >>
> > > > > >>>
> > > > > >>>>
> > > > > >>>> It does not look like you tested the DTS against bindings. P=
lease run
> > > > > >>>> `make dtbs_check W=3D1` (see
> > > > > >>>> Documentation/devicetree/bindings/writing-schema.rst or
> > > > > >>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-d=
evicetree-sources-with-the-devicetree-schema/
> > > > > >>>> for instructions).
> > > > > >>>> Maybe you need to update your dtschema and yamllint. Don't r=
ely on
> > > > > >>>> distro packages for dtschema and be sure you are using the l=
atest
> > > > > >>>> released dtschema.
> > > > > >>>
> > > > > >>> The bot is reporting that the reg field is missing from the a=
dded
> > > > > >>> ramoops nodes on t186, t194, and t234. However, as also menti=
oned in
> > > > > >>> the commit message, this is intentional because it is expecte=
d for the
> > > > > >>> bootloader to fill that in. It is not known at dt compile tim=
e. Is
> > > > > >>> there a way to mark this as intentional, so dtschema doesn't =
flag it?
> > > > > >>
> > > > > >> Fix your bootloader or chain load some normal one, like U-Boot=
.
> > > > > > How would chainloading a second bootloader 'fix' previous stage
> > > > > > bootloaders trampling on an out-of-sync hardcoded reserved-memo=
ry
> > > > > > address? It's possible for carveout addresses and sizes to chan=
ge. Not
> > > > > > from boot to boot on the same version of the Nvidia bootloader,=
 but
> > > > > > potentially from one version to another. Depending on if the
> > > > > > bootloader was configured with different carveout sizes.
> > > > > >
> > > > > > There is precedence for this. When blind cleanup was done on ar=
m
> > > > > > device trees, a chromebook broke because the memory node has to=
 be
> > > > > > named exactly '/memory' [0]. How is this any different from tha=
t case?
> > > > >
> > > > > That was an existing node, so ABI.
> > > > >
> > > > > > These nodes are an ABI to an existing bootloader. Carveouts on =
these
> > > > >
> > > > > You add new ABI, which I object to.
> > > > >
> > > > > > archs are set up in bl1 or bl2, which are not source available.=
 I
> > > > > > could potentially hardcode things for myself in bl33, which is =
source
> > > > > > available, but the earlier stages could still overwrite any cho=
sen
> > > > > > block depending on how carveouts are configured. But even then,=
 that
> > > > > > will not change the behaviour of the vast majority of units tha=
t use a
> > > > > > fully prebuilt boot stack direct from Nvidia. My intent here is=
 for
> > > > > > pstore to work on such units without users needing to use a cus=
tom
> > > > > > bootloader.
> > > > > I understand your goal. What I still do not understand, why bootl=
oader
> > > > > even bothers with ramoops carveout. It shouldn't and you should j=
ust
> > > > > ignore whatever bootloader provides, no?
> > > >
> > > > Mmm, I actually don't have the answer to this. Ramoops carveout
> > > > handling was added to t186 and t194 in cboot for L4T r32.7.3, fairl=
y
> > > > late in the life cycle. But it has always been in edk2 for t194 and
> > > > t234 afaik. I could hazard some guesses, but don't have any
> > > > documentation on why the decision was made. Maybe Thierry or Jonath=
an
> > > > could chime in on why this was done.
> > > >
> > >
> > > Friendly reminder to the Tegra maintainers about this question.
> > >
> > In lieu of a response from the Tegra subsystem maintainers, I can only
> > hazard an assumption, Krzysztof. I presume the pstore carveout is
> > bootloader controlled because various stages of the boot stack can
> > dynamically allocate memory, and this became bootloader controlled to
> > prevent any of those from overwriting pstore. I worry about hardcoding
> > an address in the kernel dt, then finding out later that there's an
> > in-use configuration that overwrites or corrupts that section of ram
> > during boot. What are your thoughts on this? And is there any way for
> > this patch to proceed?
>
> I haven't been able to find anything out about this yet. Generally it's
> difficult to get the bootloaders updated for these devices. Tegra194 and
> Tegra234 may be new enough to make an update eventually go into a
> release, but for Tegra186 and older, I honestly wouldn't hold my
> breath.
>
> Thierry

Krzysztof, based on this response, is there any way or form that the
Tegra186 part of this could be submitted? I can drop the newer
platforms from this patch if Thierry can get a response to his other
reply about how the bootloader could conform.

Sincerely,
Aaron
