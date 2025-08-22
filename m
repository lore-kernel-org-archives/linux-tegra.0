Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D44414;
	Fri, 22 Aug 2025 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874830; cv=none; b=NKqObikz0g+6/Xxkzso80CVGS2+IU0zTDQky8WqixZt08mvVe0c2nyvDOjSfw5IkEszvymQsqYxv94VsWujKf+YfXfq5UXSCf2YRINPnA5T/UKGC1/Y7Je04+pNh9bw2BzoE8I/Iao7V8spSOCRmc2/3Ptxg2VUBm9xJ25HZtD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874830; c=relaxed/simple;
	bh=1xpS9ljdc2a6cPAWu2IlHVqg2bPq4/jYl5w6BDtGzZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7/uOJAlzi1LV3qWUs+SpdcyXGqFuRsaOg1OS2gwIfRQhBKX9N7hbo8Kp0qhsTSTTpu8DBOx8JzF/ZuQXujbK8zTo4dW91sUz1RpTffO112aQlh+n/7+JKwpTef3tL0chxCovFewI5hAHvw+bnNSoUvMn03lMKPV6g2Drhh7BMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsgpzVuj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsgpzVuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA255C4CEED;
	Fri, 22 Aug 2025 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874830;
	bh=1xpS9ljdc2a6cPAWu2IlHVqg2bPq4/jYl5w6BDtGzZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsgpzVujNkJAwUrL9obbZJeGZYJJ3QLHBFCo5LYhU7CFi0vhWlKIK9njDnom8/D/u
	 wEIxEWFCuYj+JZsAkSin+10j8ZX2v47wKJVYrl/jS2PcKcJ11EvOGYLjMoBqxglqvj
	 5QiwuLQus61YS4uczByYwB7OIcGfJRedAJxvdpRZYkIE88wLQXChTKLWRerZcpUi1a
	 uorIZ5qfY8e5/3uAstwRbGDWOj2GRuQVWmUXaH8wknbz6R7QPw0clXg4z9xcJjjy/u
	 vEBbXOd+/rJDgCu78LjvFOBKGWdd56dZhU1AhOU1D+teh+firZ0lI8CtxzcrrImvdB
	 zOpY209HelitQ==
Date: Fri, 22 Aug 2025 10:00:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: memory: Add Tegra114 memory client
 IDs
Message-ID: <175587482840.3804695.2274290139712087106.robh@kernel.org>
References: <20250820151323.167772-1-clamor95@gmail.com>
 <20250820151323.167772-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820151323.167772-5-clamor95@gmail.com>


On Wed, 20 Aug 2025 18:13:18 +0300, Svyatoslav Ryhel wrote:
> Each memory client has unique hardware ID, add these IDs.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

