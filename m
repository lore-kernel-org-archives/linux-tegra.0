Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0A2C11DF;
	Thu, 26 Mar 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520376; cv=none; b=MVV9TmY6m5ZZobrrcYpiIL3v9Na1FlR6NntCXV/ugL/sAMgJ8YxQKRXmjVv1loLmUXyN2zcCs4ezEXXZDAeAqNNtGTYt7VT01+TXglDXCVW0zzlUZHGlvVAnzSJ2IXj9qxht+XqaLlhIIxX1rHowqc6L2iwdlxWRaCcJpDq7UXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520376; c=relaxed/simple;
	bh=C6ZFEsgQjfGJwxE5EgQuT8WAfzsLS5V+qMDYqnoQbao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpNP8irRlU1yopKIc1wNXacskzxvPwawn2I1W9kkDGUqbLAtzZXDJ0htuUrbbbduMsFVq57JnhkI7i24gDd+U4sZCsPQl0EdSplwmKoHh5pPezQs7EoT6gjPukBksKHZ/I0nISaoAbDR5dozYyEPCAtOuD5rcEL9JLg58QSboGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpEM386R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpEM386R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6E5C116C6;
	Thu, 26 Mar 2026 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520375;
	bh=C6ZFEsgQjfGJwxE5EgQuT8WAfzsLS5V+qMDYqnoQbao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpEM386RQNdKHU6CsJ7Z1QNpXsfkAv4qx+vr+XRF/f5FGe4KvThRF/cFpqPhB9g0X
	 jUlRQFsVKlRgRx3GvaEm4d1bute0mtcxJiLKWEWPwQk3vv4dXpFKsOhhEoPs1Fa8kO
	 WQeCDEfV73NcaB78Z1tF+enOVySd4+LJ/g1H5kkaCN0bWf6MgKeEHvEVU4fYuJ48LR
	 enhlH5dA0X54GzpCD9abjdgqhaJq9pSJMOkpjrtKTTA88VoC7PGtDXle4SAn6Z3WYA
	 ZSn9mG2m3l6IQDYlkCcM+g2uk8UKAYNJcrJfVJ2IUCWH/LXhEvIzBFOcmPf59CuQYC
	 ufNKgfwIOPS0A==
Date: Thu, 26 Mar 2026 11:19:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chun Ng <chunn@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ankitag@nvidia.com
Subject: Re: [PATCH 1/4] dt-bindings: tegra: Add Tegra238 clock and reset
 definitions
Message-ID: <20260326-accomplished-wren-from-jupiter-61a6db@quoll>
References: <20260325212628.1234082-1-chunn@nvidia.com>
 <20260325212628.1234082-2-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325212628.1234082-2-chunn@nvidia.com>

On Wed, Mar 25, 2026 at 09:26:25PM +0000, Chun Ng wrote:
> Add device tree binding headers for Tegra238 that define the clock and
> reset resource IDs used by the BPMP firmware. The IDs are defined by
> hardware and are not software enumerations; 0 is reserved, so numbering
> starts at 1. The reset header documents reserved ID ranges where no
> reset line is present.
> 
> Signed-off-by: Chun Ng <chunn@nvidia.com>
> ---
>  include/dt-bindings/clock/nvidia,tegra238.h | 279 ++++++++++++++++++++
>  include/dt-bindings/reset/nvidia,tegra238.h | 125 +++++++++

Where is the bindings change with compatible?

You have entire commit msg to explain unusual things. Or cover letter -
nothing useful there.


>  2 files changed, 404 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra238.h
>  create mode 100644 include/dt-bindings/reset/nvidia,tegra238.h

So how can I verify that this matches compatible?

Best regards,
Krzysztof

