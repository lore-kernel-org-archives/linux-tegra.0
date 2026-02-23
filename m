Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B132939C;
	Mon, 23 Feb 2026 17:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866701; cv=none; b=ErRcKk8MniN4Tv7N3KhGvXlgmE11h5EjH2VGUghIGGVLf4Br2HYckJ4ZT0N+xBkzWJ9oMYwbLF/MdmfnbOVHgx1fTWu92YCLsi2C/hOO4JL5JDbKzfnnINDojzNNoLOzEWVO83loyIaMqP11iErwQMSG6NmZBicceZ//B1ql7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866701; c=relaxed/simple;
	bh=ZRbVHff9cwhjzd4EHPCkK5bTEZb7Lbk26FN3GsdVZ5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToS9eCW0auuZzosNT+4yEd9e8o2KfMit5MJNTaumgdikOhGrlEczh21gNKo3JEgwcrLXAwvpXxkAa5YFBde9lpxHTSBwnE29wQv9qqOQm48kxd69nWaH3ATvCxyeiUCBzPtuILi4+Cp8hhXDHLFSvO95V+h8BPpcR2WChGyif9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/mIOFe0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/mIOFe0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3282C116C6;
	Mon, 23 Feb 2026 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771866701;
	bh=ZRbVHff9cwhjzd4EHPCkK5bTEZb7Lbk26FN3GsdVZ5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/mIOFe0Yjdq0piPLsmh5N4wP7yKaqEdYI0eVSVx4iedMaB4HSdOrCJ8WPMAo7/EE
	 pKOUjhJCmr4fkBxXcRpNv7DQo328fKY9Yz3hF+cGfFi8tTXc91Tz69FcuIYVrgz+kf
	 T/gjRBBOORWGsSUYEbiJAJkpbCUuxg9kINGSA2me9lrX0kaXr0SWJ8OxJwwAMo6+v0
	 O8WajFrALSrC1vLUN5p86f2f4l5fXGrsLqS7/62qTmfxv6B3zLgV8UFhPsgjKjdH8j
	 gw1XkdbWHYwAGBuiLFFvqGCbL3rAP29GbUx1I/C9MwU8wWnvVzdirVIUigirKxd6lz
	 58kZoLtsLkr7g==
Date: Mon, 23 Feb 2026 11:11:40 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] dt-bindings: Various cleanups for Tegra-related
 bindings
Message-ID: <20260223171140.GA3992907-robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-1-thierry.reding@kernel.org>

On Mon, Feb 23, 2026 at 03:32:55PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This patch set contains a couple of cleanups and conversions for Tegra-
> related bindings. In total, on top of next-20260220, these patches get
> the number of DT validation issues down from 184 to just 88.

Great! Really, you were at only 40 unique warnings (I strip the 
filenames to avoid multiple boards duplicating warnings). You're in 4th 
(to last) place:

arch/arm64/boot/dts/hisilicon:116:74
arch/arm64/boot/dts/mediatek:197:48
arch/arm64/boot/dts/qcom:132:45
arch/arm64/boot/dts/nvidia:184:40
arch/arm64/boot/dts/rockchip:76:27
arch/arm64/boot/dts/marvell:182:23
arch/arm64/boot/dts/renesas:83:13
arch/arm64/boot/dts/xilinx:16:6
arch/arm64/boot/dts/microchip:22:6
arch/arm64/boot/dts/broadcom:32:4
arch/arm64/boot/dts/nuvoton:3:3
arch/arm64/boot/dts/sprd:2:2
arch/arm64/boot/dts/intel:2:2
arch/arm64/boot/dts/apm:3:2
arch/arm64/boot/dts/realtek:45:1
arch/arm64/boot/dts/freescale:2:1
arch/arm64/boot/dts/arm:1:1

This and logs of all the warnings from next and Linus' trees can be 
retrieved with scripts here:

https://gitlab.com/robherring/ci-jobs


> Note that technically these are at different revisions because they had
> been sent out separately a while ago, Some of these have already been
> reviewed, but given that they are fairly old I wanted to send them out
> in case there are new best practices that these don't include. I've run
> all of these through dt_binding_check. Also I've verified that these do
> not produce any new warnings/errors while eliminating old ones.
> 
> Krzysztof, Rob, I know that you prefer DT binding changes to go through
> driver trees, but given that these don't have any driver changes to go
> with them, should we queue these via the Tegra tree (or devicetree tree)
> once they've passed review?

I prefer they go via subsystem trees still, but if you don't get a reply 
in reasonable time just take them. You can take the interrupt-controller 
one though as DT only changes don't tend to get picked up.

> I plan to pick up the two DTS changes into the Tegra tree since they are
> fairly trivial and unrelated to the bindings changes. I suppose they
> could've just been a separate series, but I thought I'd post them along
> with the other changes since this is all a concerted effort to get the
> number of issues down.
> 
> Thanks,
> Thierry
> 
> Thierry Reding (10):
>   dt-bindings: phy: tegra-xusb: Document Type C support
>   dt-bindings: pci: tegra: Convert to json-schema
>   dt-bindings: clock: tegra124-dfll: Convert to json-schema
>   dt-bindings: interrupt-controller: tegra: Fix reg entries
>   dt-bindings: arm: tegra: Add missing compatible strings
>   dt-bindings: phy: tegra: Document Tegra210 USB PHY
>   dt-bindings: memory: Add Tegra210 memory controller bindings
>   dt-bindings: memory: tegra210: Mark EMC as cooling device
>   arm64: tegra: Fix snps,blen properties
>   arm64: tegra: Drop redundant clock and reset names for TSEC

arm64: dts: tegra: ...

Rob
