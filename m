Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159263F7877;
	Tue, 30 Jun 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816849; cv=none; b=B8hFIP/3BCB8hfGSHJm0AT/SkBMlSW5K+SuH+MnieGaTD9Y4cV8DrCQKKAr9rOEQZKv4cIjJap52UW6+Kt3r54YqOrmSLDdpec5vyvjXw2u6342/cQe9eCIewzLHq5V98hP44k38TCag3+Mj0UkmYe8VWB/3MQNg0y8GWF9CVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816849; c=relaxed/simple;
	bh=fEvpqHWw9i2d57Sm/WwLcUxQY1+owlDBFTnHRtMPGmw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjPOjArRE+fVr94obXrShIFpfK9OnUbSnW+a2cNGWWei0AY62zdIDpCDMFgAeHaIz0b0Tw6eY2IWdBZ7fLGCcNmV3eWko1kyWS6CTlQ46FSE1e63GGID1ou7flajNm+Ppag3VxVcMPEkgSMqd6N9md5uBONmOIByNlY1YHEz3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2uy8AfH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2uy8AfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DB71F000E9;
	Tue, 30 Jun 2026 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816847;
	bh=7XUNh2xZ+zxsc4m1oKNNe2grhWxc/9LAqKvL6GOxjTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X2uy8AfHwtHF0wRDgaE7g4aiKyldyWQrtNyErgp1exNnCRystRDF/nRD4TN5XDJ/v
	 c4d1r+IMrpcHszxihBDru5JKvu28nYxG1blVJKdHxCABJTTlMkJmDVfuE9GRjpo2hz
	 uViG0Yz6Q9Yr8LKmCBReXkWW2H6TrVmA1T0IOYUhAQUXATG0ICWEoRPyA2tGggArBA
	 MsWjTXDlwjBBePOqwZeu305qL5JC3fYUPjdyOnFSrZ1LxNVaSYLBjms0DQv9prRtcr
	 b/ipnzolIFJEJi6J2fF+uAzqDecWqz7UcAe8WydxiWYQKzZc+OjAPRl/yby28g7sxF
	 a33NHauFqG3mA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1weW6O-0000000HREb-3tTn;
	Tue, 30 Jun 2026 10:54:05 +0000
Date: Tue, 30 Jun 2026 11:54:04 +0100
Message-ID: <86wlvgpacz.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,	devicetree@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,	Lorenzo
 Pieralisi <lpieralisi@kernel.org>,	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,	Catalin Marinas
 <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Mark Rutland
 <mark.rutland@arm.com>,	Daniel Lezcano <daniel.lezcano@kernel.org>,	Thomas
 Gleixner <tglx@kernel.org>,	Rob Herring <robh@kernel.org>,	Krzysztof
 Kozlowski <krzk+dt@kernel.org>,	Conor Dooley <conor+dt@kernel.org>,	Chen-Yu
 Tsai <wens@kernel.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel
 Holland <samuel@sholland.org>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,	Ge Gordon
 <gordon.ge@bst.ai>,	BST Linux Kernel Upstream Group
 <bst-upstream@bstai.top>,	Jesper Nilsson <jesper.nilsson@axis.com>,	Lars
 Persson <lars.persson@axis.com>,	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix Kernel Team
 <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen
 <dinguyen@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,	Bjorn Andersson
 <andersson@kernel.org>,	Konrad Dybcio <konradybcio@kernel.org>,	Andreas
 =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,	=?UTF-8?B?Ill1LUNodW4gTGlu?=
 =?UTF-8?B?IFvmnpfnpZDlkJtdIg==?= <eleanor.lin@realtek.com>,	Heiko Stuebner
 <heiko@sntech.de>,	Shawn Lin <shawn.lin@rock-chips.com>,	Orson Zhai
 <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,	Michal
 Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 12/17] arm64: dts: nvidia: Add EL2 virtual timer interrupt
In-Reply-To: <3c714ae3-8f62-4785-9f61-ba9899fd70d8@nvidia.com>
References: <20260523140242.586031-1-maz@kernel.org>
	<20260523140242.586031-13-maz@kernel.org>
	<3c714ae3-8f62-4785-9f61-ba9899fd70d8@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, andersson@kernel.org, konradybcio@k
 ernel.org, afaerber@suse.de, eleanor.lin@realtek.com, heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Hi Jon,

On Tue, 30 Jun 2026 10:42:34 +0100,
Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> Hi Marc,
> 
> On 23/05/2026 15:02, Marc Zyngier wrote:
> > The ARMv8.2 based CPUs used in a number of nvidia SoCs are missing
> > the EL2 virtual timer interrupt. Add it.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
> >   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 3 ++-
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > index 849694f751d90..45cc180ac9973 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > @@ -3163,6 +3163,8 @@ timer {
> >   			     <GIC_PPI 11
> >   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> >   			     <GIC_PPI 10
> > +				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 12
> >   				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> >   		interrupt-parent = <&gic>;
> >   		always-on;
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > index 04a95b6658caa..ab9813f9ba30c 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -5872,7 +5872,8 @@ timer {
> >   		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> >   			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> >   			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> >   		interrupt-parent = <&gic>;
> >   		always-on;
> >   	};
> 
> Sorry for the delay. I gave this a test because I observed the warning
> that was added on the Tegra194 and Tegra234 platforms. This change
> fixes the warning for Tegra234, but on Tegra194 the platforms I tested
> hang on boot. It appears to be similar to the issue that Marek saw on
> his platforms and so I am wondering if Tegra194 also doesn't have this
> wired up?

I think you are in a better position than me to find out. It also
could be a firmware issue not making the PPI a Group-1 interrupt, and
therefore not allow Linux to configure the interrupt.

> 
> Was there any resolution to the issue reported by Marek?
> 
> FYI, the Tegra194 SoC has the 'NVIDIA Carmel ARM v8.2' CPUs [0].

There is no resolution so far. Florian was going to check what the
deal is with the Broadcom-related systems, but hasn't come back with
an answer yet.

The possibilities are as follows:

- remove the interrupt for the EL2 virtual timer and live with the
  warning

- add a patch such as [1], which should document the reason why this
  is now working (and fallback to the EL2 physical timer)

I'm happy either way, as long as we know exactly what we are dealing
with on each affected platform.

Thanks,

	M.

[1] https://lore.kernel.org/all/878q898ulx.wl-maz@kernel.org/

-- 
Without deviation from the norm, progress is not possible.
