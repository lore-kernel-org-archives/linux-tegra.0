Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9183126AD
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962655; cv=none; b=VkO8UKnuAV9KxTXLogyUCKir7sF/xym60NUiLY15pEzjvraWeyylbFqwPct8W+L20OWiQ+qIfqZUcie1HQ49S24MZdFItR0PzcBPhaWgqm2zOLw2AiHmoZG7laNJL5poQRJwg2AGWeJIkV3Oenh8y2t7OJjC2SzWOAUBKYhMo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962655; c=relaxed/simple;
	bh=PlNBbF5ZJFNnuNXtuTdTU8RU08l+CRkDyuEQBZNScuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWzIqdyoVrCWiiRpE3+TNWfkWepDWkLEJ81WGoHenBqIc8oq3taet2XCFCOgGfVZl9AN05TQQN9x3LcslQ8MaMkm9n6qTZemuriPqbgk/WL2rwlYrF3CYLHZJZdeQ08WAQi1/xs+pHX5Iuh5hVQoLxft6JqOvy3+w8F8B2/IwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoxSXjDN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoxSXjDN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so7550637a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962652; x=1761567452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dj7LQnvneAR4ryP3ymo/U7mnKP1adFX16i1dLrQ/meo=;
        b=RoxSXjDND+siuHGl9xH0W9ohpY01+0qReyn/NibdT7u48ryd/s4htiSxEFVG5O+Tk4
         XrOPB+yWNHWKVgU4qF46Vk5ldBxCBA8s7BKBBpejs9Kcjk7Nz5bgSiRB1whcSbKFSBk5
         RI8XG9Ev9P8fnMIzstMIb92B2Cta2i5i718HoVBxmhE1qtUZ1uHDWxpeOGADcJmM5nAE
         uLS5fsi2v3FVBPZ+veWLLT/ZM7dF+PQyy7NgFtJr4uWOTpk2QGXtSJiyYsZ4k+ghXGyv
         AEi6CBevYz3lDV+vn4/QHzwDxShk5P36IKeVyJo5fxbWaLxxxeuFbUC1se3so8efUPd+
         QHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962652; x=1761567452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj7LQnvneAR4ryP3ymo/U7mnKP1adFX16i1dLrQ/meo=;
        b=OXYIgX0PMi7/FZAMqI6KpROO3sbIHjiObUwg/Q9wOa0kLix8LWfGRJdtXwa9lTnFV4
         0ZwTxDkvHifdEdxb3rEavY0bCF/wvf3hNN6Rsa7g7ar0oQoSAjo8Pxan7h24QKOCLUkU
         QLbtOxBYfhFVEaI/ofS2uY3K3P9N43VRfw3VLytnoC3ghTP0fiAyw7Vrp7bSFmW+cLHN
         bS4Mgvn1HLqMvsWYIBjAT10B4nx7qAcZoOge4sMerrfWojM2uDyXjQRUd/G7LDX6auvp
         /k8dipNClfrTUWTwUm4uyJuvh75mpU5GQSojEXEEVw2WZbmfD9RVinTdlZx1b7oPcpy1
         RYQw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZLlsXdzxFQqCk/VUogPfxzDWH085P8Tls+5T5ABg3rQo4BLl2xSGFxVI4BzF8x4U4DBPE3DpbEkLdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DZ1Fxgub3fhlW0RskHIJtuxG4EmKoE3icPc9Pw1AGTX/LF9k
	L8D8MpDvWwOA61Fr9VJnaeMFpuEaY+U2hA/Mf4qcwfDbYKZ4z4aTifbjnsSBvfhBdV6u7WxD+KD
	VDDoFn6YQkbSs0JEFoy6kYDlzax2tm0TcBks5
X-Gm-Gg: ASbGncvARSJCKDQ+Sm6ASVXuIjhoQ31+7SrHCT0q8L0U2RpoHoHu+HIxYrFjiFpQhzD
	NVXg2TdHATRsBekl2ayafKeO2gQiSXrikADWRJwKhKJgMDqQ92ZofaQ+5l4wqY5tZ4NZEDGNOUV
	Sh8WOsW9AyKk8JM+cWnzgGCkJ9zGAOeTjEf2jqwfxoAspcm0LnUR4ifBthL61Ki+gWAV8qlmC3J
	Mv7l8YfBua5LV/qac7UV5IypcKAMShIeHt1/C31uvLPMfsMygbfIjBMWy0=
X-Google-Smtp-Source: AGHT+IGuNXPYa8nOqQIFN5HiYiI13azg//upEX7PQX3o2Wgvacevspa/TtHt85O5Z2zq4yPkoXGnodkOLNNfPhUi9CU=
X-Received: by 2002:a05:6402:2113:b0:63b:f91e:60a2 with SMTP id
 4fb4d7f45d1cf-63c1f6c1fc8mr12209727a12.25.1760962652107; Mon, 20 Oct 2025
 05:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-4-linux.amoon@gmail.com> <ose3ww7me26byqwsyk33tipylkx3kolnc3mjwrlmjwsmza2zf3@os7lkt4svaqi>
In-Reply-To: <ose3ww7me26byqwsyk33tipylkx3kolnc3mjwrlmjwsmza2zf3@os7lkt4svaqi>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 20 Oct 2025 17:47:15 +0530
X-Gm-Features: AS18NWBjlpXvFk4mMS_-03BU5B3Gd9QeHI1AqyR0YTTEtYP4gYQmGYX3Grt5mQ0
Message-ID: <CANAwSgT0VRFFpKv3saJTAA99oGoAHhP+bx6Xe-QGf5b4Dgik=A@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] PCI: tegra: Use readl_poll_timeout() for link
 status polling
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivannan,

Thanks for your review comment.

On Sun, 19 Oct 2025 at 13:20, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Fri, Sep 26, 2025 at 12:57:44PM +0530, Anand Moon wrote:
> > Replace the manual `do-while` polling loops with the readl_poll_timeout=
()
> > helper when checking the link DL_UP and DL_LINK_ACTIVE status bits
> > during link bring-up. This simplifies the code by removing the open-cod=
ed
> > timeout logic in favor of the standard, more robust iopoll framework.
> > The change improves readability and reduces code duplication.
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: dropped the include  <linux/iopoll.h> header file.
> > ---
> >  drivers/pci/controller/pci-tegra.c | 37 +++++++++++-------------------
> >  1 file changed, 14 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controlle=
r/pci-tegra.c
> > index 07a61d902eae..b0056818a203 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2169,37 +2169,28 @@ static bool tegra_pcie_port_check_link(struct t=
egra_pcie_port *port)
> >       value |=3D RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT;
> >       writel(value, port->base + RP_PRIV_MISC);
> >
> > -     do {
> > -             unsigned int timeout =3D TEGRA_PCIE_LINKUP_TIMEOUT;
> > +     while (retries--) {
> > +             int err;
> >
> > -             do {
> > -                     value =3D readl(port->base + RP_VEND_XP);
> > -
> > -                     if (value & RP_VEND_XP_DL_UP)
> > -                             break;
> > -
> > -                     usleep_range(1000, 2000);
> > -             } while (--timeout);
> > -
> > -             if (!timeout) {
> > +             err =3D readl_poll_timeout(port->base + RP_VEND_XP, value=
,
> > +                                      value & RP_VEND_XP_DL_UP,
> > +                                      1000,
>
> The delay between the iterations had range of (1000, 2000), now it will b=
ecome
> (250, 1000). How can you ensure that this delay is sufficient?
>
I asked if the timeout should be increased for the loops, but Mikko
Perttunen said that 200ms delay is fine.

[1] https://lore.kernel.org/linux-tegra/CANAwSgT615R32WTBzi2-8FYntmaxbmVRLm=
A3yi+=3D4ryH43aaWQ@mail.gmail.com/#t

> - Mani
>
Thanks
-Anand
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
