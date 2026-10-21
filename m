Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553629;
	b=UjcrQIyo/vQcWER9+ialmgnNq9ofatrp/0RX/ra/rWvtMf9/Ye13auZTdHVbX8g1fCmz
	 pp4saZeXPbF+UJIs6gq8bSawkk/8E0JqDvVlr18YULr0fQdxWAj5D183UnJvFwyt09kYe
	 x9cbiN9zyvAYjdr/Kwu2v2r1btQZWkswlFKwm1sPwqz5PWVZlBS3SlInPN7q6meSYyJgt
	 ty3ct7k3mnFdkDlsSB5X/Em4Uwx4GIhFD8RfUubxvR+JWmMwuPAzwSzWdzZDCJXYdeAoG
	 V5Qg8pNUU0HHhIRTWWq38MMGt2qrhLfUEwqZsY2l6dUPufbmgLHJSux4TIwCHzz6+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553629;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h9uL3bUFmsFJ4jdYyY5J7tcbz3RUdrntjKEXNV+fUxA=;
	b=s9ilpiHdIdr++IbtI9npcduXQDQ2pugTuIs0e4vk+aoqDn7C9qjsYN/pByXlyhf6mPpt
	 FCTF5mi5ynKj0DLCZZnCarphMWS9WaOoPZWQY70RUpn57hRMuCG+BAMwYnhF2saB3wCzt
	 9E1A1297mx3+DNY/eCxD2ntXLCuLxdlnTZvUi9l7ecZSDM5Wu+6/2LKgtuMVJhdRVuLRw
	 hx2KuN/AVS9GL5NCJ0egCwOR9SBP5yDxFC2ufC8DqOdUo8w/tUCh0CzJ5fyRMV8W1LzQw
	 TnrwWbYLeWAhibC+seD4BI5RxXwvZPM/iYYKuHO2DPv6NmjMLnE2WU1uiWVjWDUmFWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsdgFKmY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41400606A31D;
	Wed, 21 Oct 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsdgFKmY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A22B1F000C9;
	Wed, 21 Oct 2026 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553628;
	bh=h9uL3bUFmsFJ4jdYyY5J7tcbz3RUdrntjKEXNV+fUxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsdgFKmYIr746vJb5AVItEQ4HIw3Om+dTG00YWvXTPXt3AWrNZkk/Sb2zITmOvGfV
	 7crUvAqQZPUu3MPS+Vkd+KrdqnnUEg3aq7vPNks1tSL0ZzigTgWzH04VdymlBbWoJI
	 xB3qyK1sl9d2mg5YvvN4jQkbqSEV8wMwNnDkAB8fRmlo7huI3VPJ2FTeXwjXLD8NMm
	 hWItyHlTEJI1E1r3j+5ug9gohOVVS6E2za9yPbvXgmZOMjvT7s88niSTE0AHKDwWuk
	 4DGNinyPVfLtr4N2At44NE0U7KakY9Oh0gwiqJD0mRPlwOPlM5/WnAgRPTI1T++8ON
	 TkYaH73gJeVIQ==
Date: Tue, 20 Oct 2026 22:33:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>, linux-tegra@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
Message-ID: <179255359778.4065508.6211892525325768326.robh@kernel.org>
References: <20261019095705.91062-1-clamor95@gmail.com>
 <20261019095705.91062-4-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019095705.91062-4-clamor95@gmail.com>


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

Reorder your patches to avoid the warnings.


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

