Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA33A8724
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247734; cv=pass; b=TGnI7uQQbMlIJVq3yNDbbHx5hDXSP6/IReGyhcrerdqGRy/HuPo3EavYtkWqbAVMxJWq5wYHDs7fhCCxZ3Uj+2J8X2X0l7IOtEYJn0k4L+t+7jhhmwb0QTATg6FpFwxRM7Tp+ISvwKrGr8OOERnyU0brdPLf2lqDcqKs6SSROZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247734; c=relaxed/simple;
	bh=D0cjfPz6srUzSK27LXqvU0HcL0VPKUNdNkRh/tXIT7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAVXBYUZVIA2U4U+XT3ligJuDsQUHAm9U6QaaY7zFN10LWT7poRwq2qhZ+BysBqLMfXskzsIJ8MwWzPEHL+nFuoqMet8Ks9ptczx4A13qf19yWJyaBNWieBFExd1rXCG9jDcCg4sy93sIwULTA0jzt2cR/QbazuCZr459lwC+n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLlT4EqD; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLlT4EqD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84830c774a0so4094999b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 07:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247733; cv=none;
        d=google.com; s=arc-20260327;
        b=AlfecIMBQFZviL/5t8DlaNlmeRzIVzjUouFMG+I20CXT4bH6+O0yyfsDNn4c+ALvmW
         d2a/tCz8PYIyRlLTWudPXMuSWlqJ91DFdMmaZLLgds3qpX5FVyZFqIsZ506NZu92FDci
         ycR7IPCeVwl/gURyCDVmbalP7v41lXVAO7HJYV9e0oJaeBpgmiPPovXVKY/1sVH2/ltE
         zDOLadORnG4yPJVr9WBRojAsOVvnc88tocSZ0FNL6BQmI+s43/EvHWvQZrc8QPlzqY+X
         xxqZjjtsSeIxGTZY/C+Au+go7PAZbQu/oJyN0eik3dEK0ju9YoOMkMBaZRKb09GZ6iBn
         jraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        fh=FJfZ2oTJLN5A4L7xPY3GmmA13+FIAMF9JZXVh6UCQsE=;
        b=SeXZsC8B97Wwrpolvw7/ffjxCZxH8060GtZ7iw1dYcKKBa6O/+yCo4oMzyRNzfwApL
         d/hkqi/lhQn0rGS43ajswAtYettG9z9YgYj8MpgPH8vO341VEA0I8v6eq4CQEdBkC38j
         UzOHEIN5a6p0ieqlg9S6Q4gqq4WX/1VeGwSKtAt3keQmQXKgkL3VRwSpJK6wSMw0eWrX
         gtoNP8XZzCDHO67Fm+OuG4NEI4JCAnd2qHna77+tu37GFZV5+3xpfnQ72jgjbiI+7W2g
         BPbUPnvLpDVLih6vQdgCnFeWyuqiaP0nLMx3CR5iAk2ZCOAAL2htDswJS3ATG/PtXbWm
         iIgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785247733; x=1785852533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        b=hLlT4EqDaH/VpkxeXh31FbrSDv6X7l7bBgOkiJw4+OoM6c9wph1AEqnxXsk8hhKivU
         00v7j0A2dcdOsl+q/kBUNgcQMn0JQkSUXPtVbwavkeTaRlu5HeC91vttI5kY/uj6gPgH
         VOrFFkxdfzP6QPyMAac0gdaRU/CNa3WhEGh8+XctSFW2xvRIasn4fdQ/cx9M/00RvibH
         EntCtym5OmvrmP0bc8YXkflfum8Sj5UhWgQ1qvLAaAnn3JyivzJ6sRXreaYIuJc1xG0w
         PHjCIcWfA1+AWW5+i5bnjo5vRLJ0yPvIPq3QP0gqalr5OsrwBi3Xyhey4JsRVSeVFE5j
         WWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247733; x=1785852533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmYzMuteSUlSNy/F0uJ+Um8VGfWKUWZHkLhmdqkcuA4=;
        b=qdbUQ5i9IMSkYAHEg+0YrhYop+9oLeZrSMJdvL2jA5W9POPzdz1lk2J9LHmjaEofFZ
         vU2GLxMw0cbVUYDyMUTThrZyvKfD1Bc9d8s2XUQZ/O932U6th3Pn6goaXilZlAasksjW
         j5vIklGaapyg5w68Y9QmfTJlG3PRHzXDGNjeN12FMwmiZsjr8tWK1jl9KB/4j/NEgBy5
         gQ42QA45feh2MP9oeedtRsRmAj8WOQ5qEaWoK9e17SMltg3aHqlQUfSchg+sd6jz0fDb
         DhpdEy8NgQ1KHIcH5GIHHJD1ZFzceCB9CC1PK6jkZZw+ikvGMVUrYbj7lQ0A+QIFP0c9
         q++A==
X-Forwarded-Encrypted: i=1; AHgh+Rpvg7M0E6+3CQ/HWyLkGxiD106F5a/PGpiHtOUizVcEd9jF1hU/Lfm/PgRmseR/snujkZnnJHNi3vUGUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4E/PmUEK/ryl3kyivxrA+SCsXFVYQXRKd6eb8CKyTMee8QUVE
	ZLQEkysAl1ee3gBr4EI3Og5UYHqB1FmOtQAOx/jcGDuYfBVN/AKBAJJUz5ZIjYJt4e/p9KEPNKK
	5MLQHDcFq9LOn/6NlruI64RI/WOCwOraNiRxq
X-Gm-Gg: AR+sD12g5hbNzjuI/TT9iNbaHDksXXI/fT16vWvSKCDr7AJ6nTXikjWBxLWzGaj59D3
	BG2sQOwKd0ixBhm/wiDV3v/zbNfl+ckslykm5nsRJGQZmv3Ynd98ges51naiP39yfKJ3N4J326O
	bCOIWx0BqM0x1xTyR+W69k2B4rX7ewkmHDtgJXkSbRY5wTANhGm74btBj68YsO4VDI0kMoeRGaJ
	zPpBYcP+XeSuRd5CrE6sGUWi/+j/dR2/FUfghz8pEVmeytrMdU2TGJdqvOEiuSo+DVSZmmfyyyh
	eouT1tt65eL4UHZB6fM=
X-Received: by 2002:a05:6a21:9cc9:b0:3c0:9c1a:8948 with SMTP id
 adf61e73a8af0-3c8ba668f1amr3171832637.64.1785247732505; Tue, 28 Jul 2026
 07:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-8-clamor95@gmail.com>
 <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
In-Reply-To: <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Jul 2026 17:08:40 +0300
X-Gm-Features: AUfX_my91r_8AyL2NlRyX8o1lr0nAHWwEheckgkyWCy-xUMglRmkyv41JrQXKdg
Message-ID: <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:13 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> > bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> > 'brcm,bcm4329-fmac' remains as fallback.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/a=
rm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > index 3de5c84d5f009..b71a02b3fd86f 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > @@ -1300,8 +1300,9 @@ bluetooth {
> >                       compatible =3D "brcm,bcm4334-bt";
> >                       max-speed =3D <4000000>;
> >
> > -                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > -                     clock-names =3D "txco";
> > +                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> > +                              <&palmas_clk32k>;
> > +                     clock-names =3D "txco", "lpo";
> >
> >                       interrupt-parent =3D <&gpio>;
> >                       interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RI=
SING>;
> > @@ -1309,7 +1310,6 @@ bluetooth {
> >
> >                       device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE, 1) =
GPIO_ACTIVE_HIGH>;
> >                       shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GPIO_A=
CTIVE_HIGH>;
> > -                     reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTI=
VE_LOW>;
>
> I'd appreciate a note in the commit message on why this is dropped.
>

It does not comply schema for "brcm,bcm4334-bt", further testing with
this reset gpio removed confirmed that it has nothing to do with
bluetooth and bluetooth works just fine without it.

> >
> >                       vbat-supply =3D <&vdd_3v3_com>;
> >                       vddio-supply =3D <&vdd_1v8_vio>;
> > @@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
> >                               #gpio-cells =3D <2>;
> >                       };
> >
> > -                     palmas_clk32kg@0 {
> > +                     palmas_clk32k: palmas_clk32kg@0 {
> >                               compatible =3D "ti,palmas-clk32kg";
> >                               #clock-cells =3D <0>;
> >                       };
> > @@ -2382,9 +2382,12 @@ mmc@78000000 {
> >               vqmmc-supply =3D <&vdd_1v8_vio>;
> >
> >               wifi@1 {
> > -                     compatible =3D "brcm,bcm4329-fmac";
> > +                     compatible =3D "brcm,bcm43340-fmac", "brcm,bcm432=
9-fmac";
> >                       reg =3D <1>;
> >
> > +                     clocks =3D <&palmas_clk32k>;
> > +                     clock-names =3D "lpo";
> > +
> >                       interrupt-parent =3D <&gpio>;
> >                       interrupts =3D <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_H=
IGH>;
> >                       interrupt-names =3D "host-wake";
> > --
> > 2.53.0
> >
> >
