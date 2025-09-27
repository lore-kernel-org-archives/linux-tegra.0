Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282423B62C
	for <linux-tegra@vger.kernel.org>; Sat, 27 Sep 2025 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758952231; cv=none; b=HY+LB2FujhDFujQQat1Boc15g8TDvgXgcgeX/xvsgl+eC5MCmv42ky+TmzL2l0npVYIK2FzTTJOQZ5ep1tRsfXn9fgUcgjl0y+Cr7Yba7v928we4bBHaNadsI8+Qs5ILTqjvE3TFkP+L0O0A2GxijxJI7NWnrC/puugOpNevo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758952231; c=relaxed/simple;
	bh=sKE/bbfJdVEWPyhD5eS+eTMe7Xb6pi5Gx0cFcMY2Gck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmSbFs6tBSCefw9Vuj1Czjkuich2sAf/Kn/nDePm1ooxc5Kz5xSJhsGaSlBR1cCxkmClIXFN5JtFp+y8fDv965VPTwaqc4H0oyomsnXjQCcNMtoD1E32JkP/O3BwYl32v2wxSEZZANctXD+baEDclzyZiTa0QQtB/9dHpCG/ur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1EXZNqO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1EXZNqO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so5379987a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 22:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758952228; x=1759557028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zEfXQ2GNoTNAAQgKz5N/9OLSNIZ34U7YEC6QsyWknEg=;
        b=C1EXZNqOGqAjlc2/v19KN8vFinsJ2thvgYqFZfWZy0htrCk49sb1b33pmZ5nQZiAFn
         mzaKvetFH+MZ+5ILtNOw+Y5JeU2FOmJdtKqWCTAIel9BFIzdkwqKcZM1iOwPHbIrgRN6
         zwq3MXIJlMBc6f/BhsAB2O66II+LBmm0tM6SlsmZ5CXlnD7IQqz4qU8G9LDejY9BVJ/J
         RprOs3xoe24e2jDi17tDTtOARAtsG4tUfimJKJrDmm9mpylMDhECqdGx4glncDnhA5+s
         cf9pMFmz+VkT72TrB7UBl0BqGYsB2hNQZb9jhvvWkCFgeZ+gt3Sdr7W9kFQJjirCEqil
         R10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758952228; x=1759557028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEfXQ2GNoTNAAQgKz5N/9OLSNIZ34U7YEC6QsyWknEg=;
        b=xQBsoC6indiWjTp/ieafSW88JmFDk60yvOnk76+SRtROWRMye8tsdwwL119b/O39Vq
         MhxTNXvZ43fV9JawGvJwmltGm8DdO5MZkticup/KkFHia2bu+T8sODYvSHw+7K3Yc3lp
         dqGEmhjBeNzPcimrC8MsAJN4yYblA3AzylETM0uWxPFs99Jr0k8MAgwjs8i1/ktlJ1bh
         m8B06HpmVoFvEzwdMaTKukx933ArUyEcHZ/D3vNrrmh1oixCaAdqqDaIaNNtJ/oiJ4Ug
         DMr00CR1vUOxcKCkn5iNydHD1xkIu+sFx9dOp/DbV836wS6JcXMrFxrvoBcgeMIaPVZw
         0Mjg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSoGJ9yn7LMggvGteaLUDNx51Elzx7ZNwDPT98AjxaurV5WTAI0al4MI2T8IAqWJm1/OTN6Rzq9Q08w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP84BuidpiNleROHTR6RWYkqJ5apYi/zZlrZLUyD6x50q28PWd
	S1VMpVB3BR5GKXt4A+UixgTnpeXQN9ivMACYeDDZtmNy4mcs2nuS80mRu579BuGlZMtLKlb4OVE
	6LXrt0dVi46hFZ+g+bYCVMYJObQXAT9o=
X-Gm-Gg: ASbGncveZ/Ch47L8PcCcoXpUN0790I6g2RpzkWD3AGX+Sy130U+WTBvyJGccN368yrC
	QjXAkwBBhl0tvi1yxWpnF04q/BBd1mJTPQvRKJAU1r503c7JkaDY4BoaFJb8NzPhte/U8KluWSi
	OhW8c83RLgSJ65tRyEAts6BDMAZbZaw/giAIBPgA/L7gNYqi6mfpO8oQ6d5eDVQrMQ8HIuzP9jv
	UAUVcfrN7AdeIst
X-Google-Smtp-Source: AGHT+IHPM8Sokkajp1U+gg4rjWNklz+uhVuqd2/uPSxPNqSrop7fWSnbP+GYFsIWZgAeYS05o11hVS/32kiqXJYUOgk=
X-Received: by 2002:a17:907:9716:b0:b04:74d1:a561 with SMTP id
 a640c23a62f3a-b34b86a1164mr1228466666b.25.1758952228009; Fri, 26 Sep 2025
 22:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-3-linux.amoon@gmail.com> <aNbXdFPrDr8V2a+1@lizhi-Precision-Tower-5810>
In-Reply-To: <aNbXdFPrDr8V2a+1@lizhi-Precision-Tower-5810>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 27 Sep 2025 11:20:10 +0530
X-Gm-Features: AS18NWAnMv2xvEsD19fF_Ap9-aFut3prDdiovARFCjhoGCTCY1ku8kU0ydS2DCg
Message-ID: <CANAwSgT3inDQZ40uFtXwFze2m4hZUvnyKTek3PQ9jb6picgi-A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] PCI: tegra: Simplify clock handling by using
 clk_bulk*() functions
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Fri, 26 Sept 2025 at 23:42, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 26, 2025 at 12:57:43PM +0530, Anand Moon wrote:
> > Currently, the driver acquires clocks and prepare/enable/disable/unprepare
> > the clocks individually thereby making the driver complex to read.
> >
> > The driver can be simplified by using the clk_bulk*() APIs.
> >
> > Use:
> >   - devm_clk_bulk_get() API to acquire all the clocks
> >   - clk_bulk_prepare_enable() to prepare/enable clocks
> >   - clk_bulk_disable_unprepare() APIs to disable/unprepare them in bulk
> >
> > Following change also removes the legacy has_cml_clk flag and its associated
> > conditional logic. Instead, the driver now relies on the clock definitions from
> > the device tree to determine the correct clock sequencing.
> > This reduces hardcoded dependencies and improves the driver's maintainability.
> >
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() with
> >       fix clks array.
>
> why not use devm_clk_bulk_get_all()?
>
My RFC used this devm_clk_bulk_get_all() which could work for all the SoC,
However, Jon recommended switching to named clocks, following the
approach used in .
but Jon suggested to use clock names as per dwmac-tegra.c driver.

[0] https://lore.kernel.org/linux-tegra/8fac00fe-2ad4-4202-a6f2-c5043f7343f9@nvidia.com/
> Frank

Thanks
-Anand
