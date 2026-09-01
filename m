Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EA415B81;
	Tue,  1 Sep 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228607; cv=none; b=ld1Cf1Upc1Xt1vO3AytaFn3wcydf8a9ZGh6qgiz9JHJponyPmbWIBzkHyZwX7TXwlk/VmFoPG2nB+H/wY2M989Iy9IoXFWajs8+wvy9tuQlFhehRHmOT2J3UQLYMk0UMAnYLcsJeP6zsgwWo2vr8yj9rqLo+s68gk7ey805sZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228607; c=relaxed/simple;
	bh=PdxqwyKzvJ5RlN6mAwj3sjLWdENPIDf6WWdF21/axiw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bvcru3y3RVvlgN86FSd+3VNcdf1KBtrXPI/c96pktvnceAS6YiyRqmZMZLvCZmC/sYbPnSFUsXtQJsSi+S0I4d9InlLe1WoDGsRgZtirVmBbehXMlcCIV3mGQURHkjjeNGj/Sh4y52BRbY+EYs8/VNJWREOo+cmYGK1BbRIoW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmxFSkD2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmxFSkD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A476B1F0155B;
	Tue,  1 Sep 2026 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228593;
	bh=R4ecXQO9vqNzXOeLVTWPt4EelG5cYusY7/xAh/+zYqA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TmxFSkD2YCDQouxFmPH971PgYOqSEV2vSyQpxt8rtsUCLoj8DDSnAsxeLNFc1Y/WP
	 fWaNooKbLzCqmNqcJMgo/9tsuldIwoBJVX8hfq+P+D1rh51Jvg0AIqfUSPkSwnFXBk
	 TkAW7TzUwFPA4Ih1R07fWPX4Ohm150DERZSF1R0UX6XrvLxqfaBQlV2HO6H24yeJ56
	 nJwT1nlZhfXANy6prsIETo4v0wkXz8pLMAn1tErzAXp2sPrFP450iifYvMLTYCmnOM
	 QNfFJw9VL6GaeCTK2MV9EOptRZFEy62ni/3zRtxaEFV+Ud2yDG8HUZaVW79Bc+xRXG
	 5l2vcvhSTLZqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Gary Guo <gary@garyguo.net>,
	Sumit Gupta <sumitg@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: Re: (subset) [PATCH 0/7] soc: Remove redundant error messages on IRQ request failure
Date: Mon, 31 Aug 2026 21:09:28 -0500
Message-ID: <178822856264.1835959.6354603328430924135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jul 2026 17:59:06 +0800, Pan Chuang wrote:
> Commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()") added automatic error logging to
> devm_request_threaded_irq() and devm_request_any_context_irq()
> via the new devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> [...]

Applied, thanks!

[4/7] soc: qcom: Remove redundant dev_err()
      commit: 29b96e2769def61531c19aa537f5a3cf3ef38e41

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
