Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF51FC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Dec 2021 22:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377495AbhLBWls (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Dec 2021 17:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377331AbhLBWlm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Dec 2021 17:41:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D05C06174A;
        Thu,  2 Dec 2021 14:38:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 925046288D;
        Thu,  2 Dec 2021 22:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EA1C53FCC;
        Thu,  2 Dec 2021 22:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638484699;
        bh=eCQdRQeoLT8kjg3MQLOIfSv3SGDXKbkijV9amNxq63Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r0h036N3J3vfGrA/G9S88xmo18p43rx/XYLCpe6Zz9Rppyt0rfYSoMOCK3Cp36S7N
         oRKqKBMZUPZpO/e+D6VJx5Y11eY37/lJzJBQXtUQYHHpGU3RAIMjioi2NdPqsJtk34
         e86cX264PXauxI4/UxH5JdHjnEwV1YV6KXAryVdgWygQ3ettiJEBAsljSLf9pESVT9
         s9VWA5fPIhY1NYWPyPVP4nus63VmTnPfQODdy/Nmgml91nJ8xEov0PeSkXPgTpuHSt
         qKXjep4vpoDPENk1FgGC0PyclXlpdPAC+IMb6iY44oW3NPjUzemiySHR/zgT5Gzm4e
         /2D+ROIDeLBYg==
Received: by mail-ed1-f53.google.com with SMTP id r11so3807856edd.9;
        Thu, 02 Dec 2021 14:38:18 -0800 (PST)
X-Gm-Message-State: AOAM533NnkhaYj54siQAM6w9RHtlI0H7q40pkhRo1Jmk+hJEArfqXCjq
        Ti+EzMLtlcmSUvwheB1B1MMDCGaiJ36kigYtfA==
X-Google-Smtp-Source: ABdhPJxWZbOYJhHoT3DHIAb5JqTei+fe/SmfOBJYQktQY1sAsS2RvEfUEn+PEnMvf1jc9N/t/XFlop9MsVhOS/pPRHU=
X-Received: by 2002:a17:907:7f25:: with SMTP id qf37mr18683877ejc.147.1638484697293;
 Thu, 02 Dec 2021 14:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com> <YaWCAGQU0sjCwz66@robh.at.kernel.org>
 <Yae0DwCpFu8F/Gbw@orome.fritz.box> <CAL_Jsq+JvZQjN3q4A3yoM+pUPHLYKtwUT=QsDq+oQ7jk8mD3CA@mail.gmail.com>
 <YakIePafm3t6rJLE@orome.fritz.box> <CAL_JsqKb-azHGWkNzEJfCffiJ7FzscV4--8sKgq+uEONFmRD0w@mail.gmail.com>
In-Reply-To: <CAL_JsqKb-azHGWkNzEJfCffiJ7FzscV4--8sKgq+uEONFmRD0w@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 2 Dec 2021 16:38:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJqCEr6JsTb_ZnadaDg_zxsdYxMyyyZT3JT=4uLLShGUQ@mail.gmail.com>
Message-ID: <CAL_JsqJqCEr6JsTb_ZnadaDg_zxsdYxMyyyZT3JT=4uLLShGUQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 2, 2021 at 3:08 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 2, 2021 at 11:55 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Wed, Dec 01, 2021 at 12:42:07PM -0600, Rob Herring wrote:
> > > On Wed, Dec 1, 2021 at 11:42 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > >

[...]

> > > > However, a side-effect seems to be that now it also ignores any
> > > > properties that aren't defined anywhere. So for example if I touch
> > > > up the example in firmware/nvidia,tegra186-bpmp.yaml and add a bogus
> > > > "foo-bar = <0>;" property in the BPMP I2C node, then it'll blindly
> > > > accept that as valid.
> > >
> > > Do you have unevaluatedProperties within the i2c node? It only applies
> > > to 1 level, and you can't have a parent+child schema evaluated with
> > > another child (or parent+child) schema. This is why the graph schema
> > > is done the way it is and why we're splitting spi-controller.yaml
> > > child node schema out to spi-peripheral.yaml.
> >
> > Let me give an example based on a schema that's already upstream. So
> > looking at this:
> >
> >         Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> >
> > it does include spi-controller.yaml via an allOf: [ $ref: ... ], so it
> > uses unevaluatedProperties to validate against any generic SPI
> > controller properties. For example, #address-cells and #size-cells are
> > validated based on the schema from spi-controller.yaml.
> >
> > However, if I now apply the following patch to add an undocumented
> > property to the example, then validation doesn't fail as I would expect
> > it to.
>
> Indeed you are right. The problem is 'additionalProperties: true' in
> spi-controller.yaml makes everything evaluated. I thought
> 'additionalProperties: true' was equivalent to the default, but that's
> not how it's working. Now to figure out if this is correct operation
> or not. No wonder there were relatively few fixes when
> 'unevaluatedProperties' got implemented...

Based on the json-schema test cases[1], it looks like the tool is
doing the right thing and our schemas are wrong.

It's a quick fixup in the tools though to just delete any
'additionalProperties: true':

index 3cc5e428b0eb..a0f22aab935a 100644
--- a/dtschema/lib.py
+++ b/dtschema/lib.py
@@ -367,6 +367,9 @@ def fixup_sub_schema(schema, is_prop):
     if not isinstance(schema, dict):
         return

+    if 'additionalProperties' in schema and
schema['additionalProperties'] == True:
+        schema.pop('additionalProperties', None)
+
     schema.pop('description', None)
     fixup_interrupts(schema)
     if is_prop:

I'm leaning towards this route besides being easy because the whole
reason for the explicit 'additionalProperties: true' was so that
missing 'additionalProperties' is flagged as an error. The only other
way I've come up with handling this is making common schema use a
different meta-schema.

The result with the above is about 150 warnings. I quickly got this
down to 100 with only a couple of fixes, but the rest appear to be
individual schemas...

Rob

[1] https://github.com/json-schema-org/JSON-Schema-Test-Suite/blob/master/tests/draft2019-09/unevaluatedProperties.json#L230
