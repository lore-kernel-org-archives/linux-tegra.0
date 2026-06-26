Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAA3ED3A7;
	Fri, 26 Jun 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469300; cv=none; b=fZoGa2pDAYbIb2NoW+6+vYuhkZLXVc/zwwVLY2tbwMyWlaz8oP0KRCPw5Sk96UrX2JdwHIgqNrFGfVTTHVye4dygLeh1wUu2cK5eAf19gil95GxAaQbQ5uZgsKxPpZOBcFyGP33i1sJl8U9NDltm1BN0wjVCANMW3iVmd4v29+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469300; c=relaxed/simple;
	bh=YzX/MLAta5+or8FOVzZwpdDah+/ccMdWjuTIgvsyxos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSS/4q/rLD+3xeMstmMnru0Jl78IJTZwr0Smxq5PWrPmnSaDeFxL0n1X2L1U3w3r0xMHKI1bYBNprNbfZFJxB0bnvQxv4ZXPCMLjK7Rv0aSO425PcMrgQ69/BswQQBXcUo6GdndgtH1gmKEzzgUsKCwjbjxdiITfmIkf1AaiSEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jby4GSSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jby4GSSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BEB1F000E9;
	Fri, 26 Jun 2026 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469299;
	bh=YzX/MLAta5+or8FOVzZwpdDah+/ccMdWjuTIgvsyxos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jby4GSSLB3FQDlGlwLgAbSFvKzA84V2ayaAzuo4FElROdQkFtzmg9+xj7HfktefBd
	 A3Ag69eHgHl59FZNUjUDQgXF2ya0XmU5X/peuZWK5CnsBMetj4Tbk1avoaC/gxQECj
	 yHVV2+Fj2qem8RNVtN0/Cg4FFhIRAOmdDFdx5+OROMwh166qy58kv6Ad1z0u7RdZvn
	 mEAOeMtkQCBoPwrg/h6QHGcBWYslYbEM/nC7Ddkpgj40ZG+/J0zo88ahI/iRIe77HY
	 QxEDo7ZMOE65bF+2tl/fEUzJ3/2Jrfk8DR3rYmQfAGH3kKMA4aVUJjareuS7FmcJoR
	 9YtGaj1aLYs4Q==
Date: Fri, 26 Jun 2026 12:21:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: tegra: Make non-vm registers
 optional
Message-ID: <20260626-unnatural-thick-iguana-88ab9e@quoll>
References: <20260622-host1x-nohv-v1-0-65bc682a617f@nvidia.com>
 <20260622-host1x-nohv-v1-1-65bc682a617f@nvidia.com>
 <20260625-hospitable-antelope-of-diversity-f3456d@quoll>
 <NWz2vh3HRYqBDySgTFAF_g@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <NWz2vh3HRYqBDySgTFAF_g@nvidia.com>

On Thu, Jun 25, 2026 at 06:17:39PM +0900, Mikko Perttunen wrote:
> On Thursday, June 25, 2026 5:34=E2=80=AFPM Krzysztof Kozlowski wrote:
> > On Mon, Jun 22, 2026 at 05:22:50PM +0900, Mikko Perttunen wrote:
> > > Host1x can be used without accessing the hypervisor or common
> > > registers. Adjust the bindings to make them optional.
> >=20
> > You still have these registers in the hardware, so it is not optional,
> > not flexible. IOW, DTS represents the view of real hardware for the
> > software, and that hardware still has this address space regardless if
> > OS should use it or not.
> >=20
> > Otherwise you need to provide better background here.
> >=20
> > Best regards,
> > Krzysztof
> >=20
> >=20
>=20
> The intent is that the vm-only version is used in situations where the
> other register regions are not available to software. Typically that
> means running as a virtual machine, and the hypervisor owns the non-vm
> register regions and doesn't pass them to the guest.
>=20
> Since the guest runs under the hypervisor, its view of 'real hardware'
> is what the hypervisor is exposing to it -- in this case with just the
> "vm" register region.
>=20
> I'll add further explanation along above lines to the commit message
> if you're OK with it.

Yeah, it's fine. Please extend the commit msg to make it more obvious.

Best regards,
Krzysztof

