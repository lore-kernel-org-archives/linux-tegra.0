Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884071;
	b=Xpo7nnrwRY3+niWqmI0G0HSqbeXzyB9hqtfZQntZlnUdC5befKDoR6SEx/8hl46zN4Tr
	 6kkMS0FTwuFpXq1Xew8xPSMqkTW6fsIva2KrnE+YtWgqSHwKMhYJF3ubURU+D9P3uH3xM
	 KghjElCd03RRxw0nlfNIsYxARWUhCO0e5qB3z9lr2cDKIlghMJcK7gfW6w52TAS9+DrO6
	 hKdDIyE/Pg7JMjxRCSfjqP/nW4oI0esmhMvCp2rbVlWZLIPhiaiN29ZfDuiRmbZxQynRg
	 h0jqA4enWIZtUS4x8xsXAL9dUD8lL8KNoUe+S9VlHIdNFbvTxnMACAR8QYim2BBbDYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884071;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DDMJqi9+UI9Rc5hDnMfgiXJQaFJ1svl0Msg8vKsIEKI=;
	b=FuyvtRlZiSW2rDrpz365qMpc2gnGcTf8t0tnzOiogeZTGwacYZdheGYhSohL0XcEW5qk
	 KliIktAPiuXSowuz9FO9Ee8iyv7nNFT4uWiafH2AGG2GeDAcUCX/V2sAWASyralTp/ocZ
	 ASBdJxYBCcXjacAThYRxkRBpllqOJWjdp/XhimF7VZ3c2KkOro//qZbMFCkw+SAY3SQU2
	 VC/6H93OoBY5xp4bad8HZe+UtJt3r4r1IHrPADuk3QLTyf7QPLyTf9FGAC5Uo+fDee+eH
	 abThw2QA4m8Mppic4A7S3rB6DmAh9J8VCHi+q5ke+Z/E5ciJM/dmhb7AIZIItiF1Eyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n03FXmaB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A0606A328;
	Thu,  5 Nov 2026 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n03FXmaB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D31F000C1;
	Thu,  5 Nov 2026 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884070;
	bh=DDMJqi9+UI9Rc5hDnMfgiXJQaFJ1svl0Msg8vKsIEKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n03FXmaBWz7ZgobicOSU6malSdCLkUxxCVAZ1jaHuQlT36WZ7RzXBmRzkJQrbcMqx
	 gN8QTw/KeTqxXa3vWuYymNASkXk31OBJfDYfVtYgXqgOr0Xq3d4aPTBfC57XrwsFic
	 De98RUAzvILI4qj3RQtl7HD6LAvQxbZxh+xP4Od+PyN9UpBJ003nkcI3uBMvolWIv4
	 LwHYUYW10cqVkP+boO/K+4Fo3LSgwDdo2dTTRDhytu+R9Pe5kUI0osWxUc6xjfV0Au
	 72lugz5VPq7QXmAzNL0bCK5hu2FtimXRNlIVX9dpFhePkxTAxlnuzR9fh6iiMEfmdt
	 klhogOJ2ZvUVA==
Date: Thu, 5 Nov 2026 14:07:48 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Aniruddha Rao <anrao@nvidia.com>, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
Message-ID: <aux8RS55HqzuTL3g@orome>
References: <20260929095915.2215685-1-anrao@nvidia.com>
 <20260929095915.2215685-3-anrao@nvidia.com>
 <20261105-fiery-gentle-pudu-e985dd@sudeepholla>
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
	protocol="application/pgp-signature"; boundary="q5n7ddzkli4abmdo"
Content-Disposition: inline
In-Reply-To: <20261105-fiery-gentle-pudu-e985dd@sudeepholla>


--q5n7ddzkli4abmdo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/5] firmware: tegra: bpmp: Add ACPI support
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 09:50:26AM +0000, Sudeep Holla wrote:
> On Tue, Sep 29, 2026 at 09:59:12AM +0000, Aniruddha Rao wrote:
> > Add required changes in the Tegra BPMP driver to make it compatible with
> > ACPI-based platforms.
> >=20
> > On ACPI systems, IPC is handled through an AML method instead of the
> > kernel mailbox and IVC frameworks.
> >=20
> > Clock, reset and power-domain providers are not controlled by the Linux
> > BPMP driver on ACPI-based systems, so do not initialize them there.
> >=20
>=20
> The above 2 statements are very clear and says this driver is not much
> useful on ACPI systems which is good and aligns with the general
> expectations.
>=20
> > Keep transport initialization in the SoC-specific init operation. Use an
> > optional init_providers operation for DT child and provider registration
> > after BPMP communication has been established and the firmware tag has
> > been read. ACPI platforms leave this operation unset.
> >=20
>=20
> "ACPI platforms leave this operation unset" - I don't fully understand
> what this means ? If it means we need to do something on ACPI systems,
> why can't it be done by some boot firmware instead ?

I think it just means that the "init_providers" operation isn't needed
on ACPI systems because we don't expose clocks, resets or power domains
in ACPI (we do this only on DT so that we can have cross-references
between device tree nodes). I don't think anything needs to be done in
the ACPI case, so leaving this operation unset is exactly that.

> > DT transports register an MRQ_PING handler for requests initiated by
> > BPMP firmware. This request direction was used only by a diagnostic
> > command in older firmware and is not provided by firmware on ACPI-based
> > systems. The ACPI transport therefore does not register an incoming
> > handler; its init operation only sends the outgoing MRQ_PING request us=
ed
> > to verify communication with firmware.
> >=20
>=20
> OK, I am more confused as you state more things are not needed on ACPI
> systems. Why do we need to add any support for ACPI systems then? Can you
> make it clear as what is needed on ACPI systems and why it needs to be
> done by OSPM and not any boot firmware if it is just one time initialisat=
ion.

My understanding of this is that the goal was to completely hide BPMP on
ACPI systems and do all the clock, reset and power domain handling via
standard ACPI operations. MBWT is a feature that's needed on ACPI
systems and that can't be represented as a standard ACPI operation, as I
understand it, hence the addition of ACPI support to BPMP.

So some of this patch is stripping out things that don't make sense on
ACPI (the ACPI support for BPMP is very minimal) just to get enough
support in place to expose the MBWT caps via sysfs.

The sysfs knobs exposed in patches 4 and 5 exist because the bandwidth
caps may need to be adjusted dynamically at runtime. It is indeed a bit
absurd to bootstrap a restricted version of BPMP like this for just this
one feature, but I don't see any alternatives.

Thierry

--q5n7ddzkli4abmdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrsf6EACgkQ3SOs138+
s6EAYhAAqfoUns+qeN0UotEckKvK2104hIx8mnnPzgF5b4lBfWwPl394CLPdgJVM
emYTXmkyT9qYP8DPwMJltgkui043Da9EDyJjm5e8YpKrHMMfPtVgVdAPw5Dmps4Q
nthg2oL0/GQyrSIqSVwVZAA3X9NCXv/enDnjInC91FLFawgucB+a9GgHlv1fwB+s
Bsf5D0tJ+25A244CzmWu0a6PkRVPnX+5gt6AMJ8Gx+xsL7sNt4bF/sACY8yUTwv1
9AHpFOe2uXuc9PjrCgZtLbXtrsJwiS6HO/l6xK7OL/0q90pCO1NoGivZQKXkL/iz
M9aXcG7iVSk/532Uqw9h2fAyJmhVicrrBQRtu91TmwtrVAoHVbQ8AHZ+sMeDEKYt
QiRO4F6UzisZoDkSC2RZvcIGEXs4Jh5Izky5Mx0GrKzk5ZYiY/2iWCeQ/WtinOQ9
I+hOKpXyn56JApVD+qbBroRCtwiTXmSbHd9IQQYsEj6qwvsveaaB5QGm1IxshUOc
nVteqC+LOJqgDS8/B/ZDmPH4N5mh0aa5hLbHQtMwJ0XID0UYfTsNWPcFKIOFz6sM
6z581/jPAzjOfZeeOA3imCC1OvmIQ4+yGair6ybWMeI8ac9pc+grV2NvNXDzbgnR
VviSSAMOuI0ogHcK7gVoN/iorwnHqlZpTBeEPn80mpI2WBtaejo=
=+AY3
-----END PGP SIGNATURE-----

--q5n7ddzkli4abmdo--
