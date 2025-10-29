Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FD35A149
	for <linux-tegra@vger.kernel.org>; Wed, 29 Oct 2025 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767686; cv=none; b=KWec9WnsnfmHKH0xaJVl/gimp+X+y6kub791o0+v3x8PA1A8c9orwqcj4cqF40bTuczosO4mmGQecmxf8ZDeqF2HWIgRFlRDbZE6o4mZJUThrPJo6Bm97SsDgU8KkxXn923WsXBxTwk1hkSnwSNQ3Bj3h4JSXWPO+Uhlg2oHEyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767686; c=relaxed/simple;
	bh=byIwb2P1xzSyr7J2uiJPoWxM/iVSABJR6EsR8lHx1IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaVhdg4ZQI/IbFBubHtMxWNck6GQT+fMfuCT4TH7B26ozHeghwgfE+wDAKLc2PIQKIHE5o+Osha/pazNywmhWuVvt6ggaxFMVfWuTZRYq+2jJR3Dmega9YhUJ6eUOAUxHhtSVxXgQEiikC+b+tcw/UkHfPak9eAhbeeXl38AVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EABGJVls; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EABGJVls"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso2024491fa.2
        for <linux-tegra@vger.kernel.org>; Wed, 29 Oct 2025 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761767683; x=1762372483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byIwb2P1xzSyr7J2uiJPoWxM/iVSABJR6EsR8lHx1IA=;
        b=EABGJVlsIzlENWjl88+JnLNvWYpEpfoji3CFjGsIycxaBnrElD8wX/Cm+kKzIeOd4r
         kOn++9nwD/dcTEUcDJfv2+yoViWCCctsFGPfmqO5vgm3vLTz5pxJdDkfh7vdvIePFb7T
         gNyEb9f0dvcZDGwsqE5tekfh6teafGDFRtfsdHD7mwf5hspSCA13pYiQW985vG90ldtx
         22wG489KTZwKnGevLxLY1MbpQdirFXpz2Sbs2CvtWmWsuBONVcKJg9hULLf0OaAFsY2+
         xqZBSWpNhRr/F39OeuS/N6rl3oJ7P3xcv/pi/UO0n9supusdqiKk1U8lewDQS7cQwZfX
         oB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761767683; x=1762372483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byIwb2P1xzSyr7J2uiJPoWxM/iVSABJR6EsR8lHx1IA=;
        b=XaUsmPUVfCR98uXEAl+NT/1rnL60aUn68ou5bpqXkqzs4lOq8CuskTqMd5f3StNCNz
         +i1G+SlMwotHSNuwyZuv62o43ag4GWGvun1gN77K41qG/bHfaCf2XtPopG2m5pFhf7KI
         KlkVP3sx5OenFK6G7hXCCbLiC983RhOHSX4Wq+n5O0RwLv+0ftWv0vzCrEYmA5/JPogy
         vVTQSkULFC7Ckoa72xn9eAofQSz+cR8oAWR/qNJ4tIZGXTZUF+mtijigSD7bRuXXgRqw
         cKGk/L392iX8G/7L3MErJV3iQk7gxXYHtVTXrZz8MebHXDASmfK0W2jGGj42kEYUX99k
         ubKg==
X-Forwarded-Encrypted: i=1; AJvYcCVblEBWT+fCtR+XrdF8yko4ZPOMSpRnAa6wNDtNZbKb1DSU4SHDHAz2QPj5j3p71ovV5jdIcACbpeZPEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPDHSwNNaUbtwPgD7+ASMO6B1wMbU/vDuukwmT+rwOw6p7d2Q
	ybGKbdnj/7/UhLxBCq1uKLNCrz33duwkXMvuouBjACmKwpTlPIJ4ymOePq+gEr7IDffNhZ/D8YS
	mdmxT2M2peh8MM6qEtJEmYhqOUKcw4f8=
X-Gm-Gg: ASbGncvuH56XwkFUdIFL9fpheHmlfncYD/zTNPQHmv3k50lh2j3HUmIx25AnOSjeqIc
	rBAr3zUGJZFpBeI3ryPKHFIXXHqGGhMKBThpQQ+qOa25pgaKgO61a/xfqyARlwYE63S6CnTZvnA
	hJxScuwP250mJHCuf6dbn+/oWIOVBErkfTqtw8zrdxJ+fV7p2SlXmZ2T2JbCS/4ReZMyRtSRlRz
	OPz7tqH4En7lj+yspMmWYFVX+Ce78IZMj3iViBfZDr5I/yxGJknijfPq5fZ
X-Google-Smtp-Source: AGHT+IE6nugI1RSYlE3lv5TXNplpg9rsZEQvlWlTN2w7AYCpm8+Ow1fHujfDgKlmIubO4wrE3hHviFIzmPX3ZC2l8So=
X-Received: by 2002:a05:6512:2206:b0:591:c473:5bc7 with SMTP id
 2adb3069b0e04-594128c4d81mr1440914e87.50.1761767682551; Wed, 29 Oct 2025
 12:54:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
 <20250803-p3450-mts-bug-v2-1-6307125408c3@gmail.com> <8ed69b4c-f656-47fa-a247-1c8d94dcc35d@nvidia.com>
 <CALHNRZ86NjcNJhRJd+jtD_7fRTFJ2szPFAAN3HSad_xwnVrHWQ@mail.gmail.com> <0049bde1-15e2-4c33-8de9-49f3df0d7650@nvidia.com>
In-Reply-To: <0049bde1-15e2-4c33-8de9-49f3df0d7650@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 29 Oct 2025 14:54:30 -0500
X-Gm-Features: AWmQ_bl-wrrhUBBpyLWRd1g2YRWbeHiuYgX2sFzM3mLqIPmPO5WuwhlB1ygmVeg
Message-ID: <CALHNRZ_odC8jcu9h_ZKJ9+449pBhmYfXF=vBkprxYkqXhabM9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add reserved-memory node for P3450
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 5:32=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 24/10/2025 18:46, Aaron Kling wrote:
> > On Fri, Oct 24, 2025 at 11:16=E2=80=AFAM Jon Hunter <jonathanh@nvidia.c=
om> wrote:
> >>
> >>
> >> On 04/08/2025 04:14, Aaron Kling via B4 Relay wrote:
> >>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>
> >>> The Tegra210 L4T bootloader ram training will corrupt the in-ram kern=
el
> >>> dt if no reserved-memory node exists. This prevents said bootloader f=
rom
> >>> being able to boot a kernel without this node, unless a chainloaded
> >>> bootloader loads the dt. Add the node to eliminate the requirement fo=
r
> >>> extra boot stages.
> >>
> >> I test this platform and don't see any problems. I assume that this
> >> would prevent the board from booting.
> >>
> >> What bootloader are you using? Is this from a particular L4T release?
> >
> > Please see the longer description of my setup on the revision v1 patch
> > here [0]. I am specifically using the cboot prebuilt from L4T r32.6.1
> > as it is the last version to support usb input in the fastboot menu
> > [1]. The rest of the boot stack is from L4T r32.7.6. The partition
> > layout xml is here [2], which requires setting odmdata bit 11 to allow
> > reading bootloader partitions off the sdcard. There is no u-boot
> > involved, only cboot.
> >
> > I've had another report of the same issue, on a pure L4T r32.7.6 boot
> > stack as well. The Nvidia downstream u-boot won't copy
> > external-memory-controller nodes, namely the memory-region ones, from
> > the cboot dtb to the kernel dtb unless the phandles match. Nv-tegra
> > gitles isn't working right now, so I can't link directly, but on
> > branch l4t/l4t-r32.7.6-v2020.04, file arch/arm/mach-tegra/dt-edit.c,
> > see line 31. Which means that such only works if u-boot destination
> > FDT is the downstream dtb. Using a mainline dtb causes the
> > memory-region dt tables to not be available, thus the emc kernel
> > driver fails to probe and emc clock stays stuck at 204MHz on
> > p3450/p3541. Hence the user from the report trying to cut u-boot out
> > of the mix in order to get emc scaling. And then hit this issue.
> >
> > You were able to boot with a mainline dtb on the DTB partition and a
> > kernel on LNX, without u-boot and without this change? I have not been
> > able to do this. The boot flow will get past nvtboot_cpu, but falls
> > apart inside cboot due to the corrupted in-ram dtb, never getting to
> > kernel logs.
>
> Yes, I am using r32.5.1 currently (which was probably what was available
> at the time I enabled testing). But with this I am able to boot an
> upstream DTB with the upstream kernel using cboot (no u-boot). However,
> please note that I don't use the upstream DTB for the bootloaders (MB1,
> MB2, cboot, etc). I specify the kernel DTB in the
> /boot/extlinux/extlinux.conf file so only the kernel uses this.

So the problem is with memory training, which is run in
TBC/nvtboot_cpu. Iiuc, which is a limited understanding, mts primes
with the dt emc tables from the bootloader dtb from RP1. Then if dt
emc tables exist for the kernel dtb from DTB, it will copy the trained
data to there. And on newer l4t versions, I don't know which version
that started on, it will copy to a reserved memory location and set
the location in the kernel dtb from DTB. This piece will fail if a
reserved-memory node doesn't already exist in the kernel dtb from DTB.
Causing the cascading failure described before.

For Android, cboot just boots an android boot image on LNX. There's no
u-boot, extlinux, etc etc. I've got the downstream dtb from RP1, since
the bootloader only works with the downstream layout. Then I've got
the mainline dtb from DTB for handoff to the mainline kernel.

Extlinux isn't useful for my usecase of android, but I'm in contact
with people using Linux distros. So I'm curious if your setup copies
the reserved-memory nodes to the extlinux FDT. Like, does the emc
driver initialize properly and allow scaling?

Aaron
