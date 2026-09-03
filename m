Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160E4A2061;
	Thu,  3 Sep 2026 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456818; cv=none; b=Z0CtLtoCYgaDtvUPfgG+7pO7uW+IbSGlrSjvr47A14z7k0klIg7GRUixZYbsdZRCvlJPZKjbKltcUcUT4ftz7fZMdUuax7gJm7qnwq+Xy1qzqNUlniD1uQSW2ajD7mdmw1xUqdFLEOe4LjcMt5A6zB93c0GSqOWfNg3XNgh6TTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456818; c=relaxed/simple;
	bh=dZTg4lEeeVfr3iYJGZj9hD1lsuVFwpsYoPZrmXHTHV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRA1wSXq59YID1aXro/ogbesNrf5vL4qt6tstbEX/WAj5AuwwuaoZ/yqgBzSYqQgpesTBsPvTO8ygkmrhJuzykE2HXgKK8xmaaMeyjl7IDgTg3NBrJnJDHoSV3G8Yu+F6i7JaIVdse9O4pQvd/C0PMHsMtCWFA3L2UeNskFyoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwxWm5tc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwxWm5tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FA11F000E9;
	Thu,  3 Sep 2026 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456816;
	bh=dZTg4lEeeVfr3iYJGZj9hD1lsuVFwpsYoPZrmXHTHV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fwxWm5tcR7T7IHHtX4kIi9TSTTlwPEtxe2Uaj8uKEVR07ib2RxQNnWX1E26r9lRxY
	 RKa0/P5ZJitcnUIYcWIS8MEz7kJJSH0iB4pJkvKiloKo7haL+Vk3S3Dfwd2T29kPhs
	 WFi7YaHvUMaOG4LYwHoUy2CnMOnPE0HmdQ4AINMKVTR3ccxhxgKI6Zaezrm5RK4izI
	 LT50OLJHnLC7DKq35szVFIa074ayCfGQ82dO8uSBBs9gt2rM94OHGopx2cVlVUlUv3
	 ILg9aAImwEmAiEEp8+Ds9bLZQ2UxRQOoIiIDi3LmfOqOIZ9MkKR46Br08PQddq+1/5
	 t8CekbFWOuDwA==
Date: Thu, 3 Sep 2026 18:33:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/3] dt-bindings: usb: Add Tegra264 XUSB host support
Message-ID: <20260903-hypnosis-janitor-dfa1a86abd6e@spud>
References: <20260903074539.613220-1-waynec@nvidia.com>
 <20260903074539.613220-2-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rQpfFsAIg8Zu6yZ"
Content-Disposition: inline
In-Reply-To: <20260903074539.613220-2-waynec@nvidia.com>

--9rQpfFsAIg8Zu6yZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9rQpfFsAIg8Zu6yZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmvbAAKCRB4tDGHoIJi
0rUrAP9Cf2gMnIsdPYtBCWhGjY6oX6CO0S3TRd+c3Idr12badAD8C2F+5pi7oW6Q
0Dsv5Auq53kuGXs7f3qNkZRTuqJ/lQg=
=CMO0
-----END PGP SIGNATURE-----

--9rQpfFsAIg8Zu6yZ--
