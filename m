Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FED329E6D;
	Tue, 10 Feb 2026 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730511; cv=none; b=uE5facQgNXgmL0ut7ycY0MFMVrkiDsjsm7gDOSzbYV7TWqk9qBAgO8rz42dO3/ToeYRBy7uRYtcOEyuRpbCXuVuA/2VN0+BfT5NFLeUmG/km49NIlyV/bwchNGweFoQx5DlOp9mqgfnAhaRYMX9BwdKC9BU6I8eYac0AIZ045BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730511; c=relaxed/simple;
	bh=iI8cJtald+cfXv682SCLdFFYI4/mbyQwgbte4z4GTJI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PAlb0gN24cZ1o7cRmzz3NaNUdU9IebKuY8HGe+hs/HRNQ0gz3wmRnmVttDt5dl/8ebMk+/coEcls/wMobNBqffnrV3kCgupq4MkP+H2nl3S8SbUBLbAxGBLbXiSGBVwJEDESlI2JCbk3pSNuPO86UtbQ3ZvTwWTn9VTY0G1J0uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo5mszaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo5mszaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15374C116C6;
	Tue, 10 Feb 2026 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730511;
	bh=iI8cJtald+cfXv682SCLdFFYI4/mbyQwgbte4z4GTJI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Jo5mszaEiP2SVKvvb3eHyau3WCTQezfaWYJwWnYSOBM8K4yJ1ivsKWqNHaKWIkl/B
	 5iW9glYy6jFDX1/+WGusEKWzfuXDloV9LdnnILhaboDqDd5f25Bqnp36tuZMEHhATo
	 Z7kni7nK78Hhq0ER5gQMTc/w/xl+t5pDtGru8qGWelFLiC/aMeWcm0unGXzs2PcAC1
	 zfYsjyZ11lRGCQKc0vRY3eYF9rvMB1Esl4kP2nGaywLS6YbxKfRc4CXzqyYjZMAL24
	 oyrjlhBPcTgOGzNpyNuqH4wbN6P1LNVP19J+P4m/0Aq0pqCHLwbGuA6v/2a14vnvWp
	 MWH1ryVt1g4EQ==
Date: Tue, 10 Feb 2026 07:35:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260210094908.14276-2-clamor95@gmail.com>
References: <20260210094908.14276-1-clamor95@gmail.com>
 <20260210094908.14276-2-clamor95@gmail.com>
Message-Id: <177073050919.2585793.5681591467415217402.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20
 HDMI port


On Tue, 10 Feb 2026 11:49:07 +0200, Svyatoslav Ryhel wrote:
> Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml:107:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml:110:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260210094908.14276-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

