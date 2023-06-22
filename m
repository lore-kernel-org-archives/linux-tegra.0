Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E2AEB64DA
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 21:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjFVV3i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 17:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjFVV3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 17:29:37 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CDF1BDA;
        Thu, 22 Jun 2023 14:29:35 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687469374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5c3zfWA9hZxWtfaWxCG2O3X4hDiQxQN422WUvKPgYIE=;
        b=j5nne5VAY4DHx802iyEkD5GQ43C7b02lGNEQbY3jdj1BLvYE09XHQLq5LNN32x/qF0W3mO
        CvkGMMahfmVv4SiqI9w2M5aOP14FJI3F70C1u8PgPeWKBa9H+PcmnwRWunuwP0AeDFzOs2
        So2j8b4HhoMaNSwgLqDSes6X6ZZnpGTryNTuQuWy3mLhBcZK8M0qU7jNkBU3R7cueuTqkn
        ze+/kSkNJeAtOCjwoRpEHjHiKK3ovRwMqo44Hhd0YtxuAcQ88DFSVfrrEnssjF8Ho2+GH5
        Dd9vzCTSp187Jzsqj+tyHLLAM17Rcxiq9UC2/Fy88E3xeqfs18Fz7MKTTV5n4g==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48218FF803;
        Thu, 22 Jun 2023 21:29:33 +0000 (UTC)
Date:   Thu, 22 Jun 2023 23:29:32 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Message-ID: <20230622232932.4a077869@xps-13>
In-Reply-To: <20230622143140.GA1638531-robh@kernel.org>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
        <20230609155634.1495338-3-miquel.raynal@bootlin.com>
        <20230622143140.GA1638531-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Rob,

robh@kernel.org wrote on Thu, 22 Jun 2023 08:31:40 -0600:

> On Fri, Jun 09, 2023 at 05:56:34PM +0200, Miquel Raynal wrote:
> > There is apparently no reasons to open-code of_device_uevent() besides:
> > - The helper receives a struct device while we want to use the of_node
> >   member of the struct device *parent*.
> > - of_device_uevent() could not be called by modules because of a missing
> >   EXPORT_SYMBOL*().
> >=20
> > In practice, the former point is not very constraining, just calling
> > of_device_uevent(dev->parent, ...) would have made the trick.
> >=20
> > The latter point is more an observation rather than a real blocking
> > point because nothing prevented of_uevent() (called by the inline
> > function of_device_uevent()) to be exported to modules. In practice,
> > this helper is now exported, so nothing prevent us from using
> > of_device_uevent() anymore.
> >=20
> > Let's use the core helper directly instead of open-coding it.
> >=20
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >=20
> > ---
> >=20
> > This patch depends on the changes performed earlier in the series under
> > the drivers/of/ folder.
> > ---
> >  drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
> >  1 file changed, 6 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> > index 4d16a3396c4a..dae589b83be1 100644
> > --- a/drivers/gpu/host1x/bus.c
> > +++ b/drivers/gpu/host1x/bus.c
> > @@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev=
, struct device_driver *drv)
> >  	return strcmp(dev_name(dev), drv->name) =3D=3D 0;
> >  }
> > =20
> > +/*
> > + * Note that this is really only needed for backwards compatibility
> > + * with libdrm, which parses this information from sysfs and will
> > + * fail if it can't find the OF_FULLNAME, specifically.
> > + */
> >  static int host1x_device_uevent(const struct device *dev,
> >  				struct kobj_uevent_env *env)
> >  {
> > -	struct device_node *np =3D dev->parent->of_node;
> > -	unsigned int count =3D 0;
> > -	struct property *p;
> > -	const char *compat;
> > -
> > -	/*
> > -	 * This duplicates most of of_device_uevent(), but the latter cannot
> > -	 * be called from modules and operates on dev->of_node, which is not
> > -	 * available in this case.
> > -	 *
> > -	 * Note that this is really only needed for backwards compatibility
> > -	 * with libdrm, which parses this information from sysfs and will
> > -	 * fail if it can't find the OF_FULLNAME, specifically.
> > -	 */
> > -	add_uevent_var(env, "OF_NAME=3D%pOFn", np);
> > -	add_uevent_var(env, "OF_FULLNAME=3D%pOF", np);
> > -
> > -	of_property_for_each_string(np, "compatible", p, compat) {
> > -		add_uevent_var(env, "OF_COMPATIBLE_%u=3D%s", count, compat);
> > -		count++;
> > -	}
> > -
> > -	add_uevent_var(env, "OF_COMPATIBLE_N=3D%u", count);
> > +	of_device_uevent((const struct device *)&dev->parent, env); =20
>=20
> Why do you have the cast and the "&"?

Actually that's a mistake, I was blurred by the "I want a const pointer
and this is not a const pointer" warning (hence the cast). This change
is broken, I'll fix it.

Thanks,
Miqu=C3=A8l
