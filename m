Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61B43BDD0;
	Fri,  2 Oct 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927436; cv=none; b=OvBRL+NsUXakrEnRuxtoKLb4+1hgsIvey040azLbPJORkjB81Kx17E+74EKUX5Yd8/A/m+9FxveF2F22/+Qm8a3ia5KD/v213chQ9qafL5UYxjMQ4gc/5x7wxtPYwF0rA9KILQWAOMRT71sHh5VklroZmUh/YVeB7a/1RCZb8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927436; c=relaxed/simple;
	bh=ddZ/0Ika27klzKF3I+d/d7JLE2NqOUP4YHYyI3E85/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKdNO188MHPrZNiCyFAZzl0Ht3GmUIqbTyoQrCouVhQLn5Dgfl3Wz7hn/DMgXF6VJzgnHHz/PLr6gXnfj4MoJtTHfIHjSpm/CtpymzomQEVBfcSAjTG1U67zgxN+j5uldI7RGtoKVOQYHDBDu01A417YhgX5n1YTsAxP/5AE4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVw7lvMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVw7lvMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6F01F00893;
	Fri,  2 Oct 2026 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927435;
	bh=+Pc5nkrvJxxyhhPfWbKf32Vct+MxV8Z2P9Zl0wY1/k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gVw7lvMoGqVLws9vQal+E+SIdYRd8U/eI136EhycJtrNhAccjVkInfoBhm7Jb+Vdh
	 fNLRHZBdv6xRlI0etsNET9uk6Pw7rkKRHiXUfWeLmVu58i+GFxw5yhsijnjdKD0LLz
	 hPPL69QId6FDxroqWH6kQGdWskTBAO2vTAVpyLyOCfJUvKPijceyz3HlbqsvXBj9UO
	 PaAPZGVZB+9BDW9CvZxF4DC3jmgqxs8jgsFQWqvrFLks3lfy97yUIDphEdA+Ld4mGj
	 zOe2HSvaCAT9sznLF9wQ+Kw9HgDLKm095R2YdfLOuVnZVGLXZ6N+mg2Nf9fEW1hiVn
	 NNjWPO8mOLyNg==
Date: Fri, 2 Oct 2026 09:50:33 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
Message-ID: <ar9iNawW4HzCx19I@orome>
References: <20260929095915.2215685-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="enqzndaxjwx6gx6i"
Content-Disposition: inline
In-Reply-To: <20260929095915.2215685-1-anrao@nvidia.com>


--enqzndaxjwx6gx6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/5] firmware: tegra: bpmp: Add ACPI and MBWT support
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 09:59:10AM +0000, Aniruddha Rao wrote:
> This series adds ACPI support to the Tegra BPMP driver and support for
> Memory Bandwidth Throttler (MBWT) controls exposed by BPMP firmware of
> some Tegra platforms.
>=20
> The current BPMP driver depends on device tree bindings. This series
> keeps the existing DT path unchanged while adding an ACPI transport path
> for BPMP firmware requests.
>=20
> MBWT controls are accessed through BPMP firmware requests. This series
> defines the MBWT BPMP ABI, adds MBWT helper functions, and exposes a
> narrow sysfs interface when firmware reports support for the required
> MBWT requests.
>=20
> Aniruddha Rao (5):
>   firmware: tegra: bpmp: Move channel initialization to helper
>   firmware: tegra: bpmp: Add ACPI support
>   firmware: tegra: bpmp: Add the Memory Bandwidth Throttler ABI
>     definitions
>   firmware: tegra: bpmp: Add MBWT BPMP helpers
>   firmware: tegra: bpmp: Add MBWT sysfs interface
>=20
>  .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 ++
>  drivers/firmware/tegra/Makefile               |   1 +
>  drivers/firmware/tegra/bpmp-private.h         |  39 ++
>  drivers/firmware/tegra/bpmp-sysfs.c           | 207 +++++++++
>  drivers/firmware/tegra/bpmp-tegra186.c        |  14 +
>  drivers/firmware/tegra/bpmp-tegra210.c        |  13 +-
>  drivers/firmware/tegra/bpmp.c                 | 415 +++++++++++++++---
>  include/soc/tegra/bpmp-abi.h                  | 161 ++++++-
>  include/soc/tegra/bpmp.h                      |   2 +
>  9 files changed, 849 insertions(+), 51 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
>  create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c
>=20
> Changes since v4:
> - Move BPMP channel allocation and ping setup/teardown into the
>   SoC-specific init/deinit operations.
> - Add an optional init_providers operation for DT child and provider
>   registration after BPMP communication is established and the firmware
>   tag is read.
> - Add an ACPI BPMP init operation for the BMRQ ping path.
> - Remove ACPI-specific setup and teardown conditionals from the common
>   probe path.
> - Drop the redundant NULL check after device_get_match_data().
> - Explain the transport and provider initialization phases in the ACPI
>   support commit message.
> - Explain why DT registers an incoming MRQ_PING handler while ACPI only
>   sends an outgoing ping request.
> - Describe MBWT bandwidth groups and traffic types with platform data so
>   firmware instance and VC type values can vary between platforms.
> - Document the sysfs hierarchy using platform-defined bandwidth-group and
>   traffic-type names.
>=20
> Changes since v3:
> - Update the sysfs ABI Documentation date to September 2026 and target
>   release to 7.4.
>=20
> Changes since v2:
> - Rename the non-ACPI transfer helper to tegra_bpmp_transfer_channel().
> - Keep the common BPMP message validation in tegra_bpmp_transfer().
> - Remove duplicate message validation from the ACPI transfer helper.
> - Move the MBWT helpers near probe and document why they are needed.
> - Rename bpmp-tegra-sysfs.c to bpmp-sysfs.c.
>=20
> Changes since v1:
> - Dropped the SoC Kconfig patch.
> - Kept the existing DT path unchanged while adding ACPI support.
> - Reworked ACPI matching to avoid a dummy ops table.
> - Added explicit error handling for short ACPI BMRQ responses.
> - Folded MBWT helpers into bpmp.c.
> - Reworked MBWT sysfs into per-traffic bandwidth attributes.
> - Removed software bandwidth range checks.
> - Use NVCLINK consistently in commit messages and documentation.
> - Avoid platform-specific or transport-specific MBWT wording.

Applied, thanks.

Thierry

--enqzndaxjwx6gx6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/YkYACgkQ3SOs138+
s6F3bA//cq/B0PZhoRS+EnpJvSQ+cflJK29IKgYI27ueF0Mi07HmWAnDSemd4zUo
iHVE8N5ubqYpUcAPseqyCNjtsHsxklev5waJ+ZTwbuaq3ypClQ8zDCKh53lUtWVF
uM2fFidEo2hjBLQPQtgyTP2yo0VE3+Qx9OU7N9daK5hB5UA5eVFxZ16jVQYoP1d4
zRdMMeLau8euTIaBSgjs3b9Q1GS0m8fHFzaYHTih2xYupOc7ZlOFbBzORTnnyN56
BaC1fL4B4JFyGTPNVUJ7j4m8/e/MPlF0oHRNrg2/LGVCTn4JPHGSqOGf+oezVoEw
1DIjVT+4NpsjOWYN2cWy+2hjo4MmLBSdJlcQ/prqHtKBvk3I4SlFq3yWXxDpe3Ot
9KEtK0A+tQ7stLJAxS87DB8+6dlHzMFYf9B/B2/wJ5wDPmvSH3UTVVGG57o25HBP
C85OBti+M98rDn4r6xDTi3cOL4DaXvJSItj+JUtt5H6vPYKpsAruGd5HRLDmXS0e
OzK6UKoaoENqShMNexY+VPyMcvaoTG+bR6jG7bwrFLoNixebHe2ThejUy0TphAxy
fcdXRXnN1dC7n0eANzrPQe07fvM1rcbb+CShxJqxVp91Ym7otpcUXh01hr5FjGLR
1eqGCxbuH1uE2h+lybuiLOp6xCsqD+js6QxK2g+eL1EKdIKw5d4=
=ptmA
-----END PGP SIGNATURE-----

--enqzndaxjwx6gx6i--
