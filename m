Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A435C1A9;
	Thu, 28 May 2026 21:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005169; cv=none; b=g8PqrUrOZyC9DzdDEqCyoh+Hm7YQWhzfX+apZXl8GH7lMBhff34MVthikJGthDyzccRqvkZnq4+Rjth7e5A2jl/110v8a0Hfw4W30JuX1bTfCxt7HS7YEQFh0/NmH3AA0rWkpM8rr7Cs7RYSoPuKhB+ZKmPlZyHAq4yARp1Qyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005169; c=relaxed/simple;
	bh=/c2Rgqzrmas2dx/niYDh3W5RnelxgQMb8+Rlx0FWgJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGJzpy1SoNH7tMLTOFv9dPp1N/9b17G78RRRauvYDOD/qIFrDZ4D0srSRi4NS8dnwm5Z/U0Y+KEiOyiLkprX0SLtOosLHvyJxB/NI9/KZE8VS0yBoNBB8tP+J27jBhpaXTJeYC9OeHA+j3NzLLE3ysrLxSA8gFtacRx1kKiPc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSrZbO0O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSrZbO0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88461F000E9;
	Thu, 28 May 2026 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005168;
	bh=P8dQxia5J1MmyVM4Wf+kPysZJUtiLa+FQRPlQG2Mos4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dSrZbO0O93XdYJoAuUqJjm3qKi3YT+FSmh7gAfFm0uRSiW61McQLiH7hL6SchZWl7
	 yMhTFsLgDfL/SIJV38B9ZuUyHqtJ5d5kwvbl4Wefe635KU/LIm2z1I70Fg9uoN04zh
	 WAVBB8zzqlFaFhJ46LlgnFRiDg+11IJOKqyUcSsx7mbecr++7Qkl0nohtarstxiRmi
	 33f2D4Z0zxDmPmjOrtD40kRtrrUU0zUdDb1fdfMcOxF+D4ESwwN0oIIF2QSp2WoqU/
	 YNw8IMaJ8hAFr3LWjf6EggRItNXPAc8L6Owhx2kjWi8Ua5jjzELBZPU6M+XUNmEjL0
	 9xNEmlSu8PF+g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Date: Thu, 28 May 2026 23:52:42 +0200
Message-ID: <178000515404.195040.3052014015963581433.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
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

From: Thierry Reding <treding@nvidia.com>


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

[3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
      commit: e6d097f575338738ba597b1d836e7fe655babd7c

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
