Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967540;
	b=4v0SKnRDDSBf8gOoKMJNFkiJtugDeTjMBQEzG5BcQshkrivIl3CpZEsluEnBI+HOXlTk
	 NJF6WF07tC4WF56ZqVfQfkJApbgjOGIxgxH2I0B351K8lTA+81VNw3Jl8rHObEuHz4bCN
	 uGd7GjZnGd2qIaNNVt7Y6YgPeiMZpytmC2waHPV2diHyW0zSTklQwTzQidemgwaRu3HjX
	 fEWhb+7QbZkhbVDuaXUEleqB6tumna3FIqLRFytjrx2X3gLwbGmdnNcw6Z1C0/zZp7rEW
	 w+PC2SnAzTDHo9mNssplChU/jg5m989UJLUhwDifAHgo8kpIuq/cr8f4ZFDqXVaLKoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967540;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3Vts4ehNV2WYkzbZel6ETHqtS+ID17Y0WMvU/pntaQQ=;
	b=2mfqG0BdcA2dd7AvwlT1eguO1xCE9N4SMBTJdOR0g5Ys23B7IKuieYb4daMG4e8gxGJy
	 5yXQV1KNPqESZxP84AG5QU6B96BGLbep6GpUfjH/H3jFAv0NCMRyTdpbXwr9iZUhK/z4w
	 +I+PmKpAcHa6GHSXrG5T/gMgaa2tuQMJ3m0eD4zsemmzqmKAVXLMC2i6EwAzQKiakGjEy
	 3otKfZ4oeWdDDIK/cCR+upghYFwX6Y31oa44OZiHJ56Y7aSy1hrmp4JMPInjyGeGNV1jR
	 03GRXU4hnTXedFQI6YQnSDMbKyZQREWbc2qVhRnsmejUrwZVqn9HfA0x1nTXEemYyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibWJ3Koj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44015606A329;
	Fri,  6 Nov 2026 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibWJ3Koj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E8D1F0089F;
	Fri,  6 Nov 2026 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967539;
	bh=3Vts4ehNV2WYkzbZel6ETHqtS+ID17Y0WMvU/pntaQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibWJ3KojUu8JIAvsm8W8+Bf+763uiVchH2mr7e7DrGaIEyqN4eicDcarsw1gAyULL
	 aY2l7xnRwC2EfoZF5xGYYmgwzQbriUY7E/VrsR+bXjIWAD0A7OT6in3gAu6eg3UE4B
	 DrLnbS6KuYGwXyh5/86Z+ugfUhs4GuscWsSNOMxQ/IUAIJ0nVGf9fmIk1hr4hS3Clg
	 xMvS1W0Atp26qQqDGT9/FeTLDSm6wFKdWObTF9ZuqWfjIz0MR4l21kYW3cPWQ2WVus
	 COBSovgMJWtAlsOGmbx0OXybEGQZ23EwHuj5zDBi6i0wz8zUS2RIl2UqEJsI0oeN0P
	 APf5Pxo7ii7UQ==
Date: Fri, 6 Nov 2026 13:18:56 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Aniruddha Rao <anrao@nvidia.com>, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <au3Ag3uEKhppG930@orome>
References: <20260929095915.2215685-1-anrao@nvidia.com>
 <20260929095915.2215685-3-anrao@nvidia.com>
 <20261105-fiery-gentle-pudu-e985dd@sudeepholla>
 <aux8RS55HqzuTL3g@orome>
 <20261106-emu-of-nonconcrete-wizardry-174c3b@sudeepholla>
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
	protocol="application/pgp-signature"; boundary="y7cj5bs7ahhglui7"
Content-Disposition: inline
In-Reply-To: <20261106-emu-of-nonconcrete-wizardry-174c3b@sudeepholla>


--y7cj5bs7ahhglui7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 09:25:56AM +0000, Sudeep Holla wrote:
> On Thu, Nov 05, 2026 at 02:07:48PM +0100, Thierry Reding wrote:
> > On Thu, Nov 05, 2026 at 09:50:26AM +0000, Sudeep Holla wrote:
> > > On Tue, Sep 29, 2026 at 09:59:12AM +0000, Aniruddha Rao wrote:
> > > > Add required changes in the Tegra BPMP driver to make it compatible=
 with
> > > > ACPI-based platforms.
> > > >=20
> > > > On ACPI systems, IPC is handled through an AML method instead of the
> > > > kernel mailbox and IVC frameworks.
> > > >=20
> > > > Clock, reset and power-domain providers are not controlled by the L=
inux
> > > > BPMP driver on ACPI-based systems, so do not initialize them there.
> > > >=20
> > >=20
> > > The above 2 statements are very clear and says this driver is not much
> > > useful on ACPI systems which is good and aligns with the general
> > > expectations.
> > >=20
> > > > Keep transport initialization in the SoC-specific init operation. U=
se an
> > > > optional init_providers operation for DT child and provider registr=
ation
> > > > after BPMP communication has been established and the firmware tag =
has
> > > > been read. ACPI platforms leave this operation unset.
> > > >=20
> > >=20
> > > "ACPI platforms leave this operation unset" - I don't fully understand
> > > what this means ? If it means we need to do something on ACPI systems,
> > > why can't it be done by some boot firmware instead ?
> >=20
> > I think it just means that the "init_providers" operation isn't needed
> > on ACPI systems because we don't expose clocks, resets or power domains
> > in ACPI (we do this only on DT so that we can have cross-references
> > between device tree nodes). I don't think anything needs to be done in
> > the ACPI case, so leaving this operation unset is exactly that.
> >=20
>=20
> Thanks for the confirmation.
>=20
> > > > DT transports register an MRQ_PING handler for requests initiated by
> > > > BPMP firmware. This request direction was used only by a diagnostic
> > > > command in older firmware and is not provided by firmware on ACPI-b=
ased
> > > > systems. The ACPI transport therefore does not register an incoming
> > > > handler; its init operation only sends the outgoing MRQ_PING reques=
t used
> > > > to verify communication with firmware.
> > > >=20
> > >=20
> > > OK, I am more confused as you state more things are not needed on ACPI
> > > systems. Why do we need to add any support for ACPI systems then? Can=
 you
> > > make it clear as what is needed on ACPI systems and why it needs to be
> > > done by OSPM and not any boot firmware if it is just one time initial=
isation.
> >=20
> > My understanding of this is that the goal was to completely hide BPMP on
> > ACPI systems and do all the clock, reset and power domain handling via
> > standard ACPI operations. MBWT is a feature that's needed on ACPI
> > systems and that can't be represented as a standard ACPI operation, as I
> > understand it, hence the addition of ACPI support to BPMP.
> >=20
>=20
> OK.
>=20
> > So some of this patch is stripping out things that don't make sense on
> > ACPI (the ACPI support for BPMP is very minimal) just to get enough
> > support in place to expose the MBWT caps via sysfs.
> >=20
>=20
> I am bit concerned as MBWT is something to do with memory bandwidth
> throttling and resctrl provides user ABI for such things, this sysfs
> may be duplicating part of it.
>=20
> > The sysfs knobs exposed in patches 4 and 5 exist because the bandwidth
> > caps may need to be adjusted dynamically at runtime. It is indeed a bit
> > absurd to bootstrap a restricted version of BPMP like this for just this
> > one feature, but I don't see any alternatives.
> >=20
>=20
> Is MPAM/resctrl path explored and you have valid reasons to not use that
> and create your own sysfs ?

My understanding is that only monitoring is implemented for MPAM with no
way of actually controlling bandwidth through it.

I've started an internal discussion to evaluate whether we can avoid
custom sysfs attributes in favour of exposing them through resctrl.

Thierry

--y7cj5bs7ahhglui7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrtxawACgkQ3SOs138+
s6HXgBAAoQ0SDxGlvO7HD0x2l6PY/QO/PMVisOZhqcPqykQZxHwJeCrGr1sb2s3a
u4NT+PVRRwhW3uett4BzRTvWTIhShdfqG1oEbD0n5JQYC1i3ohgys+R4uSSqPQCa
6UNd1tLO/9qOJ5mOEksQ5DZsPfnyWZBZMFDa/OCAizL8OOWMtRLnTgR2+kMoHsw2
LMVyt68i3bP3clkMY6yDOQjw7vruv2S2GkyZltbqlGF6Hvch7T9Ydf6xGSOPTj2J
w6drQoP8Eh76CexBccGVKvoFc+oi277FIyaqu2QmO8L3FppXpnQEMmnuUEo8TgDi
RS/FsU7gup5vi/VdDPBbY3Zla473K/jAT4mNMFQVfydQIUepWgxChADQIgm1JBJ1
gordoLbKf1GmuGnPiIZeQrvUQgI0FqVBDZwCMYAqi8/VEb1VLI++Q52MVyfNtrVL
iq7V0b+1lrGi+UiiSbqcBZzKIoKgJJFm8SSvbAkGUfG9qZ/bE4/zBilZbWEIbEbV
JQX85NxdkbUCsiDK/i2kwjNT4XIgBEd2GaFdc3wSofXz0FpSRwCNcdmZXCWelXtl
0mtafup+oLqQnjamr7UTQKbmuMwBMn5oGnUC597hlM7o7XzqeoXZbNId0z5eGBrx
ou09rOUTC29P9UHbiZsMkRptxw3/mFcOd/+S6dLGPEjMCy0RH+M=
=q7UL
-----END PGP SIGNATURE-----

--y7cj5bs7ahhglui7--
