Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D92080F1;
	Mon,  7 Apr 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041646; cv=none; b=Nc+YtQaAcyDeMzZBj9bUM1IuRlwl7rmX1CAdSXGz8NGqoczXc3rAMUf5AcU+bzEvPLseJrChdFI2Vgjfw2eRHNtV8cZdvDitc2E5smEm8e3RbFue2PIlpoatPoya3llP3VLNF4XUdlsfYi+YwAajWqhb70Yictt9lc9NT1nGUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041646; c=relaxed/simple;
	bh=lg3cSbzvrK/T/urDtbB3CSVmlQ8cKNzboRehv+MXEaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqP7DY5n1XUMvOREPuFaq2ZCJl1vSDmTZJuDwTL89/pw/U8Jloe0d0tI1j9NCfiuAIO3BdDJgeAV3h1DXOFsBljl/N82v3HRUmaU0GFePhpgDCGwi3A2xTwYY7hLK23UwyZUbfua6rG1if1H8U1CPpPOYNc7ThgZfMYwepF0vPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXYmxvTw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXYmxvTw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b10956398so5298805e87.0;
        Mon, 07 Apr 2025 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744041643; x=1744646443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqd/F8I+kjZgKXTtOk1uv6CuQQZlQwvT3i64alSUGLw=;
        b=gXYmxvTwqmoTawKxR7TID8Qr2cxTwIP0C6DaerrMfd0dqMIIJOZL0RTris83F+ly2c
         QHeEkRLYvhXwXTRj4tbtmQ6hhwBi0xh/BeoZkYoCcMf5ZJp/bZrRKq5RQt5dRK3fyd3f
         I+QJulZQSvF/hEIR4XvSzzZFFJbL/zAH1j7PhLfSB4O6a2jyyLoWIgc0uYPrOHZhWdB+
         cZ+kyv0PImptIDFt3tDvhu6CeCvs9x8GC6FzfnXhpl1j05CK1LzdIwrmszAT6ZcKow+C
         WKcuNEt4rTeOWCogoenz7LhqBDw3erLZJ4ElJJ3SZYG2Mi+a4n2cVxO1Fgz6VFndJyZh
         J8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041643; x=1744646443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqd/F8I+kjZgKXTtOk1uv6CuQQZlQwvT3i64alSUGLw=;
        b=nyKMUOMX/7KUYmrUl68VikPZcWFjw1SoX08PMdJMWw6HHKt6KKEwDqb9qgJMEo9far
         ONy5/IWEB9l+xxIFFg5CH8NrJAs7KcWCIg3/wbHRSUC9KL2G7VMQ2JhbaVrN3BT1n94p
         hsVkAK76R9D/8U2Pd9Th2zkkuGc+Q9MoXVHAcqKnkZf0mcDlBC6VI81RdlEK/TUrtH87
         hVqG/jCBbrehn7UDIeVUfK8DMfa5BNSPMIOdq339CmLY9UOjK+zxB6Nr//7qOrYhUKyl
         8WlDxqhZRuW7iIsSTId30v70IQvy9ojEG7MbZFEB6N5PghEGhPneMfh6gXLX//S14esj
         430g==
X-Forwarded-Encrypted: i=1; AJvYcCU9Fx7tfOY+01catBr3ojsEFwUOgBHF66tUaTU35MTN44yX2MMyEf2TjtPXTgWbp/WNzpYVdBg2dgvv@vger.kernel.org, AJvYcCVhWiRX3WISiCkjVNtWFwYGHJBvoUHDRzFEp5UhKxmVGNQhwVjii5ukDAWiFlzoRHhL+zumKMNJSBQJ2g1D3Ubo@vger.kernel.org, AJvYcCWAa8EAGaKzABtgn0sovNuhCBhi5M29s0gzVxzwZLgQZgnCVzcOw4xqur6ZeXk5kfpLmrFGofy6jCFWR8Ya@vger.kernel.org, AJvYcCWa2dPSmneMqs9skGeBo9l5sMU8RtrQbmUnO2mTj1w2pB1RQYwB9bFgCgbqjvsl887IrPopn4zFvNSc3zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxP2oX6JK2iCurTG1JyDuITNunzAdpCsj2WW2lrfaoVXa/xwp/
	PVaKgyBa08uGoOb5sLPZHFQo4deFKmujdaMz6+cfibYOLHPa76j+UxPx0/6YBgx8UK5Ok3zZQ1j
	nQJi7CCkglk2Lk5k3wqpg1myYDYs=
X-Gm-Gg: ASbGncvVFcxlILIEOpJTxSI6oDUjJViaesFpebpfCVj79AvyGpiEQ65RSXwKMUbg40u
	32jU/E4kj59pxUAGqdRvxBhPDIxtYtGwjnsFnqYvoCNI+Ur5hRYTnHwVbqN0vFt6MUdSwW88aB5
	mHIQvcDKsgQ55lBZs6Ev6g+Btsrg==
X-Google-Smtp-Source: AGHT+IEVrNVcwklMERTdBeYNy+sQv1Qhef78D7qd4L4zddSsRfl28NNMUq3bgprXEFJQvPG//aGTthRP2n9RzHntEyE=
X-Received: by 2002:a05:6512:3697:b0:549:91bd:2d86 with SMTP id
 2adb3069b0e04-54c1ca8c075mr4841164e87.26.1744041642153; Mon, 07 Apr 2025
 09:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com> <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org>
In-Reply-To: <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 7 Apr 2025 11:00:29 -0500
X-Gm-Features: ATxdqUFNsatT5UhJzB5tzRpz10S4ukxDMe0vOi53IWYyOQIORz0IaHECah3vQ8s
Message-ID: <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This allows using pstore on all such platforms. There are some
> > differences per arch:
> >
> > * Tegra132: Flounder does not appear to enumerate pstore and I do not
> >   have access to norrin, thus Tegra132 is left out of this commit.
> > * Tegra210: Does not support ramoops carveouts in the bootloader, inste=
ad
> >   relying on a dowstream driver to allocate the carveout, hence this
> >   hardcodes a location matching what the downstream driver picks.
> > * Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
> >   size in a node specifically named /reserved-memory/ramoops_carveout,
> >   thus these cannot be renamed.
> > * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based on
> >   compatible, however the dt still does not know the address, so keepin=
g
> >   the node name consistent on Tegra186 and newer.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
> >  4 files changed, 61 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra186.dtsi
> > index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd754e42dd=
03f5a1da5079971dc 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > @@ -2051,6 +2051,22 @@ pmu-denver {
> >               interrupt-affinity =3D <&denver_0 &denver_1>;
> >       };
> >
> > +     reserved-memory {
> > +             #address-cells =3D <2>;
> > +             #size-cells =3D <2>;
> > +             ranges;
> > +
> > +             ramoops_carveout {
>
> Please follow DTS coding style for name, so this is probably only ramoops=
.

As per the commit message regarding tegra186: bootloader fills in the
address and size in a node specifically named
/reserved-memory/ramoops_carveout, thus these cannot be renamed.

>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

The bot is reporting that the reg field is missing from the added
ramoops nodes on t186, t194, and t234. However, as also mentioned in
the commit message, this is intentional because it is expected for the
bootloader to fill that in. It is not known at dt compile time. Is
there a way to mark this as intentional, so dtschema doesn't flag it?

>
> Best regards,
> Krzysztof

Sincerely,
Aaron
