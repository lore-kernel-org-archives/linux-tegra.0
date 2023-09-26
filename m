Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6537E7D26E
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Sep 2023 09:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbjIZJSu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Sep 2023 05:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234030AbjIZJSt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Sep 2023 05:18:49 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5CB116;
        Tue, 26 Sep 2023 02:18:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BF3C433C8;
        Tue, 26 Sep 2023 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695719922;
        bh=mlwG5wTGIlk+oeIJXV5mNozKoyrhncfuc0jgKxRBWzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T3S8kaOmXQ8FsN5083g0llW5eIovcu9kopK2DSymPv33VasNg76uU6RDfujD2zvMT
         lsYnOPIJ2K4xO6Dh2QDaq3lOjo61mnEaDVPIimXMb/AEvkuKO2OYRgOm5HcsibrY98
         UELjcG8tDoHEyeTaQ/bvyX4QqAXbVoP+9y08QqgshIfDlTDS1Dh0EMN+644cBjxO9o
         SPBQlKkRrN50VO8Hw3hLdufDe1Up9Q1INpDIVH9l1bVDRFarfu1GgVi34TBQcIhxTz
         nb0SlbqbMrfGna9Mk03r/CBR9DhOMTTYc45FrongNwTNiXYWiK6paesvAtetzzKE/i
         JjAQsgM+1C8eg==
Date:   Tue, 26 Sep 2023 10:18:37 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Ninad Malwade <nmalwade@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V3 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Message-ID: <20230926-caretaker-raging-0fe380cd1232@spud>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
 <20230921130818.21247-2-jonathanh@nvidia.com>
 <20230922210101.GA3562325-robh@kernel.org>
 <c2a5a199-2297-d0ca-515c-64b1dd267509@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t5SaNNLRZ2Jhwil1"
Content-Disposition: inline
In-Reply-To: <c2a5a199-2297-d0ca-515c-64b1dd267509@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--t5SaNNLRZ2Jhwil1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 11:46:58AM +0100, Jon Hunter wrote:
>=20
>=20
> On 22/09/2023 22:01, Rob Herring wrote:
> > On Thu, Sep 21, 2023 at 02:08:15PM +0100, Jon Hunter wrote:
> > > From: Ninad Malwade <nmalwade@nvidia.com>
> > >=20
> > > Convert the TI INA3221 bindings from the free-form text format to
> > > json-schema.
> > >=20
> > > Note that the INA3221 input channels default to enabled in the chip.
> > > Unless channels are explicitly disabled in device-tree, input
> > > channels will be enabled.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > >   .../devicetree/bindings/hwmon/ina3221.txt     | 54 ----------
> > >   .../devicetree/bindings/hwmon/ti,ina3221.yaml | 98 ++++++++++++++++=
+++
> > >   2 files changed, 98 insertions(+), 54 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.=
txt
> > >   create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina32=
21.yaml
>=20
>=20
> ...
>=20
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        power-sensor@40 {
> > > +            compatible =3D "ti,ina3221";
> > > +            reg =3D <0x40>;
> > > +            #address-cells =3D <1>;
> > > +            #size-cells =3D <0>;
> > > +
> > > +            input@0 {
> > > +                reg =3D <0x0>;
> > > +                status =3D "disabled";
> >=20
> > Examples should be enabled.
>=20
>=20
> Yes normally that would be the case. However, per the discussion with
> Guenter and the comment in the changelog, for this device channels are
> enabled in the chip by default. And so to disable them, we need to
> explicitly disable in device-tree.

Maybe a comment at this location would be good then, to point out that
this is what you are trying to demonstrate with this example?


--t5SaNNLRZ2Jhwil1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRKh7QAKCRB4tDGHoIJi
0p6zAP9IDPIlYXKh1b6yTrS2dz8pjd5jzbbeXViPKKFPs5v8FgD/W5j59c0Z9HxS
NecwcJZBhTXgt/Ro2/fPA2mvhz1agws=
=NJQ8
-----END PGP SIGNATURE-----

--t5SaNNLRZ2Jhwil1--
