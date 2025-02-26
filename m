Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3421ABA1;
	Wed, 26 Feb 2025 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582932; cv=none; b=GEty1MJdgPaiL3Z/79/R0/DGR2QGWIslC/bt0jREvXUR1Ts/BdxZiDI8Y3Wsb3bbbBI4h5iBL8I1V4AcfHF6lD6myb8C7eda8r2bCMbmWEyTKC859ABC80RBk9QwneHzxK4FcHVB+/aq2N6IHyCFDkRht6KI/8d1PG3TP4rPr3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582932; c=relaxed/simple;
	bh=IVMyqJwn+TghBnMS53cLE4IgoqzRJmhtYXmIopyK5lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fV13DSi+LnY5fZ/tmlfPTRGTw3v7VgOS5CtYd4EEume479GG0QBWM3ru27Mu4fSo3IydH4TGvn512Pn2wXde3i5sm0WLLPrtnYzeleNbrYuH7F+PiJ6Mkc+PIxgYLXPyuSvSHOZ9K7s46YBg9OqQGjypyK+k25mQW0STumiu9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t54+ShyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t54+ShyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5629BC4CEE8;
	Wed, 26 Feb 2025 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740582931;
	bh=IVMyqJwn+TghBnMS53cLE4IgoqzRJmhtYXmIopyK5lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t54+ShyWgly8gI+MdBtdYLvTRksoHHzTKCigx1TEdTd4xOegT2vsZKBg66UxKUMiD
	 rS4Gh3OiVlpglHvzHWqezzwxyC8LCmwx/kP3lYfeWm2Bc13MWvwv4yDQZ41mFzRFl9
	 bXmPgNO3eLBwEZfEN3CMFJumw6aEroAzM3i9AtaltTf9+lSTpU/QPR5jeCwDlMXd+y
	 z/Poo261meNVB9nAyQ+riOUdw5COp1/CvoCHyyP7/JJCUZ0lgZqYll3DWl+6qWfveu
	 M0z8DL5kX0ZRmi1Cr264XbIv6AWBw5jMpfX5mqc+CmguOo/IsMuWCuaaHyC43SaVJm
	 PEFbHl5z/zp6g==
Date: Wed, 26 Feb 2025 09:15:29 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 6/9] dt-bindings: memory: Document Tegra114 External
 Memory Controller
Message-ID: <20250226151529.GA2338510-robh@kernel.org>
References: <20250225143501.68966-1-clamor95@gmail.com>
 <20250225143501.68966-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225143501.68966-7-clamor95@gmail.com>

On Tue, Feb 25, 2025 at 04:34:58PM +0200, Svyatoslav Ryhel wrote:
> Document External Memory Controller found in the Tegra 4 SoC.

This all looks very close to tegra124. Could have missed something, but 
I see 1 property difference and 'nvidia,emc-configuration' is slightly 
different. I'd just add tegra114 to the existing schema. For 
'nvidia,emc-configuration', I would just list the range for the length. 
It's just a list of magic register values, so we can't really do any 
validation of it. And I don't care what register is which entry. If you 
really want to document that, then keep the existing list and put 0 
value entries for any registers that don't exist on tegra114 and put new 
registers on the end of the list.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../nvidia,tegra114-emc.yaml                  | 431 ++++++++++++++++++
>  1 file changed, 431 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra114-emc.yaml
