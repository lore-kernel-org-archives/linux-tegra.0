Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3514286;
	Thu, 24 Jul 2025 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753378134; cv=none; b=NXhQKJuxuliAuZ5c6kFEX8XZYGJWHTuH5X7ldYsazlZ0l5QS7rdKJp6SjbbYS2Fu9VWqauySvqFlyEN5EE0SYVloZd3hE7n23eOp9g+1fX9Acl2BE36/JgUC6mtznAkTkotJd2OriHwfuep+NQIhXRiD3N858HtCR8nGwc9MaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753378134; c=relaxed/simple;
	bh=F6qIB6kF4lFdDXyUQoTntjieBic9P6s1eVYX4GTmdA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ihbg3HCWlRgDB5MBQrHNniQwxbIydjvCh/bOcXAwdfaFo1oNxoC4bqz36f2W3c9ANdOqRuqZAqm1isGSauGYnjifxzt7jg//kG7Y7eQmvqZylr9pXCBmVVHKlTI4O8JB665paYNdPekMWngDympvDbjp3ATSdR7u5J/mbZeYBoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/2L//M7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/2L//M7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AE0C4CEF1;
	Thu, 24 Jul 2025 17:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753378133;
	bh=F6qIB6kF4lFdDXyUQoTntjieBic9P6s1eVYX4GTmdA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s/2L//M7d07eXxQkgyLgfs249md+rTG0Z76bMuAZfmbYe29F2EJoJpzy3AtdkiZ+h
	 Xuw03ZYy7/lqs1CdJGy/pE/Th36IxYPvIEGjXW0KwVCpB3qYUa9xfaBVkyHd8n1kLN
	 /fip5Iud1jVHzfUg5VV9ECYTntnweHbQcEBevd1tJMfts53ee+qhKOIcfLidiRHjPe
	 5igs8qEZhI4x455ifmzqn7qaG5BX0r1FEQT+7ZXG+S3u07lg6rElTTVR0yXul/GODY
	 jl75dYQDQILtshoTjZFeqmv9++Nji5x41Y158sp+HNC3Z0so5u5Z/C7TB4XLUa4yf2
	 k3IuNjB1uTnyg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso187313866b.0;
        Thu, 24 Jul 2025 10:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0QeaKGd1MBzshq54V8bcf3B6gnc3rxkN5D16ywu7Nb1p2P5biPv8oMfcQ6xRtMDjGrQ3FCsMzyMfdXz8=@vger.kernel.org, AJvYcCX04PsTTz+k3jmTK/uwdWBTvaE4BcK4D8QxSAcbnIVkPnxlnB/gi7TXCw96Ut/n1kj0qc3+dYlr/y7aMwRp@vger.kernel.org, AJvYcCXHIiBfed0ou+j2PRqTuWFosO3iOAWZ3wJSy0sM2sxUtFrgyZ+/F7ICwdAAvBjhqKF8fX7tkUPXtihA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+IetGg91EMqfXheKqhW17lR/8ZtS+7ueyTZZENqsYywP8y2rX
	D7Wqz+nRKYgpqjnq45yfA/Ya5brXvdpnGNwswwNz60I1Iez5fJrYjTq9bRwev4+ZfqSPv3SjXSW
	kzYL6v31/uDFs88Z7HY0xRtBRCw7svQ==
X-Google-Smtp-Source: AGHT+IE0Bsb4bduOu2RoryQlc1uiDCJU1f+6Cs/aYA662lRWtt4rjAMlqY5HHo8781R7io7wFJbNbEC1s2avzSI1wR8=
X-Received: by 2002:a17:907:2d10:b0:ae0:c355:2140 with SMTP id
 a640c23a62f3a-af2f8d4dcd7mr832737466b.45.1753378131891; Thu, 24 Jul 2025
 10:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703103829.1721024-1-sumitg@nvidia.com> <5xkzehwr7k3ycpd3buqahmvamn6gvaol3exv46oe7nfpj7aw3q@eze4dbhplgqa>
In-Reply-To: <5xkzehwr7k3ycpd3buqahmvamn6gvaol3exv46oe7nfpj7aw3q@eze4dbhplgqa>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Jul 2025 12:28:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ-+Z6Trc_eo1-qoh9Ge4VuOdbZBESvPoY1fKkycHqmSg@mail.gmail.com>
X-Gm-Features: Ac12FXylAvak32uY7xt-4JFETBFfsQBdN5NuE81l7emBIhMZIFxCnqEnU-upOIs
Message-ID: <CAL_JsqJ-+Z6Trc_eo1-qoh9Ge4VuOdbZBESvPoY1fKkycHqmSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Support for Tegra264 and Tegra254 in CBB driver
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com, jonathanh@nvidia.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	tbergstrom@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 7:31=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 03, 2025 at 04:08:21PM +0530, Sumit Gupta wrote:
> > This patch series adds support for Tegra264 and Tegra254 SoCs in the
> > Tegra CBB driver. It also includes a fix and some improvements to
> > make the driver more generic to add new SoC support.
> >
> > The patches can be applied in sequence. Patch info:
> > - Patch 1: Fix.
> > - Patch 2: Change lingo from 'Master/Slave' to 'Initiator/Target'.
> > - Patch 3 & 4: Improvements.
> > - Patch 5: New feature for HW lookup.
> > - Patch 6 & 7: Tegra264 SoC support.
> > - Patch 8: Tegra254 SoC support.
> >
> > ---
> > v1[1] -> v2:
> > - patch 8: change name from GB10 to Tegra254.
> > - patch 6: added ACK from Krzysztof
> >
> > Sumit Gupta (8):
> >   soc: tegra: cbb: clear err force register with err status
> >   soc: tegra: cbb: change master-slave to initiator-target
> >   soc: tegra: cbb: make error interrupt enable and status per SoC
> >   soc: tegra: cbb: improve handling for per SoC fabric data
> >   soc: tegra: cbb: support hw lookup to get timed out target address
> >   dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
> >   soc: tegra: cbb: add support for cbb fabrics in Tegra264
> >   soc: tegra: cbb: add support for cbb fabrics in T254
> >
> >  .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
> >  drivers/soc/tegra/cbb/tegra194-cbb.c          |  34 +-
> >  drivers/soc/tegra/cbb/tegra234-cbb.c          | 758 ++++++++++++++----
> >  3 files changed, 606 insertions(+), 190 deletions(-)
>
> Applied with a few fixups to the subject lines and commit messages.

It looks like you missed the binding patch. These compatibles are not
documented in linux-next:

nvidia,tegra264-sys-cbb-fabric
nvidia,tegra264-top0-cbb-fabric
nvidia,tegra264-uphy0-cbb-fabric
nvidia,tegra264-vision-cbb-fabric

Rob
