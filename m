Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594826;
	b=NDhOsnuBkumHDKLFVImBQ8VBcPWkJAAMSZh+5LIQ0kPIZSvCZuOG1Lty8BWZ64HdOV8N
	 W3VNo46jpP0fR6eI1F6e3ZTt3kxVFtgh2ek552ycyB8QksCb2shOjVOJ6az0EvKDt5zS5
	 2JgSbHLQMmjmN5NQjKDE/wRj0wg0/vY2QtlEUBBTX6xWO5ev4oZjA1xRK2cX2p8oP04fU
	 +TXi+BCL+bkK7xR0Q1bf7ZFWb4zJseEozTeGWtcTohq0z/Vw0r6iDLeju1FfGgsePrG94
	 SZti504Htcb7OaYLVwOBuus3gYqKuCTQLxNqf86JrvupJF117/rg9wfjRDPZiy3Qq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=J2oZ2Pffx6RFmL4hZYGK3DF77UUAFY+CBcj5PPYK2gw=;
	b=UmnYHffYyVzHziL7y06o6AAkac0OIX9B2IwbD1jWHQHORdgdtbuoCEYvEbMXJvKoKHsp
	 FMhLPoYZ1FdiKsVAxvueCP2wgEIvUDbbgTfGm6Tg9duqH8TeYUcPh0vFBc7BcOw+uE0i3
	 jRE2YwfNl7tQbVOswWBRwkW9Ca4BgByxS5lLJ85McA2sRofj09YmBEeVHvUoNhqGxL9ji
	 BtmFv6MOPW0V6BNcv1yhwdiVNKiGuAGi6tTuAgfUJDzaQGF0JMLKL7ZTpDmJ0XccQwxbR
	 ynMbGIWz8RW2sGOrzVztXL0hFLVeOmslAUqKQgQXGsdF7K3WC/npI/uAntJXHRDmmSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjJXaQcb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85F606A31B;
	Wed, 21 Oct 2026 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjJXaQcb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E137A1F000C2;
	Wed, 21 Oct 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594826;
	bh=J2oZ2Pffx6RFmL4hZYGK3DF77UUAFY+CBcj5PPYK2gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WjJXaQcbrfAY9BxH6maCYdJfdDk0EmgTU4q7mbf09sUaFYw6kDhu2XUpCL3HjA+e+
	 /DoHHdy5zKsCXWoDfvl5lK4SBdOHROKmUwXtuXCA795C8w1jSEvivIzACxyKNozs7j
	 GgK4f7f7vBavwniHn4d4YV4l1tG96hX569TYT018lc7WgSrrm+JcorZTfq+oVttLJE
	 TDLF0jpRcaB8lJKDInnlgf1B/SFNNr4KzvydubeTWwSFjGHzipsUNlfUvky90n3nAf
	 tQHdLZGsTviUE50YB2BmFxg9Vr1Ah6gmHCOgDplbSL7fy9ujozutpyr2R+lQI6G8E7
	 /lFOpZ2oJGQYA==
Date: Wed, 21 Oct 2026 10:00:25 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <20261021150025.GA254364-robh@kernel.org>
References: <20261013145210.103565-1-sashal@kernel.org>
 <as5N73fHztX8hVWh@orome>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5N73fHztX8hVWh@orome>

On Tue, Oct 13, 2026 at 05:36:09PM +0200, Thierry Reding wrote:
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > index 4d856a8b674c..ecbc20e6adec 100644
> > --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> > @@ -44,6 +44,7 @@ properties:
> >        - description: GPU clock
> >        - description: Power clock
> >        - description: Reference or fuse clock
> > +      - description: Fuse clock
> >  
> >    clock-names:
> >      minItems: 2
> > @@ -51,6 +52,7 @@ properties:
> >        - const: gpu
> >        - const: pwr
> >        - enum: [ ref, fuse ]
> > +      - const: fuse
> 
> Technically this now allows:
> 
>     clock-names = "gpu", "pwr", "fuse", "fuse";

No, it doesn't. There's a 'uniqueItems: true' in the common schema (via 
a $ref).

> 
> I think we may need a very explicit version to cover this now, something
> like:
> 
>     clock-names:
>       oneOf:
>         # for GK20A, GP10B, and GV11B
>         - minItems: 2
>           items:
>             - const: gpu
>             - const: pwr
>             - const: fuse
> 
>         # for GM20B
>         - minItems: 3
>           items:
>             - const: gpu
>             - const: pwr
>             - const: ref
>             - const: fuse
> 
> We may also want to leave out the minItems property because it turns out
> the FUSE clock is indeed required, so we'll need to add it to all device
> trees anyway to fix this hang.

Please make this kind of change as 1 applied series so we don't get 
transient warnings.

Rob
