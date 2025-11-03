Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6029723F294
	for <linux-tegra@vger.kernel.org>; Mon,  3 Nov 2025 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193141; cv=none; b=TjD6PhVnxwHSRptvST0XJ8ci22jbXya6W8k30fDasCFK41klZpys/ui7od9FqypKNpJrDx1/6fuwHwUJ1AWUoUDr7WQdac3zPQJvQK675Kgm8whDwmMcgYQDenNpfIJ20MtkBpYkwmeznbyvN4XvBl7MEvyGO2Ex2j9tx+v3HRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193141; c=relaxed/simple;
	bh=PISYnyVrW+zygEMF1f2YOQFTzGbLCiScr72QBhAs73I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEj1/1z1ru0+tai+WquM1CJLngRcb1aU24KAL2u2SymhLeeL4CH3/pPHTjzn9Zpy0+jKMERRrVysZzdvddAaMc7mCzwHPDfcR+dIMgKNC8HRA8A0UEpIPZ8daV5MZ8N/Y/QPDrF6H5Ni1BGSMNvAZiwcQfW6RvwYt6TOljbx98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9wNou3K; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9wNou3K"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3717780ea70so51810851fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Nov 2025 10:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762193136; x=1762797936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8aecrmpQ3K9U7oiJGcYa/Rpdn9pxiAVmo61NrsXbt8=;
        b=J9wNou3KNVNCwbK34zdV0koeNZPam9yEEEyJgENpNXhTaTjtqB2YZlP8QT/TLbMypD
         M9kMiXsec/O+gCm0vyRuYZOA3zLrKmEQ8TPTiwxMFVgbgeMqHzS0Wd4Y/2V9w5O2th9a
         +IgdkDIRS+RnBCtPACsmad/jjNo5T4qqM20LKaTOQc6Df3iZ7waOfv4Mk45a/47isCn8
         jCPuvXTEvVqJpxlPvwRXkcyu0a7ivfPLZtwxTXqEUYarS3mMjeI+Q+Qx29ALf+43rzKu
         QS3fL+fJNVEs/Cv59Z2cAmY9HAILXeXIKfDFUk1RdWaTS1jQZhF9GvqhPZiiSHClJQ6z
         Q1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762193136; x=1762797936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8aecrmpQ3K9U7oiJGcYa/Rpdn9pxiAVmo61NrsXbt8=;
        b=cKJIOWZLYR8+Ensvd1wmpJ0UzoRSvbJA2sNKhSfWcjKRsRZVgC50ezvfJm3tNMXesA
         FM/V1bcA55BB1PLlQGL9Js186vghXxmr4EXsukuXdMphKvQRJrKZsbvfoq+UemQ/iaFs
         AYW0ZG7jMi5oNmSoCzHUL48qn3mpe67Q5Lvy8qhOOqYPIs6ZJDgA5FKXmChWztdY358i
         /+mlpV2FBAAA44LxZjhkeGgXKc+nB5/NqF3oyZcmrSZo8ItOolwQPtc/G3buOynGGcd4
         4NF7dWmduFc7CkcOjIrFCNDvYn+CRHlvtizT7RxzomXB5LTtXRbEHHjkcvMPK1pFLbiw
         jvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlWCk+UFsA4wPzUkPGzFLmsdadwtV/85BiZYpycVGeXVFdd2OsM0vaJw664b8xETmTAHuegDnHUMG72w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxKOKMcBrmL7zIEqworWwG5/XBj42d3Jtg4fxBa0zLxjavdLy4
	i9RGSIEaU/dxPxVdlDI3t8xaNStiTg8bwiZB3ylyrHF8Nai2wjdwqH3PXgj2vBrziMSZo2QQgDV
	xpfZYGbk/bh7iW7+ACnlDJHhh8v5xF0o=
X-Gm-Gg: ASbGnct5IPBbdzbyr9TOjThNOiSaI0ICeC1V8U2CmfxhFZtQ9qAuagqmnry8A1by1AS
	t9UjzErBifb/X0xjUvMse6eYmmRhPxzMddm/lAAjdEJW+lp9ulcxyoZax1gqG1l4BKZ2Ca4CQY/
	i1eY9wq4dlMCqFlMcG6Yb1h/6c8Gmtpt4c4HqZiS+GvF4iV4JaN494Qp2CpQpUUslyL88iiYOym
	VdiB2s8rxBG0b8sdkaHKn2ReB0aiuKmXYl4K63kjfj62kWMO/B+CaPlCP5BYT3UtyF4vJE=
X-Google-Smtp-Source: AGHT+IGC7/OpISkWQbMMipKycZQIYQDKL8rXabUx2InfXFTpSjCKCJJBdIGKPmclJe97UZMkkDuX8GDTzhUEQwFUA10=
X-Received: by 2002:a2e:bc21:0:b0:378:e8d1:117 with SMTP id
 38308e7fff4ca-37a2626ec92mr31718591fa.11.1762193136204; Mon, 03 Nov 2025
 10:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com> <CALHNRZ_QrQHCmF7f1z29tAmuNR-=rG1SgYJ1sssK3VXiQqURYg@mail.gmail.com>
 <ehkwvvmvk4mddxtcmne5jrex2rfq4phqsa5zifxdslrpvdl2ir@3zlwejmx5f5f>
In-Reply-To: <ehkwvvmvk4mddxtcmne5jrex2rfq4phqsa5zifxdslrpvdl2ir@3zlwejmx5f5f>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 3 Nov 2025 12:05:25 -0600
X-Gm-Features: AWmQ_bn8e3wfcvjuhO6Vmi4IjMPB_dfMYgSSGbJtskmsQArECnzIC31_RuG-ptw
Message-ID: <CALHNRZ-rArVkbEaiEVwMevfbu0dgX5P-ooVYTd-3RHvrhOJ5vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> > >
> > > Mmu is now being enabled for the display controllers.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194.dtsi
> > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eedcdfb=
ae1fdde1374adf40337 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > >                         #iommu-cells =3D <1>;
> > >
> > >                         nvidia,memory-controller =3D <&mc>;
> > > -                       status =3D "disabled";
> > > +                       status =3D "okay";
> > >                 };
> > >
> > >                 smmu: iommu@12000000 {
> > >
> > > --
> > > 2.51.0
> > >
> > >
> >
> > Question for Jon as the author of the commit being reverted. The
> > commit message states "we do not have a way to pass frame-buffer
> > memory from the bootloader to the kernel". If I understand this
> > correctly, this is talking about seamless handoff. What does this have
> > to do with enabling mmu on the display controllers? Seamless does not
> > work on any tegra arch as far as I'm aware, but Tegra194 is the only
> > one that doesn't have mmu enabled for the dc's. But enabling mmu
> > allows for better and faster memory allocation. My initial attempts to
> > enable this didn't work because I tried to attach them to the main mmu
> > unit, see the related freedesktop issue [0]. After noticing in the
> > downstream dt that the dc's are on a separate unit, I made it work.
> > And so far, it seems to work just as well as Tegra186. Then when I was
> > packaging up the change to submit, I found that this had been
> > explicitly disabled. But I'm not seeing why. Am I missing some
> > additional factors?
>
> This isn't seamless handoff to the Tegra DRM driver for display, but
> rather to simple-framebuffer. While this does technically work, it also
> causes a spew of SMMU faults during early boot because the firmware does
> not properly pass the SMMU mapping information to the kernel.
>
> In a nutshell what happens is that the firmware sets up the display
> controller to scan out from a reserved memory region, but it does so
> without involving the SMMU, so it uses physical addresses directly. When
> the kernel boots and the SMMU is enabled the continued accesses from
> display hardware cause SMMU faults (because there is no mapping for the
> framebuffer addresses).
>
> That said, we did solve these issues and this may not be happening
> anymore with the most recent L4T releases, so it may be okay to revert
> this now. We should find out exactly which release includes all the
> needed changes so that it can be referenced in the commit message. I
> want to avoid people running new kernels with an old L4T release and
> then seeing these errors without any reference as to why that might
> suddenly happen.

For reference, I have rolled back my Android usecase to use the L4T
r32.7.6 bootloaders on T194 for a variety of reasons. So I am using
cboot as the final bootloader and not edk2 as in L4T r34/r35. I have a
pending cboot patch to support simple-framebuffer handoff, but haven't
fully verified it as tegra-drm is currently unable to takeover from
simplefb like openrm does for t234. But all that to say that since I
no longer use r35 for t194 I don't have the setup to easily verify
which point release works here and what doesn't.

Aaron
