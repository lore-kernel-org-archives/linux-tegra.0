Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F317C7F;
	Thu, 11 Apr 2024 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712846605; cv=none; b=QFwjE7wKlv//Ij4A+DM2GGgRp7eRPx0o6m4gSKv0VlwlKlVEXHsOLbiL+Aj6xNvmO63JlAFo+vDYGMDdGqHdnA7FsEuVpSAgCCad5gTUy5InFsSLe3XwFXnXCsNVBUk8ykGSsIa0LweSg3j4yhioyCU6F9cLbAWqb2sZGubF1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712846605; c=relaxed/simple;
	bh=5KlfnLklpi72F6aiosgVKrwtBblRp4nhvDuxgNau2e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcOtsAlsGbTwY6QA5fRyaTIuAdl0XJdBkqRoZsXvf5BwpzN9fII3ZRj1+D6d21RUA5CLNa01fTk3PTk3jdRrFz8fyJvEoRjW/5vW6FtDQB3157F/E0cUS56v7BbUhbAg8MJQKfnTyjcZWgKQhYt+a8k34Qf8dbQ2VDQmxTdh45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBwQwkXU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBwQwkXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D540AC2BD10;
	Thu, 11 Apr 2024 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712846604;
	bh=5KlfnLklpi72F6aiosgVKrwtBblRp4nhvDuxgNau2e8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sBwQwkXULJhQAFh/14CgNxZUZ/uQcvKwL4bvpD4+cipaxJlSrNwVSS7bPOuUdVIzy
	 5uCbDnHELfcteq0QXq3aS1DyNygRFIyegD4UprXYV+ZInuY8iXxBogBpDMA+Fo106P
	 swDY7aU0AoJKTtQV5tJf2SNu5qFB3HMbsugu2s7P8n1W6vptBHs6cSdL9KKZCcJz7F
	 48j9kj4x4t6kOM6uESAVRJtxt+FrTjLq7cn3kOOdmRUmz+aZUG6mY2Iuo/KS375NL4
	 h8Sn9Y+QFuZVMtZ3Zp2hGN4FE2hw5a0uAgNuFZMyn7Qx+04TO7rUUO6Oy2BqScPdJZ
	 qq/UZbtzvnIBg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso9132939e87.2;
        Thu, 11 Apr 2024 07:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6HCY0Zl2oFUdy2Ia02wIapZkY4IaBF6HfnSp1IKaUG+dFv4TBt/sz4u/4lp5WYgZR67TvTwnkZ/ZGPYHVmW/rQtIIahwZUfelXNto6ELap7IupqOqkcXUWjnG+PsWVd+/9uY4E6cL
X-Gm-Message-State: AOJu0YzSzBXv/SWwUT99Q93/24hl68bjl9llE/H67jGE5CsdBVk/S1Qi
	oc01qHSWCL7T4jrKtQd2BB+OE1oXzaBuHBdYJGOxAgatyXjIJXGh38ZC8768iHjzX3mmjepb08S
	WofsCAz1r3bDs88bIzzRr6nV8XQ==
X-Google-Smtp-Source: AGHT+IHqfwEXidpe56eHHTf6+wKKEKnyPfSu9qLBxjfq1qgbwFbrlIn4jfh4fnlvX9HBSF7DFI1pY1lJUHSTQXH9aVE=
X-Received: by 2002:ac2:4951:0:b0:515:d4c8:942f with SMTP id
 o17-20020ac24951000000b00515d4c8942fmr4304308lfi.58.1712846603218; Thu, 11
 Apr 2024 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409082324.9928-1-jonathanh@nvidia.com> <ea3be8f7-0ee6-4940-828d-2fc15b9239dc@kernel.org>
 <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com> <87909fc5-e4de-4b74-bdac-61a92777f32c@kernel.org>
In-Reply-To: <87909fc5-e4de-4b74-bdac-61a92777f32c@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Apr 2024 09:43:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLarN3-aSJ+UkRR4FxaiNbcApycJoTLyST9f048t_7-6g@mail.gmail.com>
Message-ID: <CAL_JsqLarN3-aSJ+UkRR4FxaiNbcApycJoTLyST9f048t_7-6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: host1x: Add missing 'dma-coherent'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/04/2024 12:09, Jon Hunter wrote:
> >
> > On 10/04/2024 07:18, Krzysztof Kozlowski wrote:
> >> On 09/04/2024 10:23, Jon Hunter wrote:
> >>> The dtbs_check reports that the 'dma-coherent' property is "unevaluat=
ed
> >>> and invalid" for the host1x@13e00000 device on Tegra194 and Tegra234
> >>> platforms. Fix this by updating the dt-binding document for host1x to
> >>> add the 'dma-coherent' property for these devices.
> >>
> >> That's not really proper reason. What if DTS is wrong? The reason coul=
d
> >> be if device is actually DMA coherent...
> >
> > In this case the DTS is correct. I guess I should have been more
> > explicit about that.
> >
> >>> Fixes: 361238cdc525 ("arm64: tegra: Mark host1x as dma-coherent on Te=
gra194/234")
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml | 11 ++++++++=
+++
> >>>   1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-host1x.yaml
> >>> index 94c5242c03b2..3563378a01af 100644
> >>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
host1x.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
host1x.yaml
> >>> @@ -177,6 +177,15 @@ allOf:
> >>>
> >>>         required:
> >>>           - reg-names
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - nvidia,tegra194-host1x
> >>> +    then:
> >>> +      properties:
> >>> +        dma-coherent: true
> >>
> >> Do not define properties in allOf. Put it in top-level. If not all
> >> devices are DMA coherent, you can disallow it for certain variants (:f=
alse).
> >
> >
> > So for host1x we currently have the following devices supported ...
> >
> > properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> >            - nvidia,tegra20-host1x
> >            - nvidia,tegra30-host1x
> >            - nvidia,tegra114-host1x
> >            - nvidia,tegra124-host1x
> >            - nvidia,tegra210-host1x
> >            - nvidia,tegra186-host1x
> >            - nvidia,tegra194-host1x
> >            - nvidia,tegra234-host1x
> >
> >        - items:
> >            - const: nvidia,tegra132-host1x
> >            - const: nvidia,tegra124-host1x
> >
> >
> > Now only the Tegra194 and Tegra234 are coherent (which are the latest
> > devices). So rather than add this to the top and then filter out all
> > those that are not supported, I opted for the above because there is
> > only 2 devices that need this. Admittedly, as much as I like the yaml
> > bindings, for things like this, it is not really clear which is the bes=
t
> > way to handle, so appreciate the guidance.
>
> The way to handle is that you must define properties top-level.
>
> For simplification you could keep the if which duplicates the
> dma-coherent:true but add else: which forbids it
>
> if:
>  ...
>   then:
>     properties:
>       dma-coherent: true

I think just 'then: true' will work here.

Technically, json-schema allows:

if:
  ...
else:
  ...

Actually any combination of the 3 keywords present is valid, but we've
disallowed the above and other nonsense ones in the meta-schema. We
can always relax things if there's a need.

Rob
