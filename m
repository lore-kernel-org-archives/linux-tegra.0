Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27999C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 13:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiJGNyd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJGNyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 09:54:32 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F1CC822B;
        Fri,  7 Oct 2022 06:54:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ot12so11539156ejb.1;
        Fri, 07 Oct 2022 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enx4RjQIyhd33IM+TyBELZC95J59S4Pgr5DS3EUuMxI=;
        b=gpj8FDZDpI7ZZ947ym7dXZiNVjveu/V+u1fISf6SmQWJg2gbqTO0XOG+EmXfZaVTIT
         5Kzj5pNupn6gpoaHds0HBtixiVNwiN3NbX6L83pCT/MnChWvT+9+P2DiAgZH67g/Di1L
         Lc8JeHvrl0E/i0R0cY+XkHRAS9Uhy2Q8MJ4Mm7kV3LaNoF2F1hGCh80L0nQCgoNd9mFT
         Ji+cPG9OXVLcelxI8y/PSz3JZfu6vaeQX2mvqa5NG457ajgkycuhmoGrMD2HU61p4ErC
         he/0JMcHbyEXa0vIWCtNfvBcBgsWMQEcvvhmk8mr4ZoH1Jc5sdG4eciwGLjTv6XdfMzw
         HebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Enx4RjQIyhd33IM+TyBELZC95J59S4Pgr5DS3EUuMxI=;
        b=fmHByDzOh4r+HBRK/3K1hCL7R8Zw7zxH5QeN0m/esintOjGk0y8wSelNMWsT+tK3K/
         CV7QjDC84wtlmJFwQIogVsiD8Fzg2DV4OgobDN2jdEkbMiAE/TP/kmB6CIVbwQ/GLHht
         xDA38E9qd7G0lnCQjErTa9wB17rAbMc2iTRj2dunn2/ApfOe7xUauI06PYBn2cYXepgm
         BCDvprrgbDPFJ5rliXP6qfBNbDomKhVYzTq9HZEbk/G48D3iaFBINw5S3UfHLhXELe6+
         YEMyCJcyMJtCbfYe01tFW2YbuJfIKz+1dK6SEa9oeiNXNL0AQGGDvGCgwB1RjCjfTQ8s
         aAjA==
X-Gm-Message-State: ACrzQf3bfq5k5FDba0DeofUjA4MxW68NTashXBIHIp7PnYDMe1HXmqk0
        MMy8REQG2Y8SJ6aiSPx8Ids=
X-Google-Smtp-Source: AMsMyM7La77T3ZitZ18KvtNZX+eTUrTaeesjPgbUf2RaeFhRX5epUFC4Oz9+762DvbFsno6Xj8g/rw==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id ww7-20020a170907084700b0077ff489cc25mr4192567ejb.80.1665150869489;
        Fri, 07 Oct 2022 06:54:29 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090660cc00b007415f8ffcbbsm1269503ejk.98.2022.10.07.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:54:28 -0700 (PDT)
Date:   Fri, 7 Oct 2022 15:54:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/5] dt-bindings: reserved-memory: Document
 iommu-addresses
Message-ID: <Y0AvkshNYmqc3UGo@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-2-thierry.reding@gmail.com>
 <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5W5c90u2fS2v03qz"
Content-Disposition: inline
In-Reply-To: <3fb949ad-74c4-1bac-7e14-5d056afcef5f@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--5W5c90u2fS2v03qz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:45:31PM +0100, Robin Murphy wrote:
> On 2022-09-23 13:35, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This adds the "iommu-addresses" property to reserved-memory nodes, which
> > allow describing the interaction of memory regions with IOMMUs. Two use-
> > cases are supported:
> >=20
> >    1. Static mappings can be described by pairing the "iommu-addresses"
> >       property with a "reg" property. This is mostly useful for adopting
> >       firmware-allocated buffers via identity mappings. One common use-
> >       case where this is required is if early firmware or bootloaders
> >       have set up a bootsplash framebuffer that a display controller is
> >       actively scanning out from during the operating system boot
> >       process.
> >=20
> >    2. If an "iommu-addresses" property exists without a "reg" property,
> >       the reserved-memory node describes an IOVA reservation. Such memo=
ry
> >       regions are excluded from the IOVA space available to operating
> >       system drivers and can be used for regions that must not be used =
to
> >       map arbitrary buffers.
>=20
> Bah, I've only just realised: don't we also need to change the "oneOf:
> required: ..." schema to permit "iommu-addresses" without "reg" or "size"?

Hm... good point. I think at least we'll want another:

     - required:
         - iommu-addresses

in there. I wonder if we also need to avoid the combination of "size"
and "iommu-addresses". When "size" is specified, is it guaranteed that
those regions will be allocated before the direct mapping needs to be
created?

Thierry

--5W5c90u2fS2v03qz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNAL5IACgkQ3SOs138+
s6HMjg/9Ez5oe7o7RKjlGxLRasyNNnpD5dUT5ZmEPcxWBlLBs+6fYqmvVi5DycrV
857CsTJED2/fHahH5TQqsUJmQ4jWtS7Z9Aw74dEMjVqAAtJOmzT0nAyXrgSSaV4E
EoOqSM8O++HDS8qUlFqI7CJMXpuUv9hfoDit0m4tSg6fFPKNO5fhWg8oNAgXaKqQ
MhBZyLjb0dqCFP/2tfLR0PoLhYv9p4kfu/tcH2HNbScAQDIb61yRRro/bw+q3ABn
a63qkZlW0ow8MepXiTfqVbZVToWrP6aSrIAgDgQhi4eQOr4WiHHS0U/t2atgW0Hc
LNLC534Hii+aIYSNK6xjDtvbEp2JS0jBVIqpJr6dCOY7jnsGLLwa5GJeNRaPbksE
XZ3QvChk9RGv7plPjIVAf23kDethEZEyfEOB93czUH1yQ97+zYQFbNJ06hrjYy0f
JbZ6pehcwEiP6PfkP54hzUBsgZrxu6a6INYvxArsEywj0IGhxpzLd/7yWbZ3sewm
FQQ03w4RguTfAZBog9+ckWCJKJQId9N2lexIT0XU5vMBZvj06yQdXOxLqTsPs24M
rF2efBe1iCzIOxx7O/ki11AJhTAhLMAbblT75FtJfLaL+v8XdkyjEpx/iz8M+MUu
hus7GIQTd7f6SpYF77unDhcBvJKeT9LQVucyaEtKo84eCFhDIqA=
=3sh+
-----END PGP SIGNATURE-----

--5W5c90u2fS2v03qz--
