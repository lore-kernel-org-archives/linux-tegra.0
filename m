Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7663A9DB5
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485917; cv=pass; b=l3IIqpInxV5rApH9I13J1JLapNLKGtAct/5kYTUOZRis9GOD4BfQ92fePSQYLQussrE2w5g5btEFEK9+Gf5csDJ4DND9VnwXltpma+gViFxirZTgIIeSYfudLQO8viIfewe4jtVF301uGVoKpIo/6cAmBTh0Vq7bvl46xl3UItw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485917; c=relaxed/simple;
	bh=bCx3idiUgw6FJ/orVDV8cPd6ZVl8C6kyuoO1CVbDxWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNyt7uJdJDXlCe7rq5lTfRY+6iPdsFYwFwxX5GDX/y16OL/q7nDW3QbYj39nDOIJHva4IzmCJXI0rEwIbCd2k/1mBw7OjDRZ2pABi5U+iG942bzKh+QzUgoGIRM2ODcf73k/Usw+6oZsuskMgNjqTxaB3rW8VZlIPjxhS65gSdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqEcliXn; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqEcliXn"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2f00a567cfaso2789912eec.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485908; cv=none;
        d=google.com; s=arc-20240605;
        b=XwmaA9+u69JSmSUNhzE9RtzA9Un905UYJMAMC++nh9L8ZtmtM2OoniZ8dexg1/wjyS
         Fk7K3cPCOGSIRh7wf2dhpJxKGQ+wW/xblOctCe2uLX1FZEOtDO447QMsYpub1PSOoRI/
         4MGFYcKGoI3R0aTJNfktbbKN2KHUkmIwoqxN3HQjCsEUbFua2MLJgqsYwT7YIXOhjzGV
         rX7NMvGt97m36LU782cgV78u5qC0WI/y6fAMG7i/daqtPsA6FRE4CcWw1q+VBaHEs6N8
         vyPU4xavIEstiBvICsmIBEHaNFd9EAPiOH84ZYXzD26YP7u4WMt58YZ4VqL4iwzpCWjM
         jwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        fh=uu+AJ0sv8PEZDWw60VO+9PPrLDt55ojzApA8mhkej+Y=;
        b=Gp+Nov4wi+aJx2vmGBSp4f7+qOLFHHIRLkaU7Pk0j3mWhCmHDrxDWGffOUWOikf0t6
         WdQ6q8zlFrXtfMhGiYXwDxmQMysRbesd5/Hha+Na87SZMv21BMu1tGewyJu8lwRf3yUx
         dA9l+CLGd3+luObar1bwNQd3lsuOMxVV86TtpvzCyCp/MCMXzPZawSf6rajkpLYDsYOs
         icAVUndtbyS0grv5lqJ2cdJ7+gTq5UxBlJNSninYxBc2kN17hZP6HfUwzgBQlVGaixzz
         jckw+nDooGB5GprQzeOgk/KOJdmgAY+TCV0LONpDWqfu+gL1yff6QmCDhCjKszUXgSr/
         0xtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485908; x=1779090708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        b=OqEcliXnh5R3VBLlUVzq4/J5A3grhtY+4qJFZr3CYtqcI64hxeyZh2dSF5vv0cU6o6
         Eykk5DtmU9t5u8MGWohv8ZMKwvBeQSYFpjudIcG+HXM4QdjFhoT4N3PhMsLY0eovH8J3
         zbHYbGcRD49VVvMK/JR/eQdPuWFR7bM1TATIFyFYYDhDwYTKrF+Eq8Vd44lJWrPcpn5v
         5TPF4sBHilYJIxcX8F4jBB+lEE5020+WYK0gHLAo4yT6fiiqfqy8yk+2k2vMcLRrGu07
         sY97dJ8N42BtXFDpfGLG7TmvLla3dQfrf0vUVXtRQ1hKFL2iZbs6e+XxQ4haMf/GfwCx
         F3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485908; x=1779090708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfSXgZ6aPkpcMY0bgCjU5DFBgjmnCeqKhXkXLLdbLpc=;
        b=oXqOoHUsXGm0FKVYDmAo8PF1jgXezeiSYle7ZXDID+6F8qpWAmi3wLMu5Xaaej1Gvl
         7qfY73YWbl/oD4h9xuHoqAWl2kYtmkXN4TDp9kwNn0GFTyuc6UFQv1c5Z0JURT8zAeal
         snGjpC6PRKj8cjy02gi3zOa8PZi0AondhUDqlUYFL+jM7FyajJjAPufLu6qVJvodDw7+
         U2/xAnPsEknquRYVl9epaGQ4SoQjtmlaXN2LqLNMrA/WYQWZ9eFKaHsWCBDSbGH183Z8
         MMOfwq7fWzrKrVtlI47jYHmSf2ZDcFCUGhUmlbonJ7MInTx98rz8E2vA04WY5/s8NbHY
         SyNw==
X-Forwarded-Encrypted: i=1; AFNElJ8FdzLXB7ZOwVgEG1irrtAGj3V40EtUYEphB0tY/LsFHliFuYPYpuANMkrU5Lyj3qaglCCNTbQRyMjdUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn2LdZ+VrKpkouxWIuo0y4R16ec2Xd2sPxxJFuctDC29xTJJMh
	k6W6t2KnNdMKH/5JrQ90EhmWUA6NCtYugyc6enytRZVXQe2fNfGpO/3CSm44dN2S4v45itFQ/BR
	G9bmAnCq1kBurepV6W+SLOueCSpQz1WM=
X-Gm-Gg: Acq92OFo89fMPe+YUmbgTJp3s6t5WqtGHesZo4oOpho6BI9PiuI1XTAkshIcjWDLT1s
	nJQlSLbEOA5xd99ErjTXUHGmU5PpLKbb8oFXDDO02h4fJadXIc9Nveu3FBjbm6LQHm05zHnFam+
	VFakXDWdxUvYQrq9ZkcK8u2TVZ4JnHAIGmtt+JEYOLCFCaNZWOsVI+xMqSkZY5n0cl+VL53wUjR
	U0R/tfua3hwt19f0IQ9XS1PDKBtEm5qgU35ayAXiU65Sl9xnT5FG2H+zQHgkGQC8KREIGPF6G1o
	tpXLQcslRveGDL1k2lg=
X-Received: by 2002:a05:7300:bc83:b0:2f0:c593:986a with SMTP id
 5a478bee46e88-2f6debcee11mr6739515eec.0.1778485907772; Mon, 11 May 2026
 00:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-4-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:36 +0300
X-Gm-Features: AVHnY4KL4_Xj5WSC6cZ4ru0Vt3ilf_DPaUiiJoBVqluNaOn2k_t2uTZaJjI3xIw
Message-ID: <CAPVz0n22wg=71LkMSP-_N7opwdLU5yxRBbXYboh_x6WMvDFL2g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 have no dedicated MIPI calibration device and calibration
> registers are incorporated into CSI. Lets reuse Tegra114 calibration
> framework and add Tegra20/Tegra30 as a special case.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/host1x/mipi.c | 82 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
