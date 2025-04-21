Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED61DFE22;
	Mon, 21 Apr 2025 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248060; cv=none; b=QVLyQQ1VrU2SV4bzlcj9Tk+qO0KLdgxqjU5GW5u0pWqIuam2fWlgUvUzvyw1/0u7i11RFbAvXFCP0vT5N8SJvIFgzvER5IC6O1tklvKAXshYt7mNNXGUBbMqz6Qkk98cRXQI6m4FAIwYBpz7UKfjX7Ya2CZQ3bWqAu/v606JkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248060; c=relaxed/simple;
	bh=N0EIcJmYbwc3S1r3REodb7XflNDvfiiQXdWup906UB8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H+9RlTqjkTQlustb69hu5zjxFwf3lARv+B95cwx583n8fI6cHqWjBNj4mjXB3CVdY8lWq0n1EeXeDQdLIKLzvUOoKsVlvFGP8L4PF5c/250tdGGV8pE/PbVH99dVMw5xlzrNHHekgZ1s0OOO0/tNntFuQJsDidDYVyR82kV5wfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFX7fMmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFX7fMmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8E9C4CEEE;
	Mon, 21 Apr 2025 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248059;
	bh=N0EIcJmYbwc3S1r3REodb7XflNDvfiiQXdWup906UB8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=nFX7fMmJHKrYRCUZuISYoUF+Y0dQugakVYMqdJ08BOXa8AlUmbmGcdtf9qCaTgzE+
	 3O0kbVMob3Y5Xoys3hqW5urNDywx2UIaTL7tWXVmRw7NQaIk4j9ohk/l5soFr4DX1s
	 Rb9ZGp1VxxdNUNv5Hd2496c9G9MMHjIoqt/zY86WoYfEYgy4fycQ/ZFodsTQskvBC9
	 LEVoXyR7GjL1RXGqsFZpDePTsNBI6bALFCbN5dCCulVX7CU3tS+8ghfcGCUN9HLJt9
	 Yg/sYbqgv3nJUpao87KaDIWeKLWVWlZj5AQ9lLbt2WYG2sc5fj46iWaHByfPinl9+f
	 cCa0/vUujLn5w==
Date: Mon, 21 Apr 2025 10:07:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
In-Reply-To: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
References: <20250420-tx1-therm-v1-1-58516c7fc429@gmail.com>
Message-Id: <174524752405.2425882.1720854230912655553.robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit


On Sun, 20 Apr 2025 17:42:53 -0500, Aaron Kling wrote:
> This is based on 6f78a94, which enabled added the fan and thermal zones
> for the Jetson Nano Devkit. The fan and thermal characteristics of the
> two devkits are similar, so usng the same configuration.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 60 ++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
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
 Base: using specified base-commit 9c32cda43eb78f78c73aee4aa344b777714e259b

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250420-tx1-therm-v1-1-58516c7fc429@gmail.com:

arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#





