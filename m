Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC131A548;
	Tue, 17 Feb 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322022; cv=none; b=Cfo4ZMsW8+VdMnYMMkJb41fsv78xOOyaOxkqiqqafuJZV8IKZqmvHEX1dxa2EkuocX4Si4O/BaTHwwrCyvz8/RQVQk7wk80NHhzFWhm7I7mXC5tE7e5LUdJxvhRPvRLNJOFgPnzUpey6wpOEpDjDpwijwUvpQpi8ackuJQpE+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322022; c=relaxed/simple;
	bh=+hHMMjCmGivOuUVBVB2++cpkvMAUfY6n/jQMTPc1lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0Bsk4HKMKSKez6It8YFGS7m5HSw3tNqy1ZbYcf6QiF0BQcfqyMz3z9BkpFKhfo/9QOmSKNnRAtpVNBE1/Suo2hNh7/OPvQ6lEvTSj/2j1hDKR6O2gt5US7t+u2nQIuyU+jy7OGXhAWL6P8CG41HiyiTAtmGCsyXpehU8cBA6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Dn0hrzvM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Dn0hrzvM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ggPH5Y20hoWNO8lI+FCNkaDwu2pNsKAXw0sa+ZPU0LQ=; b=Dn0hrzvM/VJdeQsAGjqG1czRZm
	pnpIslEfGJ2Qn3LVa2VS0/aVSgJ0mVSIq4o8w3E20nWcK683vbm7ojtr9TS7yfiZvgAIeIHEH2eGI
	Rt4UIoUkkNXN3GpzZ6l2IflQQxGDpFxR4x7am3yA1JMoCeuwj+Q2dSY3TX0DVVX10gp8QZnOPvWoP
	juGx6mXJ3jAYX8L691jz3Wo7qqm/crGWYOKZ09BsHvbyVwdwxp/kGwkVGyqJY997OqQQBWaD+2PLf
	xh5spBVW18Iq3mrnZDJi0/V81dBnbegBstYT6/3sJYgHLFqch7cj8JNtiCBS9iXaYnLu7q3Dc9Y4b
	ciakkJBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsHlu-000000007b6-2njy;
	Tue, 17 Feb 2026 09:53:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsHls-0000000017p-1Ns6;
	Tue, 17 Feb 2026 09:53:32 +0000
Date: Tue, 17 Feb 2026 09:53:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 1/3] soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Message-ID: <aZQ6nF9NJA9bqjSD@shell.armlinux.org.uk>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
 <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 17, 2026 at 10:16:36AM +0100, Krzysztof Kozlowski wrote:
> By convention, only one globally selectable ARCH_PLATFORM is expected
> for given SoC platform, defined in arch/arm64/Kconfig.platforms or
> arch/arm/mach-*/Kconfig, because we target a single multi-platform
> kernel image.
> 
> Platforms wanting different granularity, e.g. due to size constraints on
> their devices, should be sure that globally only one ARCH_PLTAFORM is

typo: ARCH_PLATFORM

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
