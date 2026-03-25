Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485273B6342;
	Wed, 25 Mar 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434674; cv=none; b=CjJ5CCYnoqMIrEvR+p6uXFHVL5fCu2FBYo7d1+tMdPZOLuI7G3NmfVtZlA+0WeLtbvcgXwNSNdCLq0TfjmVwCDlB+IUzApVWuuSMOLImy2r3e/7a1vvlbVskPyI3PaJnnrakTA/Kzb50Xy04b77B41S5xdKDKD++q3cdl3Ubvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434674; c=relaxed/simple;
	bh=oJjXP7xdNnZ/BGIVuhLzu0MfsHL3XvKpMIM3SaBhYfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJTOnEZwmqOEOgrZ8ukUv2dAIsqrAxgZbQAuwJSnXdtgzOCzDygyYepIB+NSSGb2wEFB1hTcTGzjBZD96Tp3X+LqnSRtFyQMIL1Bkid8gYoCC6J34vwaQK6wgGvE9OFzu7J5s4ZTjsbKEbtGNzGAyRJIdTGvAOIzuaL7IuhLWPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNmggxTi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNmggxTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BABC4CEF7;
	Wed, 25 Mar 2026 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434673;
	bh=oJjXP7xdNnZ/BGIVuhLzu0MfsHL3XvKpMIM3SaBhYfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MNmggxTin7K/6W/4SAhXxVVhhDmcwZaEhsjbkFJHNe0FYCa7T9o4k6z1t2QuMcGmk
	 77wUYCQTFU54CIbmC1E+4JnJe/CDzVLutHSsNR3KlBsrlAzWiGVU8lz97OAW7eNgLn
	 ALBL9WqwNniCGj6bi5utGFCqQ5UN9ep5k6/6yd8ImitK/Xp8jlegDjw45EM29a+j4N
	 NkpbYmaW3cdXPPUHrBCkfPh+yfzQIXixAyYawvKhvA3/ia8HXrlMRm2a2qebz5JhoG
	 00Pfy1wr7CgjBofXbGUNLA4uZhJ9yqh+asjiB1txJ98jFVMPlNTrrfibDmL9NQ9Sr9
	 WARIuC86D6dCw==
Date: Wed, 25 Mar 2026 11:31:11 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank.Li@nxp.com, 
	acpica-devel@lists.linux.dev, alexandre.belloni@bootlin.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech, 
	jonathanh@nvidia.com, krzk+dt@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux@roeck-us.net, miquel.raynal@bootlin.com, 
	p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com, robh@kernel.org, 
	smangipudi@nvidia.com
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Message-ID: <acO4NKPDUayny-I4@orome>
References: <20260319-nano-manatee-of-vastness-fbafa1@quoll>
 <20260319170929.14543-1-akhilrajeev@nvidia.com>
 <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hefw7yhop4kz6jja"
Content-Disposition: inline
In-Reply-To: <67165a1f-9fa3-4853-b530-b1f9d6e4c2cf@kernel.org>


--hefw7yhop4kz6jja
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
MIME-Version: 1.0

On Thu, Mar 19, 2026 at 06:15:14PM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2026 18:09, Akhil R wrote:
> > On Thu, 19 Mar 2026 10:40:34 +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Mar 18, 2026 at 10:57:25PM +0530, Akhil R wrote:
> >>> Add I3C subsystem support, DesignWare I3C master controller, and
> >>> SPD5118 hwmon sensor as modules to the defconfig.
> >>
> >> Why? If there is no user of that, why would we want it? Your commit msg
> >> should explain that.
> >=20
> > Ack. This is for Tegra410 which has a DesignWare I3C host controller.
> > I will add this in the commit message.
>=20
> Board or products. Not SoCs.

Is this a new requirement? I see a bit of both in defconfig changes.
Some mention specific products, other mention SoCs. Does this
requirement apply to DT platforms or also ACPI platforms?

Thierry

--hefw7yhop4kz6jja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnDuWsACgkQ3SOs138+
s6GkJQ/+KHih7KGdwK8LUXDaRizPuwcIwvX5HHc3TOdKw2Gw/XtV+JaoI7c4wtx4
MvnJjhsHhu4zH+4SMnxqEzTP8jbxcV96L9WhQ+Zfurvs+4X+vZ0KsNXN7H+uTeOB
UKlf8JumnoVOs74dUSxIy4c9s2XoY/q6W/pBIguuczmMO/uyuUIIV7tiS+IAHVvG
V+ySkgCNZR+6XH9tyAdN5xTvt7K26KFKoPUgOEXzY7k1gPWCL297YdEoWAfaw0PR
7DxE9hn9z8DcflEbdkwLwD6z5wfJBgTPvZZgXNheyMv3Spr3lpmAOLFqW6a5QicG
HllawC3G+ShlLltKAbjxygCX87Wf6fmKKYT40da3GrEkex+GWfDsDYXK5hijGDas
2nxOZPvXBvQ8aV4Fx4kJHr0GmL6psv8VRVvDT1GWn3clzC7VBOzeMvf7cJBXImMv
uxr53vBDzVSuLNZbt2ZZu+teJREZG+pM4nxC3jPIgh2t2tXWDtfco9O9qUyJsK2Y
ibZ4l+p2uBzRu3cD3obBsHjnVLY79XEd6LN9RH6ZXNGn5t6PVHarP2gLW5hx5VI/
rc++EMVFU2qrO2fe+duASYGyQs+BS4u7u5S9j/jnjEO+Z7kZi4zPk9cnAZEZXSZl
tWV0O0BCLlbHYHHVrKTMZmT7Ay//JLt0uEEsogX+Cm7vH3z0U6M=
=cTw6
-----END PGP SIGNATURE-----

--hefw7yhop4kz6jja--
