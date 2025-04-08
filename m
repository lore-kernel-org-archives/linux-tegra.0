Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CE262802;
	Tue,  8 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097727; cv=none; b=j237SBJWAUXYltnwTxW21UxArXLNrhS7hc98AcA/sVB0nt5u1yjznYm/XpO8bJQOjJD81pGzTO7d/P0MObdBquCBjdm3D/+KNDH/jZyE6OcmF5OIVeSE8txjzWCT6OzZGlSpG10aJrIpsMuG9kwsG+FLwdIcs+sIERxSIrlX/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097727; c=relaxed/simple;
	bh=RfVYczxIb1l3GGMPXFeT6GWHpmjtTJlf7l2gvlRQhAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov2PVGcyuCKSsFFuOmvuILDVpYb1EkLefRjMJ0YMRAJ+nOp5OCGlaCGtBcM1HE5w/UNjnW77atsNo3TgrS3E8YoEsMMk+mWAIN4+/jID9stPCdU/p1ax9jLOL2DIbUpFXOO4suDxoo1jUZe7s89LhOSEqH3cBRSgkZUYmayfN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYbtY1cx; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYbtY1cx"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db3f3c907so47697171fa.1;
        Tue, 08 Apr 2025 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744097723; x=1744702523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5JtdeaXKDYvfwZoLN8X6ZLeGIMqSphwrswY3PSKZU0=;
        b=iYbtY1cxzMw5QVacP4DKlzjuDbCKnYYkzKAdI8uitM8xtHMj9PoxlGN91J8dDDngMj
         whnSjPjvTeGukOTugVaHQbVoMOeEtG4HMOdqOeUZwZM4t3+cShoKT3oo6Oibjw1eIg8D
         EyZcfhw87yvfJij521POrz11UpIBR2snrI+SAtMXlglBOuKtJrefsXRsupQWJLcd/Bp6
         KG+4bUfQlk1+jgBuLRLPxzKEemKO/uPLgBX778xf8456uA68efM/APwuQ/70mVCBkraZ
         H5KWB4TocRn1AHyw0my6OgYWblF+FgGKJONNhrWeUhAKInwerzi/cQ4u4ijb406VMCff
         19lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097723; x=1744702523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5JtdeaXKDYvfwZoLN8X6ZLeGIMqSphwrswY3PSKZU0=;
        b=VylWvTiQpm9uDThuNqurp3zQV8kPrfwpTGy28MRrzdkFZsSsurNOA3AXZ23Qse/zup
         ALZFLo9mH5P4EarjzjXNnU0QwJSbVQ7fa2AwFVUDtKSydwt2fz2oAXnrV0cZNjzxXYvv
         Hko+vcHzDwhdxh+yOs1aYnWVNGuvKTqBZyJK3VOsOZDYI1UfrKLFKtEWIN+35tSf9rS4
         AMRwZapAkd5qKTcOMUa1EGVm6xStI8bEmWy6y+OS+/XOi8iVho8y8NpQpPqDTmI180iu
         +xchhji1DAW9zRX5WiGk9Jyj4/xk11sYEg8tV/1unvarYTHsFoTr53z4q7ORZ9Ba/2wQ
         uIrw==
X-Forwarded-Encrypted: i=1; AJvYcCUNRp8/uSobG6W3C863ZkVYQtFG40McW/e4V3i6K0xfBmWr94FxBp/jOznsH4ebAyrXzdhXyqdc/71D2mLCqc47@vger.kernel.org, AJvYcCVa9KzsqNcMSPBM44QwX+lPnXWjS7etfqWAtFkehzbCuRJoER4K8eF/oydvkXBUlB6pTGpVLJQEtZPTuTU=@vger.kernel.org, AJvYcCWEr0uj4O1DtglK1Rf1iSkvYLJ5CxS5VyiNiSJdtxZLf6f0dNf4i9kfB5y4JoBBQEtg/gHZz7Q1UgWX8TNH@vger.kernel.org, AJvYcCWY1ZM5puxS05impNVWBMoa3rI3dTC2UPmW5J5yOuDZpk3dxZP3zdl3k9vQWlC6887zMCx2yy/5HREB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzregvc9nG+nMEwcdjjrsQ6J2GG2PODtHjY6gtrpYj8xHFhrqKX
	uLbfq6HwWvW8SF7nkZ4fMfsw8EM3MBP5Mm86iuZXFNjV0MtXkt8o1yF64N/yan6QYygDXvqScGM
	NG8qCE8qgAD2DaQrlC/9vIsT9YII=
X-Gm-Gg: ASbGncuGl4vhekU3GZGsMk0cCTlHsXduZn0wDsULgKGHpIKm5T/2sGiut1YQCTlsOxH
	M6m/3D0Hmmag65FeXzur4hrIhyZmKtLCTtzY8sJlMNNLNJogSZSLntoObluQFTCm7oxZWyGEQQP
	3TRdTGYwMFP/+yY4jdKJ+XMFsaOA==
X-Google-Smtp-Source: AGHT+IGLFlGV0+F2A7WjAzugPsJsNrpzgZaS1otIu2dmbXOM18v+qIiibbTKcAKtDA2ibCYLFOZG4haJvxewlqhpI/k=
X-Received: by 2002:a2e:bccf:0:b0:307:e0c3:5293 with SMTP id
 38308e7fff4ca-30f0a1d4e3amr55882911fa.36.1744097723300; Tue, 08 Apr 2025
 00:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org> <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
 <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
In-Reply-To: <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 8 Apr 2025 02:35:11 -0500
X-Gm-Features: ATxdqUEhT_cCsCHIzbYXLVPcrwdWBAkM0Y94ixPBAugMf6UkgCf_WAucGZWtu5k
Message-ID: <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
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

On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/04/2025 18:00, Aaron Kling wrote:
> > On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> This allows using pstore on all such platforms. There are some
> >>> differences per arch:
> >>>
> >>> * Tegra132: Flounder does not appear to enumerate pstore and I do not
> >>>   have access to norrin, thus Tegra132 is left out of this commit.
> >>> * Tegra210: Does not support ramoops carveouts in the bootloader, ins=
tead
> >>>   relying on a dowstream driver to allocate the carveout, hence this
> >>>   hardcodes a location matching what the downstream driver picks.
> >>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
> >>>   size in a node specifically named /reserved-memory/ramoops_carveout=
,
> >>>   thus these cannot be renamed.
> >>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based o=
n
> >>>   compatible, however the dt still does not know the address, so keep=
ing
> >>>   the node name consistent on Tegra186 and newer.
> >>>
> >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
> >>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
> >>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> >>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
> >>>  4 files changed, 61 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra186.dtsi
> >>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd754e42=
dd03f5a1da5079971dc 100644
> >>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> >>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> >>> @@ -2051,6 +2051,22 @@ pmu-denver {
> >>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> >>>       };
> >>>
> >>> +     reserved-memory {
> >>> +             #address-cells =3D <2>;
> >>> +             #size-cells =3D <2>;
> >>> +             ranges;
> >>> +
> >>> +             ramoops_carveout {
> >>
> >> Please follow DTS coding style for name, so this is probably only ramo=
ops.
> >
> > As per the commit message regarding tegra186: bootloader fills in the
> > address and size in a node specifically named
> > /reserved-memory/ramoops_carveout, thus these cannot be renamed.
>
> That's not a reason to introduce issues. Bootloader is supposed to
> follow same conventions or use aliases or labels (depending on the node).
>
> If bootloader adds junk, does it mean we have to accept that junk?
>
> >
> >>
> >> It does not look like you tested the DTS against bindings. Please run
> >> `make dtbs_check W=3D1` (see
> >> Documentation/devicetree/bindings/writing-schema.rst or
> >> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/
> >> for instructions).
> >> Maybe you need to update your dtschema and yamllint. Don't rely on
> >> distro packages for dtschema and be sure you are using the latest
> >> released dtschema.
> >
> > The bot is reporting that the reg field is missing from the added
> > ramoops nodes on t186, t194, and t234. However, as also mentioned in
> > the commit message, this is intentional because it is expected for the
> > bootloader to fill that in. It is not known at dt compile time. Is
> > there a way to mark this as intentional, so dtschema doesn't flag it?
>
> Fix your bootloader or chain load some normal one, like U-Boot.
How would chainloading a second bootloader 'fix' previous stage
bootloaders trampling on an out-of-sync hardcoded reserved-memory
address? It's possible for carveout addresses and sizes to change. Not
from boot to boot on the same version of the Nvidia bootloader, but
potentially from one version to another. Depending on if the
bootloader was configured with different carveout sizes.

There is precedence for this. When blind cleanup was done on arm
device trees, a chromebook broke because the memory node has to be
named exactly '/memory' [0]. How is this any different from that case?
These nodes are an ABI to an existing bootloader. Carveouts on these
archs are set up in bl1 or bl2, which are not source available. I
could potentially hardcode things for myself in bl33, which is source
available, but the earlier stages could still overwrite any chosen
block depending on how carveouts are configured. But even then, that
will not change the behaviour of the vast majority of units that use a
fully prebuilt boot stack direct from Nvidia. My intent here is for
pstore to work on such units without users needing to use a custom
bootloader.
>
> Best regards,
> Krzysztof

Sincerely,
Aaron

[0] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20190211110=
919.10388-1-thierry.reding@gmail.com/#22474263
