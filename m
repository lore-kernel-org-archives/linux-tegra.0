Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAC3BCC4C;
	Wed, 17 Dec 2025 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967876; cv=none; b=cdSOrR1bgN+h83EcoF4fJfDhVSShoXn9HKvSKsP+1lmArS9een6sRS+fCZVS7r9xLLbb3TrE1Jo+THg1+nhYhcWpy2RKH8W34/fX7mlqJ/Zcz6EV5T/coybH3MwQ9midcEbqL02xaaJUukTpc9knSzEpq8i05xqi1RzoeJuO0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967876; c=relaxed/simple;
	bh=E9bX3EfZQy7A+FgAuoC5vQ970Fo1oE//50LrhAop3/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8XgCTR4W4nUco8WGuTAPO2w9IxVDobGkv3SOMC0vjfajn1huTF18W98K8lfk9WLWOziQ6hXUJVHKFCk/x3o9l1V22WSi7QMG1TuMQPZE3fNJDdAkkBSqTrD4U/iY1+IaLdSA97nlHm+8qVAS8/fR1X095vSjgwO2FkCwoSAjfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3LI2F1X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3LI2F1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A035C4CEFB;
	Wed, 17 Dec 2025 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967875;
	bh=E9bX3EfZQy7A+FgAuoC5vQ970Fo1oE//50LrhAop3/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3LI2F1XslGs8iYZ4WeyX9F3Q2ejfClD4BeTwgVp/ih5rQTszDcEISDrnsoDQ3mi+
	 b/Q9qcr6Qq/sh6WxWhUOiMMLFcRfpUn91N3s1dWJ2x9AJIE2itRLU9IdFu1mw6BWNU
	 UUWRho+eOxBr7bTlw4lObVwfC/ZpSfdDLWwjrqod7AGER5yr71y7TLcJA7L3lJazFH
	 udBskOPVw8ny+7/AbxLsVU76CQVtuwzPy0cWFZEqixDVCg0IVdXLin+cBMSvhpOqQU
	 0S9XyoMc+yJ9eU24Y65fAqFiaXS/l0kF4D7PfaNnmr6Fr75pyZux8ZSHkF1vXWbMpQ
	 /TH3g67OnB0uw==
Date: Wed, 17 Dec 2025 10:37:47 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sander Vanheule <sander@svanheule.net>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in
 tegra210_ahub
Message-ID: <7a9b88a0-7ede-4ff7-a59c-cf12a049cc56@sirena.org.uk>
References: <20251208052040.4025612-1-sheetal@nvidia.com>
 <176580711685.161056.2870238132964388874.b4-ty@kernel.org>
 <f2f81d3e-ac2d-4b24-b071-7beb4fb867e3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rUy8BBTjuPNQUvc5"
Content-Disposition: inline
In-Reply-To: <f2f81d3e-ac2d-4b24-b071-7beb4fb867e3@nvidia.com>
X-Cookie: To err is human, to moo bovine.


--rUy8BBTjuPNQUvc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 16, 2025 at 04:06:53PM +0530, Sheetal . wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> This patch is causing issues with the tegra AHUB driver. Could you please
> drop it, or should I send a revert?

As covered in the mail you are replying to:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

--rUy8BBTjuPNQUvc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlCh/sACgkQJNaLcl1U
h9C0EQgAhZ8Re/IXvbJ9mbwDwQ7IsYJLBRxnz3PzTNNl2Y01meuaWYYAA3mtmIm4
0FP2I5LiJ52dEr096h7zY6Su7QszNeTVsWzLdUVhwA8ASjAYx1uTLmYVBacLQsdJ
x1gnq6qyq0eDBQZYxN5dE5SnQO3mu7otqYpY35qoFD9QFkYOiMx1o4m1eSOFLz1x
E5GOYrWp9eKeQqBaDnZ+G8j9X2b1gKelHiaW+qDh0z0RjxDpZUVz+YtjNRgtCPtp
Az17tuTOGda/wNrtdwbCKwNBYHJvcbYgeEtsPvIKJYjDVLnu+56DCLMG/w0WghnQ
iyTqlHnpxvW8108kmICWFlI+mknNEA==
=Acb2
-----END PGP SIGNATURE-----

--rUy8BBTjuPNQUvc5--
