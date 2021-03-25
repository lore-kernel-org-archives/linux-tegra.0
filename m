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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0956C433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77F2961A0F
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 15:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhCYPBy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 11:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhCYPBw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 11:01:52 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557BEC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:01:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id v11so2597945wro.7
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UTtCbmIjt7mSID/LY0/N2CpdLYWpWW5B77eXxxKSX8o=;
        b=lqzcJfodMTIUogGGzabRIu3cfB6fUNFH1IqUbbJdOVBhPD6HG1XAysc2Bqz0tHHpD+
         K6kMd0S40qu+Q+QmCOH+Z9vQ2zvHCokfShmgznJcrD4nM0WNivIgPZeFSmiu9yrTlV5N
         vf4xOQFJfQ39L1rHgttID9XQB3oDL+ASIhuUgYrjde8yOyK010WSNTKM4PsXX6AnozUq
         KEyGoFEXmO6f/Z/pV423ydwGEcON/xhkpBE5vJ6Sj7fL+7a4IIiT+Uv8f6/gpJe4NZYX
         H9jDsTqFXo+e4s4flpnfUXUjCFZsSw1aoSuUsF+mCJMVHYS7RK2EJ3k9axHL2Z2R/BeT
         H9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTtCbmIjt7mSID/LY0/N2CpdLYWpWW5B77eXxxKSX8o=;
        b=REVQ+IZ88hE6cN59CeOcMS7DzvdGeoBlEcMCNvx0/qhtYlry3T3xR6Bwz/lV5adkbO
         bv6Xr9OnSxTnk0P5UL63PNYZXZcdNBvnh0kArTUFh14XNVbFkgXZsz5ml+37H6Hn2tPH
         4ty4wzgboADAPmcMV5emY6aPA6XzjjlE9OV580XjUOkCohRW5HyWabT6FzOJcTyh/ie9
         D85cpGH7ArcnE4dMTJNwLPm8s670MIrKjOEyN38gxI4tnREhXxHCJax5qM7idgD3Ou8i
         uTDvCIH8woM8nowjbFCSdjVV17Tu8RIY7wRiM48kmbsLjHpsNgyIhToxAvGqgzLf++ja
         4dzg==
X-Gm-Message-State: AOAM533r6OjKOgrvVsOisrRX9yoQp0jYG/agAhvZNaoLw0JfYxrhDloD
        4NK/f1xKebX0/OLxq1ZL0Vc=
X-Google-Smtp-Source: ABdhPJzjs8SViAVeI/3zgArvchxAWMSSPlRw0O3hjhS4sGnUsj4XUCy6hQxgBhsyTtFJ+vxLn7d7cQ==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr8566696wru.272.1616684511022;
        Thu, 25 Mar 2021 08:01:51 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c2sm6909493wmr.22.2021.03.25.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 08:01:48 -0700 (PDT)
Date:   Thu, 25 Mar 2021 16:02:10 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] memory: tegra: Implement SID override programming
Message-ID: <YFyl8qh5P8lJFc+Z@orome.fritz.box>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-4-thierry.reding@gmail.com>
 <e994810f-7c3c-0f3a-b5af-b318b6eb31f8@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J5HkKuVHndwGUDS4"
Content-Disposition: inline
In-Reply-To: <e994810f-7c3c-0f3a-b5af-b318b6eb31f8@arm.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J5HkKuVHndwGUDS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:27:10PM +0000, Robin Murphy wrote:
> On 2021-03-25 13:03, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Instead of programming all SID overrides during early boot, perform the
> > operation on-demand after the SMMU translations have been set up for a
> > device. This reuses data from device tree to match memory clients for a
> > device and programs the SID specified in device tree, which corresponds
> > to the SID used for the SMMU context banks for the device.
>=20
> Can you clarify what exactly the SID override does? I'm guessing it's more
> than just changing the ID presented to the SMMU from one value to another,
> since that alone wouldn't help under disable_bypass.

My understanding is that this override is basically one level higher
than the SMMU. There's a special override SID (0x7f) that can be used to
avoid memory accesses to go through the SMMU at all. That is, as long as
that passthrough SID is configured for a memory client, accesses by that
client will be routed around the SMMU. Only if a valid SID is programmed
in this override will accesses for a memory client be routed to the
SMMU.

> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/memory/tegra/tegra186.c | 70 +++++++++++++++++++++++++++++++++
> >   include/soc/tegra/mc.h          | 10 +++++
> >   2 files changed, 80 insertions(+)
> >=20
> > diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/teg=
ra186.c
> > index efa922d51d83..a89e8e40d875 100644
> > --- a/drivers/memory/tegra/tegra186.c
> > +++ b/drivers/memory/tegra/tegra186.c
> > @@ -4,6 +4,7 @@
> >    */
> >   #include <linux/io.h>
> > +#include <linux/iommu.h>
> >   #include <linux/module.h>
> >   #include <linux/mod_devicetable.h>
> >   #include <linux/of_device.h>
> > @@ -19,6 +20,10 @@
> >   #include <dt-bindings/memory/tegra194-mc.h>
> >   #endif
> > +#define MC_SID_STREAMID_OVERRIDE_MASK GENMASK(7, 0)
> > +#define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
> > +#define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
> > +
> >   struct tegra186_mc_client {
> >   	const char *name;
> >   	unsigned int id;
> > @@ -1808,6 +1813,71 @@ static struct platform_driver tegra186_mc_driver=
 =3D {
> >   };
> >   module_platform_driver(tegra186_mc_driver);
> > +static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
> > +					    const struct tegra186_mc_client *client,
> > +					    unsigned int sid)
> > +{
> > +	u32 value, old;
> > +
> > +	value =3D readl(mc->regs + client->regs.security);
> > +	if ((value & MC_SID_STREAMID_SECURITY_OVERRIDE) =3D=3D 0) {
> > +		/*
> > +		 * If the secure firmware has locked this down the override
> > +		 * for this memory client, there's nothing we can do here.
> > +		 */
> > +		if (value & MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED)
> > +			return;
>=20
> How likely is that in practice? If it's anything more than vanishingly ra=
re
> then that would seem to be a strong pointer back towards persevering with
> the common solution that will work for everyone.

The idea behind this patch series is basically to use this mechanism in
order to avoid the murky waters between ARM SMMU driver probe and SMMU
device probe, so that we can avoid the early identity mappings that make
things so complicated.

So in other words until the device has been attached to the SMMU (at
which point it's expected that any identity mappings will have been
created), the device will remain in passthrough mode through the SID
override mechanism. After the device has been attached, we'd lock the
SID to the proper value and hence enable SMMU translation.

In a typical setup it would actually be fairly common to encounter the
above. The firmware will pre-program the SID overrides and lock down the
configuration for most devices. The only one that will stay unconfigured
at the moment is display, specifically because it is the only device
that may not be in a quiescent state during boot. For all other devices
write access to the SID override register is disabled and the above just
abandons early because the subsequent operations would just be
discarded.

> > +		/*
> > +		 * Otherwise, try to set the override itself. Typically the
> > +		 * secure firmware will never have set this configuration.
> > +		 * Instead, it will either have disabled write access to
> > +		 * this field, or it will already have set an explicit
> > +		 * override itself.
> > +		 */
> > +		WARN_ON((value & MC_SID_STREAMID_SECURITY_OVERRIDE) =3D=3D 0);
>=20
> Given the context that's just WARN_ON(1), but either way I'm struggling to
> understand who the report is for and what they're supposed to do about it=
 :/

This is mostly for myself, or anyone else looking at the integration of
all this. I don't expect this to ever happen. If it does it basically
means that the firmware isn't programming things the way they are
expected to be programmed. It's a sanity check, basically.

Thierry

--J5HkKuVHndwGUDS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcpfAACgkQ3SOs138+
s6HUjA//XulkIAZElxddEPfjbsjtjEOQkKywqVSDMm+nQah1sR1vlo94lFnbm3Q0
bRI67N3Cd1dABy9ZwQeQt4/3RCWsWpDRP+RwDQYpRjwAyGtcXXy1cIZC2ghI+lFE
japnkrrTZqpGaSmrxNhbYIJvQPzuEvXn+610WzV4yonxY0ovpEpqsTpx87VhHPqo
/O1CgpO2nqMHzFJuxj15tsP34rzgnbgFTJROM5OO1orCMJLBdV0J1qfW3komzv04
YIuvUDeuH0/xrpwH9QbatO2on4ulmv2QkmMNCL5B0wXRO+blLsqFhgatVReSN3k9
970IKR6R1ZIDz/PCTIyzZinao2saeik93dLZZ7ehwU4TbDZAMp5J5yGApQ/Dhcwv
S8twDU2MhiEPT5KF1Yz/EW9IIZBAGgs2gRpdR4YbueIEDEXDl46XGvorSDj7v9pB
M6/8B9FEQVnZ4ZQWlbclkYH9hrawbQvLBz5Fpe4t2c4cPrEZqGCIpmljd88aF/bu
p7lqzYfba9sV8ep0plC60r2xY+C2BwSeEtwyDKhpBydQMu5eUML+FvWFr+hKzqz1
UCluE8thU8cvdWHpqp+g4tOXFvgnUZ4C5sB9yx/DJ6zjZtuQpK5Y2PoxXkefjUit
MoV+gT/dyffOBH+gIHX31tKxXED/hkAVxCRiR+joWjwcwK0ujXk=
=sJSz
-----END PGP SIGNATURE-----

--J5HkKuVHndwGUDS4--
