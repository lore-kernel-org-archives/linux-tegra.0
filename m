Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DDAC433E7
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:53:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F97721531
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 09:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMr1Kaur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgJHJxs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 05:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgJHJxr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Oct 2020 05:53:47 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78203C061755;
        Thu,  8 Oct 2020 02:53:47 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l16so5185545eds.3;
        Thu, 08 Oct 2020 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lqr4ABnW85C3Je0foNXfCbbtgfxpQ2jxIk+IuODdI2Y=;
        b=OMr1Kaur1CMf3Bb2u6SfXVx0so8WS0J5PYKBVqjDMN61IiUVUNdeSZFfI0RtDQvTHr
         +pBjVdv6Mv3lJ6t8n2V2n4mLIcxGnVmy1YFKVp1TsnjM985AztiOkmHTz817n364jcBF
         dP+b8uct4rxtwDJCZqUE4WZ+UpcYWHaQf/7WgMs64G8T4kNugx4ZKOq/Uk49+R921rX0
         og0H/B7hR7VkthHvHPQ/B0tRSOaZJrr99GbreVQkb1s+O4jkVs9HoMfLhrRHFrFVxXFh
         no4UnkO343TxtLCWtpgDFm+7P9O0AklpSpxfVFB3dQ+ynS8qdLs3zSE/Tw9lzKeo+Qqr
         5U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lqr4ABnW85C3Je0foNXfCbbtgfxpQ2jxIk+IuODdI2Y=;
        b=W6Qcrb4xG66JwYYgaER5Bx67bCeednVLX0QfUqKAHwBCr9Ukik51/7OPEK2tuaFeyn
         gscrLkKrsdMwTIzg6OAuelJ1yZjG6PsN8G9B8jvg55MLHkPaxkvmr8op6uhWyMuKnhMD
         sJuby9SuJxQC3FdV8JQ93A/TO6fZcJNgbnxMwwTY8GL5R2DLp5Ep+J0nozLBpJMyCvTk
         1hgZb/lSb3rjYI910L0lA430VlVppnMLigkuJRFCqocNVzuAtwiS7sR/03aeBdKNXBH9
         I84j4xADhaw09/dS6Heh2gsV2xTl01l8OWqlKfyoyMa1OSoTNyaH+17nlCW9S/v0jw4d
         vhuw==
X-Gm-Message-State: AOAM533HjNGo2weoZIOLYKU1F/f72tO2DE3hEv+7nLTWSn5y19j/+Vv9
        kQZbQMp3I1AcEHXoYBhQfPw=
X-Google-Smtp-Source: ABdhPJwXAgXumiQ2YlXTkZUA5rbcE6A65/i02wvNNq8+5V40qJvkjd4wlCjH7H2R/YojN/w30Pdeaw==
X-Received: by 2002:aa7:c447:: with SMTP id n7mr8110557edr.134.1602150826103;
        Thu, 08 Oct 2020 02:53:46 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id dm8sm3553145edb.57.2020.10.08.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 02:53:44 -0700 (PDT)
Date:   Thu, 8 Oct 2020 11:53:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201008095343.GA2349275@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <5542b314-f414-1e83-8cf6-2bf22a41ae9c@gmail.com>
 <20201002185828.GC29706@Asurada-Nvidia>
 <20201005095754.GJ425362@ulmo>
 <20201006010546.GB28640@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20201006010546.GB28640@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 06:05:46PM -0700, Nicolin Chen wrote:
> On Mon, Oct 05, 2020 at 11:57:54AM +0200, Thierry Reding wrote:
> > On Fri, Oct 02, 2020 at 11:58:29AM -0700, Nicolin Chen wrote:
> > > On Fri, Oct 02, 2020 at 06:02:18PM +0300, Dmitry Osipenko wrote:
> > > > 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > >  static int tegra_smmu_of_xlate(struct device *dev,
> > > > >  			       struct of_phandle_args *args)
> > > > >  {
> > > > > +	struct platform_device *iommu_pdev =3D of_find_device_by_node(a=
rgs->np);
> > > > > +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> > > > >  	u32 id =3D args->args[0];
> > > > > =20
> > > > > +	of_node_put(args->np);
> > > >=20
> > > > of_find_device_by_node() takes device reference and not the np
> > > > reference. This is a bug, please remove of_node_put().
> > >=20
> > > Looks like so. Replacing it with put_device(&iommu_pdev->dev);
> >=20
> > Putting the put_device() here is wrong, though. You need to make sure
> > you keep a reference to it as long as you keep accessing the data that
> > is owned by it.
>=20
> I am confused. You said in the other reply (to Dmitry) that we do
> need to put_device(mc->dev), where mc->dev should be the same as
> iommu_pdev->dev. But here your comments sounds that we should not
> put_device at all since ->probe_device/group_device/attach_dev()
> will use it later.

You need to call put_device() at some point to release the reference
that you acquired by calling of_find_device_by_node(). If you don't
release it, you're leaking the reference and the kernel isn't going to
know when it's safe to delete the device.

So what I'm saying is that we either release it here, which isn't quite
right because we do reference data relating to the device later on. And
because it isn't quite right there should be a reason to justify it,
which is that the SMMU parent device is the same as the MC, so the
reference count isn't strictly necessary. But that's not quite obvious,
so highlighting it in a comment makes sense.

The other alternative is to not call put_device() here and keep on to
the reference as long as you keep using "mc". This might be difficult to
implement because it may not be obvious where to release it. I think
this is the better alternative, but if it's too complicated to implement
it might not be worth it.

> > Like I said earlier, this is a bit weird in this case because we're
> > self-referencing, so iommu_pdev->dev is going to stay around as long as
> > the SMMU is. However, it might be worth to properly track the lifetime
> > anyway just so that the code can serve as a good example of how to do
> > things.
>=20
> What's this "track-the-lifetime"?

This basically just means that SMMU needs to ensure that MC stays alive
(by holding a reference to it) as long as SMMU uses it. If the last
reference to MC is dropped, then the mc pointer and potentially anything
that it points to will become dangling. If you were to drop the last
reference at this point, then on the next line the mc pointer could
already be invalid.

That's how it generally works, anyway. What's special about this use-
case is that the SMMU and MC are the same device, so it should be safe
to omit this additional tracking because the IOMMU tracking should take
care of that already.

> > If you decide to go for the shortcut and not track this reference
> > properly, then at least you need to add a comment as to why it is safe
> > to do in this case. This ensures that readers are away of the
> > circumstances and don't copy this bad code into a context where the
> > circumstances are different.
>=20
> I don't quite get this "shortcut" here either...mind elaborating?

The shortcut is taking advantage of the knowledge that the SMMU and the
MC are the same device and therefore not properly track the MC object.
Given that their code is located in different locations, this isn't
obvious to the casual reader of the code, so they may assume that this
is the normal way to do things. To avoid that, the code should have a
comment explaining why that is.

Thierry

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9+4aIACgkQ3SOs138+
s6HueQ/+IOZaomOI+NW0LwMajWW2zjW4gBRAz5bNFuobcJxakAdxvpd+HqnE//XM
GZ1AdJsC31UjUcaSzyyYNr87aCBjadMOTdUkgPOTl7hplEOMY8tt4aFa0AQwCjqF
FvtoCeMZ1fQsTAaq7FLChGrNi2zeHuUS7LMSM1W8ZStUSWqrHvN08fbV+hxy+ikK
FxS+9YrAdxVlnzIczrtceOE8AwmtYk8KouHi81UXSUxqesjBaJZUoo7acF4GwfMC
pTWmuwckCRW51yx9KSZnQJk+vZrQ0BKw4rhDPrwWnIL180fL74Q53A7Z7LuPTdi7
E4D6cNh70nWgJBUTo2Gq3YYKawhZOTSsGyWIvhQiGL3NVlRdYdzk1sa9hvCl/owk
88ERcDSkO82WNapN9ugABK9PYZWdlH9UxdzcTd35r6h/uX6yWogZhC4Mu6kw31bg
2zs7LOQq5nGZgoIB3YriFxLN/HzoVnLV6BYNX7/ZZhMENBpVHh1M3A0u5YUzOxrL
yMgfabkWJSopA2vMbsS/sLVHCQyfjjeQq9lOFNph0mooeUqisiMT5/FE4GCDFIK1
T8vPohPrtu7X5qDms5eoieet0+NfuvUUEFKa8SmAN3NoNQmsuQaFUP6zzEIqj9Ci
zuN3m2IIkv+53g+02oz52FUa4t5V+GvCMrkzqJ3i8mtXUbNCess=
=P2RE
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
