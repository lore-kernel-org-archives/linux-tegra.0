Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3385C7F
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202912; cv=none; b=P+grRAjpKNLlz5aZgnw6gyCDsPC6Rb+UNEQTId4vkCwpIH0t2az++xe5JnBZ5e/oweyd/VUYz2k2yt+p6DcOxQZXilugDyJ1k8qj/J74k8HD7JcR1GPf4nx3OhAWtcdIqM6YHtBtRJ6B9YfALxskUwZ0qAsXT/e5dDSb9uT2Ob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202912; c=relaxed/simple;
	bh=xDzP8JtH++TeG6a490HKNdr4gYMBp0MXFefRWtUa87E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dF3sH//hwX3cRZHYaeFaZC+R/dbVB6gf25tI7nIfLPv5hHn+FxWp6BqILHSKyNBNiqX4U+s2kSFRxRxlvxzGK2La9IfEziBH1WffgPhCQqcTlk8MideP9ZYKb1NC2MPpaetSGvxVl56Gc9rIgVLdy/N99VZnT+ySt34NTR+Q23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATeo5rCl; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATeo5rCl"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso3399555276.3
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713202908; x=1713807708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=ATeo5rClKw3FS7E6DymOTXcte5a7C45OqKGWyd6e8dONwLEwCz/K3oXTy9ighRjuyb
         /EWaU+ANG8N0FjAh4xSL4jE/b6DyKGuqc/JEKMwCMDhQ1m4TAN6nH+s4xhebIdWii+Tj
         736xA+AGi4CD1jCjE60s2Ofv5H5NXix9XXYEqveOMvhH0k989iVqpPcTEyUEJb3bdYsF
         msR29IKkmevBqlFDs/NljGFHvC/K0+9pPjiTC6modLhyeROG3PqBk+stEQCDlHz0rsnS
         U4XbnQnU+FNt6q187ERxC2ZVMwKP4TeCDc2Chrpe1K0KCDctKCkTw6rXzn/cJ6x4N80E
         agdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713202908; x=1713807708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=Y4P3cgaPAHBVsN/ddL+ViJgK2qhIre2qt/KdJctKrdhCvDAD0FM4NR8u1Ve3Uk2Crh
         CzlEXWDopUJ+yqxfhzzfPY8lMVhG3v/jkI0xLR67911OKMDD//LHyyumq/liFkd9fQXP
         pni/+JJ84ZYqiBozMJxoS83b7yeTg8+gdaFCVinPX5BjnUsbHgZZdHH9TY/Uea55ne/Z
         0Dc2XVYrw+OTRgg0OUlXO6jCdQ0NOLiTeK57Nl8M3+HD9RJ/y2xQ6rWbr0q1XgPldPHX
         XoeX9gtJLJIBuPOiz7El2BkEJUkKL8RH3bKEq1+seX9DqYYVVXWOCZziyzlKgEcNVp2h
         6pLA==
X-Forwarded-Encrypted: i=1; AJvYcCW6hb2YTszeC3TD996y6ZskqvAHwL+XQ93Wxnpv051cGWLq9yUox+Nt/k07g9t7jKD50O2vk4+3HOOxlAuhxKWoClQpb7vDU0CGzw4=
X-Gm-Message-State: AOJu0YwR2B+Pq9skX2bA8y/xTjkbiwQIJxTXV8oLdJvoO3dregBFTzAW
	ClwpndRHJlc2olxAAgaFQBYYR3gj+Hnl40/ez5tQay3WDispWeaTjlr2KGCvHeD5MW6vTSeSHYI
	eNzN5vN5tcPuzE6PqAfM5dflecnTn/L34OcoaWw==
X-Google-Smtp-Source: AGHT+IHKpNfr2TaUgVv6Ugvchn9mUOD77xP6+GIEtmI5RLKRLLZLr1EmobTo6CX82MQ9pJIWGNHcl6abRXCvRtZsfeM=
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id
 c6-20020a2580c6000000b00dcbaa2650femr10533953ybm.15.1713202908173; Mon, 15
 Apr 2024 10:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com> <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
In-Reply-To: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 20:41:36 +0300
Message-ID: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.=
com> wrote:
> > > >
> > > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > > [..]
> > > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > > >
> > > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> > >
> > > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > > sdm660.dtsi. Ideally it should come as the same patch.
> >
> > Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> > well. Will drop sdm630.
>
> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
> A53 PMU compatible is an improvement over the generic one still. We
> can't just add kryo260-pmu compatibles because that breaks
> compatibility. We could have a fallback, but then that introduces a
> pattern we don't want.

I think it is believed that Gold cores are A73-derivatives.

--=20
With best wishes
Dmitry
