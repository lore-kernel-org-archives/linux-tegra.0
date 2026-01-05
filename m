Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D3311C24;
	Mon,  5 Jan 2026 21:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650300; cv=none; b=NDvw7DkDXphSTgsDer7lcxXPcK366DbGLD0XDzhIbWxaiwIOQIdpPTl2ky7aButTDi02q9SkXZv7yhQCZCnRLj4Ah0GJadJsrtP5fLKHWUesakosFQsxQGJqgvuiXooNEYFWYxbdjyCVvOXbKYWo4fKb1xU2oKYwOBg+5yhzNpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650300; c=relaxed/simple;
	bh=iEw+W7eYpml0+ut1H65CELRyHgaqnq0z2gPAIWzmZ/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MO287SP8bQbMIw5QjeFCyYOmKFLJB3AtLFapqlVRnmw1ilI9mTEEa/nGVNQJlpjIZzUuGsasmv1I4YwlvA3UD6+Rl3ZpLNOYfSp8TGisbmhiDqEnCdaFERbAyXOqQ/8cs98WW/92K3gSNP0++HwZ664/m+nkc5/z6RUfOwWPhLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQENB4zb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQENB4zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C931C116D0;
	Mon,  5 Jan 2026 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650300;
	bh=iEw+W7eYpml0+ut1H65CELRyHgaqnq0z2gPAIWzmZ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQENB4zbTdWIHNQka6uoWjzsVoD8hGLZLzKiVCdNW9Lxo+pqcT7KTv9OxvQhULNbA
	 BK9IapF5VDdAEJ2/LFVQufoNksK48JMpZ3y69u18t6E4agT/TdMndWiDHbUxVhoxQq
	 jBvxlPH6JdmBCNcyEP72p3cpv13dydQeSJM4i3kPFINpvU0+ImNLdjtlszc5h3pnEk
	 xirHpXOuzDzKj7345LyomYxy+hzYoB3Ag2jtZWs/8LoTeEEfGWTRDvrx45K6FHSrEv
	 sAaUzGvSFx39F6FbHEtORGEKV0iuA7BunnD9zB4DbXJsZVFKEITUJc2MIO4uuF26Fm
	 YiHZdKSe3BFYA==
Date: Mon, 5 Jan 2026 15:58:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	Lucas Stach <dev@lynxeye.de>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <176765029770.3496261.3882475061714506998.robh@kernel.org>
References: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>


On Sun, 04 Jan 2026 11:23:04 +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> - Modify MAINTAINERS references to point the created YAML file.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v5:
> - Modify MAINTAINERS references to point YAML instead of TEXT file.
> - Link to v4: https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com
> 
> Changes in v4:
> - Changed the the reg property for nand child node.
> - Link to v3: https://lore.kernel.org/r/20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com
> 
> Changes in v3:
> - Removed pattern properties for partition.
> - Used single quotes for nand string in pattern properties.
> - Modified maxItems value and added minItems to reg property under nand child node.
> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
> 
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>  MAINTAINERS                                        |   2 +-
>  3 files changed, 103 insertions(+), 65 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

