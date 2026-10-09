Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603022C237C;
	Fri,  9 Oct 2026 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533920; cv=none; b=Lx05FxWQKeY//koWDs/3VqiNU8sD96axOZynEaKmTF9t88Wov94wbQ3t5KEgJul3dF5/8pbkFlP2y5UVqoW2l4kFPVoLxmpXlJroee7fEWybTFYG4MjQPhS7IabKzV+h6tf2C4/XC+SweOGRJRyqgp6TtRRMGPk/8BaauLTAjEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533920; c=relaxed/simple;
	bh=SRtuuGo4Unz2sgKiCP/+R+yRvsAHsYcDsOeuuSY2Mgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X2nyoCljizwGNU2A/QtszAJXvOfpMTJ/+AZi/n2/HYpbXjvMU3LiYt03u/xwgt7hVXMKjg80KJ8pZ/In8/tjd27oUlr3Xk+EA0kT2kGO8bsQdLT81pJ/TVnPNBRIF1IKPfFg9+XzwzaRd2+sCII8ZL14LaP8VuMZKiQGTrzfIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/mtgsjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/mtgsjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A261F000FF;
	Fri,  9 Oct 2026 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533919;
	bh=LEB2edmb+By4KY5PbnRuFAPSvxtPKPV/ZSYkCWJ+hOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O/mtgsjpkKi6BNXuqheo2nO+aTKz5HNYB2nxas0c+Px1im5T808IrDDbZf3Xla4bb
	 jGWMTRxr2NT4kyVKt99R0U6GbHe++1W4k+hLn78JnqNh7ZAakiCpEejtMdl9TdRvBb
	 4RRrAmlCLgWfu0S3suvgkF8gUN4k9lgH0zd+cVrCMQwiQxgy42lrwa6sKkXeWMx41A
	 a4GZJX+D9yqq2r1cbp7g7PA5rZOi7oyEfR3ZHuZ/GJogEYyh6I5vEOkA3DZVSUJQnc
	 3Rma7J3dfu17IKEHXfDS0ksp/cI2y01bIFofB79xw6v6dYmzHiALEEDVt+gJMImDSt
	 G3VBN3V7gjW9A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
Subject: Re: [PATCH v3 0/3] phy: tegra: xusb: Add Tegra238 support
Message-Id: <179153391582.536264.8259067930837326835.b4-ty@kernel.org>
Date: Fri, 09 Oct 2026 10:18:35 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 07 Oct 2026 15:44:40 +0100, Jon Hunter wrote:
> Add support for the Tegra238 device to the Tegra XUSB PHY driver and
> add the necessary device-tree binding documentation for this device.
> 
> This series also includes a trivial clean-up patch to use the
> dev_err_probe() function in the Tegra XUSB PHY driver instead of open
> coding this function.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: tegra194: Add compatible for Tegra238
      commit: d940f4f05123ecdc3d1226df76ce652c1b4d845c
[2/3] phy: tegra: xusb: Use dev_err_probe()
      commit: c0c4091bbaa3c6dc05ecf8a639cec25eca933bfe
[3/3] phy: tegra: Add support for Tegra238 XUSB pad controller
      commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7

Best regards,
-- 
~Vinod


