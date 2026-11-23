Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445723;
	b=mfADbRKqF16v7ph96Wx0lvyn8EGXAGnz/otX47IatC5khVAE7hM7P93lCtHRITeN2iCf
	 vXufqIpD1QdQutgF/VXJKacAAlswxbg7MJxtLRwuEe6o6NyUPSSq3eAXbnnffkfDdiWap
	 D5YR1fkHunKuIkGrJqlLjc4SdPU9GhEmFiIeXx/Xj1KeU7GXCOhrN9EcTMs8zJdcT3fiT
	 BPuCSwIuPx8puBu/1vkB/hxiWeeC3JkG34ELj3sY1h7Bd0kpI50pDeJw6jdOTIqABclca
	 1wGLQLWRPnwUBbJbvdaY7J6+UTNKRz2OGbGCdj1V4QnOa8vU+SL+ovQjvjnMdg4xkfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445723;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JS+dIiqr490kzSTjrrhFYTyKXPHN1OOH0o4K2ofoZrk=;
	b=xsq+vgXzZ/uP3baVFyzj5ro2S/XCNMaAxUL3o1DQQRNZoh+naaZNAuav84jxBUClnp+X
	 5mjL2kBt1GLTTyaZzSSFov61VprHwHJ0hXGdBeUyhIgSxhDoM9oLx8hEN4yTPYEF5UI/V
	 otUhFK5G6NtFl7ZHLcSN4iI11KN8zWC92RTPeFBpD4wbnuda05nYbZ/BUXIpXNzK1l5OJ
	 a9jTdwdoSRD3YeOGnwmd6oX7O5Ei9yOv/aQNaEgGoymcfSCd97HjyihQfB+RZ75daBhNS
	 uw78bCBTi/31Dqv4Y3UbvMg9ml9jB/HDa80ztQqTXXa1K1VdLgJi2jO40eRjWoKz9dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWXqzKu6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51F606B09A;
	Mon, 23 Nov 2026 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWXqzKu6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86D61F01561;
	Mon, 23 Nov 2026 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445723;
	bh=JS+dIiqr490kzSTjrrhFYTyKXPHN1OOH0o4K2ofoZrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FWXqzKu6DWFkhSaPILqik4hil92oG0gEsL+MorSUkM6kJ0p4cCMoM5s0Gi0IA70Cf
	 k0PstVwJNZ1BKr6IQs7hyugglnXfCpmm80pX72eLMMun/lTPE6pv6tfg3QLc8zksFP
	 Otbi1zjRW9IEMbk3rFgs4ZhsN5QUCekhd2q7mYuKqppQHtXHiLoNqan7pvFNnaGMjx
	 EGeen9gzrejVGUdqJ5bqgtZFf5fRpO9Y+9yC3ieqR/Y+/jI2yJp3XpSeTlBB78iWTP
	 d3ykUSfXOKnVtyFEvob5wqVXS1TGLc70076DJEVEK0iJMugjH0lmTUpojbPVRbJ4WN
	 MNDiaHv2VxY0w==
Date: Mon, 23 Nov 2026 08:55:20 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30
 fallback
Message-ID: <20261123145520.GA2412988-robh@kernel.org>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-3-clamor95@gmail.com>
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
In-Reply-To: <20261113161819.36847-3-clamor95@gmail.com>

On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> After further investigation, I have found that Tegra30 requires a slightly
> different programming model than Tegra20, the maximum VI clock differs by
> nearly a factor of two. Additionally, Tegra30 does not require the
> APB_MISC workaround.

If the clock rate is a function of the sensor or input resolution, then 
wouldn't the h/w design prevent that scenario?

Does having the APB_MISC workaround make things not work? 

It sounds like things worked or could have worked with only knowledge 
about nvidia,tegra20-vi, so I'm not sure this is really justified as it 
is an ABI change.

> 
> Therefore, remove the fallback compatible and add a dedicated compatible
> for Tegra30 VI.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
