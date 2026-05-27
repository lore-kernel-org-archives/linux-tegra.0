Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43813D0939
	for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869586; cv=none; b=FiseachVdoLYs7OlkgWrf507BXSzu3pRyfndp7ToRinRuHFyu7UeEY/EDXcokx9yY0XNr9hpWLVijOR8O27Rg8bPxQEnbxlGVdpr6vnZk0wOQDC0b2aGOOSwqeOzA2F+69em9HkLOlNQib8f3O7HGyTx62hTl5D0h3NK1bzEe/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869586; c=relaxed/simple;
	bh=hqVAzjRWLywE76QH/sAxIUiZu1GDDxkUq7lLM2EwSek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGkH/Upj58V3EpUO24YLSUAwGStaaNsAuYIjrPPjVgcUnkhm8EMVAzELrEOAtT4W/Vj+ChDFane6uhzoUWVT4mjn4dw2UOg0GwnhHxpvj9ULahj+sXM/JYk064ZO9KmmL9MSey124bjsZq9CK5kSs7r9x1Lz0o+sIrjdNRjw1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btZ8xiUG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btZ8xiUG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b0786beso76431715e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2026 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779869583; x=1780474383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bslgN8YyByc2uPPwR9aK15Zw85YMgKncjFfuOQiZI0=;
        b=btZ8xiUGU7q3KpajQGROH6qWw2sHTQ+dm7NdYxrpLbcNk7em01K1Lj3E0wlXc2F9sN
         P9zSfEs4u5/T2QmEJ9ec6msKgw1J77/LdVD+Xiz+nEjEC1p4haRffCBzEj1Q7UnVsMxD
         +1ghZhftrKYM2MU5BeUNGq1F0GjYlqHNU85/zdU3bCrNEPcTZozXnuEp7VQ+FaZChlYH
         Fg+lhTzkgntvdCq4UB0khoLgn06xVvVO3YHpQ1MVZjqkG/L2l+ZfAxHUkDdxpdgY1b0M
         BNdQIWArYoIvttNWgVeRhEez0t6ntrOhOD8LtepTGyw7WV+VoJWs+/UrVjWAdc28Hno9
         cuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869583; x=1780474383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bslgN8YyByc2uPPwR9aK15Zw85YMgKncjFfuOQiZI0=;
        b=D7Oc9b2jjoItteQzjAg/6JQps86sMYXHAS+o5rSYr4RCUe4IfDo82b34WqkabCsao4
         +R5bNOVg/O6G0azi10yVMybud4psWUGJPZjtbVmgYvcIX3wWjm+NowgByxU1V7BLPdcJ
         4+Qg96WEiZF3XM6LsBRoWkCvt9UteFf7qVT++a3BifIwCnHYTDZlXSt2emAv/kOFMdBP
         qnDbV87c6w+BuEOJbkEjIxujlfFfBqzaKXWA+4trSEDYkM55zERKoGHEBuUnTE1OVQvW
         bQM5diy459a0IZLzOi9SfP67/H0GBjPYKrqIsidsgF6k+nA8Ep4hMaXmxWlvt3fYn+M8
         94Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/2aGtFKxTTzedJxZNOYo2bOTkWScqynoC5KDeOv7UDmUJGF4PRwqnvmf+zsJrMyZVVSerJmKifG61AVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEfTm/ao7C/D64rL7YFsahN1qEsPQ6aVu8LA9AXktagQYcOIM
	L598n2u1zPioP0fzvZayn8LH9DbjfhnN4lURuy38o9uWnqL6BdPmvyvN
X-Gm-Gg: Acq92OF5x35KzUdnPuWiYHfd5NANlwb16DX9qjY7VtI8AMhRmOkLSjbLfZYpAScATFL
	rtOMLSU1nk0FPzGt3kBwgePmrMRDl/XpsCtKLkVbIElKmNUtwwdioXQzKrGaHGxIG0AiYItAGxq
	mEpw8Grz2tutg/V2ecMGUFqqXGej/A1hMXnyYx/JF6Ue+gZNyOVpBXFNJi6p6XABZkbnXZPZZvX
	OlzEEc012Y+YTWMAbxc5HkEfuWSQWVE58yE3lHI6W5HrmDJvAlb1O+FsbxreJudwNVKEm0OYoeC
	z3R3dnwIepCMfGSdRgnb/yZFWJ2bz4dhOm3VJF6VrAthDDU/ItAPvoUXZuCt6xnB05m8PaJpmGW
	36s79Jh9a0NzT96VkvD2aeyUW4OIEGVntsXagMaErKlPb2YtKPAM1g8nj8J8NXm00c15qdDbHUN
	9l1p+zpXw7aOo6/DikY4+PFIoB1c4fxP7TsLpj/tarLYFpGSq1FsjGM79C2PRd1mLySrj5p2Tzd
	gWrfiuUxZ4ASrQIhuzWIY3b
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490482c4586mr387652955e9.23.1779869582774;
        Wed, 27 May 2026 01:13:02 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm270978095e9.7.2026.05.27.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:13:00 -0700 (PDT)
Date: Wed, 27 May 2026 10:12:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v5 3/4] PCI: tegra: Add Tegra264 support
Message-ID: <ahanW-6XndunYC-S@orome>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-3-84a813b979d7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4qm33uwbiswsuek"
Content-Disposition: inline
In-Reply-To: <20260526-tegra264-pcie-v5-3-84a813b979d7@nvidia.com>


--j4qm33uwbiswsuek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, May 26, 2026 at 10:53:12AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> driver is very small, with its main purpose being to set up the address
> translation registers and then creating a standard PCI host using ECAM.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - make PCIE_TEGRA264 symbol tristate
> - drop dependency on PCI_MSI
> - reorganize tegra264_pcie struct
> - use standard wake-gpios property
> - rename tegra264_pcie_bpmp_set_rp_state() to tegra264_pcie_power_off()
> - use dev_err() instead of dev_info() for some error messages
> - add clarifying comment as to why bandwidth requests aren't fatal
> - address some compiler warnings on 32-bit physical address platforms
> - drop needless comments
> - explicitly deinitialize controller on suspend
> - use devm_pm_runtime_active_enabled()
> - rename "free" label to "free_ecam"
> - use dev_err_probe() in more places
> - reselect default pin state during resume, not probe
> - return early on absence of wake GPIO
> - simplify BW value calculation
>=20
> Changes in v2:
> - specify generations applicable for PCI_TEGRA driver to avoid confusion
> - drop SPDX-FileCopyrightText tag
> - rename link_state to link_up to clarify meaning
> - replace memset() by an empty initializer
> - sanity-check only enable BAR regions
> - bring PCI link out of reset in case firmware didn't
> - use common wait times instead of defining our own
> - use core helpers to parse and print PCI link speed
> - fix multi-line comment
> - use dev_err_probe() more ubiquitously
> - fix probe sequence and error cleanup
> - use DEFINE_NOIRQ_DEV_PM_OPS() to avoid warnings for !PM_SUSPEND
> - reuse more standard registers and remove unused register definitions
> - use %pe and ERR_PTR() to print symbolic errors
> - add signed-off-by from Manikanta as the original author
> - add myself as author after significantly modifying the driver
> ---
>  drivers/pci/controller/Kconfig         |   9 +-
>  drivers/pci/controller/Makefile        |   1 +
>  drivers/pci/controller/pcie-tegra264.c | 544 +++++++++++++++++++++++++++=
++++++
>  3 files changed, 553 insertions(+), 1 deletion(-)

Ignore this one. I messed up and fixups for this ended up in an
unrelated patch. I'll send an updated version shortly.

Sorry for the noise,
Thierry

--j4qm33uwbiswsuek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoWp4cACgkQ3SOs138+
s6HJ9BAAp5sb8ml3mtyJAtl6FMSPiAYlmRM+Rln/kTddrHpNfNe7Ps7RkRrnzhIK
GxGgDwX+8fkfF7jdWfdo+we+uYdJY+5qdblwFtd0Am1Ek2lo+CVv4LIWpoIGWVx7
qCM5CGjH+B+5mq+a5qZO3Jkp0ItV3qPR9ICa7dBZR0Hf+d+tmmtCG0L9frIi+red
D4jhLX7ZSwJwY0HkqMNWPJsk3BjRBiwinut+CRpdpbH5WKDHUs//knQjikdMpCyt
js2IfnMuMUG/MMmnE/L/4Mw/cN+mVqeOVnLCZ2jhqcW4PD870E5mDWcbQGJTtBOa
aYM+jYUzyRF6FRUDa+8LDMFT4kLJSCG8UsTNkYZuM2BTpcpcobb9SHELVsHzBMca
iboEKEW2ivHSL0SrzWwiwfo3mUjVEs+2zicFCjFomzlieY2/nEKJDxX0qz7vl2YI
pggUPMtCQt+HWjJBm4qPp7E7gHbEl42K6WwgMLjpaaqFj9dyscZkgvYP1fxWubEa
9Gomsf9BYzPf+PEQQ1V5TC9pIAkBI67+aB9xP+eZe2CPlHjC+7cI191jmjTYiAGJ
VP0QGnFjXm0mBowPZ8bEW9gIAtUNIMaeUyxbXbk1AtmSIPE1BytX9+MZqW3LZB1g
+D2Ukq9lvn/GNQVDr0ZsH+G1hGubr+5xcP5gy1mCV8S82ocUvrk=
=a2y4
-----END PGP SIGNATURE-----

--j4qm33uwbiswsuek--
