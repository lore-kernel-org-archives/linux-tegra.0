Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF46C4320A
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 15:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EBAF60E97
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 15:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243471AbhHJPoQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Aug 2021 11:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242153AbhHJPoF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Aug 2021 11:44:05 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0840EC0613C1;
        Tue, 10 Aug 2021 08:43:43 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso2299833wms.1;
        Tue, 10 Aug 2021 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tnip+r7F4/z9nn06tEEoEy64A1xUTKQDwuabyuo00UM=;
        b=WFhliwfjNR2UDPKQ34rKuWI+89TaHhjfBnqx7mgsmLWTGj0kWTpIRdfCn0RAf5yZMq
         ctaRSKwnCN79tthvYKQIPZuOIaijo85HV7IUUKjhS5k8fXyPW37kPnKwJbA+nslOYWfK
         pRcTaQjZ4sV2QohldWjVy2hjuEmAgQI+qK5v8N/cD6UTKT2b0X/0qucByhO5BV9VVNWO
         95xO/eKpv4+F6np2HjDePsmmeuutoo8lZJgZt0vAzDCR+A1IagjEpvWocpQ0SjrT9PrT
         zWDbgRpSWpMHgj2An2JMBRRDJappLMoCefGkbsPPmVvBrcEK+g+LVCpI2TzpzWy8+7Do
         H7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tnip+r7F4/z9nn06tEEoEy64A1xUTKQDwuabyuo00UM=;
        b=ISjw8fUa6vby8ymaAVo8EzijWJeqyW+0rGvOUXKUb/qn9lOe5q6Om42p4Id5ajZ3LU
         1hII6z/S3/f7vulbKZkbGAuigtsF4UVqBEDXzvKdtTUhcrzwrcXySnCKKmynUDKUNtcA
         6M5HL+BPv4f1tCmkOZVgF8ySwlIXAIZSA/7EmgrtgXpzIAtMzgxGBAOIafaTKlDyP/8Q
         9l3sq/j1R2L6RlbKlYg+Q3CpRHNeZK41oG5T3aPtZd/DA+96hFsJSsKBtbAZONQgV4EU
         mFF1AWLv9gEgqKFlhTIEwSaa7ej3xvCoCTnukP2bplD5O8jD8cWlFzXv1ipN1d3z0NhI
         GSrQ==
X-Gm-Message-State: AOAM533hPgg41sQvyi7yBXfhfdjuWEWA62/HHx8fuVsrALF6+X3AWMY8
        qqpEyCComOFJpJMMCWsb4bo=
X-Google-Smtp-Source: ABdhPJyrXFtiWBZX/iqpMUwvql9VImtTVKBhvmPwpU94sRaJwTVHz5jyvnjwfgfPUDUJxv0ZdvbxNw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr5382798wma.33.1628610221497;
        Tue, 10 Aug 2021 08:43:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w18sm25620287wrg.68.2021.08.10.08.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 08:43:40 -0700 (PDT)
Date:   Tue, 10 Aug 2021 17:46:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and
 NVDEC
Message-ID: <YRKfPuf0SLU9RXgU@orome.fritz.box>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
 <YRKengKZmFtgsIZy@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G//wZ862ek2PTEA7"
Content-Disposition: inline
In-Reply-To: <YRKengKZmFtgsIZy@orome.fritz.box>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--G//wZ862ek2PTEA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 05:43:26PM +0200, Thierry Reding wrote:
> On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
[...]
> > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra2=
10-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra21=
0-nvdec.yaml
[...]
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: nvidia,tegra194-host1x
> > +then:
> > +  properties:
> > +    nvidia,instance:
> > +      items:
> > +        - description: 0 for NVDEC0, or 1 for NVDEC1
>=20
> I know we had discussed this before, but looking at the driver patch, I
> don't actually see this being used now, so I wonder if we still need it.

Oh, nevermind, upon closer inspection, I do see it used in the driver.

Thierry

--G//wZ862ek2PTEA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmESnz4ACgkQ3SOs138+
s6EJSxAAqldttFWwp75vXQGSE+6i/aroYKOoS4UVyngCFgy5tqkb3cqF9pzYR0YN
8brXcJ5o3shp4eB6xw6e61l9jPNRnlFR2FOdAilfZwTg0qSm+e+ENv6inuT2hDZz
J+TOBZ9iFtZlk3h6Fl4bdPM7w9oL0EOuxnnpj+bBvWcct5PcNnjXTwek2CRARo80
kI/42mAq70BKAAjuDxKIbBXkSW1k90Vf2pqUfNDYSL5ZQvZdwMUT8jn/9B8GXReG
bmkha6XzHxjOZWNSf+obibcOf+aHVsHpkrMT6DmYr8/KZEZ2GZLnQannPE2kJuFe
NuDCcl2b1sfOLWdDh8DIY6Zun8DD6U0tjH26dP3H0Eh0eQcDSkvay/0K8bO7U3s5
yiMQaKONk925Z5vZV25lr+PQ6rz7SuSf7ycluvzeGiNmBLIgcpGNPK1e4AP0lWBL
wLgsYJdNqD3rlIac2bi0zawsQzbFe3p1/KM/5B3RClu2qMd1PYED1I2CqFuv/oot
LjOTnWDaXxg6bTDntW4RQKr8hb3LW473TOrtbB179LifDv/8Gh+FxINc1iDZD+FA
Fvhb6uY22wnXNRJJlldjFXnFnw+zpogSchIUmiCKdwGakTYSN6f/nyZci5LLJ7Yy
F0KXZu5eSVebEIrGHntdQR/3CA900incMHwhAyfNCz/DqzOUJYI=
=odc8
-----END PGP SIGNATURE-----

--G//wZ862ek2PTEA7--
