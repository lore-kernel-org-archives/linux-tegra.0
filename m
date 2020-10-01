Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1782C4727F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 10:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8D30207DE
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 10:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezLB0wHe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgJAKmu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKmt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 06:42:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752E3C0613D0;
        Thu,  1 Oct 2020 03:42:49 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id qp15so6394038ejb.3;
        Thu, 01 Oct 2020 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9FRk996kXmbCzurLgfmc69GteLgu6w7P0PxV4KREbKU=;
        b=ezLB0wHeQycBgR4B82GsRYhJdyRuIrQO/bEY3AK0zylTRyV9jk2lLGCNi0FcqQUX0m
         lwJPqOXwFyCNTQ4N/riLCvrDypHNnX3ilv8IdIUIRKWLsoCUdu0qoERi6ysmWkBMcyeX
         SuZlS/ML3/Pa72QDt8aBVVtAcxHjnwg46fEG+86CrFJnqGmj3ERUiclv9x9VDAMQBoJ0
         143cpVYXeOyUJ2nhX/ehvjnV/DtF74zqg+lWyDMAtlajyFg+MfDe7zWKEUwbKO+aeX2t
         KA89WAedtn6M6JqElCbDhz96UV2/2/YAmu+rVRH5//Nnp8w7ZYjO+o0QQIAj3PdSTYx1
         resQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9FRk996kXmbCzurLgfmc69GteLgu6w7P0PxV4KREbKU=;
        b=skqFIEpWyLMoNotllFMg5eoksSqJLysk0o0QYPreXLdNsx03o9I/0+boK0hCNe48up
         KOi2BfutMFgMS8IBaZ7VpxPAcwhBwu6Up1Eo6y9z1QjiefoBQt2blCBEnnv08WUjWrLh
         XKHYmlgx6HalSm313Pjz5so7qBXpQXHCr1e7PC5ZTXnU3Np9hgvRqHkfy8tRRs5ClUa/
         rqnnrTm+7AE/31KRySdR7MIxyD8sL/oc4SxyMT5ZlI/AqyueP9gbdYtVbEkrbvsAVD3F
         Ju7LQ3ezrKaHV/vDXv3xEm1IEi04ftitacIjl13ikZyJFQa+mxxZ2A1/CdM5l5nYJLjV
         GQ/Q==
X-Gm-Message-State: AOAM532Zxgot8uQbqxlb52Kskzr4B8tXrtZ4DVnjdy3RQNWS7JtzTdBn
        l6oWco7EJR4kTP44jUspvf4=
X-Google-Smtp-Source: ABdhPJztC9jjH9+YEmm5LclGKIWab3URIaKWAnjYnPTVujhZMKa5c1lry+BELJRJ6vyR4iX/Kt2SKg==
X-Received: by 2002:a17:906:5490:: with SMTP id r16mr7088359ejo.222.1601548968063;
        Thu, 01 Oct 2020 03:42:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id p10sm3879845ejy.68.2020.10.01.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:42:46 -0700 (PDT)
Date:   Thu, 1 Oct 2020 12:42:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001104245.GA3939583@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <20201001095152.GD3919720@ulmo>
 <20201001103318.GA1272@Asurada>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <20201001103318.GA1272@Asurada>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 03:33:19AM -0700, Nicolin Chen wrote:
> On Thu, Oct 01, 2020 at 11:51:52AM +0200, Thierry Reding wrote:
> > > > >> ...
> > > > >>>> It looks to me like the only reason why you need this new glob=
al API is
> > > > >>>> because PCI devices may not have a device tree node with a pha=
ndle to
> > > > >>>> the IOMMU. However, SMMU support for PCI will only be enabled =
if the
> > > > >>>> root complex has an iommus property, right? In that case, can'=
t we
> > > > >>>> simply do something like this:
> > > > >>>>
> > > > >>>> 	if (dev_is_pci(dev))
> > > > >>>> 		np =3D find_host_bridge(dev)->of_node;
> > > > >>>> 	else
> > > > >>>> 		np =3D dev->of_node;
> > > > >>>>
> > > > >>>> ? I'm not sure exactly what find_host_bridge() is called, but =
I'm pretty
> > > > >>>> sure that exists.
>=20
> > > @@ -814,12 +815,15 @@ static struct tegra_smmu *tegra_smmu_find(struc=
t device_node *np)
> > >  }
> > > =20
> > >  static int tegra_smmu_configure(struct tegra_smmu *smmu, struct devi=
ce *dev,
> > > -				struct of_phandle_args *args)
> > > +				struct of_phandle_args *args, struct fwnode_handle *fwnode)
> > >  {
> > >  	const struct iommu_ops *ops =3D smmu->iommu.ops;
> > >  	int err;
> > > =20
> > > -	err =3D iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
> > > +	if (!fwnode)
> > > +		return -ENOENT;
> > > +
> > > +	err =3D iommu_fwspec_init(dev, fwnode, ops);
> > >  	if (err < 0) {
> > >  		dev_err(dev, "failed to initialize fwspec: %d\n", err);
> > >  		return err;
> > > @@ -835,6 +839,19 @@ static int tegra_smmu_configure(struct tegra_smm=
u *smmu, struct device *dev,
> > >  	return 0;
> > >  }
> > > =20
> > > +static struct device_node *tegra_smmu_find_pci_np(struct pci_dev *pc=
i_dev)
> > > +{
> > > +	struct pci_bus *bus =3D pci_dev->bus;
> > > +	struct device *dev =3D &bus->dev;
> > > +
> > > +	while (!of_property_read_bool(dev->of_node, "iommus") && bus->paren=
t) {
> > > +		dev =3D &bus->parent->dev;
> > > +		bus =3D bus->parent;
> > > +	}
> > > +
> > > +	return dev->of_node;
> > > +}
> >=20
> > This seems like it's the equivalent of pci_get_host_bridge_device(). Can
> > you use that instead? I think you might use the parent of the host
> > bridge that's returned from that function, though.
>=20
> I noticed that one when looking up one of the of_ functions, yet
> also found that this pci_get_host_bridge_device() is privated by
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/drivers/pci/pci.h?id=3D975e1ac173058b8710e5979e97fc1397233301f3
>=20
> Would PCI folks be that willing to (allow to) revert it?

Yeah, sounds like that would be useful. If you do, perhaps also take the
opportunity to replace open-coded variants, such as the one in arm-smmu.

Either that, or open-code this in tegra-smmu, like arm-smmu does.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91sqIACgkQ3SOs138+
s6FgMxAAkIAlSJhQY18t0HvstNKYU9tcVJ3N3mpV2YgENuKOh2v4DOxfKpIIbHLL
WvIce8RTWXwiSuC76X2fIaYOVU4PrgN1vfeXuL41bB0bVancNgSbRbnERWUIamgx
N60bL5sA4HDU8nJ4nqpqWzrGwqVmFArMyF75AypIfc83rMDyjXJ2tEQJjS2tO9nb
tZk5Prg0Yjy/2AOYjoZJjp1rpWkcW4lNTPnTopzWM9GJCbDs/Vr39Lii3zo0iOMS
Mvwb7GPpr7yAwTtslusaXbpd2Zi+GLvwvirP7dx8u7fPu9CMMsznLgzkGhK/Qh9G
xNNCv36GREUS0jMJ3ft5D/1+rnYg+xrCbHywkJGoELIRqZdlb6SHGGD2sF+/uR5y
6R3WSnHA9PPWoFBhpoGGChC7CjyN/RynCDnbnFlCPJ2RaC75K6uAWHQO4GhBWRK5
ldtE+H6p9vRLEvnz6tYwNjKj0dnRYRGoPnmn7WPm/j1dvWzLYpoK+DDjZtQnXLWH
+mUbOIP0z1Ih8WWaM/MIaMOpFWJZqxUz/A3J0ztuJU+7ltZUVHnNGWkHsF4ozZGA
k0UHLN7PJMyjAaUnrMW7KRUjExQimv3jOoMWW4PhJdcnI3rj5yl+HhJVVJUXfSbl
8KsU91Fevsot/r2oxL8zOXUy1FsuTaN2EWEWIi/Zk+Cafblog98=
=znw9
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
