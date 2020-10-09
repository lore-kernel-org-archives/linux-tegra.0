Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF89C433DF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85DCE222B8
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwXhEoXG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388496AbgJIM0C (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388452AbgJIM0B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 08:26:01 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F37DC0613D2;
        Fri,  9 Oct 2020 05:26:01 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id lw21so12790278ejb.6;
        Fri, 09 Oct 2020 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vxWvga10iK++hQGsOFVlXKsQyXZ7GztSMmrf028ztk4=;
        b=NwXhEoXGxC+R37EfS1lfuy3g8wbdrNmU1E77zfyzc9D/fJwROKORSsZfAQKLCnnOMk
         d5vWXwQRNB4Bi+3zTINWBL0LgydS59ZKZRYp40cKQvY8QiUfAY73FMiBfEWBIGw56R8y
         iS4a2hSi7xRdR5vj0D+RFTrOaiYJ7evxpNryiOknzByilQ9uNIGR+y0R5FUhcVptSfMM
         63P7nk78F1hZKMy+TR1hNm9QyO+zYqHIC3cstDV2l2kqtjSuIyCxdIXx5aF63qupP1vn
         P+WHmPHGzAyyA1lXVqWwtitoHl7b4GiR/PsPmEYg76+c2mfqCWA9pNAP7fV4/QKiLCux
         D0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vxWvga10iK++hQGsOFVlXKsQyXZ7GztSMmrf028ztk4=;
        b=YiyqUlnI1I0zl45UYfE7v7cQue5MEKbEdMFKr91gA8aNwVHgFsaFd9gYJy690CiNua
         Ma2gk7z7j9E1l//6NtSuM5TsoXjpTLZTGBKwPGOobEi4aT2U4AG6dE0SnMMAuLIaX9Hi
         Vy6lbFCKILDFCNXSpm+ENr8iTInjA0FpaDfKyzHalJoQGCXp6oM8qwBSLKnqoQayPe/q
         chHixuBZPDA9r9NVV5Rrwu+7LDXyTLXLQVVHUMNhcFyThciPqc34sD03pbe7/lNpyqJY
         8uUCayWdESuOnLgAVpJB3ihPyv0igybF5T+8dm2Z7Kijf1gUBokbtgtkh2YNBPgfL+KX
         h5yw==
X-Gm-Message-State: AOAM531nLT6aqERUVNUryoCzrQe/iEXp2bw7g+2hwgcG98WSEzAFbKF/
        KDYRfsQYe26WMmhPofDpiYA=
X-Google-Smtp-Source: ABdhPJxkD3KtJ6bfK9EwnyjmX+Fl4PJjDDa08bzc4YEJmViDgYAtnI0ithJ1zzW1tf+4J5V2VWMRNQ==
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr13800241ejq.122.1602246359881;
        Fri, 09 Oct 2020 05:25:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id lb11sm6271626ejb.27.2020.10.09.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:25:58 -0700 (PDT)
Date:   Fri, 9 Oct 2020 14:25:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201009122556.GE458338@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
 <20201005095754.GJ425362@ulmo>
 <20201006010546.GB28640@Asurada-Nvidia>
 <20201008095343.GA2349275@ulmo>
 <20201008211209.GC32140@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <20201008211209.GC32140@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 02:12:10PM -0700, Nicolin Chen wrote:
> On Thu, Oct 08, 2020 at 11:53:43AM +0200, Thierry Reding wrote:
> > On Mon, Oct 05, 2020 at 06:05:46PM -0700, Nicolin Chen wrote:
> > > On Mon, Oct 05, 2020 at 11:57:54AM +0200, Thierry Reding wrote:
> > > > On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> > > > > On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > > > > > 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > > >  static int tegra_smmu_of_xlate(struct device *dev,
> > > > > > >  			       struct of_phandle_args *args)
> > > > > > >  {
> > > > > > > +	struct platform_device *iommu_pdev =3D of_find_device_by_no=
de(args->np);
> > > > > > > +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> > > > > > >  	u32 id =3D args->args[0];
> > > > > > > =20
> > > > > > > +	of_node_put(args->np);
> > > > > >=20
> > > > > > of_find_device_by_node() takes device reference and not the np
> > > > > > reference. This is a bug, please remove of_node_put().
> > > > >=20
> > > > > Looks like so. Replacing it with put_device(&iommu_pdev->dev);
> > > >=20
> > > > Putting the put_device() here is wrong, though. You need to make su=
re
> > > > you keep a reference to it as long as you keep accessing the data t=
hat
> > > > is owned by it.
> > >=20
> > > I am confused. You said in the other reply (to Dmitry) that we do
> > > need to put_device(mc->dev), where mc->dev should be the same as
> > > iommu_pdev->dev. But here your comments sounds that we should not
> > > put_device at all since ->probe_device/group_device/attach_dev()
> > > will use it later.
> >=20
> > You need to call put_device() at some point to release the reference
> > that you acquired by calling of_find_device_by_node(). If you don't
> > release it, you're leaking the reference and the kernel isn't going to
> > know when it's safe to delete the device.
> >=20
> > So what I'm saying is that we either release it here, which isn't quite
> > right because we do reference data relating to the device later on. And
>=20
> I see. A small question here by the way: By looking at other IOMMU
> drivers that are calling driver_find_device_by_fwnode() function,
> I found that most of them put_device right after the function call,
> and dev_get_drvdata() after putting the device..
>=20
> Feels like they are doing it wrongly?

Well, like I said this is somewhat academic because these are all
referencing the IOMMU that by definition still needs to be around
when this code is called, and there's locks in place to ensure
these don't go away. So it's not like these drivers are doing it
wrong, they're just not doing it pedantically right.

>=20
> > because it isn't quite right there should be a reason to justify it,
> > which is that the SMMU parent device is the same as the MC, so the
> > reference count isn't strictly necessary. But that's not quite obvious,
> > so highlighting it in a comment makes sense.
> >=20
> > The other alternative is to not call put_device() here and keep on to
> > the reference as long as you keep using "mc". This might be difficult to
> > implement because it may not be obvious where to release it. I think
> > this is the better alternative, but if it's too complicated to implement
> > it might not be worth it.
>=20
> I feel so too. The dev is got at of_xlate() that does not have an
> obvious counterpart function. So I'll just remove put_device() and
> put a line of comments, as you suggested.

I think you misunderstood. Not calling put_device() would be wrong
because that leaks a reference to the SMMU that you can't get back. My
suggestion was rather to keep put_device() here, but add a comment as to
why it's okay to call the put_device() here, even though you keep using
its private data later beyond this point, which typically would be wrong
to do.

Thierry

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+AVtQACgkQ3SOs138+
s6FyaRAAkt3dP2DNCS6TI3/NevoBQ2IpMYqF1ex7aH/lNxsI1ES7OlWIkSvq7Nbp
OdGJxPgxHA9kvYKCwk6u97yR8TX8erODLYov8YWeIYT4j5QcSS/axChfZJwYScEy
TPMyMZrSoQz89AbZjJ1nXF7pafhPzc+9VI9oyouFL2kwJ5nG7oCmHM+oIswYy5gO
ek1ARsPvwoQu1hBT19wRzaQMgE9TVc/HzaRtjaCbWBAXZSNlScjn3MxuWW4Teo6P
5lG3qhBCof7r374RLMz/7bq5MUndj3R5MuwX1eOVzcJgxVYV+94fjTs4ysawaG7f
vqetJ3RBUHia+rXWZx09T3F0ax+EErEs9cQ94OysiDqdnvMSxb/av8yS0j+rYN2u
ZLOBqTMgfQaVLiTZgehSSYU1wGyId93lWNvH8oQ9VZ032x5ys37j8y5+9IOtufM7
ebDWZwobYybBpr8qVA/odW6gStS5qj7gbUE9GBg06y+VB74UdN8K7YLzr4nYNFgz
HEatjuW3kEIAB/Si2fB/yTBm62HAL7pZ2eGeIDxhFr9d0An5mhTkkUF4eN3GPIyA
gfOkKq+Vfq+0JOFF4GJj1nGB5kV7CON90yy/lZ5Snt5ru2SdQNhhreFAo3v6QhgH
IdtXPzcQLz/qJ+QceSHsqujPWojzkVLkGTJVkzojRKwOv6B1vVw=
=8opr
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
