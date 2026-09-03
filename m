Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1487049E5D3;
	Thu,  3 Sep 2026 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456855; cv=none; b=ktdRjoJ6jVB1a1TCBeqxXttdd6smeb2tHwio9g3f30in8oXbZOXN78QNPav5ZenLtTen0lT2vgbp/zrBxj2Th9L1Dd8YTM/YYN+APuJIkV6axzb7xb/vjEyQxe2C+dE05lWXhByT9XTfMbnd65uzUqg31dfofouOrQ6IXw/I858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456855; c=relaxed/simple;
	bh=NYpQHrjsJvf8pKVE2GpTexSixvlMtoy3aWduLWczkEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYCihXmkMFgol69Zyubg1S1FUF94thsbh543noShZwQNuaquQu/Ak3NsPPppOrSkWLD16ZAbYwAxOoaWHVNmzuIGVf5dJ0u/Gvo2jkf6hCNo1gjpTOiks2pVRgrIJA5PQjD+wjFo2hvDiIif/j/SS76Sq492bheDgNZESfDnpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFdoaqnL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFdoaqnL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927221F000E9;
	Thu,  3 Sep 2026 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456853;
	bh=NYpQHrjsJvf8pKVE2GpTexSixvlMtoy3aWduLWczkEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WFdoaqnLUk3HaTNd6HUuFF5+QP+sJz0ubZrssMmxLDDY7LE6BAcf6NtBJdBk4FuKm
	 0EEDjzWb+nc6WMLy8y7RRKQa+rNq0Eu55R8XKibH0kHLyyGZcTILD84W0U0bnlXWSu
	 pNnG6M/lgKehxsFqo7DDW0l6TRenm005mDLoYD/Z9S93nrwIi/ymLsKLdSxepzjHpM
	 qQ6BZdnivOqpFK8yQalLTMNh2wBFrOGlDltNkM/qgYUhgBk2s1GP0JU5Z9rysf5sb2
	 sELq7qRhTse7++FUySRdpcvQePQzrzAU/hrwpMHBEplymY1D/K4cQGyk9TSf5VJqVo
	 gIENVLIxytCsA==
Date: Thu, 3 Sep 2026 18:34:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/4] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Message-ID: <20260903-autism-tranquil-15dd67d9cd2a@spud>
References: <20260903071937.533646-1-waynec@nvidia.com>
 <20260903071937.533646-2-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q9uhrpU5IRC6OFsn"
Content-Disposition: inline
In-Reply-To: <20260903071937.533646-2-waynec@nvidia.com>

--q9uhrpU5IRC6OFsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--q9uhrpU5IRC6OFsn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmvkAAKCRB4tDGHoIJi
0jD5AP0a6bqiLXcYQNaN8CsxuVSiDNsddxuqqt1yA1S2qLMJjAD8CCRYlaWXwDgV
ff5GEGbWl5rKWquWipeLRs/ydPo6eg4=
=EvH+
-----END PGP SIGNATURE-----

--q9uhrpU5IRC6OFsn--
