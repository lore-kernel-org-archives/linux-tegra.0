Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C993CC9EA
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784980; cv=none; b=eLb0a2UxChjBabmVA86q7Bz9Y6MjxUjXmhF7qinAvTt9L4llVuwPDw6dW560RJiUsOnSKzZcTZN9dvf8P4juy0lPAxfkRYbCoj1kFchqTSNyuthnLXFxtIpL9dGPWMBSVZYPH5jYAyF5UsXRs6Bdd85LEsjwQthf7PjUs7wrDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784980; c=relaxed/simple;
	bh=Zqw766Jy60K1FM3PKpdg2gxD770lA/4084JUd2Hz3RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4kAS0SfgPc/ycZemZ8uMh1GzKU+v6ETwVRyhMd2sAMebolp+S85QCCoDuhWxT3hQAbSHg32MbFLeceZBScol2L2ErJxM4TnYwmerCXap4aMeZ0dHsm3fDiKGXBQSXvwYG0jDN0/m09wRcAbQGdSSg+tVIK8/8dbAkIRf1PeKaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwBOf9kr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwBOf9kr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4905e190c71so21273695e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779784977; x=1780389777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydnICT1XC8Vp9E9v1sQrxCC0lGHYdxwXITHGPqNpjR0=;
        b=kwBOf9krSVXECfjqJCIWISd3Xz0g9Oaj4ezQJklNLVbNSPJgcuarOV5b9G1xJWRh2q
         R3aSSlu7ENtvSIoo+9VDesAofNMr1Qxq3yDjvuz6cjejynzAWTU+WyJc0C8Yi0C/IZEd
         aFd1rC0o6y0VtGuOV8KNxSQp50woWmIouoXLpJyikRhGqGK6eXuQ7RU/FC+XOymODAka
         M2PAUuzHtSp08U+q7TsFikHvNgGW9nP/1J1LWaRFl/0/nEd7kkihqChCvibtFulFfgSK
         n7BRccAG0rBwkKBRfEWxE90wkGff9wiwbHobydzl3Pj19i+6ShMrSsW2km/ekYaIQeim
         HIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784977; x=1780389777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydnICT1XC8Vp9E9v1sQrxCC0lGHYdxwXITHGPqNpjR0=;
        b=YxDP4tVz5ax0cRgdY50D6v33Mgerrgxgy3uoWn6EjV6PH4UChz2tM82t8jJ8NEG6jG
         SerXbplk7i0Kgmf5weVHGbuBayLWqIkD7e6yKgT4jxf8I6+CvwXbzjaUh8RVmjOm/gZ9
         xwqXF6cpcLPzWrlOcbUY4g3SqHd7KQNKYakb6Uz15/rcxx0X7LfpffjdM/ozuzmMty98
         1fYcHLnq0PoItVLiUgJMiUKMW121i2dzncQQrV6KM546Goi3LpSX9WEx6Q9x9JTwh/W5
         U5+rG8aSp4S/qva5vrCt6If7B1QLUQVjqMEFuHou2CB2UKRrn7VT6GId3MwqHdYnlLNP
         wcsA==
X-Forwarded-Encrypted: i=1; AFNElJ/a65erKKsH+tZE5eJmTInYd30dWg6SPRYYYoea0VO+h8EHS9h5+W04IXzKkeGxCDhmmPE5Nthq1ycL0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKDASH04YmuGU0vhZG5KvzGth2kthZOgphjHRt/56Cz09X/yv
	xaff7Q7wjhKp3OubJmyriMYMpIODMxkq7GgYA/+MSeKcYCJjX92daf+O
X-Gm-Gg: Acq92OGdzQpT1f2PVb41qK0OlYLcU9cQ96aJ4qEveDAhTcBeHTRw86w/WJ2/CVq47Ou
	izOlA5pgJ/pwcLwH8081ioYQI65n/p/8H5VUUPx2eynmDx0c9Ff2qU/clm3fEUe1DL8rLAz/6S5
	L6UyzWlWx/xhQ+nqDa99CPWFu/sATNAlCZvuaxu7kPRNN2QQsB94c4dr8YI/p3T3LIPP7m3w7OQ
	W5z2GWoZwRAvnAVqYpwJP1mHUZHVnRe3mvMxsTIWjJWS/VW8rT6LADwfbfKJ413bAGOz778S2ic
	AUetdDqVyXJV5BHZg5S0jpA2Hob5eCQLLCEoOmDfh/n2m2Q3yCuReqUpNU3FzSHA4u9DGxGRU84
	8OXF0lvkwCac3sk5FwX/93a72kFtlhHrqrA8zb95pgZISbiYm100LguF4EJYY4e/n5u3hWjEbBz
	rKmkkM9Wq8Sjl/wavXm8hQS5ut69nlYYhyrKdOke8GwI2T/CMgTXWmueyMTuqDaUZLyMfCIcrDy
	zgUUR2yWVAzkw==
X-Received: by 2002:a05:600c:6303:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-490426d7025mr293058365e9.22.1779784976851;
        Tue, 26 May 2026 01:42:56 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm325360665e9.9.2026.05.26.01.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:42:54 -0700 (PDT)
Date: Tue, 26 May 2026 10:42:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v4 3/4] PCI: tegra: Add Tegra264 support
Message-ID: <ahVbq96MYmhIngcP@orome>
References: <20260402-tegra264-pcie-v4-0-21e2e19987e8@nvidia.com>
 <20260402-tegra264-pcie-v4-3-21e2e19987e8@nvidia.com>
 <iaoee5r5e2w52fap7ex23wdikbuvpjpesinedgjkehsedszhzo@64yoo2avmxle>
 <adTAVYEzfD9FQl8N@orome>
 <ukeelrtmjgxxwlkkzsojygzo6us5ijshis66a4x2a44hg4bw25@hggglahvrajy>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyj365btmhllqxkn"
Content-Disposition: inline
In-Reply-To: <ukeelrtmjgxxwlkkzsojygzo6us5ijshis66a4x2a44hg4bw25@hggglahvrajy>


--zyj365btmhllqxkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Fri, Apr 10, 2026 at 10:04:20PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 07, 2026 at 11:38:28AM +0200, Thierry Reding wrote:
> > On Thu, Apr 02, 2026 at 11:02:02PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Apr 02, 2026 at 04:27:37PM +0200, Thierry Reding wrote:
[...]
> > > > +	depends on ARCH_TEGRA || COMPILE_TEST
> > > > +	depends on PCI_MSI
> > >=20
> > > Why?
> >=20
> > I suppose it's not necessary in the sense of it being a build
> > dependency. At runtime, however, the root complex is not useful if PCI
> > MSI is not enabled. We can drop this dependency and rely on .config to
> > have it enabled as needed.
> >=20
>=20
> Yes. I think the rationale is to depend on the symbols that the driver ne=
eds for
> build dependency.

Done.

[...]
> > > > +						  GPIOD_IN);
> > > > +	if (IS_ERR(pcie->wake_gpio))
> > > > +		return PTR_ERR(pcie->wake_gpio);
> > > > +
> > > > +	if (pcie->wake_gpio) {
> > >=20
> > > Since you are bailing out above, you don't need this check.
> >=20
> > I think we still want to have this check to handle the case of optional
> > wake GPIOs. Not all controllers may have this wired up and
> > devm_gpiod_get_optional() will return NULL (not an ERR_PTR()-encoded
> > error) if the wake-gpios property is missing.
> >=20
>=20
> Ok. In that case you can just bail out:
> 	if (!pcie->wake_gpio)
> 		return 0;

Done.

[...]
> > > > +	bw =3D width * (PCIE_SPEED2MBS_ENC(speed) / BITS_PER_BYTE);
> > > > +	value =3D MBps_to_icc(bw);
> > >=20
> > > So this becomes, 'width * (PCIE_SPEED2MBS_ENC(speed) / 8) * 1000 / 8'=
=2E But don't
> > > you want, 'width * (PCIE_SPEED2MBS_ENC(speed)) * 1000 / 8'?
> >=20
> > This is M*B*ps_to_icc(), not M*b*ps_to_icc(), so we do in fact get the
> > latter. I almost fell for this as well because I got confused by some of
> > these macros being all-caps and other times the case actually mattering.
> >=20
>=20
> Oops, I was misleaded too. But you can simply do:
> 	bw =3D Mbps_to_icc(width * PCIE_SPEED2MBS_ENC(speed));
>=20
> > > > +	err =3D icc_set_bw(pcie->icc_path, bw, bw);
>=20
> And here you were setting the MBps, not Kbps.

Done.

> > > > +	if (err < 0)
> > > > +		dev_err(pcie->dev,
> > > > +			"failed to request bandwidth (%u MBps): %pe\n",
> > > > +			bw, ERR_PTR(err));
> > >=20
> > > So you don't want to error out if this fails?
> >=20
> > No. This is not a fatal error and the system will continue to work,
> > albeit perhaps at suboptimal performance. Given that Ethernet and mass
> > storage are connected to these, a failure to set the bandwidth and
> > erroring out here may leave the system unusable, but continuing on would
> > let the system boot and update firmware, kernel or whatever to recover.
> >=20
> > I'll add a comment explaining this.
> >=20
>=20
> Yeah, that'll help.

Done.

[...]
> > > s/link/controller or endpoint?
> >=20
> > This controls the PERST# signal, so I guess "endpoint" would be more
> > correct.
> >=20
>=20
> Yes!

Done.

[...]
> > > > +	if (!pcie->link_up)
> > > > +		goto free;
> > >=20
> > > goto free_ecam;
> >=20
> > It's not clear to me, but are you suggesting to rename the existing
> > "free" label to "free_ecam"? I can do that.
> >=20
>=20
> Yeah, I was just asking for a rename.

Done.

[...]
> > > > +static int tegra264_pcie_resume_noirq(struct device *dev)
> > > > +{
> > > > +	struct tegra264_pcie *pcie =3D dev_get_drvdata(dev);
> > > > +	int err;
> > > > +
> > > > +	if (pcie->wake_gpio && device_may_wakeup(dev)) {
> > > > +		err =3D disable_irq_wake(pcie->wake_irq);
> > > > +		if (err < 0)
> > > > +			dev_err(dev, "failed to disable wake IRQ: %pe\n",
> > > > +				ERR_PTR(err));
> > > > +	}
> > > > +
> > > > +	if (pcie->link_up =3D=3D false)
> > > > +		return 0;
> > > > +
> > > > +	tegra264_pcie_init(pcie);
> > > > +
> > >=20
> > > Why do you need init() here without deinit() in tegra264_pcie_suspend=
_noirq()?
> >=20
> > That's because when we come out of suspend the link may have gone down
> > again, so we need to take the endpoint out of reset to retrigger the
> > link training. I think we could possibly explicitly clear that PERST_O_N
> > bit in the PERST_CONTROL register in a new tegra264_pcie_deinit() to
> > mirror what tegra264_pcie_init() does, but it's automatically done by
> > firmware anyway, so not needed.
> >=20
>=20
> Hmm, so firmware asserts PERST# at the end of suspend? It is not clear to=
 me why
> it is doing so. But for symmetry I'd like to do it in tegra264_pcie_deini=
t().

Done.

> Also, I'm not certain about the 'pcie->link_up' check here. If it is 'fal=
se',
> then probe() should've failed. So why do you need the check here anyway?
>=20
> Maybe you should get rid of this check and return the link status from
> tegra264_pcie_init() directly?

We specifically don't want to fail the probe for this when the link is
not there because we want to tighly control the power mode when the link
is not up. We also need to keep the link alive for the case where it can
be hotplug capable.

I've added a new tegra264_pcie_deinit() function to clear that PERST_O_N
bit explicitly, but I've kept the link_up flag.

Thanks,
Thierry

--zyj365btmhllqxkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoVXQgACgkQ3SOs138+
s6GQqA/+KSnsckn3+QROPSYwl6WFhBwH/d766AWMTz1MGrQhNGuXXph5WZDZlNHq
qDbOjvCc0NtpXT5MDRWoBJYWiuzqHwgqOrsWprV2Vyb1omZHV8pWgJwDVDFOez0J
FKTX96dA+6vwIyFfUb+7H4Uv2F6yeG11pBHMmZD/EWmXWDGUMp5u9jSCvh1sHenC
c4hLaL4SozZnTnvtZlxTE+hw8OQ48YU912lY3SzAbLKy/f4wtgYJMwFv8rkrT19s
n8tZsOaqjCJaLl4/ugYCSusB29JlMwFdW0tn5pvX3zivBELigovK+3IX6a45TKHE
cPfWT7tk2AxpDyGBpV6U7OCwQKvIcsybni3ezlk6uEThZMbUyyEmA3tQ7lbMj6gA
kr6VLCSiYZmKUIVHtSw3Lj1v3XsuTomcSn4hgsb2sFFQwWiIAO2B+JCbexeY1Ljs
mwaM9we7rAAFXR15OELuuqFxobE/SlcWvLKUI99wfumNaKnQskBtnVYnIIxGmhgj
bPQCesXH3pb08C8XZcFDF/2aqD4myzgldJcz09pu+6y0pqREz91HQ/YsUpRjZgKp
i7OYSOyo8nb2kN9GDrIUWTf7wOXIWppJrAuWqyiwOjnm/dV7L9si4iPbV57Z2its
YS3B1Stbq3LJJABBKpFp04HTbOnxCk2Mg80CNLAnuV/JqdPCfrY=
=WV2r
-----END PGP SIGNATURE-----

--zyj365btmhllqxkn--
