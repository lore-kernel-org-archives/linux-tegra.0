Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6CE368D59;
	Tue, 30 Jun 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834164; cv=none; b=i0hR+uaHCLKFXDThzlv62mmOh4wvb8sl59p1tiHrF3E3ope+SLm3o2VVbUco2fbAerQmSaajK8lPi0AcSHGoSIKtsqymYvqZLd7QQTpUv3jzgkJq8+au8LIHoUN9newdc5Di7t8Xsbag1c7yDtscn4PiOmWq9jK6a21MPLrahmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834164; c=relaxed/simple;
	bh=aG1/3HIetHlFe8/byJ8wEJTkXGyN3Z5AAsWiCtDTky8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js6xIVBL9Bjk4ExNJ/Uo0hPjdMiflqpRavdtOoKPB/LMxODumVPGsZJrrWALR4zO5yScN6eoFRlr0Dv8aR4z8eyucjSjO6mjVH9PEGIBo2h7waiWGvX78aR5Y9u0QU4gdJDslvT4CU4a0OBaomEMeidbyFVIRRD0/zC068Nf7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTxcA1I7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTxcA1I7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395241F000E9;
	Tue, 30 Jun 2026 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834163;
	bh=MNzdmtI26hhlgis7iHvjkaKObdLefwf2TLs7oUsZvRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UTxcA1I7SlQKZVmYpdr00uTW4atY24KujaYv/R9BnjWUPKPHpwU9Ol6Wg0SxITd9r
	 J509agtZkTWZzP5XZD3xrMiEQmNFUo9v1vk/DCwvSPsOhGe5IM/zEXtg1BZ+EDLZZ3
	 EDCjKGltIAsxUgXBma/vlIVm50sfGoG1+7NSG+QXprcTdRCHiXYyoWBYWOWR/J4bK8
	 IZv1o+DJFoaAGXviJvBxDSLQOy8s7PRIGo+PPi1+KD3i4oWJ7gOFHBzGCPtaYh38xq
	 tCfpzSnX3eotaM8T4vhs8vxc+m9gvkZ+2nQ/fUNVY/gGz/tBGmiGEO01+jk6joH67l
	 zKTunZlw9D7Ow==
Date: Tue, 30 Jun 2026 10:42:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: tegra: Changes to support
 Tegra264
Message-ID: <178283416214.3689764.9700887048944091225.robh@kernel.org>
References: <20260622-t264-host1x-v2-0-ff7364d9ff7b@nvidia.com>
 <20260622-t264-host1x-v2-1-ff7364d9ff7b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-t264-host1x-v2-1-ff7364d9ff7b@nvidia.com>


On Mon, 22 Jun 2026 15:57:38 +0900, Mikko Perttunen wrote:
> Add nvidia,tegra264-host1x compatible string. The Tegra264 host1x is
> similar to Tegra234, but with a different set of engines and layout.
> 
> The engine register range is no longer continuous, so two range entries
> are also needed.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.yaml         | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

