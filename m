Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885494;
	b=2P2U7YSPpTqHIZrbB3MdfyLq5fBD7kOwo6ZWUXmLfiFPYd1a3xPTHoWL5Vkw7+L1ekdI
	 4CMWXJsj4mtxGchc2U9W0sTEzIp/2YDz0j/kZ/Sm+LtIMu9iuj0elMQY7L7aU3RmHQSo5
	 0Btp7k2oHE55eMn0HtZdd95FTIN4gCy2nfVOb8rl6+NcF65ejAxuGkH0hHqaurvJzRtRv
	 qxQKmMPxHbKfT1/uJRZeACfdrEQ9GIqXtow0WvGqJr8wFoGvmR7tDgFUTkRHTa1YkkT6c
	 kEzTjloMm0tQj1qlgicPhMKuHVXY3mXAyzy0tIi3dJSTX/7W5aS36tL58CvS9PLTQCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885494;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/QvKnUG4iFq+pg6e/pJ49FqAE2AbwcrtIOiNlhBH95A=;
	b=JJDJneMRcizz/GuuZdD0K2wcTDZPWp4eVG72ofqPUJ/GH9vM4k0lZWiM4FiPJXullIas
	 pNn/px8bVoFbx8M7p98xyhbAgPolfyTSo4SOGqSbWzt6/4UieYpVL3U9/YeR5vJzzkPsI
	 YXywrSXi+/HFsu3+Wqtv6u+JyiZDEYJWTBURnnwy8C88+izvzdJgQU43mdZb0/I7rnzEj
	 CuvUsXMTBj5HWwvLp8lc/TR83SPF2j40W2/Cz4zMrMbG4wAywn4sYRFCV5Q3XySroyVf1
	 3xx7BkzVTmdNalz6gprXSllgtHRvSZdYsgyg123IL/MyBQwsQEkShP4U8OwgzjxEshg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws1hHqpC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF3C606A328;
	Thu,  5 Nov 2026 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws1hHqpC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4171F000C1;
	Thu,  5 Nov 2026 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885494;
	bh=/QvKnUG4iFq+pg6e/pJ49FqAE2AbwcrtIOiNlhBH95A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ws1hHqpCrTO3vv5+xWSpKi1W3FzvYwAnjHo7ZBri+xFew3S/iI+cg+vaLDpwRX4Bq
	 7CH55eaByLgICZl7qi4fjM2FWC0dAz7vDsAicN5XTdy7H9aMIAAut0u2LoqDOF0kcC
	 qCcUi4Q2GjAQWl+Zxb6je9rfvn6D4UylfxObtecabLBvOk5dz+OzpM2go58G+puAzL
	 2jPeQsLvvjE/3CRV8jGtCR8s4rMoyzf0+UCKnZHc6okGrT2VzObWstYJpBUnNr19x1
	 DhUau/mWTXC4er4D5cHYEemg2gy+4t9OgFaQVk8yQ7Y6RO4oWngYTJlems/uva3Y3a
	 ep/1AInJyJiEw==
Date: Thu, 5 Nov 2026 14:31:31 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <aux_4NxiWvD9uVev@orome>
References: <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
 <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
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
	protocol="application/pgp-signature"; boundary="z7tak3mo2ipp6x3b"
Content-Disposition: inline
In-Reply-To: <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>


--z7tak3mo2ipp6x3b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 10:23:24AM +0000, Sudeep Holla wrote:
> On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> > On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:
> > > On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:
> >=20
> > >> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
> > >>    and follow the specs where possible.  If there are gaps start ask=
ing
> > >>    questions. Linux definitely  doesn't support all the stuff that h=
as been
> > >>    added to the spec in recent years.  So this covers things like re=
gister
> > >>    addresses, interrupts etc.  All fine, hopefully a subsystem maint=
ainer
> > >>    can take a look and will have enough of any idea.  If not ping th=
e folk
> > >>    on this thread for help.  Things are a bit flexible for consumer =
type
> > >>    devices where fixed and bodges are common, generally less so if i=
t is
> > >>    server grade hardware.
> > >>=20
> > >> 2) Stuff that is an ACPI spec gap or place where we'd expect general=
ization.
> > >>    There are several examples of this on list this week and a few mo=
re in
> > >>    my inbox.  The particular series here might fall into this catego=
ry.
> > >>    I've not figured out enough of the details yet to say definitivel=
y.
> > >>=20
> > >
> > > Nicely summarised or categorised Jonathan. Nothing much to add.
> >=20
> > +1
> >=20
> > >> I'd also expect a driver using AML as the target interface to either
> > >> point at a published spec doc, or to include some snippets
> > >> of the AML - that can be a lot easier to read than the driver code
> > >> (imagine reading DT by only looking at how drivers parse it).
> > >>=20
> > >
> > > Ideally, it should be just HID that any vendor needs to publish unless
> > > they make use of any custom methods or something device specific like
> > > DSD/DSM. I would expect most of the devices to use standard methods a=
nd
> > > properties that are already well defined in the ACPI spec.
> >=20
> > >> Given that has new ABI etc, I'd expect that to have gotten broader r=
eview
> > >> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
> > >> going to result in anyone noticing!
> > >>=20
> > >> https://lore.kernel.org/all/?q=3D20260929095915.2215685-1-anrao@nvid=
ia.com
> > >>=20
> > >
> > > Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enabl=
ement
> > > patches.
> >=20
> > Is the "BMRQ" in
> > https://lore.kernel.org/all/20260929095915.2215685-3-anrao@nvidia.com/
> > a custom method then?=20
> >=20
>=20
> I=E2=80=99ve quickly reviewed the patch; it does implements a custom meth=
od BMRQ
> rather than a standard or out-of-the-box solution. More details on this is
> used based on my understanding below.

To get everyone on the same page: in a nutshell, BPMP is a separate
processor that handles various aspects of power management (Boot and
Power Management Processor). The CPU communicates with it over a shared
memory region and a mailbox/doorbell for signalling.

> > How does this relate to the EC and PCC interfaces in ACPI systems?
> >=20
>=20
> I am still evaluating how the BPMP driver is intended to operate on ACPI
> systems. In the meantime, I share the same questions noted above. The cur=
rent
> commit message lists several driver features that may not be required for
> ACPI, which has introduced some clarity issues regarding the intended des=
ign.

My understanding is that an ACPI systems, as opposed to DT where we do
this all through kernel drivers, the inter-processor communication is
done via AML. This is because standard power management operations use
this same mechanism to enable clocks, deassert resets, etc.

> > In current mainline, I see that the bpmp driver is used on DT systems
> > by the tegra specific cpufreq, memory and pci drivers, but I would
> > expect that on ACPI those all use shared drivers. Are there any other
> > users that are not already covered on ACPI?
> >=20
>=20
> For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
> supported backends.
>=20
> My understanding is that the BMRQ method is called by tegra_bpmp_transfer=
(),
> which supports Tegra-specific drivers for power domains, clocks, resets,
> I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
> OpRegions as part of standard methods like _ON/_OFF or other device state
> methods. Although device/memory DVFS is trickier since the ACPI
> specification lacks standard methods for it today, the commit message
> implies these components are largely unused on ACPI systems.

I think this goes back to the disconnect from the patch thread and
earlier in this discussion: the intent was very much to encapsulate all
the power management within standard ACPI methods, and that's working
fine, hence why clocks, resets and power domains are not getting exposed
on ACPI systems.

However, there's no equivalent in ACPI to expose these MBWT knobs, hence
the need to expose this through BPMP directly.

Thierry

--z7tak3mo2ipp6x3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrshTAACgkQ3SOs138+
s6F/FA/+ObQrZtsqOmcyTIJjG1fJSEbJOLpkQwiKNY62NJ38g6XFAQhHDquZK7fU
Q8zZA0rub/mrtVypRyvKH4aVCdFSRd1g6aCSbTa7P46GPlk+aqwqWiZTLFVQOMXN
+/aHuJvK7hh98Bz0FJl6uElcDjGG9+DkSThb7wMiqnqXCT/+Nn6FlqDpAMmobiby
MrY+FwU4LI4LApngp1EhEmA79HuuoRfPZwPgOXvcuT4W8Mp/fX2ObKHcbrjUWh/F
KQRcI+/6yemzKGUUn77IDoSm3BcYoFpMSoT17pToEjGnLMw8OIIJgetGCwY1Vo0O
luXnMzylpJ5Dv9b5PtOhayc3RMjXXNGVpjeiZYTmkCXpd6gpNbYJL3h1hoRoEWad
t0ETWzP7TAdkVocXmZwo65U7vI6E+1DgXgE6FDTJUaCPQpvNcAlwWlUFF3X2Mh0L
dMLkX8ywPdGb0z3/J70LVwwn2F0lbKfbYTRkHTi829x3iJXbQ1MK2llCCm58gBwz
7MjwrYHFZmiCGWFqjYAADDmAaYR11PMRlSkJjWdaURIgtyugFSuE4MzFY7RoIdNd
jtbxlWsiaM8FKd79mBUA6uCSWLb2VTbpJc6mkA7notTGmApThOfPi8r9sn4W2Drj
X5ZBqtAzUt/qlKjMrQ08k3zYg+4QMddSGiwTk47KF6qoZNJ/YLk=
=QkJC
-----END PGP SIGNATURE-----

--z7tak3mo2ipp6x3b--
