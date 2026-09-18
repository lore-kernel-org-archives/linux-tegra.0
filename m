Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE20E51C07D;
	Fri, 18 Sep 2026 19:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758378; cv=none; b=rHMoVTbTNSG6DN39chCT2WPDt1JTR3JS9onbRAMBtgBc8S3dRt8nchtrW3L7y0o7cPnoiXWqIPjKYbm9qF8Wbw1L0ZbVOpIifhQldp+g4wv2j0gbq+rjifBIf+xQBH03Cpw1RaERoaKvlyeaR+OeOY3/xREjCpi5sWKSUmvR7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758378; c=relaxed/simple;
	bh=neFcvlHUtyFN5PORXFsaETg9NfjJ6wcK4YcyI2E8ibc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jn7OWtIBBLKfXYSUgmU+XT4Upd0Xtn7i5Hfoc8agNPMJUdkyNBwKYrJlDBqRXYMI6Ir+xvEgfRacGUAeOeFp6N/RpoFnHWWUps3zQjL36fPDlwPu44XBZkz4pl3set87fztSC0x9r+5DBIvvNFLHkC65Lm8zN1C7DSuBZSqjCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ/ctkVu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ/ctkVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D153C1F000FF;
	Fri, 18 Sep 2026 19:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758367;
	bh=ntsDpuFIGEFqBWQ4hCUDxmA6xI2gJJY0UUK3+l2mWV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GQ/ctkVuaPSEe8tmCKpLc2FO13ojqwd3ifnKXmzsz2Ae+KokK+/k/8HGncGi8cvtP
	 q9O8qqI5/h9keIXoo0vI1vFHAgqkq8cn2ry+QuhoNpdS5f69SvpHaS8ALcxvpS0zg2
	 Jaceyfm0Lry4Gn99Dd3uZyT38zrOn0PXrc6iimQmGOHDexkY48VHgbsqS0qZL38ksc
	 JmfSoDYJ4c0xeNfBEPslF6yDs/HawkZZsfwTf4E49ANqxn0M4Cm7CWs2Pjmyhxi0SO
	 VEEIojkEa18WrVA5rDgeXSvxZHwYVFfyw/S6JYNz3WANOKU26EHxVRikGHAYhfWXaQ
	 OdM1Cd0lMTqsg==
Date: Fri, 18 Sep 2026 14:06:05 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, mfd@lists.linux.dev,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Message-ID: <20260918190605.GA1426069-robh@kernel.org>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>

On Wed, Sep 16, 2026 at 06:41:27PM +0530, Bhargav Joshi wrote:
> Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
> Set additionalProperties true as this is shared schema.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ------------------
>  .../nvidia,tegra-regulators-coupling.yaml          | 76 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 65 deletions(-)


> diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
> new file mode 100644
> index 000000000000..248cc98b6af1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra Regulators Coupling
> +
> +description:

Separate paragraphs need '>'

> +  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulators. Thus
> +  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there are 2.
> +
> +  Tegra20 voltage coupling On Tegra20 SoC's - there are 3 coupled
> +  regulators:CORE, RTC and CPU. The CORE and RTC voltages shall be in a range
> +  of 170mV from each other and they both shall be higher than the CPU voltage
> +  by at least 120mV.
> +
> +  Tegra30 voltage coupling On Tegra30 SoC's - there are 2 coupled
> +  regulators:CORE and CPU. The CORE and CPU voltages shall be in a range of
> +  300mV from each other and CORE voltage shall be higher than the CPU by N mV,
> +  where N depends on the CPU voltage.
> +
