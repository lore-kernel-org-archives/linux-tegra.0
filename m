Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9724A0F;
	Thu, 11 Apr 2024 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712846214; cv=none; b=bRxJcVgUjLQVP1q7H6QCH/lxVkXgb2l9mUYWNNmjWL7BmEkMbkOD4VFY6uRKmjWLjpWvWHOeKdZgzFnhi+TjYedjIFoJ9FGwfY++z+EN6GkTdTDRt4IRNlm/9NoeJa3jwq4hffq+3NzRB80P0MHHZalP9R0cTntDiYuiPf8iXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712846214; c=relaxed/simple;
	bh=IewoV/etTVhMO123uGpbggCD3+VxEchZ/PN0HJueGTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q71FV+X9c98moum+jrQudh3B2d+8kEsXGtX4zbUEFpNg1ciZ2LO3WYhLrnvGAWO/OfLqjJXVS4hV/955amQgVo5R5meKGyy0m9Bzptp6XKuJCGaEZeMZzKcMBT5/ntd+sfmCKBFpinGmjp1CjHGfLrCu30+jb/2/eKcCep8MxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nrexifsf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nrexifsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8ADC072AA;
	Thu, 11 Apr 2024 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712846214;
	bh=IewoV/etTVhMO123uGpbggCD3+VxEchZ/PN0HJueGTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NrexifsfvYtAd035gY1nxJkw5su2bADiPYW2S1BQNmWDrkN1u2L1RX9Ap1hUw8jp0
	 gDuHZ4HcMD/BMDML+89BdOdg4bYaGP50Uu9ziE8rnSPnNruoSSA/oKwXB8CPjpBQfs
	 PyDY6QZcIxuu5lUT/6vvEGiyuI5Cu3aC5gOghLuvqgkeo42zVuhFmLUMhy+cedkh6W
	 0pSxDNuSgMPb6jIF9eChphXibSls3IeXpLdudgf81PnqF2+LVlcd8eKDKvSPyHxWLq
	 oRgdWZnemI+V8tAjXLvffM7zHt2fjHy8StlJRpBB4jLjl4D0sC5G2mc6q+cS6sfW/d
	 g3tYNlxr9WEeg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso817362e87.1;
        Thu, 11 Apr 2024 07:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbTRWF8bLZBIcLaEOF1xs7szt9kzOizzM8QUjrG/LEWiKlDvLqeB9gs9TdL0sEOgia21C0MeDo4nbeoTPq3Gudb9OVqVcsVH6GKA1PgvHBFCwyhwx4MKIZVAnwYgXtXh/1MBpc/h5U
X-Gm-Message-State: AOJu0YwJmeK8qDC8OlFNmRmZoNanDnYE8B3ZN6YKPBd8lXVgW/XkHMkk
	mXlXYAh+xPMGWX5wHNbsip8gdHFCisxPCaaVu5lM+0z42oQLJ0dx6naWBbvEeX3OHDTNPofSRIR
	pLV/fxH1+R5/aO280e07tbt6svQ==
X-Google-Smtp-Source: AGHT+IGz4GuUoIA2mfwiI30l9Lwfa4dJPZoK0Pb/jyu01DJB6UR3gI6Y5I7rlAqNsTMMhxCMCxHsbb8iha4oP99XyuE=
X-Received: by 2002:a05:6512:490:b0:517:5d67:6db2 with SMTP id
 v16-20020a056512049000b005175d676db2mr925190lfq.10.1712846212691; Thu, 11 Apr
 2024 07:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409082324.9928-1-jonathanh@nvidia.com> <ea3be8f7-0ee6-4940-828d-2fc15b9239dc@kernel.org>
 <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com>
In-Reply-To: <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Apr 2024 09:36:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLf9Obb8wTeriRVopT=jxDoV0i_RvdJibsUsgJt4jOAXQ@mail.gmail.com>
Message-ID: <CAL_JsqLf9Obb8wTeriRVopT=jxDoV0i_RvdJibsUsgJt4jOAXQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: host1x: Add missing 'dma-coherent'
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:09=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 10/04/2024 07:18, Krzysztof Kozlowski wrote:
> > On 09/04/2024 10:23, Jon Hunter wrote:
> >> The dtbs_check reports that the 'dma-coherent' property is "unevaluate=
d
> >> and invalid" for the host1x@13e00000 device on Tegra194 and Tegra234
> >> platforms. Fix this by updating the dt-binding document for host1x to
> >> add the 'dma-coherent' property for these devices.
> >
> > That's not really proper reason. What if DTS is wrong? The reason could
> > be if device is actually DMA coherent...
>
> In this case the DTS is correct. I guess I should have been more
> explicit about that.
>
> >> Fixes: 361238cdc525 ("arm64: tegra: Mark host1x as dma-coherent on Teg=
ra194/234")
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml | 11 +++++++++=
++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,=
tegra20-host1x.yaml
> >> index 94c5242c03b2..3563378a01af 100644
> >> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-h=
ost1x.yaml
> >> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-h=
ost1x.yaml
> >> @@ -177,6 +177,15 @@ allOf:
> >>
> >>         required:
> >>           - reg-names
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - nvidia,tegra194-host1x
> >> +    then:
> >> +      properties:
> >> +        dma-coherent: true
> >
> > Do not define properties in allOf. Put it in top-level. If not all
> > devices are DMA coherent, you can disallow it for certain variants (:fa=
lse).
>
>
> So for host1x we currently have the following devices supported ...
>
> properties:
>    compatible:
>      oneOf:
>        - enum:
>            - nvidia,tegra20-host1x
>            - nvidia,tegra30-host1x
>            - nvidia,tegra114-host1x
>            - nvidia,tegra124-host1x
>            - nvidia,tegra210-host1x
>            - nvidia,tegra186-host1x
>            - nvidia,tegra194-host1x
>            - nvidia,tegra234-host1x
>
>        - items:
>            - const: nvidia,tegra132-host1x
>            - const: nvidia,tegra124-host1x
>
>
> Now only the Tegra194 and Tegra234 are coherent (which are the latest
> devices). So rather than add this to the top and then filter out all
> those that are not supported, I opted for the above because there is
> only 2 devices that need this. Admittedly, as much as I like the yaml
> bindings, for things like this, it is not really clear which is the best
> way to handle, so appreciate the guidance.

I would say how you have it is fine, but that would only be for common
boolean properties with no possible constraints. Having that exception
would make the preferences less clear I think.

Rob
