Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C949365C;
	Fri, 18 Sep 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758526; cv=none; b=B7bvRt5btYJ15ymmMIzpP6mRoTVJhPbvF50dUOilA+EkOo0hDVDwXKN4jLnxO6zk2Zk+MvnpIyH1fDoNjAIlMXfmereOFeQqHgpckCHDyAqjA+Gz4lyZnzGkcLHlA52Y5Qm/6yEj0MxPhO1aVmAsOnym0/dmaxKviXJn9P2tMHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758526; c=relaxed/simple;
	bh=vI+TF9dVX8+RcMZILkOobu5dRaDpbLMEirHg2VF5u3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+MXepVcEPVaq5qOEi5tIZCeNQ9v4N5npCoFwDVnY484EpaFYpXoTKjn+dnyxsJAhMLb+HZVD1NoGYLKuGiBkfFDJNhKIE4plxDgLfqMuvtyzI3/zSjOvEvQexAOISynVso0nVPWunynRp8VmXlUgSZwHwA2kSvAeasp44IwnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYaa25a2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYaa25a2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E21F1F000FF;
	Fri, 18 Sep 2026 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758517;
	bh=HWRmnHQMovxcKFotbAleN5uJtk69/2HddGt39ADECss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CYaa25a2AlxVZQUM8ycEBhvuqlJM05/D6Svs3yvM9Akx7OWMuYMrQQBs3ooZ/+BVs
	 fX7dPOLCp/CJ4Ef+CC78YHjCYoRjyD1m2iwLMZ9Utb2/oOa3XUcks9R0XSnhb4exIY
	 Rj1DdVAMc8tscZd1VxsR6/+2fnpOSkXSI3WQUrbLt9V0F2xtU9RDMbbjsEvO/eAm5X
	 AfbqLi5aKeFx7vx7QEzLNcOqKJOVeleFvOWlZcTbtmIgdHFodoWnVTfe3rU2Qeun/j
	 ibhNRJB0UefURBR2/L4jpz1uYC0ZCFUAeBnEcQ5kLdBKQF8q/I4s+zUFaYyylwN/YK
	 eGbSLSGvDD0Rg==
Date: Fri, 18 Sep 2026 14:08:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org,
	simona.toaca@nxp.com, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, daniel.baluta@gmail.com,
	goledhruva@gmail.com, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to
 DT schema
Message-ID: <178975851483.1443252.7885513556008901807.robh@kernel.org>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>


On Wed, 16 Sep 2026 18:41:29 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments tps6586x regulator binding from text to DT
> schema. Reference to nvidia,tegra-regulators-coupling in child regulator
> nodes.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
>  .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
>  2 files changed, 196 insertions(+), 135 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

