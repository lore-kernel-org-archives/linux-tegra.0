Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10759C4743C
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:10:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E63266120D
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 14:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFUOMR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 10:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhFUOMQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 10:12:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72156C061574
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 07:10:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so62388wml.5
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8kepLA1skYYXxAo8YW3JZV6sp2HsHnw4TxhCp+yjjQg=;
        b=h/9/G+BKEWjlDy3cdYEoizmczLXp8k8O9toVOq6Dnc48Iqq0r+nELVmFqttkJenHOo
         n2j5Idv6Z0CDRsIwKaZhm4xQ/vkIY8xI9Ipvy0R9csY0JiwEjJcmX6MiDjr9TF6ruBof
         I9wBaMgjrWWYA9SFHzCFACRrc29LsSqkVX1rKmzlcM25gkGuCekxVfBhh61S0a2Hcv9M
         4xFlKBEsWluVYnFh0Dw9O/LHIjp8tmv4X7HVeLLBu+AzSuvZI6pxsc4kMHiOBrWusfyg
         TEnOtOujadbTWVKDERUWzTQ8N27HsF4iqqlU2G9GpKhV7aGYYJzKGfofUtsAyC0NPZQD
         nItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8kepLA1skYYXxAo8YW3JZV6sp2HsHnw4TxhCp+yjjQg=;
        b=TxCNyg202fE4A8SEZDud6xjsB3ahlZXNPnupdsXoTNVll8bpmETRmALoOUzLxtazN+
         m0sFJAc6GAnOQnfrhJHTkwEbph7sF4XQfMPJ1gM6e04xPFyh+Z0PkuKGiEO/1dJAVDaU
         eQJd7RjfnI5ddYXi+UHTR6koIMM+dQMXqvsoX4oeefxzzQ3f7p1j7Hxic4jbe1WcL9fX
         CHn61lhaGh9CE5S9Gh6Q/Va/o1DVvgazX1k6KlvRYxWfr1GgrkJ0UUF7VKbdKb4fxr0J
         h5NTCanQYilDTn0w/fRa9gVRmASEoFZfTJDWBErrxoIMX8TyonKG6zNspBwCVcshLZ8G
         80kA==
X-Gm-Message-State: AOAM533YjVRJmgsFzKzPk8JBogtbssI8rhCjDmgVex/a3FMsUeFZ81Vp
        RazP58OeeHZyNcJODsolFrg=
X-Google-Smtp-Source: ABdhPJwHv49pYFJDn8vquRM0+2cpK1F0btscoOHXlGyMmv4gAoMpiY01o32Uy1jcbBoDA1Qm2vTxQQ==
X-Received: by 2002:a1c:a3c4:: with SMTP id m187mr15738405wme.41.1624284600021;
        Mon, 21 Jun 2021 07:10:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m37sm15730023wms.46.2021.06.21.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 07:09:58 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:11:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible
 string
Message-ID: <YNCeK9cdMPf+serd@orome.fritz.box>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-3-thierry.reding@gmail.com>
 <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
 <14551e79-853d-471f-bb5e-0d2d6581a9b6@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ug2yoxoaj18CzXNu"
Content-Disposition: inline
In-Reply-To: <14551e79-853d-471f-bb5e-0d2d6581a9b6@canonical.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Ug2yoxoaj18CzXNu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 08:46:54AM +0200, Krzysztof Kozlowski wrote:
> On 18/06/2021 21:47, Rob Herring wrote:
> > On Thu, Jun 3, 2021 at 10:49 AM Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> >>
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The ARM SMMU instantiations found on Tegra186 and later need inter-
> >> operation with the memory controller in order to correctly program
> >> stream ID overrides.
> >>
> >> Furthermore, on Tegra194 multiple instances of the SMMU can gang up
> >> to achieve higher throughput. In order to do this, they have to be
> >> programmed identically so that the memory controller can interleave
> >> memory accesses between them.
> >>
> >> Add the Tegra186 compatible string to make sure the interoperation
> >> with the memory controller can be enabled on that SoC generation.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++--
> >>  1 file changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/D=
ocumentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> index 9d27aa5111d4..1181b590db71 100644
> >> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> @@ -54,8 +54,14 @@ properties:
> >>            - const: arm,mmu-500
> >>        - description: NVIDIA SoCs that program two ARM MMU-500s identi=
cally
> >>          items:
> >> +      - description: NVIDIA SoCs that require memory controller inter=
action
> >=20
> > This is not valid jsonschema:
> >=20
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm=
,smmu.yaml:
> > properties:compatible:oneOf:4:items: 'anyOf' conditional failed, one
> > must be fixed:
> > None is not of type 'object', 'boolean'
> > None is not of type 'array'
> > from schema $id: http://json-schema.org/draft-07/schema#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm=
,smmu.yaml:
> > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > must be fixed:
> > None is not of type 'object'
> > None is not of type 'array'
> > from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm=
,smmu.yaml:
> > properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> > must be fixed:
> > None is not of type 'object'
> > None is not of type 'array'
> > from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm=
,smmu.yaml:
> > properties:compatible:oneOf:5:items: 'oneOf' conditional failed, one
> > must be fixed:
> > [{'enum': [{'const': 'nvidia,tegra194-smmu'}, {'const':
> > 'nvidia,tegra186-smmu'}]}, {'const': 'nvidia,smmu-500'}] is not of
> > type 'object'
> > {'const': 'nvidia,tegra194-smmu'} is not of type 'string'
> > {'const': 'nvidia,tegra186-smmu'} is not of type 'string'
> > from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> >=20
> >=20
> > This was not reviewed nor tested since the DT list was not Cc'ed.
>=20
> Ugh, I see now weird empty item on a list... and not only DT list was
> skipped - Thierry did not Cc you either.

This seemed like a too trivial addition to waste Rob's time on, so I
didn't add him (or the DT list for that matter) on Cc. The ARM SMMU
maintainers had reviewed this, which seemed like it was enough for what
the DT bindings change was doing.

In any case, I clearly should've checked the DT binding check output
more carefully. It's rather messy for Tegra because there's quite a few
that we haven't converted yet. I'll have to resume my effort to convert
the remaining ones and fixup the device trees so that we can actually
run the DT binding and DTB validation checks more usefully.

> My bad, I did not check that patch thoroughly before applying.
>=20
> Thierry, please Cc folks mentioned by get_maintainer.pl. Either sent a
> fix or a revert, if fix needs more time.

I've sent out a follow-up fix that removes the two bogus lines. It looks
like that was the result of a bad conflict resolution on my part.

> Additionally, why the patch changes reg to "minItems: 1" for
> nvidia,tegra194-smmu?

This is because originally the Tegra194 SMMU nodes were supposed to only
represent a "dual" instance. However, on Tegra194 there are three SMMU
instances in total, with the third instance (dedicated for isochronous
traffic) being completely separate and having only a single range of
registers.

That third instance was previously supposed to be covered by the normal
"arm,mmu-500" compatible string, but given that we really need that
interoperation between SMMU and memory controller for SID override
programming, we need the Tegra-specific compatible for the ISO instance
of the SMMU as well. And since that uses only one set of registers,
minItems had to become 1.

Thierry

--Ug2yoxoaj18CzXNu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDQnikACgkQ3SOs138+
s6F2uBAAhnU+wroFvGjGTsdCo19Lye7ZwlgYVldxZuzdoI44tNFapF9qTlWT/yE+
MVCOVn2Z85TkKmMWqZh2qFrbBaX4m0tU2QkoIbs5W7Poc6CECTUUsKRSHFWTojgh
1bak/TQdCSFrpwte1XOZ414EFvXRNIEmB2oD8I714MBAlpzSYLFew+1DkLTtBjqa
2Aa80pzR3OEmGhs4h643KHDdDT3RCFLu/h/Xh2h6FCv900D42bLybO0dUyatGbcX
XilHecs9gsLSysXAyVyDOZ0EDBVPeeQi1CKo6coC5nXg355cEvNWtYjyW9Bi/J7b
m+a3TnU9ryd+fZJFiNTzeu2ElYb8JDotBPf9CeDNeSEL7IHy9o8uOsfM4LJQuCfv
1SCDHiMdSEd7rxk3us3G/yHPaTBSLHIouud7cNy0WCD5JPL/fNgCBSLvOOXFr2LZ
kKx3v++QwiLSn+lJrbb5QKyDLIWhUUrV8L2ssf2WdQGGNNKkMzjXgb99NaHHGpZU
8+q90lfktYxoWX6mehBu1luIJ2CPpvlEdX2Nb6zkHcsCwmzSiKDcTLzeBQLSquH+
5z/FCo/510vTm2rD/9YbjGWbOZ+k8/bs+jTV2rGk/gAxeOuXEbScCyAG7UrFHAvt
F6WCjfa4448VFtk0ww2Gm6DMYyrc5VKyn66oCd/xWl/iOQonB4Q=
=3Q5A
-----END PGP SIGNATURE-----

--Ug2yoxoaj18CzXNu--
