Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509165;
	b=UW8+4mlaLvfbccZaZUJkynA78zlEIEwwtbWOd0KdR6NSfJh9tQCtk2ciNyNAUZzLI4b6
	 CXVBO6PnMBT9GfUc96cgsanWVvc5aCOAOIrqEsfOPSpA8eXO/SMAqQ6yeHR2lI8Xr4F/c
	 a3mbDeC5EbUT+kmWhAAA1spjW7ham/X6VyLsOs0Xq9G6J2vD6Z4QftABJio+ckiJGK4gj
	 O+ixcYx5z+gleBQjad1VKLsgYvfNOINHdZzjW9Ym7xeSphIHYICFOOiudY/jrbuF+mF3N
	 JPCDHTxjxLpquN1ovKVO20y8TSanyrcCr89UWnmLWF9cUkwKNw/pk+H6JTTUDpq+1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509165;
	h=Received:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=icmdR51+Ir0zQ+jZQcpa/uVGmHPKZxVQjpIju4FRHr8=;
	b=UBBtWm2dMsIu1dDO/vKnaYtsAvGkLFEHXif1SJ8PIgbddCmKskZjoU6H4bKsjyGoZdRu
	 ctUPGW4YtVoUL7QVvQ9andVS4SDuRvf5ufnuNdpd9BosoUuNicqtH1XKn7cmrLKqgEyku
	 yq6gCC4afnlNFiJ0JOgQO+0tiLJZDr8ogwWvPcvl0WLDS1GwRDDJLLX+vol89p8UHcm4f
	 om+O61xw32cuHR5c4Kn55z7ARbDlFmywbBs+x0bwhET6zHbUzp7WddkoSCu1Jp8ZOgwVS
	 7eaG8ja8BPPF1mZzdgsspXHVrVIsMC+GNEGATyju/XKLUvgh0m2kvH40nAGRllH7PCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60276606A31A;
	Tue, 20 Oct 2026 15:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081971F000C4;
	Tue, 20 Oct 2026 15:12:44 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:12:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thierry Reding <thierry.reding@kernel.org>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20261019095705.91062-4-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
 <20261019095705.91062-4-clamor95@gmail.com>
Message-Id: <179250894267.3309780.15694845491721120765.robh@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface


On Mon, 19 Oct 2026 12:57:01 +0300, Svyatoslav Ryhel wrote:
> Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> Tegra20/30 SoCs display controller.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra-dbi.yaml       | 138 ++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-dc.yaml      |  15 ++
>  2 files changed, 153 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/tegra/nvidia,tegra-dbi.example.dtb: /example-0/dbi/panel: failed to match any schema with compatible: ['hit,tx10d07vm0baa']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261019095705.91062-4-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

