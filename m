Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12113C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 16:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbiDFQll (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 12:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbiDFQlG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 12:41:06 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E90420E94B
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 08:04:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b24so2958918edu.10
        for <linux-tegra@vger.kernel.org>; Wed, 06 Apr 2022 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aVHvc0zZRK67BRBNMcSWSUGH2BhjLhMfBAEGq/czyxY=;
        b=pJE5RCQwh1dyQbzSLBcNxYCqMktNILRb5+4CW3Sdt+m171TY8c2Up+a5bQAlWLnQms
         1RWwhDrqIoxmbO3U7ujPG5ZhY9JEjXSomwOvFy9ArFbV4iNQBcHGDv6x8UKS5WGrAF1q
         T3FK6YDsDurS16PFYHYAJMhVTMGk3kNBehB7kBQILaxDucyx3tnqqn1U+rduPXQlbCEX
         KeFKM/8R6iUVdMtJ8CC3fibPt4245THCJC3Yto9CgDuGOvaSS0g2rXXV4z9Yq+BHE7yz
         uezdHJtA/KC5MkyHVu17IoRI9E4yt5BPGiz3tVdDTyUIOyX7Liomej48bsrGPegD/7Rp
         h6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aVHvc0zZRK67BRBNMcSWSUGH2BhjLhMfBAEGq/czyxY=;
        b=Xc9sppBg69979G1uA3IBl9hdh+eXwM9wH2+pb6m3z/CNVrxC2phUEaBmL7e2vn9KyM
         76kyu7kbc4b2nVXI0i7cuEzJIobS6qotUN7KmRwMKmCX/hIwzddk+mZnZN8HUsyJmtKa
         LQfyBSm08Umj1g/3YQ8DrNfDnM7GJHRoB/Q9t3NJBNJQIhyTh5F5MgVzTOTgJsz2ObI/
         QwJd68RgjvYCtBXt/56BGfsbGt5g2TsgtAiOxJR6UUT6w2lRXaJvux0yOyp+slsm8iva
         5M934Jro+V8gZQIqe7/+imK0LpNRi2sAZJ8/DmWpGwmSZhIBBkvOXj2GMKi34Sm+Vv8S
         xFjQ==
X-Gm-Message-State: AOAM531173gXTP4fImqNwGwlzBa5e84Lz5+heeObuv9kORoRWeIb9aeu
        yAPeaW2FXMs+YqQy1wbTNr4=
X-Google-Smtp-Source: ABdhPJx6uJ5+O1XuvY4eXyK4rKcVgx5lIodWG2VPqTAVtxX24uvFGnve0kEZKava9Zyna4RMMrqdrQ==
X-Received: by 2002:a05:6402:5215:b0:419:4c82:8f06 with SMTP id s21-20020a056402521500b004194c828f06mr9245634edd.275.1649257480852;
        Wed, 06 Apr 2022 08:04:40 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
        by smtp.gmail.com with ESMTPSA id jt8-20020a170906ca0800b006df9b29eaf1sm6613335ejb.8.2022.04.06.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 08:04:39 -0700 (PDT)
Date:   Wed, 6 Apr 2022 17:04:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] ARM: tegra_defconfig: Fix enabling of the Tegra VDE
 driver
Message-ID: <Yk2sBf075+WIyWQ+@orome>
References: <20220406135920.129589-1-jonathanh@nvidia.com>
 <89c70eab-da76-36f7-0576-0122a7861c9c@collabora.com>
 <586d894c-425f-d924-a178-d1ff2c724a40@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kkvX+DhPOIauf5EJ"
Content-Disposition: inline
In-Reply-To: <586d894c-425f-d924-a178-d1ff2c724a40@nvidia.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kkvX+DhPOIauf5EJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 03:58:25PM +0100, Jon Hunter wrote:
>=20
> On 06/04/2022 15:37, Dmitry Osipenko wrote:
> > On 4/6/22 16:59, Jon Hunter wrote:
> > > Commit 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver") mo=
ved
> > > the Tegra VDE driver out of staging and updated the Kconfig symbol for
> > > enabling the driver from CONFIG_TEGRA_VDE to CONFIG_VIDEO_TEGRA_VDE.
> > > However, the tegra_defconfig was not updated and so the driver is no
> > > longer enabled by default. Furthermore, now that the Tegra VDE driver
> > > has been moved under the Kconfig symbol CONFIG_V4L_MEM2MEM_DRIVERS, it
> > > is now also necessary to enable CONFIG_V4L_MEM2MEM_DRIVERS in order to
> > > enable CONFIG_VIDEO_TEGRA_VDE. Fix this by ensuring that
> > > CONFIG_V4L_MEM2MEM_DRIVERS and CONFIG_VIDEO_TEGRA_VDE are both enabled
> > > in the tegra_defconfig.
> > >=20
> > > Fixes: 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver")
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > >   arch/arm/configs/tegra_defconfig | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegr=
a_defconfig
> > > index 289d022acc4b..c209722399d7 100644
> > > --- a/arch/arm/configs/tegra_defconfig
> > > +++ b/arch/arm/configs/tegra_defconfig
> > > @@ -286,7 +286,8 @@ CONFIG_SERIO_NVEC_PS2=3Dy
> > >   CONFIG_NVEC_POWER=3Dy
> > >   CONFIG_NVEC_PAZ00=3Dy
> > >   CONFIG_STAGING_MEDIA=3Dy
> > > -CONFIG_TEGRA_VDE=3Dy
> > > +CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> > > +CONFIG_VIDEO_TEGRA_VDE=3Dy
> > >   CONFIG_CHROME_PLATFORMS=3Dy
> > >   CONFIG_CROS_EC=3Dy
> > >   CONFIG_CROS_EC_I2C=3Dm
> >=20
> > There are per-existing patches updating the defconfigs, unfortunately
> > they were not applied together with the driver patches.
> >=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.ozlabs.org%2Fproject%2Flinux-tegra%2Fpatch%2F20220220204623.30107-8-=
digetx%40gmail.com%2F&amp;data=3D04%7C01%7Cjonathanh%40nvidia.com%7C98f0277=
ce8b74700664508da17daf665%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6378=
48526453449366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DBsHhvVKHeDSg%2BAyGIswF0CM=
ay0vcgucnaDD8D%2FUwLRU%3D&amp;reserved=3D0
> >=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
chwork.ozlabs.org%2Fproject%2Flinux-tegra%2Fpatch%2F20220220204623.30107-9-=
digetx%40gmail.com%2F&amp;data=3D04%7C01%7Cjonathanh%40nvidia.com%7C98f0277=
ce8b74700664508da17daf665%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6378=
48526453449366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DmjA88k40mPaX6V2TCDKd4S8AQ=
TUBC6rwq9VKwyIntPw%3D&amp;reserved=3D0
>=20
> Thanks.
>=20
> Thierry, can we get these applied for v5.18-rc? This is triggering some t=
est
> failures.

Yes, I've applied Dmitry's patches to the Tegra tree now and will let it
cook in linux-next for a couple of days and send a PR for v5.18-rc2 or 3
later this week or early next week.

Thierry

--kkvX+DhPOIauf5EJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJNrAMACgkQ3SOs138+
s6ElQQ//b7sbefUIpAzFIpv+eBCTJXiBz0fE1hMxagFke/hHJgBVtTuslKmmDcvX
kbP+lG9qQHziMQMlWZDqAm3HG+FvB7zMrAh1toIJff7ynLvf3WS8nJyD0B+t/dnw
u6tpRcygWiJFo8qke7z4H9I8K+Yl9AVzA5OGR4Ekk2voBEmau2H2orb6Qk1Sw73T
jLVB6FGRLjysn4p7NAONFUQy+XUIFrAOuRnyAh8B3YynhvP3FbTQhNFUcEdeBmo+
265HN9QOo84aqC/CGdiRNvdEpLIYmgVo9GSLqFO3yIjD0XdnHkSIqlbrKEFaqQnO
GBxtumwhK8HMs1as+CahaT/Itl7qD6Jxro5njtacj+xDdqeJWl8NbiFS09CcdXvN
Is8f3FWXpHxCJ5XYJyle3zjzrzWvrh4aVuGfpx2XVQkBn5uJoN2QYHIUnTO2WV9p
bUFLdkp/Ci/NdDBqbRce1MpV/wBcJXuygzbxFI+sZVBrUET003Yp6VmQDCLjGKbT
p4Y3QwLAap4LQfym0y0W/E3FGXzVzPSXk7EeK6DRboYWy6dfXfwraRDBgateZwZY
WCBPUP7+diA2eGD8pdjfrDKdnZNcW/LRvszh4nn+S8r+K9RxAK4MNz0arX5skva7
kAVoUuFthVH8aul9wEJ0Rt10Zs9a9xCHs5R59bi02V+8jknIbg0=
=Jph8
-----END PGP SIGNATURE-----

--kkvX+DhPOIauf5EJ--
