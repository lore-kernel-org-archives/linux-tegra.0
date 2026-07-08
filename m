Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079FE481FA3;
	Wed,  8 Jul 2026 14:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522631; cv=none; b=XaJxJQBqEgkqYk/N3IPsol4JZnAIVLIe+eGcrA0a9SQBl0eifnnwrQRUiv1Aa4uSojsd0cILHQIEIYa0lqNZMmIKd8bLDUgayvfPy3E3qcgkuVH7PrbVvzv6x5zLCPIBfOpdtuavmy4AgBzRHaWNQ2Q1IPCO2tum6rasbu3i6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522631; c=relaxed/simple;
	bh=QQqGQi6Z4damYWDMSPJOsddjhXKhaz7Y3X5z1JaEGPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzKUVt8WSM6BYzWeKrKPQhsZN3EgIjYJbrTekN9TgRdv68bW+tlSN5/W9i1Dolrp4cvW1F8Do9I5U9SPvzDhDGgMVP0IdTuH0DrB1wU3wWsIoQ2mVIYUNoCHa6H6n/iSswnThPhSmVj53lEGVidS6EN9o50cOUT4eqNMz39uxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtIV1ZK5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtIV1ZK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490DE1F00A3A;
	Wed,  8 Jul 2026 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522629;
	bh=loAbfll9dAH+nUDsAvMm88Rm+TOQmHRnqH0F30OWkjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BtIV1ZK5NKiWe+IhkuHQEzJdODa1Lsg3aCPJDG12ltWsdADOxjjP26jSgakjc0kXt
	 fwAaeD4OkwIlsNHxNzR0+JbyZ5TpTrYpqbM7/BPca8VkfyjV1ldwsrl82eSHuPens2
	 JIKh9Q3XaqqbExk67OexIpPXwFDEuHv6kgeLUXYEwB75RIiNgwlIXWbvUVnB8hfjo1
	 vbJyFwBrnNotxdAsXCbPSH9fVcjrFTdhzj1bRauSq0mzt4siC86nCMgVe1I+QBnvRG
	 C/VzJFSL9cx6cCvcOkWtXThcD5ItkkkHT7tVXXxJrulIvgZsfI/t5f9GDxLxm6lcey
	 c1oGt6PZCS4Ng==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Wed,  8 Jul 2026 09:56:10 -0500
Message-ID: <178352261572.2235436.2748282198553537708.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 13:06:52 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: qcom: Add #{address,size}-cells to Chromium-based /firmware
      commit: 2a906f0b4f037b3fe5f790a48f88549a86288fdf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
