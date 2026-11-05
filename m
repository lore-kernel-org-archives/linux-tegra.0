Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919507;
	b=0M8+i8RUQVNNEEo67JYW/cLneIv4oCbJUpY+TYbFj6yBGeoK9dOXM8D1d3VL9m7w9Hn9
	 EQdmzL3Oiz8cDr/8TPOYckFwnDjiuPa44wC/Uj26gkmN8tUJEGhG6f3Emr+N3Q4DajKVg
	 kJH4jAz+prZGRPhSUxjta57jg8Rj7yWOeuSNON3nT0wyjdIO7U/vxXztqfzB7WIElqTFI
	 Y5xmhnnHdMPiVeAxOhVlo1g3eYPSBHQkQ0UeZ8Ti34nyjq7CslZFKTwJqv0Lo4qUW6orf
	 mrWcG13cxbO25hJlYxdQmSazZtUFXOsGYyUMwxL9N08M1uwXpEqiMUpk1GZUNwFYyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919507;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=tAeSYJKxv49Um8YvczKpMyCnEqXgAVDRGgOKsRK/LrI=;
	b=m1JE+Py1aixn1sJ50IwGrODE9BfeDGD9Wr3PzoAWoDawriVhX12+YTkwRWCHkA80UHQC
	 dQ4KC2pKic1VLxZvwdKGUrrUYmXIywrhodj1/82K7Lw9xDgTtNTFdAnNOWNv9m/Kj37lu
	 UNQ4tSOpFia7GH1rhCJOnI4lSsORuj2nLLVB5x+9qvw6uPohbxp+aNCWzjFG5aDxMNG0O
	 1F8yirexLrzxbSr8Go0s+ZZgpQp7FGPG7E6rF3XC3UqMf2Dae90PcqLEIT2jcIKiup5JP
	 /X71Ohl9M0AOznpAt1PyawxPWKq+zG3FrWA9rzmuaFuFXZFGJYbvU7E0htYecyYRDsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgxAofaN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB58606A31B;
	Thu,  5 Nov 2026 22:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgxAofaN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5707D1F0089F;
	Thu,  5 Nov 2026 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919506;
	bh=tAeSYJKxv49Um8YvczKpMyCnEqXgAVDRGgOKsRK/LrI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=KgxAofaNpa26Q+CnGGNaQb47+2HxNekzMYJb/WbMGKCE4E2RE1WXFHWJQQKESatbY
	 e+4JYe9yPAMopLt4Q4R8Ik9D0F1KGwX+m8TTUDDuEg0O3lZFIErEgCvolp6at+enHw
	 yOAaWONE0zQLlLchjRPaD5yGqYv5iB7MQoP+H5uLCdP5wI5LMLxgsdcS/bzFjnXcCp
	 sMaR9U2+5/O1YuU+5i4NGp6aEqsnc8//2PLn1KZkTWfl3OTuRP5A7MUMPq0R3z5SDB
	 aBVxMITnOI4Xcq1qZ6c4X8UM0jp8UrwsLOgAQTuoU+6xvhz6Hygb+jkiCy/qsJc5Wv
	 csG0qUXkK9xEw==
Date: Thu, 05 Nov 2026 16:58:23 -0600
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org, 
 Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20261105140510.165165-10-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-10-clamor95@gmail.com>
Message-Id: <179391948182.1745061.4582577989237353337.robh@kernel.org>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit
 CPU parallel interface


On Thu, 05 Nov 2026 16:05:09 +0200, Svyatoslav Ryhel wrote:
> Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> Tegra20/30 SoCs display controller.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.example.dtb: /example-0/dc@54200000/dbi@0/panel: failed to match any schema with compatible: ['hit,tx10d07vm0baa']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261105140510.165165-10-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

