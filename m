Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03E722EE5;
	Fri,  7 Mar 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353960; cv=none; b=kM8jpe8JWWx+3Ps6xOuFdSpPMD9CIZYgKbfkq3aj9AVosjDPfeWSFS7fPnyVhCoJ0bOLsHgXWLghSUL/I1Y0Q9lgmIgU19XUhzgMPzrTEVol0WWrxlhRXHZHam2e++QLaDlSks9qQc4p7ShT3cxTaecIIIklwiz4CRZCHZ5NITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353960; c=relaxed/simple;
	bh=LEKn/iVCDqHF6UuoX0gnwRLWk845tZ27d/a8XRfdFns=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UEeaRsLFoU/n6TSFy2OHbom880pP6fuK+nCaED7VYaa51X3wc30xzrBHkRCaxMS2GjU+Fvyc4FmrkzJTDkc2E72tkCAZTYqbQ5n9sfEGghpwhKnv/BZ+iDCnQIsHzcmAuNv2jV8qDiGEYKYtGjD0Xpo12IWPjZXRYmLZzgqhPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujmQT0N6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujmQT0N6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6EEC4AF09;
	Fri,  7 Mar 2025 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741353959;
	bh=LEKn/iVCDqHF6UuoX0gnwRLWk845tZ27d/a8XRfdFns=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ujmQT0N6gf65OIZAzyctWyrhVDHH+NoBKkPRP9nIUk8R/cDtq0oWXQXk2/EsBIsfu
	 0sGEj5/wXbPMZDZXSKxL2AO6+gq0rhyrxBzDWkT/7DEHzvi5N1wYHsWSCJOkHh6CzO
	 lLqXe6RR2nwGRbexL2qTzE/HRNiVUdUReSnVZTSa7cAOCk0BL8vYn64HvFUFPDEyfa
	 nMwkWgAUehuE5qYIW0p+WQmOZ2lvM90B/5fa97faBy5R2vjG7SCdDsPFFkkxttwlEt
	 JTyRl8mD6AoGVfNOzrh4xkvDdEXH/0l5IxpAuqUv3bq/ub4GTzJBOFzUjshpTuxM9H
	 2+b+fz8o486VQ==
Date: Fri, 07 Mar 2025 07:25:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250307081047.13724-1-clamor95@gmail.com>
References: <20250307081047.13724-1-clamor95@gmail.com>
Message-Id: <174135385223.4031140.10808514258285152164.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM: tegra: complete Tegra 4 and Tegra K1
 device trees


On Fri, 07 Mar 2025 10:10:44 +0200, Svyatoslav Ryhel wrote:
> Complete T114 and T124 device trees.
> 
> ---
> Changes in v2:
> - dropped accepted commits
> - added EPP, MPE and ISP compatibility for T114 and T124
> - added TSEC schema
> ---
> 
> Svyatoslav Ryhel (3):
>   dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
>     Tegra114 and Tegra124
>   ARM: tegra114: complete HOST1X devices binding
>   ARM: tegra124: complete HOST1X devices binding
> 
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 70 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 12 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 16 +++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 30 ++++++--
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        | 65 +++++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra124.dtsi        | 65 +++++++++++++++++
>  6 files changed, 244 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nvidia/' for 20250307081047.13724-1-clamor95@gmail.com:

arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-nyan-big.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-venice2.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-nyan-big-fhd.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#
arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dtb: isp@54680000: reset-names:0: 'isp' was expected
	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-isp.yaml#





