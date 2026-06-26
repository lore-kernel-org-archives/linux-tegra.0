Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD32F3C19;
	Fri, 26 Jun 2026 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488208; cv=none; b=dtjmBW5W5DkKtXH1+11Qgn1Vw62rA1Am5FDovVD4BziLWvE26OAgzOYwkGVFqMspT4HFdOZOWk+88OG6qBkBfsCuSSKA3SGmR6+Ww4cJTJ6kvQPyK5Z8iU2QTD9neXNTcMBA88BO4pPgBnzRH049VEF95OUEfgPi0vDPrW57nV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488208; c=relaxed/simple;
	bh=62mB4Rf7rGoMMJhEEyJqd2qXM2uJ1hue8C5YaLlYn8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKx9yNJ50YolK/yHpRbOMegw5/7X0ZGd+GN6VCuGzbsXQz0riDttngekUy8R+yF91zAsT1I989R6sOFEhAmOaO4nGRs4wy8EgN8/AF3rXtaDbAUnWaA8+hX1hCxb+q/bxGgbeE53TNbLjbPwF29pK2PsLVA0uIT1kfkaA4vkmgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNxkCNqh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNxkCNqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D731F000E9;
	Fri, 26 Jun 2026 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782488207;
	bh=62mB4Rf7rGoMMJhEEyJqd2qXM2uJ1hue8C5YaLlYn8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNxkCNqhkFlxTaC2AKSYrjBO4VYQnOOA38JxDiyQyZ6Fm9AGNcXeMHk8gjQeadxGB
	 x2GK+kirRX5heqRwDvagUH1tSs1MlY3vaocMk1Oqev9bBGzT4L2ZfWmb7QpFLlQ4yj
	 yI3UzGwJz8SG0h0E4CsU3r3G+CgaiQ6p1OAvKoyC6WDDReiCwrw/sCkJd1DoZJgjZO
	 rxOWa0a4Q6f9lPoU/P8Z/Kjyg0a3wHz9FzrowR+wbZiJOuYO0j9eHfgl/4hIDVJExy
	 NmBcy9iCI4ulJBXRPN88L9rPfc8QiOH49RWV6N2YGW5EpwAMKiq6r/TnWWuKQtb83w
	 DSy92msmkQRQQ==
Date: Fri, 26 Jun 2026 16:36:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiqi Li <lijq9@lenovo.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	mpearson-lenovo@squebb.ca
Subject: Re: [PATCH 1/2] dt-bindings: arm: tegra: Add lenovo,thinkedge-se70
 compatible string
Message-ID: <20260626-cartoon-splice-59704e8ca9c5@spud>
References: <20260626105625.600156-1-lijq9@lenovo.com>
 <20260626105625.600156-2-lijq9@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cqHS+6gAc2oW++dh"
Content-Disposition: inline
In-Reply-To: <20260626105625.600156-2-lijq9@lenovo.com>


--cqHS+6gAc2oW++dh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--cqHS+6gAc2oW++dh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6ciwAKCRB4tDGHoIJi
0rTwAQCLbcqvllYTQbGdCCnn6NyySU+DKoU+vEb8UIsKe3Br+wEA2W8lxQajBnGJ
zPq0cWQZfgWt3EawwK0Sm9XIlfqQQAU=
=rkGN
-----END PGP SIGNATURE-----

--cqHS+6gAc2oW++dh--
