Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF8424169F;
	Thu, 28 Aug 2025 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391201; cv=none; b=i8MlsM/mhKAihAbpjDx6RWJQaJy2FbtJwA9ASe/azu6M2pFfPHdcTjMHicecURhgDeC63Ngxrfb4mC0VLqx4H8RrVJRcN0LHjUACfFcEBdIZsDRgVJyqPItgNkQ1AaEsxglv2BAdY3LaoPj+pfeu1bB46Cfp7J1n2akFAF9Y0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391201; c=relaxed/simple;
	bh=/IznsUAvnTndT5Ot+jQYWMWwYARY3EbdfbzmC6jzSlQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GV+T4ICRflr3wxiweflHipHPnaE4tvgwxp5tuYoyFowoL24x74SkeB4L7PEbfjQYTyupsKQT4B7IECBQKCHJ4msaIbnm2DH4J1Kqxk+i/EFg3dK6L8nMJfN4yR7Rj6S9aHyWXirbEu2jqQAQZXAPR4D5trGHNOsKuvDlFox6dVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP8lt6oN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP8lt6oN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83172C4CEF5;
	Thu, 28 Aug 2025 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756391201;
	bh=/IznsUAvnTndT5Ot+jQYWMWwYARY3EbdfbzmC6jzSlQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AP8lt6oNDNEW43O0TspzpzGxfmWb0Unt+HwIL0fZGkcgjLVE4xDXm1eHFkKh2bISZ
	 zf5mmnXHb/LjDY8GFTmCJiQXbMEUx621Rs3kBM/1KhQXuKU3hJ4shui6gRClRVfPk/
	 MdDreZm4o/R70j3QJ18s2XbFblkXbG6k36J9B0dgNDs9+nQPCB2mlOwBFQxfvdcQP5
	 LS+PicAo4cGNz/yJLkEFyExmKkenULDuVN7KOrWNfznpDPcKgz+Q8PNabCL1I0AkEv
	 D645Sy1zsAQpxZWFfin/9GBj3nigmEc7dwaybTNMlR2saPu5mRhKsqRVRxlEfa3951
	 w3tq4L4/jcSDA==
Date: Thu, 28 Aug 2025 09:26:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, 
 thierry.reding@gmail.com, krzk+dt@kernel.org, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <20250828102803.497871-1-kkartik@nvidia.com>
References: <20250828102803.497871-1-kkartik@nvidia.com>
Message-Id: <175639109042.1621859.15536493695388543442.robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: Add I2C nodes for Tegra264


On Thu, 28 Aug 2025 15:58:03 +0530, Kartik Rajput wrote:
> Add I2C nodes for Tegra264.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 225 +++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250828102803.497871-1-kkartik@nvidia.com:

arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@0/i2c@c600000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@0/i2c@c610000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c410000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c420000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c430000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c630000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c640000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c650000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c670000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c680000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c690000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c6a0000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c6b0000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c6c0000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']
arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@8100000000/i2c@c6d0000: failed to match any schema with compatible: ['nvidia,tegra264-i2c']





