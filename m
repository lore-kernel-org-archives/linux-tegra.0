Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F8342CBF
	for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771429781; cv=none; b=crWJ+oJguyoOx21IOzj8ZQt4sjBqGLUhn6U/4MJXSCQ+HEsk2byRcNJY7FnR8CQdEt3ZHP1IZFQvhZ9j62O72/IX8O0eJmt5T3Tz/kIV3C/ABNswAW7FpfZayq97wucWUQFoEi5WQiOq4NcoCmkfWaritO68oPs0nhsnDmi4+3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771429781; c=relaxed/simple;
	bh=6s/DRXe74fLPKwvA6jsEImtBpQp1apKjuEkG2xpenu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6eXReKRLjKcCW67+y5B8uTGUDuoKkf+i1/W9tIOGwkvU1TeTlZzXdA98WpdAmZVZdkqe6iXCgQXndm2Y8bUouA/o1zrIk1LvvWEseRYLSx2Sfk+rmPK+ElWP0m+0u1ZWBlBiOuN5Bh+/w2xXmSX9TlmPc94V2sirXaPkfpwtVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dulDhNSj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dulDhNSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC5DC2BC9E
	for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771429781;
	bh=6s/DRXe74fLPKwvA6jsEImtBpQp1apKjuEkG2xpenu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dulDhNSjiR4mEtDJA4ZsVMQmZmTFuohmKaWJNV27y7lLuy92UTuRIYTm9YO9gJBIH
	 8f7aImf1f6HGcUOvLhyKCiIRl2H8anWf/LAGPM3lncGRw57sGsQQ5HfGtGTEoYXu1i
	 5r0rERtcHVeyoa3vgHhAJPG9uRmHWYBMZN0hQI3smQTIlTz9IKOGzx/fDzsRmdb43x
	 NyMQlMrCiC5E7LDqH6/id4uFIUXEz8gF0K5EJCxZ4MwvV9UH+OZdHKkRr0N/QbGaIi
	 FXLRRJDu6hbrfjjx8B4q1ajBiFVwrBFFneR3xdx6E/yOgtT/mYH2TYpFc9TvGN+XDZ
	 DIaMJCrTcpdPQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so4563175a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 18 Feb 2026 07:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU46RUJpVIpR56vnLWlBcVvTfAb75aO4DqjfD+NJtWFuRFEWV/EolmFXr51Cm7Uwe2PClB/Qz/uV6Y/mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOxq729GlSuu/ij+3XnidLdar1KzWrDAflz8zImwdpz60+Ts0R
	e/Hpgk8H/mYj+/eXXMeLlJHUw8ZjjeM3LgK/Nt9w3bQp01Voz6415vGq9AcXMVYaOBT1Mry4ylo
	gAZnFID+HAiZQ6lziekKLMJS4teaPaQ==
X-Received: by 2002:a17:907:86aa:b0:b73:4d06:bc8 with SMTP id
 a640c23a62f3a-b8fb450a23fmr946321666b.53.1771429779464; Wed, 18 Feb 2026
 07:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217173457.18628-1-akhilrajeev@nvidia.com>
 <20260217173457.18628-2-akhilrajeev@nvidia.com> <e26ac880-c397-46ee-a308-be2de608e3d4@kernel.org>
 <eb42fefd-758f-4c02-86fe-01d21a08e101@nvidia.com>
In-Reply-To: <eb42fefd-758f-4c02-86fe-01d21a08e101@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Feb 2026 09:49:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6+U__jOGyoZCHA1KMopP+=QoKuLC0K90rb_XJfqq9xA@mail.gmail.com>
X-Gm-Features: AaiRm52YUr-ugyU80YIG6Uftdjkq2NKQ_2lfpPCd9EUbe6TXgMNQrQzHTFBaJg0
Message-ID: <CAL_JsqL6+U__jOGyoZCHA1KMopP+=QoKuLC0K90rb_XJfqq9xA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: nvidia,tegra186-gpc-dma: Add
 iommu-map property
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Akhil R <akhilrajeev@nvidia.com>, dmaengine@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com, 
	p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 3:59=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 17/02/2026 19:53, Krzysztof Kozlowski wrote:
> > On 17/02/2026 18:34, Akhil R wrote:
> >> Add iommu-map property which helps when each channel requires its own
> >> stream ID for the transfer. Use iommu-map to specify separate stream
> >> ID for each channel. This enables each channel to be in its own iommu
> >> domain and keeps the memory isolated from other devices sharing the
> >> same DMA controller.
> >>
> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> ---
> >>   .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml  | 8 ++++++=
++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc=
-dma.yaml b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.y=
aml
> >> index 0dabe9bbb219..542e9cb9f641 100644
> >> --- a/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra186-gpc-dma.ya=
ml
> >> @@ -14,6 +14,7 @@ description: |
> >>   maintainers:
> >>     - Jon Hunter <jonathanh@nvidia.com>
> >>     - Rajesh Gumasta <rgumasta@nvidia.com>
> >> +  - Akhil R <akhilrajeev@nvidia.com>
> >
> > With 4.5 trillion USD capitalization of Nvidia one could assume they ca=
n
> > spare few resources to test the patch before sending it... instead of
> > relying on Rob's and my machines to do that for them.
> >
> > Expect grumpy review because you do not care about our time.
>
>
> ACK! We need to do a better job here. I will work with Akhil to improve
> this.

Anyone that wants to run a gitlab-runner (and docker) on one of their
machines to add to the test capacity would be more than welcomed. It's
pretty trivial to set up. The only requirement is something faster
than gitlab shared runners. My 2 machines are M1 and M3 MBPs.

Rob
