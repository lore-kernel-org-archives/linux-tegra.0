Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACE480336;
	Mon,  5 Oct 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207013; cv=none; b=a+5PIyGeVlh1HYfUar9OOgD6X8uKC9E5bU8yET+1PziLJMYttrJf731HWZMrv74QjzbhBCwnpR0fTQXEHv9oq4B3nni18rcibextmQmmJlt2seVe54HretrV4vHgcHFHzuZVx0oISrw7tx7HDD9FRmkKA8e7Q6RkAURLTZCZ1Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207013; c=relaxed/simple;
	bh=r23uk5fhjo/rntXKdsCfnicMGedrobwGeWB638ZZ8Sk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TkN3rWawj/z27nMtQna3RGg3gae1qA38ZtVbsxEbCdy4eBapJH4KpfK1rDMhfp9D78FxT8iMcAri77D5yJYsVCwSg0re1SeRZWDX2gLymtTe3G8kGxeQgPzul5KpcZNs+awEOyDT5AqV/DwzfjhZaVLH3vOG0pRSEBq69PxKH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKBb2mCI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKBb2mCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F7F1F00899;
	Mon,  5 Oct 2026 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207009;
	bh=JIiq+/90VCXi0iZJ9YrPZ2Fc0DkQlo0PQTnFhrJEQEY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hKBb2mCIxTkUQaihj33bnpib/5DlJHP/c2mCUmpDA0DE+QdKfyU7wUqsqtmu6OVZx
	 s+bxiA6G/MWUcrU4svehLkmDbV2DQev4Qvt75agrC1QumbQ2+/yDswzUC5hvI0RN0v
	 rbMEFDRVl+juG3Jtwz/6JMvN5JWo+c7Eio3Xchpdczhe/AT329eJ6HHkVY1a/U6Ah4
	 7BR0oCHs6kfcy2Fw9SOeRy1xEeTesC4zat2RdZTv3CEeQstV5++POW56LAxUwez8wW
	 hyrsrHbpoI6/k14N6f9MToIMGvjnlVEdQs+NgL4JybXFrXFPZVvP9UPB6yh6HoXiC7
	 v1OSM6eazex/A==
Date: Mon, 05 Oct 2026 08:30:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20261004163114.181800-4-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
 <20261004163114.181800-4-clamor95@gmail.com>
Message-Id: <179120692660.84836.6687045443264440808.robh@kernel.org>
Subject: Re: [PATCH v2 3/7] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface


On Sun, 04 Oct 2026 19:31:10 +0300, Svyatoslav Ryhel wrote:
> Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> Tegra20/30 SoCs display controller.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra-dbi.yaml       | 143 ++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-dc.yaml      |   3 +
>  2 files changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.example.dtb: /example-0/dc@54200000/dbi/panel: failed to match any schema with compatible: ['hit,tx10d07vm0baa']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261004163114.181800-4-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

