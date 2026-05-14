Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9F346E60;
	Thu, 14 May 2026 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782258; cv=none; b=Bm6ufZDKJdsgNtLoAfAkOzAOpZdPs5vnDktsJWOQ/PDxR6U7k+ir/rVGajBg5AIg7KNqL9TwLE9TuGHmslJqfSu0Y6r01fMelcshuxw3jrnzIL+CejvnfU72N7ORUKbxQw0pFeVg93UQd9WJptYhl9fP4FEqcWYNUS3Z5xkiWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782258; c=relaxed/simple;
	bh=pXB7gvkMrq8uaqboYD6QkHzg968yxGg94Mk5cRIwvcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6zy9G9lIGHtPLo34PMLFGi6paUgjs5II34tXbddonkb1AXwg5fyG+Q/cekjikdBcpYk5y3Nf26QOaJCkuY8VfoQg/tE5I88EGV9nU8GMq4d/QVzvRWnv26x/lCVGUP1UuZDkmmUQNgpROsDD1Tth2uXEkIai1RqixKqDuQ6p84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1ibrMER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1ibrMER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC49C2BCB3;
	Thu, 14 May 2026 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782257;
	bh=pXB7gvkMrq8uaqboYD6QkHzg968yxGg94Mk5cRIwvcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1ibrMERd1kdJFeozYDWh9bQWWpffzhPf5y1335qRmA217In7WbsZo9IaoJZ/J5I9
	 7x+i31JVxsjQfMrw4OCQ3ZlsLEljBfleuWhJonERQ/ntg+sT886G4qFykE7SGIQ5IY
	 +evmmsvWBA1rG/EduQW2uqj/T6Ivtq+gznYT2EVrOqfaggPq+kGRFndJlEO66Q5HDn
	 6fPbLncoIq71hY8/HWfss/+yQuxkm6UGBS3osz9qQ+QUI5UBBGvHTeqDCLRLCI5O/D
	 nLYcyiyojxNwsxjGFB4rh41Q0nCLxJLKSAuLkWGAaBbtFdFCvek24cSDa9+iA3p6Xe
	 7iVpFc9gVtxPg==
Date: Thu, 14 May 2026 19:10:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: tegra: pmc: Add Tegra238 compatible
Message-ID: <20260514-shadow-motto-c01032b002a4@spud>
References: <20260514124856.108606-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bDYP720XtDu9eVUT"
Content-Disposition: inline
In-Reply-To: <20260514124856.108606-1-pshete@nvidia.com>


--bDYP720XtDu9eVUT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bDYP720XtDu9eVUT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYQLQAKCRB4tDGHoIJi
0vRiAQDnHqZBv2S+0n8nFOch0O4TcGGUI/I08MKU3SpvzuHDnAD9G4QCEZm/Nj0U
eWL9saiXpf+Z/3LCvKeQFmva5h9GWQw=
=Bpaq
-----END PGP SIGNATURE-----

--bDYP720XtDu9eVUT--
