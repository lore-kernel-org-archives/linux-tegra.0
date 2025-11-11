Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA732471F;
	Tue, 11 Nov 2025 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868430; cv=none; b=iisTYDjewqyKgyUaQehb45zm7UzLSGl5+/OuZeDhQ/WwFh5zxfgP036q22VA7vpbsKMlsqqDsKVYAjG8pJNVV+GFLard79kpDEQb74IjkQrPGd7w9WPvganZfKYBZVZZPSowfxLaCHFkEx5PK5D0ZlN0v9v47unWY/qb1RA6eL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868430; c=relaxed/simple;
	bh=RSW9YL0BCELPxBMTGQR4MkyH+CMvpuUdUOYR1x3z6t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toWOOOBmNI3PenR63yqO2GPTj5jZE2GutDj5bweX46H/0wT7k8FBzDafXfrwlZLy3wUyW2PV+NJFW7ibfjeLfKXLTnBZA1LBXV3Y4+VRRssOSch8/ri8u82mfS3j9uIz0LzDS8houFSaoIa9XBXopxvSBkoViit6He+u95RNWtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaviA8Iu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaviA8Iu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72998C113D0;
	Tue, 11 Nov 2025 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762868430;
	bh=RSW9YL0BCELPxBMTGQR4MkyH+CMvpuUdUOYR1x3z6t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FaviA8IuS0iLpm2pUdhfnytjs85xym83e2L0GOXCVPVcd5zvbgabvBe9Y/d8IHNhM
	 BPZt7YPPqFol0yoJom+7t3WmCCpn2gPuEFZ5VV9shZRKSD/Acq86BmK5B+rRI08rNt
	 fmd8gZUHklbbL1qHp7QaQ5qaiYtolh31GVpXX2COHXI5ObUD0Hm8Zog0Honp1c/OSp
	 Xj6FI3xTYwGxaqAFmOJTqqLkVr04ASuUFJ2KKGFaswzUubKA3QrMj8pdTvxz/zXFLk
	 d6zwuvMgFHdSnhga+fiNdGhmqivX1HqsCUKJXa/Rl+mXCtILYD7Nz09O17pGFGv/uR
	 asWdwGx4u+ToQ==
Date: Tue, 11 Nov 2025 14:40:25 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
Message-ID: <aRM8yTtKBVEMSsQK@ryzen>
References: <20251009142253.2563075-2-cassel@kernel.org>
 <cvbvbshg4asz4ddrtsotsjc5srouwktirpxbhsjdmlxfzklytd@7sav35bkcmm3>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cvbvbshg4asz4ddrtsotsjc5srouwktirpxbhsjdmlxfzklytd@7sav35bkcmm3>

On Wed, Nov 05, 2025 at 02:37:33PM +0100, Thierry Reding wrote:
> On Thu, Oct 09, 2025 at 04:22:54PM +0200, Niklas Cassel wrote:
> > When the PCIe controller is running in endpoint mode, the controller
> > initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
> > 
> > The driver has configured an IRQ to trigger when the PERST# GPIO changes
> > state. Without the pinctrl definition, we do not get an IRQ when PERST#
> > is deasserted, so the PCIe controller never gets initialized.
> > 
> > Add the missing definitions, so that the controller actually gets
> > initialized.
> > 
> > Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT")
> > Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> > ---
> > Changes since v2:
> > -Add pinctrl definitions to all pcie-ep nodes, not just C4 controller.
> > 
> >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 57 ++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> 
> Applied thanks. I did add blank lines between the blocks since that's
> what I prefer. I hope you don't mind.

Perfectly fine with me, you are the maintainer :)

However, I don't see this patch queued on any branch @
https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/

Did you perhaps forget to push?


Kind regards,
Niklas
