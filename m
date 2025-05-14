Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412B3FD4;
	Wed, 14 May 2025 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259180; cv=none; b=Q7vZI3PRmCeZcnw1cCdgPrKHH1gFgPwY9GjewGNxP/uJ6MzoZYQ4+AJCjfDuRXgBuPszDpNkBs0Tdden3wTS+PMZIP6vMFEVGMFO2iaNk0SHW32mErcjttYPhFpa4lhVvPg04XgwYXCSUmTJvmL4Mp6wVFBoAnNh/NNd4N5ve0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259180; c=relaxed/simple;
	bh=INyPf9yRPrCTJUB7wPymmvA5p1vmjy/KnxmT+ewfMxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyYM4P6rWmhOmMLn9EovtDWUZeAkAvkGePhfL3QbF1FDuP0XWWh7IxPhdeFpYEuBNwIkiKjQOOFF0MYkY/MFZ+LW8iTPPZT8dXULnoDCnCGdl4n84PUizShrJRoanwKaWXbnEXrokEBt4hm9gKD6RbuaJOTr95rMniE2Po8NUTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHaB5Oi8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHaB5Oi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF8EC4CEE3;
	Wed, 14 May 2025 21:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747259180;
	bh=INyPf9yRPrCTJUB7wPymmvA5p1vmjy/KnxmT+ewfMxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHaB5Oi8JW9sCCW7ZGMRLRWQPKtR129THi0kx6eNb3gmY3WSQ2w4bhmEMTboslbdK
	 XEra3jWJtbL2DaZGbQ1zCWtHZJ654lHmvvS4x0FbqslmeqDfd/UXmvU8rFsLkhqkEi
	 PS9KkfyXN5XpCJqJJ69zmCLRvJwCX6nLVm63WtWxx7VoJRXOHNjo853+64QC0tfeow
	 uuCDVt2NS5vHJqpTNEjKbqQaKkLBOqL+erw8x9xxbXWPPJkMTKWY3ugeNKusCkHZd0
	 VzGEKx1Pp80vIVLT/p3HvO0ssi5tN08gdEH9g4NUPfx8GU3svD6ES0KGGmvXQtRZIh
	 OR8N0B7AtLCDg==
Date: Wed, 14 May 2025 16:46:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: perex@perex.cz, thierry.reding@gmail.com, mkumard@nvidia.com,
	jonathanh@nvidia.com, krzk+dt@kernel.org, broonie@kernel.org,
	devicetree@vger.kernel.org, tiwai@suse.com, conor+dt@kernel.org,
	spujar@nvidia.com, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, linux-tegra@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: ASoC: admaif: Add missing
 properties
Message-ID: <174725917783.3093373.1906010196019033996.robh@kernel.org>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
 <20250512051747.1026770-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512051747.1026770-2-sheetal@nvidia.com>


On Mon, 12 May 2025 05:17:37 +0000, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> Add optional interconnect and iommu properties to admaif yaml. These
> properties are supported from Tegra186 SoC onwards.
> 
> This fixes below dtbs_check error for Tegra194 and Tegra234:
>  'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra210-admaif.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

