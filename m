Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DD21CFFD
	for <linux-tegra@vger.kernel.org>; Tue,  9 Dec 2025 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254097; cv=none; b=tXd/3KlD0oZWsk5kL0z5omlUwcDyLb3tsEpHwP1ZTbuECHoO3dMZwAcF/bfvlITDhVs9kkW70OgLT9RmZY7QWy7Xl075tuRJM4BtMoxesHosKqeTCMvfNV1XrxRPY5ckN8KGQIfS/WNS3BKWh42RDcuSTsUsaH69Q1GuTyNo1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254097; c=relaxed/simple;
	bh=PZhds5N6X6MmhbvC04AMxoJcF84daqIxkM47skgPn24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBS4a2yBUSaLUgaIsBJZPuHXWZoqreC0Q+HJCg1P918+gZIEuF9CgqI1LlSy0u5GRDCd6/WkxWo51v4Kn+qfT7IU2M4J5bufOIND1So1tGxGiAaiOEs6mCNfVtq6KcVE18jlf9HgQ7mqSYCS35gxfrnFerHhSnlpneu3FvlHi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VViSmwMh; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VViSmwMh"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59584301f0cso5628093e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 08 Dec 2025 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254093; x=1765858893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9NVGlJCg7ykVUdeW2T+8c4mtxDYcXfoa/ug95D9+KU=;
        b=VViSmwMhBx40sY4unsLoR4vgHrLYnz8kwlROf7jAFZVwGkFeftKXZUX/9McL0aKQTM
         Q7AIvB4vWIteXqpsasawjS/Yo7WEZggR4ro8pqFDqeqNRMOVMAXaVF2W8HU8jsqlEUp6
         7phamk5dpluvxdI4Hi3DUhB5otPNvzGljEckym7dPfW4iXvhDGMcZwhcSmdMwGfJgExg
         3x2U2GTHIoNoGcrW/rt0cF9keXsCjVwOUIqT+GzePrd/xuJlTw3UWqE8lt7PCjeco2JW
         TMRdeobXN2+cnanKyQX3Pn9h4kgGwB8QjMF5Sg+PfgWUnbkC9Ph5tgK3tOJnFWbpPVP9
         JYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254093; x=1765858893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9NVGlJCg7ykVUdeW2T+8c4mtxDYcXfoa/ug95D9+KU=;
        b=VwnjMCqV2pDkbxPcnT5VTQAcIt2lPF8WQBw4e89BWj3icNpcK4Rbe64LftNCvLgwsO
         BHVeztTIqLeAPNTsUARzC/4ceXA4Cx8dtg6nc6D/6j9MBeeUf1PwtVMIWJEZj9yBPON6
         DIZQb06AX5/ff5ASr6tLDdoFc+mdx/oK+sdnk1tC93dLbeb/rkLIdc07ihsaTH8mYdck
         0PRfPt2pDPmso3trdkdyFJhpLCGUjs2YrPzsWRdR64Z0C2GOyUICKMmula+CT50AVvnj
         0O8a39/xV3Qjp4abN3LBH3BWl2gSRLzbeu21Pn07RBYGbMoPUdNZcb142h4D/gVljx/W
         brag==
X-Forwarded-Encrypted: i=1; AJvYcCWW+g67qYO69xHattTp7nop/C6JHKSDvqkjtARYhZrRVsfHrsc7XSPvCpRXbERQgxMrMc8IxHcDnvAbsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPHrc0mniV0g8HvW3zT0DcAl/M658bi9EF7CQB7yFKlEDtt3X
	BCv+AM/G+WNvoLlK4f7eN8v1n6chaCOvnssxFDvz/x/2wnFD+9l1GqkHVcZWwh3G39VYo3MDQEN
	NEx9nq3nZseqCBpeR1rgqimQS5woXjvE=
X-Gm-Gg: ASbGncvldiuKUo9Jgt7KrgI9KXKb1+xITy29j0fKk5I2Ki5iXAnoO27R86Znwop40jY
	2m9rcjVl9a3j5FABllxItVrmzfX1HPBFEdCIrZijiohXNHUdJaxkhlIfsrAEGryXR8Qny11FiNM
	WbSTCLZL9U0+MUpZtwbyqBEdlFSfBAqo7it9LYhPQkVzlHraP5Xc8uqcQ5/m64FRlsW+MSkXCFm
	AX3NpOHp4eBD12XM7pkJoFxSohW+fNXUHtyfk4JjhZfSXHdsxppmYkcAlT8YB/Xv88UNvo=
X-Google-Smtp-Source: AGHT+IH9ow4VGpZQxvEmwOt6xtR/45A8V+ydlsbvjhAiEm/De1njwbRl1RCDsqCKKbvLz+iAKmYkKo8bb9PDDvlzQqY=
X-Received: by 2002:a05:6512:1325:b0:597:d6d6:4a35 with SMTP id
 2adb3069b0e04-5987e8c8cd7mr3385735e87.33.1765254093127; Mon, 08 Dec 2025
 20:21:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <20251101-tegra194-dc-mmu-v1-1-8401c45d8f13@gmail.com> <CALHNRZ_QrQHCmF7f1z29tAmuNR-=rG1SgYJ1sssK3VXiQqURYg@mail.gmail.com>
 <ehkwvvmvk4mddxtcmne5jrex2rfq4phqsa5zifxdslrpvdl2ir@3zlwejmx5f5f> <CALHNRZ-rArVkbEaiEVwMevfbu0dgX5P-ooVYTd-3RHvrhOJ5vQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-rArVkbEaiEVwMevfbu0dgX5P-ooVYTd-3RHvrhOJ5vQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Dec 2025 22:21:21 -0600
X-Gm-Features: AQt7F2qUovQzQ0cgOIiDDf4VAk0bamHdd6WWdUgxFn3oWlK1__sJAG8hXFhHdPc
Message-ID: <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> > > >
> > > > Mmu is now being enabled for the display controllers.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra194.dtsi
> > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8eedcd=
fbae1fdde1374adf40337 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > >                         #iommu-cells =3D <1>;
> > > >
> > > >                         nvidia,memory-controller =3D <&mc>;
> > > > -                       status =3D "disabled";
> > > > +                       status =3D "okay";
> > > >                 };
> > > >
> > > >                 smmu: iommu@12000000 {
> > > >
> > > > --
> > > > 2.51.0
> > > >
> > > >
> > >
> > > Question for Jon as the author of the commit being reverted. The
> > > commit message states "we do not have a way to pass frame-buffer
> > > memory from the bootloader to the kernel". If I understand this
> > > correctly, this is talking about seamless handoff. What does this hav=
e
> > > to do with enabling mmu on the display controllers? Seamless does not
> > > work on any tegra arch as far as I'm aware, but Tegra194 is the only
> > > one that doesn't have mmu enabled for the dc's. But enabling mmu
> > > allows for better and faster memory allocation. My initial attempts t=
o
> > > enable this didn't work because I tried to attach them to the main mm=
u
> > > unit, see the related freedesktop issue [0]. After noticing in the
> > > downstream dt that the dc's are on a separate unit, I made it work.
> > > And so far, it seems to work just as well as Tegra186. Then when I wa=
s
> > > packaging up the change to submit, I found that this had been
> > > explicitly disabled. But I'm not seeing why. Am I missing some
> > > additional factors?
> >
> > This isn't seamless handoff to the Tegra DRM driver for display, but
> > rather to simple-framebuffer. While this does technically work, it also
> > causes a spew of SMMU faults during early boot because the firmware doe=
s
> > not properly pass the SMMU mapping information to the kernel.
> >
> > In a nutshell what happens is that the firmware sets up the display
> > controller to scan out from a reserved memory region, but it does so
> > without involving the SMMU, so it uses physical addresses directly. Whe=
n
> > the kernel boots and the SMMU is enabled the continued accesses from
> > display hardware cause SMMU faults (because there is no mapping for the
> > framebuffer addresses).
> >
> > That said, we did solve these issues and this may not be happening
> > anymore with the most recent L4T releases, so it may be okay to revert
> > this now. We should find out exactly which release includes all the
> > needed changes so that it can be referenced in the commit message. I
> > want to avoid people running new kernels with an old L4T release and
> > then seeing these errors without any reference as to why that might
> > suddenly happen.
>
> For reference, I have rolled back my Android usecase to use the L4T
> r32.7.6 bootloaders on T194 for a variety of reasons. So I am using
> cboot as the final bootloader and not edk2 as in L4T r34/r35. I have a
> pending cboot patch to support simple-framebuffer handoff, but haven't
> fully verified it as tegra-drm is currently unable to takeover from
> simplefb like openrm does for t234. But all that to say that since I
> no longer use r35 for t194 I don't have the setup to easily verify
> which point release works here and what doesn't.

Any further thoughts on this patch?

Aaron
