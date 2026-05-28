Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585AF3E3156;
	Thu, 28 May 2026 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969411; cv=none; b=T6emWcXFSK6lR0r04NRtrHRc8nsSA+BacLDw793M5YxecQE9e2rZclsghEH4Ht997933CQ7fTBj1EcEA+0t/X02gEIJSHGruxz3CQVOwLqTWwXRF/Zaa2rxBtjEjJUV0p5KZe7F7s9I3/F9txh0lpiuamP3dElmgbuPbFIAM6Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969411; c=relaxed/simple;
	bh=6BhpbZNcxlixiACkiUWCG2FqE7ap1CJA76fnSQWO/RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBltGFkzS406GimsHtVsyZz6BUfTp9HbLBkjOAq61mhPCOLT+V5+TJB7e8vC98TeRDkFGR62cNZiRXIXJVddlyw1WrRsVY29gVxXNkorlD2MvQLB9xvk9KrvFB+/R3qSBu3J0M/IC30LACPudr4AhjT5cA8UycErcAmy7zmJDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLc2LzbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLc2LzbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AA81F00A3C;
	Thu, 28 May 2026 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969410;
	bh=2mRzCpBR2PaA1X6/03ZSG1fJEVgwRtfLFdtdpRDimWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XLc2LzbA/3WKsdX4gb443JZoc7QVA2mp/+Hr3LKOJHJDZOFO82/HQYQyxRHO/c+9E
	 rZbAxD9dHgO0u+Uq/MsIN999MbqpzEA+lGmXf/TABTXDIBZpzSFASPOxlLrX+5ZpC5
	 OqcU+Jnn+9n7Cidr+Ntjk7PCd9pNmajk2RqNI5CcjYTSBi2S+t79IDc+qg1NJ/G2bI
	 GPGnwA2Z2d8Ng7N6PGl+7cYg1gwv35owE0+Z/DfGwqOwkVmWHY5G6yzvePMn6n09Wl
	 ifWf3e+EgWGqG7dhpWiaXBypBE4BHRRUES86hRTHAr1DFsytaVC9rgjhQc1Yk+Z5uq
	 G5KGo9Eld2fdA==
Date: Thu, 28 May 2026 13:56:47 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com, 
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	bbasu@nvidia.com
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
Message-ID: <ahgr7EevWJ-unfSV@orome>
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
 <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3avrr65flzcak2ii"
Content-Disposition: inline
In-Reply-To: <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org>


--3avrr65flzcak2ii
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
MIME-Version: 1.0

On Wed, May 27, 2026 at 04:46:38PM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2026 16:21, Sumit Gupta wrote:
> >=20
> > On 27/05/26 18:25, Krzysztof Kozlowski wrote:
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> On 21/05/2026 16:05, Sumit Gupta wrote:
> >>> -             err =3D icc_link_create(node, TEGRA_ICC_MC);
> >>> +             err =3D tegra_mc_icc_link_create(node, node_id, TEGRA_I=
CC_MC);
> >>>                if (err)
> >>>                        goto remove_nodes;
> >>>
> >>> @@ -957,7 +969,13 @@ static int tegra_mc_probe(struct platform_device=
 *pdev)
> >>>        if (IS_ERR(mc->regs))
> >>>                return PTR_ERR(mc->regs);
> >>>
> >>> -     mc->debugfs.root =3D debugfs_create_dir("mc", NULL);
> >>> +     if (!mc_debugfs_root)
> >> That's a probe path and you created a singletone. Looks like preventing
> >> async probing for no real reason.
> >>
> >> I am very against singletons and debugfs does not look like justified
> >> exception.
> >=20
> > The singleton was added so multi-socket MC/EMC instances could
> > share a "mc"/"emc" parent. I'll drop it in v2.
> >=20
> > On single-socket SoCs, the "mc"/"emc" names will be unchanged.
> > On multi-socket SoCs, each instance will create a top-level debugfs
> > dir named with dev_name(). Same pattern in tegra186-emc.c.
> >=20
> >  =C2=A0 if (dev_to_node(mc->dev) =3D=3D NUMA_NO_NODE)
> >  =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir("mc", NUL=
L);
> >  =C2=A0 else
> >  =C2=A0 =C2=A0 =C2=A0 mc->debugfs.root =3D debugfs_create_dir(dev_name(=
mc->dev), NULL);
>=20
> You assume this is fully synced, so you as well could do a look up and
> then use what you found or create new dir. If you think that is racy, so
> is this approach... How are other drivers handling per-device debugfs
> directories? Do they also create such in the top-level? I think no.

I think we want a top-level directory for a bit more structure in
debugfs. But I also think we want to create that top-level directory in
the module's init function rather than _probe. Granted, that means we
can't use any of those helper macros, but we don't use that for the MC
driver anyway.

Thierry

--3avrr65flzcak2ii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYLX8ACgkQ3SOs138+
s6HmYRAAp0bWGywahhps0yImTcXTja1jDtCiw2FHvwwmBSL3qNA5iVvUp/50op1i
NjocKZLh7n3xAvyog68sx9SrJzNwxVyJI+cNmES1ozZbp83frcRXdk3zKs7UpCzj
CnSGgSRgLcRThMAd6oNykDJsM7/KtSxjHau5Sqy10RqSaIgCNZFWKNDPPBVUmKfC
bwilxsfPxXXa7jF2/v3++vX3oXEKEN1GNyYLW6chyhFyedzDDEQlm/4aVmNvr3+d
v3VXn5hIGWrLBnMXGQaEzAkFZZ6npFbgFdVffBM1EiOTTLo7XnU7ULJ7ErnkDcGD
cMNzuKa38CIb0wUPrIuFWa7pL/JHzX0dy3hIhPBuc38NJTKDPC/eGvYrRXbjQci5
6PK0sI/zG5NGXpZgSIH0eD3bUfHZaxBKOlh05lrfeFUpC23zgY5lJas3mhblTc2p
soHOJUpdCmGws9HJCPOIXqqK99BsbA/nm2LYoJ3B87UAP0bNblmLjCx+7Ttwsyqg
BaxSLA2llD+F2AeJuye7+OwzK4rsQ3TkH2zSaf5Ox2NEYiivjmLglzaecRQ5KbxK
fN8HjQJMayQYL4AZ/kwUWFP3JM4hwlWbXazfTMvcjmuVluhMD2Vv+K/8EkEaThEe
ZURdcZ10ikJutDx/LmJVHWdBE5mYMEUaEQdpqoDJhkxcln0pZXQ=
=gAQN
-----END PGP SIGNATURE-----

--3avrr65flzcak2ii--
