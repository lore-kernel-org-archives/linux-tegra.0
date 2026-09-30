Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3D4915B9;
	Wed, 30 Sep 2026 11:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769072; cv=none; b=iUuwE+oPCrFpLqphS0mlHcEBuF6NjYYYHcCW8jYV97LJ5UEq/DK/Ov/9IwkGReldOlXJRs6e/32Oiv5/ZufIrGXl6EYxAI9BUTct7bdkozNAYzGXPdapCEypkAoEPSfxuG2aPQtcWBdWzNAn/Rseyo5lBr61QfeQMI1n/1qewnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769072; c=relaxed/simple;
	bh=PVEC3OfMnJKPSbEYEJhCCXJZBxEy7N52ccDh76wrJpI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GWhMPkAeLWiezNn4MEgtOykxw278G8ZcPxpuBrMPPlsRIM2aGzIjLdA/yD7O1R7j00Astuy+BsVgPtELqEihN6+MSVFJTVqlP3pkgbwMus8rC2xVmUGuO5Elk3mulQrS/SFW8wb0He7fC2Itau6Dr8paF32UWORWT2vxsoC/iOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6TAJnvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6TAJnvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A561F00893;
	Wed, 30 Sep 2026 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769070;
	bh=MsKu2QvMYXznsid/PbO/r1U6EfT+lLwdNFVx4O4bgtQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=h6TAJnvg38T8ZGN/EIwoqqtBiFlnbXRa0lWOxh6p0B5Rpz4tK31to/oI6kFWQvxI1
	 v6f6jmZWVdVISWWG2sdyxHsdlXI8u1jmO7xF0C8AbqEw6fmEoltjsZVihxBMBrqjUh
	 2TTDD6DxikCq1b84Xpl5Vyv0FgPg/pqf4alQr5pFh0W6KNJNy1i5nuc2d1aZgnlduQ
	 SXZLrAvrmCfIeg/deQ2TB6tMN+IxBn0Rd8cw9C/hoMXqRQLR2Bf59fMJRKNIbNk9dB
	 +wkoGu+0eHOOzpw3kxLyDo4mxXj9pA/bd5yqIvh+1v7Nm4rvIH6LBxC5I5DpheZEN5
	 XFJkNcwN4s4pA==
Date: Wed, 30 Sep 2026 06:51:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Conor Dooley <conor+dt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260930070535.47130-4-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-4-clamor95@gmail.com>
Message-Id: <179076815642.2155434.13248975463672729099.robh@kernel.org>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface


On Wed, 30 Sep 2026 10:05:32 +0300, Svyatoslav Ryhel wrote:
> Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> Tegra20/30 SoCs display controller.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit-cpu.example.dtb: /example-0/dbi-bridge/panel: failed to match any schema with compatible: ['hit,tx10d07vm0baa']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260930070535.47130-4-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

