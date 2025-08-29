Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFC3225416;
	Fri, 29 Aug 2025 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756486255; cv=none; b=iHHdaKvJkytiHSMrEpbnPNTSNArMPjJsuaO2EEJP1iJuZ/WCpLjhGPqvchdQJ9B8ykIT+IZjmm5ovH17t0jCaF1IdLDZ0/8i2GtMGsHt1v+ZFwZ4J5BK6E0jZdY+a9Qo+Ej5EKOpXnj5EQdGmWCi13s9CNUpCTKFpFs7kruxPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756486255; c=relaxed/simple;
	bh=jB6RPkxQ2Th0EoI02zrpFSQVhdODKW/Y9zT0Zky7ANc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiC/44J7tcLiEg3oy9HdpMLha5pVM6RhCLamKSXvyCj1663lkGBUOBmzVmof6ZtapDRV8iK76jgQEGbSn8MjWNDiEJMO9ofZ0CqIZI+vWjGWJ4nvHa+01T9gBSe+hk/XQvVyqysv0yqE4rIWbZWcFZtwCjUCJnX44l/kswl3Cxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hREyhJjA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hREyhJjA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D41EC4CEF0;
	Fri, 29 Aug 2025 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756486254;
	bh=jB6RPkxQ2Th0EoI02zrpFSQVhdODKW/Y9zT0Zky7ANc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hREyhJjA9D74P6kA4Pp56ZO0IJsCeerdeIrVWlvYKAgjd+Jb17f0X4EN8170NUP3n
	 jLc5P6xlU4rTU87fGNRW2LPizIbapQcvvhel8/wajrzZVkoYL69VWqd52LAtU/uWF3
	 YizeD0DEAKM09D+bmsgjqERIcXiM559XJSEOjYtVSPmu9nDvnNUYLAqYE6LYaNFZar
	 KeZN9qQ95PWNCc/tBfnHdjEgGQby3BvVIacHkR8ctFf4d/Tyy/CPULuewL4Gb9pexD
	 5R6MqziWKh0Dc/KReUU7qCPOmW9E7B6T19HYVOXkj7t84KVWBNxLmQfCFNjA3xGzND
	 Wvdcaxdg62eKQ==
Date: Fri, 29 Aug 2025 11:50:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114+
Message-ID: <175648625304.1001411.217793513914470413.robh@kernel.org>
References: <20250827113734.52162-1-clamor95@gmail.com>
 <20250827113734.52162-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827113734.52162-2-clamor95@gmail.com>


On Wed, 27 Aug 2025 14:37:31 +0300, Svyatoslav Ryhel wrote:
> The current EPP, ISP and MPE schemas are largely compatible with Tegra114+,
> requiring only minor adjustments. Additionally, the TSEC schema for the
> Security engine, which is available from Tegra114 onwards, is included.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
>  4 files changed, 102 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

