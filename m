Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DBD30B504
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162375; cv=none; b=XtJAD8TKSIsHqaQxL12niaTGiGggNQno2crtW27EfHwVmtW4tt+7LH7ea8izx7elRWDPtsEao60PLroqkuHUr2A/GFr6WQd50qrIPRjxUxC1L0heQZ8e5tZ76yHnOzKNvCOUC/lldqUntV8KeUeM00W+PXg1VBL4qebeaEvJv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162375; c=relaxed/simple;
	bh=Tg4GHAGSujxf07p3BKLBHupxzDzRxA4YhwnGHXjIWqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YghX/KclhwdBKKUcJLBOZx6OG0MuMBkGwt4yU4c1Hm4bqfwH4RE1eyVABRjS4L49OAzt6vokhxsIS0UAJmfqGUG5uWBNuOyeBddr0AfzSkz+EHThrm7M4vv+AEXCkfGDov1IkJVHUatJiyute4GBnSsRPtYruOpEw3sHRT3aA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1dUyX8h; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1dUyX8h"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso1667311a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759162372; x=1759767172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKbIiyOJGnPtewg2XGQmyuDm4Je77/TR9Lj2L/HdtYA=;
        b=c1dUyX8hhJSYyGYODEZJNq541ZKuCw/Gdz7nPQEv/xxNam6/fqe07/DWYBL7kEC3dD
         EXqzZlE7dPBQT5g3rtAqSJGV1ZiYvgc4lu7IV7GLHHj0kZIjYjIQSF4+9/KP0y2QWiuP
         2LlFfSPu6WtLuvy7qDyG76i9nDVWNA7cnKynvmukfpOJvIIZUDWmmnAZp0agIUq5QyCC
         hnjK7f8n0iWjotqiwEQGMwem5PD+yZU/1fcJQDuJQ9b6lYc5A1QfMFc0qLbv7K1w0r/N
         4gPJW1+MriX792QkKWGr934qmGWJ8fYrUHeg/W07ZQfr6JScdZAQCW0o6H9jxFoka5BT
         iJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759162372; x=1759767172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKbIiyOJGnPtewg2XGQmyuDm4Je77/TR9Lj2L/HdtYA=;
        b=u8fZXkHEzsrbMKO3VzFCMW8Sd1yXtG+gSTETxj1ToAAsD/aQ6OHF4UxdHbvCu/tkZ3
         W/Pdxr8Fw6OBt0+y9zfPV9aqGC3nZQLnl04qEILzetlFYz22sQ8IhGVoYtaOvlg0FHgB
         9INvQCRD7zebGj6cEXsjwlyM3djgZDZhfu0mrvo9fhaU+2hgrV4mpF4FVLrVw1N1bUW7
         fTQCta5BH+uBA+frbnd2mC+EZHZgXoNz1E+blGlR5DEh0LNRHczpWlS3zToSFq7tHw/2
         1UgIv2Om7HUVxYb5bjh7AGPjCW44RF3hHd8mJQ8DJvt4ySh2FU0GdSVC7hDFkpS6Twee
         yyOw==
X-Forwarded-Encrypted: i=1; AJvYcCXXGFJLxWQQU5TCNkw5vsLSCJPNaM0n3V7eriTxQtr7XipNfvkSOyrp7v5VLx2DdHIfx3NWE+33jA/kvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgZ/Uj8bvBELUW+84lCa6LUrP/++b4NBgT6pQxLU1pcOYFGIG
	ME5rxBePnQIzj/gn+20ZaruClIy++0Oy+t7smcthuMCwZmLW4TG8h+NM7jGfvq6UYakhJYFQwDI
	oObsXkeTwJFA/eJH2r+C2NN6XWgYr4as=
X-Gm-Gg: ASbGnctJLBgG6OOFifro+JPt/AkTprNyHgpwVwanmPkFbE6jIpOjOQqWQv7WIOV9YJ9
	p0eL/FYQLeOUsI3u950xFujXyHD+bC+hNnkmdwpmoOU9pPj7cMUyHYVj+QnvifHzzodXaJJHJBF
	X0i1amkAJQdRvOZRcWusiDlGHTNwz5P2p1+LhYhJTA9wyIiBtdET0j4wSujHE+sL7LtwLvynKr0
	zXcBtEEKVNnuAad
X-Google-Smtp-Source: AGHT+IE0lqGvuA/Xz523aRKIL9hmjXUK7+0u8AEeVGECM/7avOtLvinLYTseWMgOs08RG2BDuA8KXOfxxvlTzVs/fE8=
X-Received: by 2002:a05:6402:3508:b0:61a:7385:29e3 with SMTP id
 4fb4d7f45d1cf-6365af5adecmr1127595a12.18.1759162372397; Mon, 29 Sep 2025
 09:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926072905.126737-1-linux.amoon@gmail.com>
 <20250926072905.126737-3-linux.amoon@gmail.com> <aNbXdFPrDr8V2a+1@lizhi-Precision-Tower-5810>
 <CANAwSgT3inDQZ40uFtXwFze2m4hZUvnyKTek3PQ9jb6picgi-A@mail.gmail.com> <aw3flahx3g4exezj5245cgrixasshvf26yibctxsd3l42ygwke@equdzipwspvx>
In-Reply-To: <aw3flahx3g4exezj5245cgrixasshvf26yibctxsd3l42ygwke@equdzipwspvx>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 29 Sep 2025 21:42:35 +0530
X-Gm-Features: AS18NWB4VW7y7yX6xXK-2yBG9rF9CezN0Xp1TVzzbBM3LHGAaoA03PQWsyQH6Vg
Message-ID: <CANAwSgR-sq_jRp7ZQyWxrW_o6vRnCsu7FW77odDzY5xPcMuwEw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] PCI: tegra: Simplify clock handling by using
 clk_bulk*() functions
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivannan, Jon,

On Mon, 29 Sept 2025 at 19:31, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:
>
> On Sat, Sep 27, 2025 at 11:20:10AM +0530, Anand Moon wrote:
> > Hi Frank,
> >
> > On Fri, 26 Sept 2025 at 23:42, Frank Li <Frank.li@nxp.com> wrote:
> > >
> > > On Fri, Sep 26, 2025 at 12:57:43PM +0530, Anand Moon wrote:
> > > > Currently, the driver acquires clocks and prepare/enable/disable/un=
prepare
> > > > the clocks individually thereby making the driver complex to read.
> > > >
> > > > The driver can be simplified by using the clk_bulk*() APIs.
> > > >
> > > > Use:
> > > >   - devm_clk_bulk_get() API to acquire all the clocks
> > > >   - clk_bulk_prepare_enable() to prepare/enable clocks
> > > >   - clk_bulk_disable_unprepare() APIs to disable/unprepare them in =
bulk
> > > >
> > > > Following change also removes the legacy has_cml_clk flag and its a=
ssociated
> > > > conditional logic. Instead, the driver now relies on the clock defi=
nitions from
> > > > the device tree to determine the correct clock sequencing.
> > > > This reduces hardcoded dependencies and improves the driver's maint=
ainability.
> > > >
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Jon Hunter <jonathanh@nvidia.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v1: Switch from devm_clk_bulk_get_all() -> devm_clk_bulk_get() with
> > > >       fix clks array.
> > >
> > > why not use devm_clk_bulk_get_all()?
> > >
> > My RFC used this devm_clk_bulk_get_all() which could work for all the S=
oC,
> > However, Jon recommended switching to named clocks, following the
> > approach used in .
> > but Jon suggested to use clock names as per dwmac-tegra.c driver.
> >
>
> The concern was with validating the DTS files with binding. Since it was =
in .txt
> format, validation was not possible. But you are converting it to .yaml, =
so you
> can safely use devm_clk_bulk_get_all().
>
Yes I would also like to use the previous approach.

> - Mani
Thanks
-Anand
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
