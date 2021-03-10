Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C476C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 20:18:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3119864FA8
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Mar 2021 20:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCJURz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Mar 2021 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:54658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhCJURe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Mar 2021 15:17:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E735F64FB3;
        Wed, 10 Mar 2021 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615407454;
        bh=22tESQIORWwnjVfGnwjn+fBTqJ+OKmI3PPmG59IpzFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L57vt6Er2TEZ7xI53hKEVh/9U3//HFqey7UDMI/eaSqhjvvU/3JXz8hF4E4E/0gRW
         dTVDBfq8ofbwGNvXfOvW5yMhI2mRUoCOQO3c0uz+3dJdWGWQ8TN6qU8l6WZptSBuVc
         KTPo3IaUcfU4gKFKAA4NYn3NRibSG5B053rzNrL+VAbYfKkFb4I12uHFynn8uzGqEQ
         tJ63O0TXO5Xh1dXMK3bY8u+XEYRyJ9WS0OtQzbXrmUfsm6it9joAAR6fa3wmFswQE6
         wKPyAsHd7RG8qRT6tb2aplCB1vwoH64mscEWrMuPiTVS3xgaPgb64jgtF+lL5V2OF1
         MHJTXrpiKp9bg==
Date:   Wed, 10 Mar 2021 20:16:22 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra@vger.kernel.org,
        Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310201622.GF28564@sirena.org.uk>
References: <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
 <20210310181611.GE28564@sirena.org.uk>
 <9e1075c6-da49-d614-e7af-30242dd3d3fe@linux.intel.com>
 <9020a65c-b8b8-ac1e-d0f8-a12e507322b8@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline
In-Reply-To: <9020a65c-b8b8-ac1e-d0f8-a12e507322b8@nvidia.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 07:17:13PM +0000, Jon Hunter wrote:
> On 10/03/2021 18:37, Pierre-Louis Bossart wrote:

> > +EXPORT_SYMBOL_GPL(dmi_available);

> > -=A0=A0=A0=A0=A0=A0 if (!is_acpi_device_node(card->dev->fwnode))
> > +=A0=A0=A0=A0=A0=A0 if (!dmi_available)

> Sounds good to me. I would have done the same if I had known that the
> current solution would have caused this regression.

Yes, this looks good.

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBJKRUACgkQJNaLcl1U
h9Do/Qf9GmQSmIRRH5Rx5BD9lm0loP+WMo4oztmA5BvnLrrnSgf2K+wOlWAG9Kgz
kya+OGtjauw1NImpC086m07bV39/APPw/ag4ZC8neDY8u1BCdebYNGxoLNd61OSS
W6EnONmDY0axTAwTnNwt3CCp/Q4hiXtuuQvYy1o91mF7RJv9hwAs8rpFjId/yZ/1
AmOiaklO+mRU3Cyysmz/wuYoHXO/j82Ftuhn4XgBKn/vl2kpRQ5pbnCJl0e3X4MA
NB+Ks0DefrXiHfRocACmQLUcCxXCd07KnM/3T9oPdURYRQrklqUjbyiAdqrjbQYR
PV/F+VNwl+q08hwHT31LEW3nY1+xCA==
=atzH
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
