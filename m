Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC32E03EA;
	Thu, 28 May 2026 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002602; cv=none; b=q809bnk092ovl5cB3cEx8AH0rMGRUcWCSjX/B+hKEFkEk6u9cX535GJmjHpDV0MU9wIqnPM7Y8uIndGEqk+VkMX1PXKS+/NQSvnSUMGtrQMtJ3RjTYZOdCrTGNVOi6al+VxajtTwy9QMJmHSF4RsUuFhtQBmt5jPaXVPBACd5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002602; c=relaxed/simple;
	bh=AHZ/9/jtIZSUiZNWpcGGXLQhAAV2e8OddyJGVJHPkto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2CreTOva0z7lWoYdu1a8DtmpBc0hBmNIk/ZmND9JnMCtXLKt5KIQUPpL3WJLa0RRvYxccPN1H5gX6dhI8WIGol5qSitelVUNTpSb9voz6S5de1nSMjJ7CQCN8rihRbv45Ga5dFqjuCcDJndUICQ3xmgZ6lvQ+TBGZhrE6+Y37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cb4ct4iG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cb4ct4iG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250AA1F000E9;
	Thu, 28 May 2026 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002600;
	bh=EE5HM668RiBUPvcutvt2dGJFbkQrJV21fqnkDq8qnpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cb4ct4iGr/VLy6w+Rx1wvifGRXGZPQl3JNKIZkDKU2ZX7yZK+qoFALr0O6lgVm4qT
	 Zmh/PZwuA9LK9C8EhBr7Kkj0nAQlqNqZICHJPbe6KMm6TN0duJvf4KZy6sBS/LnXly
	 hv76QIpjX8AfO7GWMa1kJuFWuR3Qh06xKU3ebn+DFMt+uIxJDELHPD3EwDP0f28Vfa
	 ixtRSMk5U/0oWAGyYRD7EbSe1sfJ1bnNdPULYAPgxcnHWFEJhaXf/vj8rpNE+ai1g1
	 StkelGcz7A6BltDYozOab10nEbF7O4JdGmwGa3VbR/jmSl3c8m9R2Fr6gfxo39VhNZ
	 zjYFKOKdhXhcg==
Date: Thu, 28 May 2026 23:09:58 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 1/4] soc/tegra: cbb: Move driver registration from
 pure_initcall to core_initcall
Message-ID: <ahivAfH1PcSNAEnc@orome>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ab7fuzmdunsjhv4"
Content-Disposition: inline
In-Reply-To: <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>


--4ab7fuzmdunsjhv4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4] soc/tegra: cbb: Move driver registration from
 pure_initcall to core_initcall
MIME-Version: 1.0

On Mon, May 18, 2026 at 07:19:57PM +0900, Shashank Balaji wrote:
> Commit "driver core: platform: set mod_name in driver registration" will =
set
> struct device_driver's mod_name member for platform driver registration. =
For a
> driver to be registered with its mod_name set, module_kset needs to be
> initialized, which currently happens in a subsys_initcall in param_sysfs_=
init().
> The tegra cbb drivers register themselves before module_kset init, in a
> pure_initcall. This works currently because lookup_or_create_module_kobje=
ct(),
> which dereferences module_kset via kset_find_obj(), is not called if mod_=
name
> is not set, which is the case now.
>=20
> So in preparation for the commit "driver core: platform: set mod_name in =
driver registration",
> move tegra cbb driver registration to core_initcall level, and commit
> "kernel: param: initialize module_kset in a pure_initcall" will move modu=
le_kset
> init to pure_initcall level, ensuring module_kset init happens before teg=
ra cbb
> driver registration.
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Acked-by: Sumit Gupta <sumitg@nvidia.com>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Patch 4 depends on this patch
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>  drivers/soc/tegra/cbb/tegra234-cbb.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Assuming you want to take this through the core driver tree:

Acked-by: Thierry Reding <treding@nvidia.com>

--4ab7fuzmdunsjhv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYryYACgkQ3SOs138+
s6HxvRAAmG3c3c73o23/oyuaQ30+lIHtYwbsevpSjGnsNuorSs/lN9aor/V9VRD7
jPoBp8fcubCks2T919zWdxBCIiorBBH78gynBTp/tFNMAfR5r7UHUn+AT55eZXgB
dq33xVP59qTyQ3dU5U9RPV6EEuQW5WyjOqcDOPeQI66ymlummlwQXdDrYiIO6eBK
SddGUlzatL9rYGmpmFKmoDvBjHx+DmXWO1EDR7zU+6F80jz6NwibJ6+gNC6ttoF5
39bBlwuQOLjqokaIdDUvAbU47RmFRojs21jtLzFI5WI7PcGu/5uoGDwA0mjmmhIk
wIBDQ6+kP6iE0RWWRMN4H1huKDmkBUhv9BsBkdEhDYGSLFhREecuqSp9ySSiSlaA
yf1WnN66rhIpLSZSg5lwmeNv6GIOvYN0ZPUcE802z9mEnbRZcJWW7OI2/js97nIz
skvgT/9LKUoFd84cMVhv0FQW9V99v0TS3o9ocB/wEHmlH5Ic3uqwFM7PXUmDFJxu
8lR3Slt7xaKJzPm421Yg7R/iDc+ZBLh4z+eMjv5cPWnlxW0rhq8yO3/TFEo5xa0u
OSlDcfiOzx1pHgkmvnRd/mjTUoz4BNCdsaha1VbWd3iGg0P5HQ4fPkfeUZLg44ZN
0EUSE7o5FR6ahZjxH7AjtCYa51BylqPiwSPPHTzd1+9/X0ts+JE=
=YYeN
-----END PGP SIGNATURE-----

--4ab7fuzmdunsjhv4--
