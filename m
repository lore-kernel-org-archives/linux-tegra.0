Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195652;
	b=ra2B132q4dtJhWTqjuYJ8u/NdvuuIrcT1Z68WCrImx5C7VqtVaruENhmZAtY8POTBBaP
	 ErVs/Sb1LOW+UG5sqC5i1hkh7zS8ljmzOwEThdl27mZftTFeZGH9ig3Oi5HfdRIFmMd9M
	 tEcCRB7lj+Epjpx+KQ0YOPcXnfOLBLcO9/PsLboAevHhyz9IjQSboC0Q5UzLwTkPmNjvj
	 /r7ynCRzK3B+x81TGkiO75nQWLipgQBqLGM8QNwr3y9+GzQ68t9fVsxbzaoK9G5oc2VFT
	 mvyXF4VfzDdgHbZvqZD35gOiKH/Ovs0g9pLipUCjP0hGlwU6fXq9wzsjHSMxH3w1/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195652;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aiV+iHpPeBuZjAIswumyv7srYRF8RS569hZpfVwwxyg=;
	b=Sgkaqx4av46kFvK0R2L8/8Psv0E/h2JXyYmNkIpeLnwhSktSXU0NNaifuoWbxvfZ6kY8
	 HkqIrPQOOrZzEHBZn0sxVJLsCr2zLCpc0SjuUpbaa9GIFucytYWtbO1czMxqP/uvcMuRN
	 JZSJZ2ITGwDOuPwIodIk3GEvIdbEQjItu/2Tx4PK5kq+0fw4q+XCC1GC/ngWYurYkeOo4
	 2+qNDNV5pxCH8jgZneVLsBUCt3dntMtEV4CtJWUJdbwfBiVPGPSHZ+lGRk/Kx517JNlG5
	 gFKpV7+DvI+OjdHwdyU9QFUh2Tb5SXr0qOXqvEEG3RGFSzAhmXTrXN0BORNoewuTIKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaMmfZtC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B35606A31C;
	Wed, 28 Oct 2026 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaMmfZtC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C091F01825;
	Wed, 28 Oct 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793195651;
	bh=aiV+iHpPeBuZjAIswumyv7srYRF8RS569hZpfVwwxyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EaMmfZtC+nPY7Y9/NPYZMXw+pAZwuXU8Qdqsj8u9Vwlxfx9pgeKdIVSVxXXHGCZhm
	 wbMwZuh3pj5MG26qIhSpLEIrEgAYtECD8mXVmmoA+hEGGMK/3jGlKvIUykLeoxheak
	 7NGlVkx5y5AHzfpxxdqlBo9BDsdkZYyZgg/nOCsumNjxJJ0NAo2likJYQTlSTCgbqp
	 d4srJ/hgUJDAUuJNhjD52Tdjsetm087jqy2F0ewo8XkX6nBWrHQ3zWLwwKfFJ6rZTH
	 9Cg9ovxUPXh2jf0R2x9M6CP9FwuHnarHWt+YSyJND/VWL/j4JHjHSn6P4g0oHIookO
	 PbavvfdFbPGgA==
Date: Wed, 28 Oct 2026 14:54:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Douglas Anderson <dianders@chromium.org>, Aniruddha Rao <anrao@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: firmware: tegra186-bpmp: Add Tegra238
 compatible
Message-ID: <20261028-wrasse-of-sudden-endeavor-b74319@quoll>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
 <20261028084900.1047287-3-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028084900.1047287-3-johnliu@nvidia.com>

On Wed, Oct 28, 2026 at 08:48:57AM +0000, Johnny Liu wrote:
> Add "nvidia,tegra238-bpmp" so that the Tegra238 BPMP can be told apart
> from other chips that use the "nvidia,tegra186-bpmp" fallback compatible.

That's redundant. We do not add bindings to tell chips apart, because
they simply are apart (or their SoCs are). Just explain here the
hardware, e.g. it is fully compatible with Tegra186 BPMP.

Best regards,
Krzysztof

