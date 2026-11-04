Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803259;
	b=MyubcnXJ1YJdO1QObkspgOlmW9L8WbietW0taQQZjqiq7kOzN/SMTmHb8Z2QgwqqKw3Z
	 AS6mhWEn53+hm0v8tBF5CUw5mQYQ7EYFfjHWkJyo9lZNaKCwAQKZJsKAtsbVpQKamqGhc
	 ojjHtcjN+lXxDmxS042oElINCn/NMCA5J0VPeMUsMdUnz/Ptrf18cmstjyYJ1o7lYNJtG
	 ndOx5SlXvg1wST+OhdXtp+i9blvsrymXek/qfVcc7+QDmCPGl3hlYdX/3PXHwN2B33ydr
	 YOFc7siukef4soUaGCCP0VCEKLu7adXyc0aAM1NiY3tDkMlHb0O1O1Gcx6xJV5xRAWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803259;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CyvjTTUdEpdGCSMavau95YAskLlm8/fyjgWRzSYqkgY=;
	b=j15ekm0XnJWI2xlbsXDI3xyHifCVo2XG4eYfK8gQlCOoZNIc65oFaK5G7W9WSid+tQzM
	 gBILhExFaDqs3Ra8q++Z2NzADigmX4R2oNr/YCfZl452rmk7MZTzSqXzEUVtxpvIUAtXi
	 bPJgO+nEneWhHs5NfiN/vszpRlzm8BstYYNXE/H2Ilww7sVSbuV+atz0qkaThaxyv8dM1
	 MgcEp6R0Zdeb6076aXRlf1c+eOk3rY4sFOFWr1G7ZVOA2NI1PAD/3q1RHvRfnS5JAFs/4
	 6ShNpLXTEUAp8s0qlAP9qhSuX6nDDGPMevbYA2ZZ1LOktiaRB8H5CrHj1cw9FJ4KtFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGa51tuI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC1E606A328;
	Wed,  4 Nov 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PGa51tuI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267A1F000C1;
	Wed,  4 Nov 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803258;
	bh=CyvjTTUdEpdGCSMavau95YAskLlm8/fyjgWRzSYqkgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PGa51tuIaKq1GcyLufKRg/mLTl/jrwLHi8XH6sN3WnWvDEPCHKXU8odd0K4/BsRzc
	 kP664CmQnDy5qMekxIjXzdHp/4aFio2MqM3Z0qo1cgxE1UU5EvcQ/8W/G/sLUT8t1q
	 +tEz4biO53s/bcHAcufkfGVRX3ml1F7R5gWKjRfNeYWpO+x9aK7tPLofllcMD+ocN7
	 Zt3AGvT6NeLVchSAZvQYrDNseW/UphlmdckBh+CkVYh0wBB8hr3HFyW1i/UMFZS6Ki
	 M72fqefvdG9KcXnV5WS2ZQlGgV6cUUoBxZP4dmXJA4heJysb1/XXn9HhYVvuDKWDtp
	 1BwxehhoqlKWw==
Date: Wed, 4 Nov 2026 15:40:56 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <autADOKsSVVMn6r9@orome>
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org>
 <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oq4coqgkbfbzxn3z"
Content-Disposition: inline
In-Reply-To: <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>


--oq4coqgkbfbzxn3z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote:
> On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote:
> > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote:
> >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> >>=20
> >> Where is the ACPI binding documentation for this driver, and who is
> >> responsible for reviewing it?
> >
> > Hi Arnd, Rafael, Len,
> >
> > Sorry for the late reply, this fell through the cracks.
> >
> > Admittedly there's not much of a formal process here at all. Anything
> > I've received up to now seemed to be fairly straightforward support
> > extensions like this where the ACPI tables basically provide the same
> > information as the DT via standard resources like register ranges.
> >
> > I suppose for anything beyond this, we'll want better documentation and
> > broader review.
> >
> > Is there anything in particular that you're looking for? Should I guide
> > people internally to always Cc linux-acpi for anything that concerns
> > ACPI?
>=20
> I don't know, I'm also still learning about how this is done, I
> was hoping that there was already an established way.

Yeah, me too. Maybe Rafael and Len can provide some guidance here. I
don't know how ACPI on more traditional platforms works, but I imagine
that it's a lot of the same anyway, except perhaps that people have more
experience with the spec and today might be doing a good job already.

> Having a review done by the ACPI maintainers would definitely
> help from my point of view, but I'm not sure whether they are
> set up for that, in case there are a lot of new drivers.

I think platform maintainers need to be a first line of defense here
since they sit at the intersection of a lot of this. At least that's the
case for me. Also, I'm eager to learn how to do this right, but I'm
often at a loss of where to start. The spec is a bit daunting, and then
there's various extensions, too. Maybe the AI genies can help me ramp
up.

> I assume there is a knowledge gap in both subsystem maintainers
> regarding ACPI (certainly this is the case for me for drivers/bus,
> drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> many of the subsystems that we support with DT.

Agreed. I've seen some patches where the ACPI support was as simple as
just adding an ID table entry and the rest was all standard, but I think
once we move beyond standard resources things might get a bit more
complicated. I imagine that ACPI may not even have specs for certain
aspects that we currently handle in DT...

> > I'm not very familiar with ACPI, so I'm probably not the best reviewer,
> > but I'm sure I'll get the hang of it over time. Generally I think the
> > same principles that we use elsewhere apply: use ACPI standards where we
> > can (standard interfaces, resources, etc.) and if device-specific
> > configuration is needed, use _DSD key-value pairs to mirror what we've
> > done for DT (and also mirror back any new properties needed by ACPI to
> > DT schemas). For anything that isn't (and can't be) documented as part
> > of DT schemas and still custom descriptions are needed, we probably
> > should have some documentation in Documentation/firmware-guide/acpi.
> >
> > One problem that I see with ACPI, and which we successfully side-stepped
> > with DT, is that we usually get "baked-in" ACPI tables, meaning we don't
> > have much of a choice but to accept whatever is provided. In a way that
> > is a step back for Linux, so hopefully we can get better practices in
> > place and avoid this turning into a big mess down the road.
>=20
> Hopefully there is a process in place to amend bindings in a backward
> compatible way. I would always expect issues to come up during driver
> review that lead to firmware binding changes. Since in this case
> both the firmware and the driver are provided by NVIDIA, I don't
> think we should treat the firmware as an opaque blob that can't
> be changed as we might for other machines.

If we follow best practices that we've learned during the DT transition,
backwards-compatibility shouldn't be all that much of an issue, I think.
But maybe I'm a bit optimistic...

=46rom my perspective, these kinds of processes need to be injected as
early into the chip development cycle as possible, which comes with its
own set of challenges (secrecy, timelines, ...). Even if you submit
patches for upstream relatively quickly, which we often do these days,
it's usually at a point where hardware is relatively fix already and it
becomes increasingly harder to update ACPI tables after that point.

I'll see if we can adjust some of our internal processes to get this
sort of feedback into the loop earlier on.

Thierry

--oq4coqgkbfbzxn3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrrQ/MACgkQ3SOs138+
s6GmYxAAqm8oI57PJDACg+xpKzJC801NDGREvpjHqUE6y4QEGHBWNPx3FFjURmwt
yFBc/WTPLH373hjaBo+gUUsZRukXEzoPdHq2k2UFWtWPTJ28kiPdM1NN4WImOK0b
h3uHd9At17ThB866U9l/hM7Mbkmh6X6wOz6fDePReSrbzuzIQBD3bRGRad0Sb5xq
5AhbqWQfXxQwldi26oI38mHu+qRMVmQR2hzF62eGXrD466Q1xpjM/v6XUV0BFLjD
4ksbs96Cq5amGlMHlAScQOaWFkt7bO/RKnjYWgLOLmWrnVQNJQYN6EnEJhwbfS/C
xJx/s+WMDDbWqO5v32Il80i6e5jI2y55reqTCKEaR0cwM3wRsGWuhBygYwFVWCMj
enQJ49OdShNlfBj2pTTOVdMJE57I2PTfvJNZVuuqkU0A69YVNftpPLDLGn8iexEp
5rVjfpRRu8RZs4wlVhnCoieaMfxjaErfv0vsvkOgyufn6lBDNSDHFNl/0rJxp8qV
+YvFWxX+A5bpi5GchNLZyrTDJwUT5DXqraZMpEokwDWxcD4TnxuvADlVAg9TyFaT
j68p5nuZqFn62QpV6JUAkU5L1QSMkKJ3h9Ms8mHwyd8FQp1Zr+86hGAjJEQ1vg+L
sc0a36xXAojiLp9fFLlFVuEiB9VLCYSm1KT+ppDVjUD2RkCPeGo=
=fUR7
-----END PGP SIGNATURE-----

--oq4coqgkbfbzxn3z--
