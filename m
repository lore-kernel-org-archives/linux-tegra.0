Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE572C4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 16:08:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEC58610A7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 16:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHJQIn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Aug 2021 12:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbhHJQIm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Aug 2021 12:08:42 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522DDC0613C1;
        Tue, 10 Aug 2021 09:08:20 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b11so10873196wrx.6;
        Tue, 10 Aug 2021 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6FzczmnqWcM8v8wmbqHjp1AM3inHU529BufOXLNuUU=;
        b=RxeplgufzJz5cddEnSUDOcYJ3UBdJF1NibJ3S42nPQdh31odlwFCl/r0snOyDSSLgo
         nt36Tw1P2s7D7NAXvPrVPLQ1oXmq9gR0ZeUVavSlAE5yWLe0CbuefRe16DaHwsAUVoSl
         icp6b+QowvLR0WCT1Q30Xj4gsaC9VMnCbUCnXwDhOjRmc/xF0YZKfRnRUVZzBcqb3kl1
         GnI5U3R+5C7HVKaqEuY9sgZhM/fkI6RvAA8kbhBUwp661A72pDq09CrsR0oVrdXWEMk8
         ZQWoz8aDZbufZgngucm86F9ckoPewp4l6q0UxIh2jODCJ5Akuq9M2HGvyP1BtgnDxgbi
         OPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6FzczmnqWcM8v8wmbqHjp1AM3inHU529BufOXLNuUU=;
        b=VPGBNvfKul5UPBXm1Z3UHCsfsHHv70owCmvCZuD8WOevH6wGuCkqZq4uMUlDG9Uahd
         gpxAhHhlX6IvLdhmpQk/B8NRoR3hA6qvgn0LK1ETkJn4hlvkWsckGsS+wGCcxftoGt7o
         gjGU5VrnosV+HSR0DNFKcHb8ohRDiXXZa8sVJhNWIqIudowqHOhhBy0q/uhYzN4wSwmC
         4QA1lnaA8foRtCk1nJDAXAPPncpEhUtTDmAbNMhmjn7nypWu2tTFICI3mpkZa1XFBrUQ
         Uq1lDW6pCebYf8a2ZqW8c2uOQXYRA62Z7MBUuO26vQpCi5fH3apcMpUXsT6sp2GO0rDS
         bO0A==
X-Gm-Message-State: AOAM532JuJ/n3ni3062vBYSmbSCEN03haF/mWk0yE8j1hmCJwfP9owLT
        7IB+Y2z7eavkSG0mv4LoIw8=
X-Google-Smtp-Source: ABdhPJysBBrUIctxQUG5HmK9FUt9CAtgtz5R7Dfn+hCUh++RhMPKvcG1HH1pbuOj/K2bMzRHh/eZcg==
X-Received: by 2002:adf:f288:: with SMTP id k8mr31946841wro.350.1628611698951;
        Tue, 10 Aug 2021 09:08:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id q17sm1801399wrr.91.2021.08.10.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 09:08:17 -0700 (PDT)
Date:   Tue, 10 Aug 2021 18:10:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and
 NVDEC
Message-ID: <YRKlA7aBYOuElXDe@orome.fritz.box>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
 <YRKengKZmFtgsIZy@orome.fritz.box>
 <c06df24f-989b-fdfe-ea04-867de1aa8828@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gS61pFWBoSyehaqJ"
Content-Disposition: inline
In-Reply-To: <c06df24f-989b-fdfe-ea04-867de1aa8828@nvidia.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gS61pFWBoSyehaqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 06:50:26PM +0300, Mikko Perttunen wrote:
> On 10.8.2021 18.43, Thierry Reding wrote:
> > On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
> > > Convert the original Host1x bindings to YAML and add new bindings for
> > > NVDEC, now in a more appropriate location. The old text bindings
> > > for Host1x and engines are still kept at display/tegra/ since they
> > > encompass a lot more engines that haven't been converted over yet.
> > >=20
> > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > ---
> > > v2:
> > > * Fix issues pointed out in v1
> > > * Add T194 nvidia,instance property
> > > ---
> > >   .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 131 +++++++++++++++=
+++
> > >   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 +++++++++++++++
> > >   MAINTAINERS                                   |   1 +
> > >   3 files changed, 241 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvi=
dia,tegra20-host1x.yaml
> > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvi=
dia,tegra210-nvdec.yaml
> >=20
> > Can we split off the NVDEC bindings addition into a separate patch? I've
> > been working on converting the existing host1x bindings in full to json-
> > schema and this partial conversion would conflict with that effort.
> >=20
> > I assume that NVDEC itself validates properly even if host1x hasn't been
> > converted yet?
>=20
> Sure. I thought I had some problems with this before but can't see any no=
w.
>=20
> >=20
> > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegr=
a210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra=
210-nvdec.yaml
> > > new file mode 100644
> > > index 000000000000..fc535bb7aee0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nv=
dec.yaml
> > > @@ -0,0 +1,109 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec=
=2Eyaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Device tree binding for NVIDIA Tegra NVDEC
> > > +
> > > +description: |
> > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > +  and newer chips. It is located on the Host1x bus and typically
> > > +  programmed through Host1x channels.
> > > +
> > > +maintainers:
> > > +  - Thierry Reding <treding@gmail.com>
> > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > +
> > > +  compatible:
> > > +    enum:
> > > +      - nvidia,tegra210-nvdec
> > > +      - nvidia,tegra186-nvdec
> > > +      - nvidia,tegra194-nvdec
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: nvdec
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: nvdec
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  interconnects:
> > > +    items:
> > > +      - description: DMA read memory client
> > > +      - description: DMA read 2 memory client
> > > +      - description: DMA write memory client
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: dma-mem
> > > +      - const: read2
> >=20
> > The convention that we've used so far has been to start numbering these
> > at 0 and use a dash, so this would be "read-1".
>=20
> Will fix.
>=20
> >=20
> > > +      - const: write
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +  - power-domains
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: nvidia,tegra194-host1x
> > > +then:
> > > +  properties:
> > > +    nvidia,instance:
> > > +      items:
> > > +        - description: 0 for NVDEC0, or 1 for NVDEC1
> >=20
> > I know we had discussed this before, but looking at the driver patch, I
> > don't actually see this being used now, so I wonder if we still need it.
> >=20
> > > +additionalProperties: true
> >=20
> > Maybe this should have a comment noting that this should really be
> > unevaluatedProperties: false, but we can't use that because the tooling
> > doesn't support it yet?
>=20
> I can add such a comment if desired. Honestly, I don't really know what
> 'unevaluatedProperties' means or does -- the explanation in
> example-schema.yaml doesn't seem like it's relevant here and I cannot find
> any other documentation.

It's basically like additionalProperties, except that it applies to
properties evaluated via if: blocks.

So with additionalProperties: false, the presence of the nvidia,instance
property in a Tegra194 DTS file would cause a validation failure because
it's a property that was not defined in the properties: block.

With unevaluatedProperties: false, on the other hand, the properties
that are defined in the if: block above will become a evaluated
properties and therefore a Tegra194 DTS with the nvidia,instance
property present would succeed validation. Unless, of course, if it
contained additional properties that are not defined in any of the
properties: blocks (either unconditional or conditional ones).

So in other words, the additionalProperties schema applies to all
unconditionally defined properties, whereas unevaluatedProperties
applies to all (conditionally and unconditionally) defined properties.

Thierry

--gS61pFWBoSyehaqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmESpQMACgkQ3SOs138+
s6HTJw//ckFGmxW4tZPl0eMpVCI8/7brLmmKGRwbDY2mXZaWyVOgVfBI36oARYUT
SRrNFxFOpYIjjBimpWNMevG149nS0EN3LxFu9/h6S7ZvFZIK5k4xXn84pxg16eb6
4mYgtrrfkDFL6RHEkrmayGlJ2whhTZjF41I5axF9bO5GH0h5ZR+Y83s64Ja8MTHt
PW7VPkwQd3RaqPi1dm3ooOFRz/DfMtqvFHYLPqJ+Ptkq5I4K9g4dQ9ZWSlRT0XCE
canA0cpmXym6HMrL6jk2oRJ/ZzTfAI9/uWwVqyVQX0mBfqhr+XEsBdPo0+fNQlpm
S8SKG9GoeCvTTZVitjxNoLfKOvZB84KX0KEFpmZk1hR5XyuCQdjEE3Rku6BjxKWv
n2En94wyrKd6CafU08tS5z4hmWk1TSGHKkUzwIni+1iupLGGlbSlwRF60Ce/5Jx0
WG677rED9WBV4yvN7rDvG7P4ujiWebVgTXy/ZoEvlERK41o630uCJ4VwhSYPMqUA
PFs1PmDy1uMlAya2870yKCYYVON8yU6IuDxw9P04a3XUmIhVlE5bcP7/EBTBptRO
ry/+y8f+rqQVwXouGcawwbHqlBCvsVgUpAFmbYTU1W0NL9Z5ArhwI3fUMgqKcYsf
hR0VriBi/qHviy33TjSpJRx8T7YbBSLVxoecJANidV0KXhE3kOY=
=cIO4
-----END PGP SIGNATURE-----

--gS61pFWBoSyehaqJ--
