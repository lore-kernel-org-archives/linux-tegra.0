Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3FFC4727C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E31B7208B8
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVa3j7DF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgJAJwA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 05:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAJwA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 05:52:00 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA85CC0613D0;
        Thu,  1 Oct 2020 02:51:59 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p9so7076805ejf.6;
        Thu, 01 Oct 2020 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aPY+MyaN3eHD52C4pGO+iu+NSxmmOLBQGpmRY1viv6c=;
        b=bVa3j7DFaJdudCtmoiaTsVjk7lsQZkfEAlX8wmufqsJVZ1hTWHFjKyzxTuSzbNqBfL
         VN6JoknzhePNt/5Pb+Rrm5QrIIIwQ5X6sOu3jUB8X46wSVeZ+tSY7vfFeLuG8bTeFnNa
         U8Clrrec+YrqQvOkNALd1taQ0uurzd7rfN1wfysg3/rY9N1PB/cJhPPqzG8PPHdxWjr6
         EarFIZigBkgyWtYqgrWAurK2ArZNVNX8p7AROwzjbGztxW5TW2h1cSMPirlqGs4b01Dn
         YFXQUwS5UMRkXfghSPMLpx0bkT6rlc++RXl5lRf0vi1HYm0x5yqS6SvZSKk6rLCwu2p2
         z9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aPY+MyaN3eHD52C4pGO+iu+NSxmmOLBQGpmRY1viv6c=;
        b=KnR/dSrR6yv+f7bPGrwcGKQeGCBpHW+UllftaMAugnFaDvV8iLHCzarYa0Ry2c8GEB
         ofv7dBmecPIlUJXNvgU3HFiz1o3PGBfLIdO2gcaFHVhG27hPdT1DsDimB5DUFv2YHSMY
         LMFsjlVWhv9xlK/dpuO04dc8S/Cge6JKFrOfDuiH8MJdXtsmIbPfQSZ8mPecsLMnYDEg
         iWnh/R0imVUJhPjQu+jROdxnWgYfvubEC26/x8ZUYF/3wKoluKJYwrj8JhCmWLMW1rPL
         5/jfR/czo43bFJ4EhZt21ACJ1z8kWFghwF+lvZ742iQzo2xI9MagFwLxz2Dmd2BmqLQ7
         G6qQ==
X-Gm-Message-State: AOAM533vtdYjzZwezil5UvmE5/q74Hhd4zEZIHi3elIrmOamMfOlITqb
        /hVgBK7GBEBKopBwg3gaBl4=
X-Google-Smtp-Source: ABdhPJx+7eAB9ejqZO0LRBbDrS6HTe/2rWdJAxOZl3urF2SeUR0xFxi5gkfUXGyNtvkYSnLmQi2Flg==
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr7368299ejb.225.1601545918322;
        Thu, 01 Oct 2020 02:51:58 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a2sm3705187ejx.27.2020.10.01.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:51:57 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:51:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001095152.GD3919720@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <20201001012630.GA28240@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 06:26:30PM -0700, Nicolin Chen wrote:
> On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
> > 01.10.2020 00:32, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
> > >> ...
> > >>>> It looks to me like the only reason why you need this new global A=
PI is
> > >>>> because PCI devices may not have a device tree node with a phandle=
 to
> > >>>> the IOMMU. However, SMMU support for PCI will only be enabled if t=
he
> > >>>> root complex has an iommus property, right? In that case, can't we
> > >>>> simply do something like this:
> > >>>>
> > >>>> 	if (dev_is_pci(dev))
> > >>>> 		np =3D find_host_bridge(dev)->of_node;
> > >>>> 	else
> > >>>> 		np =3D dev->of_node;
> > >>>>
> > >>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm =
pretty
> > >>>> sure that exists.
> > >>>>
> > >>>> Once we have that we can still iterate over the iommus property an=
d do
> > >>>> not need to rely on this global variable.
> > >>>
> > >>> I agree that it'd work. But I was hoping to simplify the code
> > >>> here if it's possible. Looks like we have an argument on this
> > >>> so I will choose to go with your suggestion above for now.
> > >>
> > >> This patch removed more lines than were added. If this will be oppos=
ite
> > >> for the Thierry's suggestion, then it's probably not a great suggest=
ion.
> > >=20
> > > Sorry, I don't quite understand this comments. Would you please
> > > elaborate what's this "it" being "not a great suggestion"?
> > >=20
> >=20
> > I meant that you should try to implement Thierry's solution, but if the
> > end result will be worse than the current patch, then you shouldn't make
> > a v4, but get back to this discussion in order to choose the best option
> > and make everyone agree on it.
>=20
> I see. Thanks for the reply. And here is a sample implementation:
>=20
> @@ -814,12 +815,15 @@ static struct tegra_smmu *tegra_smmu_find(struct de=
vice_node *np)
>  }
> =20
>  static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *=
dev,
> -				struct of_phandle_args *args)
> +				struct of_phandle_args *args, struct fwnode_handle *fwnode)
>  {
>  	const struct iommu_ops *ops =3D smmu->iommu.ops;
>  	int err;
> =20
> -	err =3D iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
> +	if (!fwnode)
> +		return -ENOENT;
> +
> +	err =3D iommu_fwspec_init(dev, fwnode, ops);
>  	if (err < 0) {
>  		dev_err(dev, "failed to initialize fwspec: %d\n", err);
>  		return err;
> @@ -835,6 +839,19 @@ static int tegra_smmu_configure(struct tegra_smmu *s=
mmu, struct device *dev,
>  	return 0;
>  }
> =20
> +static struct device_node *tegra_smmu_find_pci_np(struct pci_dev *pci_de=
v)
> +{
> +	struct pci_bus *bus =3D pci_dev->bus;
> +	struct device *dev =3D &bus->dev;
> +
> +	while (!of_property_read_bool(dev->of_node, "iommus") && bus->parent) {
> +		dev =3D &bus->parent->dev;
> +		bus =3D bus->parent;
> +	}
> +
> +	return dev->of_node;
> +}

This seems like it's the equivalent of pci_get_host_bridge_device(). Can
you use that instead? I think you might use the parent of the host
bridge that's returned from that function, though.

Thierry

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91prcACgkQ3SOs138+
s6Fzow/9EGA/miigYk1RYGKaX6nN8Jl2bZRTKfwp0TTaegw7NEya34qmC1q6Ifou
MRCbSPSDXC97bkOQ5dZloJvAnv1mzZd+79ihEEGGeoEwkGk2FqA99/1vTSKYK+58
MN1A2NY1DtOD6yoRsJbfjI7tc+Embd3aymXaI/gT9yOYPRd9z/0Fg+FoJudUIEhE
Gs+AP0VCpre0XkRDiq1mONE74lgcfidMp6wXHLWNdbJ6OjK87xgqFQZ0tD1Y0ecS
MS1dttMszm3S43a/1QdY0Qr9p0Nxl6KgDRtmez2ELTY8n63vfslQ4RDd+Om/++nW
divpQqi3W8dYtHE9CwEI45mtUlJSMTup+ThfYJ4/O6sh/JDSIYxX9ligNEsySpsy
5ZHIsEE77tdFSwynk7oxnHCBYkLo/qp5CvW5t+e1hx8Cf2Jaj6gQ5YjAxbOBy2Zk
8tGdm7d5XhJjyPzWq1q5nHBY2iEi7PAQlmAurHJkTTujYc318H1Xp3NYgKThdFGd
SueTpE1dIouqFpVdp3hks8jzFSqOP0tjOAHBW2OVm3r0EseG8W6uXvoYUF8FN9ui
ajYqfqrtpUrfdOGnEqCClmUbOoJvb9nnzI861SLYEv9OZJ0ag4Pwic4wf5XEl8CM
M/AdWcldy82Bbhr0KmmP6Av7/DBSjIM2RskCiOHvfFnMWQ+YfnI=
=eSx1
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
