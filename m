Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B9C8CE;
	Tue, 30 Dec 2025 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093316; cv=none; b=i4v9ay5UYPn4ZAoak/FqErv7dlJU9om/jO6mkBZ1AzMZ+boVaGu6jc4Tm/XzlK9xHQra257AnLuogM/AmGsDU1o8fBl8lRDaDm4nziwmQ402AH/EnCM/c+HD1VC5IWrYaY7PXGMxvA99Ksa1r+7+jYlxjPatlb1P1lXo18wFQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093316; c=relaxed/simple;
	bh=6XXs1Ij3JW13h4+nLNLkR/17LPtoGVAMzCvaZFHlxKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R95SzMLI9Dtlurxw+du/8O8k4+QMcykTIiKy78Hkj178kcHTer9rTdQPBKo9uUZ5ugrrovl9PsfSAkiaYue30dGH/j0VA6qQWEXXuAlALE/8sEcNcVnwXQ7yKnQkfdeN4DP71RtSP1LI5Nrz0MYCYgDkA4OHuMfQQDuf3bCDeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtCO8kYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtCO8kYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CB4C4CEFB;
	Tue, 30 Dec 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093316;
	bh=6XXs1Ij3JW13h4+nLNLkR/17LPtoGVAMzCvaZFHlxKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtCO8kYNJW5RfkfkcDsCqJkgRG0uoJVSm6aHkbcNw23KzVAZ6iVLxMvr7TaeQpGt+
	 5HmDZp1+npop1hue9R5PQg6tkl1V1b86xgllo9DcqxaX8nPX0WrdzBt6dnZHYWoVDI
	 8YgsM+J9A3KYyiDvudvErjYTQhQUxyazuz2CSRqLYOsXJErDoomMEmygjoAUmx1jHB
	 LrTXTZVHiRixgZj+PKl3YRb7HUfLczTVKVYEyTW9ZPA44qIWlgtJ3Q+ITIR/jYO7AQ
	 Dhb20wQmF9JsdRCOJZ0dfeVPLco4QBxz67y2pydkU1Wq99KJBInaRIg+iwwJCKQGWx
	 mxFrN7LfmyJvA==
Date: Tue, 30 Dec 2025 12:15:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <20251230-pug-of-sudden-pleasure-f6d1d1@quoll>
References: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>

On Mon, Dec 29, 2025 at 02:31:12PM +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
>  2 files changed, 107 insertions(+), 64 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

