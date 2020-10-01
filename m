Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F36BC4727C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A68F208B8
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 09:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qctVyxiX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731611AbgJAJyf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 05:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAJye (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 05:54:34 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF52C0613D0;
        Thu,  1 Oct 2020 02:54:32 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id 33so4595764edq.13;
        Thu, 01 Oct 2020 02:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=efGqsffX4u9vH950l+RdFnOqEZhHr145ZOrzjBNbZJQ=;
        b=qctVyxiXQeQzGQC0kaWPpGiSXNd+AqHeiD9piKQPIWef2I8izx2d6KiSytItvh0RlT
         gl53jtEUXVjbulz/hVicyNHRcmWVdqpOhFYKjv/KBsD3WOCVUnv1PVNVHn7GipJwOHTZ
         r40sbW8fBWoXohBcp7D3ccagMDwsZRl1NtHQ0etxuD9nOmWdvYJKEEfsBREZu+yYZi+r
         5WQOS/wCWwPnHxqZ+nPJ8FyusXKQQTIQdtNgR4Enc+Jhusk5MtJaFCO1cZQeooyeDs7B
         IXFpx3uFm/fnJzb2fJ3gcL4tEpTRuKuUvvDrNd468wbMQyBJpR82R30XdskrYm0lcpo+
         hNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=efGqsffX4u9vH950l+RdFnOqEZhHr145ZOrzjBNbZJQ=;
        b=gHd8q5OPrtF/i1zxc9Bavev2VjWYfHTusdO0d7kfFY78LNI2DEW+GcMQ2f1D89dhbg
         /1voqC+7Gabsyhb/4PiLXW729V4+vFDYcmMLrjI4nN0QaYB6sOGWIYl+AGkgJYiABjSv
         5hDlwarkTwjnmeFxvNCV9HXGWvUWCBtyMkl9oNKC5dmXCndttxtZeKXpFxcN6jkMGyOq
         v6/89Myf3fZtrCmyzVbM3A/q1VED8O1ygLUUz5CLqjNMkWv2dTWsrk0QTwIQLYsR3WHY
         lurB5cknITpnh2Yrjcm8Pixy0S+sA2MH6a9OZD4Uzgtt0rPIJMCB4XfkBLvGSCwRHF+u
         czTQ==
X-Gm-Message-State: AOAM532SOxrgMqN8cYgPKbcQA1L3jxUiPiXvvDEBPgnVwJwiAxeWDMwk
        vJHBA7yMSYm+q9D0vqqgRyA=
X-Google-Smtp-Source: ABdhPJzJPPAnIKfFwlj9N9xDoFpsYFaqOQ8/fWOTsMXVKq+2zk3e1FIgvsrkW2LL08v60lYvozYplA==
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr7323346edi.148.1601546071606;
        Thu, 01 Oct 2020 02:54:31 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id hk1sm3732258ejb.20.2020.10.01.02.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:54:30 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:54:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001095428.GE3919720@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Content-Disposition: inline
In-Reply-To: <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 05:06:19AM +0300, Dmitry Osipenko wrote:
> 01.10.2020 04:26, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
> >> 01.10.2020 00:32, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
> >>>> ...
> >>>>>> It looks to me like the only reason why you need this new global A=
PI is
> >>>>>> because PCI devices may not have a device tree node with a phandle=
 to
> >>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if t=
he
> >>>>>> root complex has an iommus property, right? In that case, can't we
> >>>>>> simply do something like this:
> >>>>>>
> >>>>>> 	if (dev_is_pci(dev))
> >>>>>> 		np =3D find_host_bridge(dev)->of_node;
> >>>>>> 	else
> >>>>>> 		np =3D dev->of_node;
> >>>>>>
> >>>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm =
pretty
> >>>>>> sure that exists.
> >>>>>>
> >>>>>> Once we have that we can still iterate over the iommus property an=
d do
> >>>>>> not need to rely on this global variable.
> >>>>>
> >>>>> I agree that it'd work. But I was hoping to simplify the code
> >>>>> here if it's possible. Looks like we have an argument on this
> >>>>> so I will choose to go with your suggestion above for now.
> >>>>
> >>>> This patch removed more lines than were added. If this will be oppos=
ite
> >>>> for the Thierry's suggestion, then it's probably not a great suggest=
ion.
> >>>
> >>> Sorry, I don't quite understand this comments. Would you please
> >>> elaborate what's this "it" being "not a great suggestion"?
> >>>
> >>
> >> I meant that you should try to implement Thierry's solution, but if the
> >> end result will be worse than the current patch, then you shouldn't ma=
ke
> >> a v4, but get back to this discussion in order to choose the best opti=
on
> >> and make everyone agree on it.
> >=20
> > I see. Thanks for the reply. And here is a sample implementation:
>=20
> That's what I supposed to happen :) The new variant adds code and
> complexity, while old did the opposite. Hence the old variant is clearly
> more attractive, IMO.

Surely code size can't be the only measure of good code. You can fit the
above on even fewer lines if you sacrifice readability. In this case you
can strip away those lines because you're effectively using a global
variable.

So there's always a compromise and I think in this case it's not a good
one because we sacrifice explicit code that clearly documents what's
going on with less code that's a bit handwavy about what's happening.

Thierry

--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91p1QACgkQ3SOs138+
s6H6PQ/9EI9ebHo2iciyjJUWVjuWPHOF3R3eyAltPRg8zAk9kVxzzmMyBVHzVNxY
eaz+zf8CRUdYa5UNMfRmpRSJRoHNpJxWedVDhGkKEPQO63ad/l5y8fJnK/G8DkBi
kvUOANk5U5ocCrwS/Qn2WsnLpDSu484EhgrISCezkb9ufERyTplrU7mNP2aHLbrV
E/dSxjxE/DwMZgO33kd7v6HEB0ED/8mcKKUlUTmgB3iaS/ZRri2UfZtRhRVPdr3s
XK4PnPlbdRD18gVe9ioJSdBES5av4nMbFDkfLnmqohduMIhol1FJ7vAErwzMxSJg
cEWifMp3NVnGjjVbpg5LN82UygJQbNGzGZZRbpGPGOMatjrXJUxqkNpZDhL5KKXM
0fhu2+1R7VDvkiGbi0kzxfVsLF0wq/Y+hlrrHK4aaw0kCwMk1d2QLOGqTv5QYGLe
gyQXrsYRESRVdtF/UaaDCOLXgIV+Dr29p6PpB+Eo/yfTuddgR0xrmTlomfkJm8ej
P4qPWiiUM0JxRct8WB/PBoM0PUWpWeq3/rlm4FWoe4gB+tW1T95alBjBvrWlIzGe
z2DpgQKtLHJYz7FZGQ+VppRA6U6+b2AwpJ/Pgr23r6dOURoHBhYZQa+vnNN4FXOH
uKbDq+Dj0hq+CewgBWBsxj9xgCtYu17j1F7tqraJuRyxMR+itt4=
=VEaE
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
