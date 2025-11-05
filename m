Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892652FE078;
	Wed,  5 Nov 2025 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363893; cv=none; b=HQH28c2Og+UYzmUfehKMHb3KDWFB2I4Fg1FeTai9UjMfo47AJzsMs4ul5e0z2G1hkC/eRatyTM8kamy2ynbWjnim9IoWhLsCuALW4Dt0rEao5J+zSYpqlCJ+Wf5R4Y4oHP0DViGIDf8jnGqIWaYqRXzlwjC51YAiyXJIZ/jIMdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363893; c=relaxed/simple;
	bh=BQadIILiFQFCy78dge1MDVJpO7lOTvap1pifY0b9pFM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rxRx1JbnkcqqNwHaX/+PJ7leSLA7oSfY+WJi1VgTmUeQ8qPWPgDyNKEaWYYoM7U61TKi9q+C5PARkpsW3dKrti5rTbjQ2sh/e1JSP4TOVAc6SS44lOEBtTy7NNFF4Nw/Izn0zyFwKP2v3RnNTbGw2MNubSvCSdFj0FmjZbzIR6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm/UliUf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm/UliUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1072C4CEF5;
	Wed,  5 Nov 2025 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762363893;
	bh=BQadIILiFQFCy78dge1MDVJpO7lOTvap1pifY0b9pFM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jm/UliUfXfTK5raK09LkYUutiQVNZTYpFR/hXDjBOmdzcO3SkLil9xx/ZK/D0YFDo
	 iUb98+a0qbi1Sf5CF4+ZUdkjlVJmbdz2LBatxOLBvB4Ld67Rx34OdughevgzOO+jIR
	 cRiENgGGCr1PLigWS5WNjnu/lSpkwOyaTDgFb+kEsllfom8xiPjtIFrULVWEE6HDGq
	 2YhWvpusdXK5iRwLfDQ8YGSQjLtQY6Ti1Vq75C4fMTJImccrsk8+unrPdjcHYw0mTZ
	 XnSXDXqBf0EgmGKXkn6p+ua8ow7FjeVske0g0qyfNHMZLIuj49X2ZsFZvGyuMEitgz
	 yKzOtCihDx5bw==
Date: Wed, 05 Nov 2025 11:31:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-tegra@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20251105160513.2638408-2-thierry.reding@gmail.com>
References: <20251105160513.2638408-1-thierry.reding@gmail.com>
 <20251105160513.2638408-2-thierry.reding@gmail.com>
Message-Id: <176236389129.1455984.6215917313928055462.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: memory: tegra: Document DBB clock for
 Tegra264


On Wed, 05 Nov 2025 17:05:11 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Accesses to external memory are routed through the data backbone (DBB)
> on Tegra264. A separate clock feeds this path and needs to be enabled
> whenever an IP block makes an access to external memory. The external
> memory controller driver is the best place to control this clock since
> it knows how many devices are actively accessing memory.
> 
> Document the presence of this clock on Tegra264 only.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../memory-controllers/nvidia,tegra186-mc.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dtb: memory-controller@2c00000 (nvidia,tegra186-mc): external-memory-controller@2c60000:clock-names: ['emc'] is too short
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dtb: memory-controller@2c00000 (nvidia,tegra186-mc): external-memory-controller@2c60000:clocks: [[4294967295, 58]] is too short
	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra186-mc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251105160513.2638408-2-thierry.reding@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

