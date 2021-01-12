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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480E0C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 000FC2310F
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbhALM77 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405596AbhALM64 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:58:56 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0559C061786;
        Tue, 12 Jan 2021 04:58:15 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id p187so3725143iod.4;
        Tue, 12 Jan 2021 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vmNMz4c82U9fhl38EDcfbIBTFdzOpA4YaurmgZ3FP8E=;
        b=llm0EnUkhX9XjQIBTK80NWvYICcF3bAcLiD6aFyt4r6ZEs/YJ+UTRHjY9PyBEGKAgB
         BN1481GgjC56jqLRFRvk7rqMyIFJd+2ep0naN3uXopdHCvZV/63IanjQNz4cp8O5SsQy
         QSsaZtO2YpZsmQdw+08v4XgF/6v8laLk7S1li6g8GGlMhmgGo+YCzaazowoyLsZ7otX4
         po05P9W+UbZldABlzAf5rIasuitM4zhIxtyPmDRyNNPna6YyaMxIiqpFpydWqCKOMuSZ
         33Y203wBhp3zjuhA4nqygoBomvzsWUUVDR9xTx83aYqjI8fW8lEhNI7uKsS7fIAYO9Pg
         sq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vmNMz4c82U9fhl38EDcfbIBTFdzOpA4YaurmgZ3FP8E=;
        b=PJPWex4tVf1i8/hzEruFLBLkuHVVsgEoC/efuBc/69+WhIx58YZvvuElzxywJPRMLH
         Xp/DAz9i48ZOKrI9JhVyt0/8vgwf8kqRP91QDvKQI66bE7p3PPp2ftL+JITxywzHqisO
         X9Fvro/4BuORKH9UWu9JS3PiT9ZxA6iMoI0KFifcco3620IS0YgAW0kDxOHmY1XepASE
         7lnZRdi5hk4b9u0aiKRQ+EKGkddBIFBznKIB9EqYnI8vxIOkbdPZronhw+sawqEJmStH
         r97w5DRVIjm5qdMS1KI3FDEnkWbIUmsZP7H5TTX9SWMMOJPR+6jrCuVzPDqpJPKmc03u
         UIJw==
X-Gm-Message-State: AOAM533u+vNdbtK/B2ARJPpX/zOXQPTV25k81S8/+FQte7+ZwOQNYL+E
        KDQskbCLgESHsNdmgg/8CpU=
X-Google-Smtp-Source: ABdhPJwH5Hk3sgm0x2Krsl5EBJerXsE1lzyGhppEGMGxcC4o8A1Cz3aGdZeVFPIzT0r85wsaVeFVIA==
X-Received: by 2002:a02:5148:: with SMTP id s69mr4167726jaa.8.1610456295322;
        Tue, 12 Jan 2021 04:58:15 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 64sm1967959iow.9.2021.01.12.04.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:58:12 -0800 (PST)
Date:   Tue, 12 Jan 2021 13:58:10 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, Ion Agorria <ion@agorria.com>
Subject: Re: [PATCH v2 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Message-ID: <X/2c4nZwO9hxTzNN@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-3-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mDB+fc3ahoOZCE0L"
Content-Disposition: inline
In-Reply-To: <20210108135913.2421585-3-pgwipeout@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mDB+fc3ahoOZCE0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 01:59:13PM +0000, Peter Geis wrote:
> Currently hda on tegra30 fails to open a stream with an input/output erro=
r.
>=20
> For example:
> speaker-test -Dhw:0,3 -c 2
>=20
> speaker-test 1.2.2
>=20
> Playback device is hw:0,3
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 64 to 16384
> Period size range from 32 to 8192
> Using max buffer size 16384
> Periods =3D 4
> was set period_size =3D 4096
> was set buffer_size =3D 16384
>  0 - Front Left
> Write error: -5,Input/output error
> xrun_recovery failed: -5,Input/output error
> Transfer failed: Input/output error
>=20
> The tegra-hda device was introduced in tegra30 but only utilized in
> tegra124 until recent chips. Tegra210/186 work only due to a hardware
> change. For this reason it is unknown when this issue first manifested.
> Discussions with the hardware team show this applies to all current tegra
> chips. It has been resolved in the tegra234, which does not have hda
> support at this time.
>=20
> The explanation from the hardware team is this:
> Below is the striping formula referenced from HD audio spec.
>    { ((num_channels * bits_per_sample) / number of SDOs) >=3D 8 }
>=20
> The current issue is seen because Tegra HW has a problem with boundary
> condition (=3D 8) for striping. The reason why it is not seen on
> Tegra210/Tegra186 is because it uses max 2SDO lines. Max SDO lines is
> read from GCAP register.
>=20
> For the given stream (channels =3D 2, bps =3D 16);
> ratio =3D (channels * bps) / NSDO =3D 32 / NSDO;
>=20
> On Tegra30,      ratio =3D 32/4 =3D 8  (FAIL)
> On Tegra210/186, ratio =3D 32/2 =3D 16 (PASS)
> On Tegra194,     ratio =3D 32/4 =3D 8  (FAIL) =3D=3D> Earlier workaround =
was
> applied for it
>=20
> If Tegra210/186 is forced to use 4SDO, it fails there as well. So the
> behavior is consistent across all these chips.
>=20
> Applying the fix in [1] universally resolves this issue on tegra30-hda.
> Tested on the Ouya game console and the tf201 tablet.
>=20
> [1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on
> Tegra194")
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 70164d1428d4..361cf2041911 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -388,7 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, str=
uct platform_device *pdev)
>  	 * in powers of 2, next available ratio is 16 which can be
>  	 * used as a limiting factor here.
>  	 */
> -	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
> +	if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>  		chip->bus.core.sdo_limit =3D 16;

I think ideally this would be a SoC-specific property derived from the
compatible string, but since this preexisting:

Acked-by: Thierry Reding <treding@nvidia.com>

--mDB+fc3ahoOZCE0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nN4ACgkQ3SOs138+
s6GmtxAAuykATDSqTibSvd5j+VhWdSgAkDIuCOCRvE8LaBjMs1+GNl1z4dMFsIdX
3XrHJIfRbXQ4msYEEYClBxU0bhI3xqG6jGDXoGRga6IJIR/CZVRMMpnffPl/2igi
RGacMeSM2jN5Z1KNV9w4Xr6YRMBdxGZOpq3hv/J4RZGX5QAnUwMEhhcMIeGOJH/T
/R3PuVN/B4UeMynK24lZHeXSlTo8Vezw/wxVKDdonJGyTSbxxdKH/Jn2bOK5juP/
k5lebqNyDncQ50JiMj29/Eaj9UB7AUCrdD33BLbzBa00kuaYo3CsMI7jd7sa60LB
iooqnIow6P0sT+t+wr7Sw2/gIxfyao+lObqMbJfpBhBKzZh8MgEBDW5W2Pc6rcjs
86iWScjgjPgVzv/SlT91vhdPb8407Bd1MvjynRuAAbwGmDkQEzgS6tFM/ZheklwI
Ws3D4J9B+u0dsUHtg8GLgf/cwNj0xlG/8ackWfbxiN37au/tiPNLlJ0u3246jct2
PFGTolFMFmsjamU519JCy0FItFnImIQ+gqd9andZYryDXxKEVCpYp2AobsAkl7sA
oEle3UXpSHWv0+/NeXhIkGAULrHntxMCLlxLziURDvylDpjRkc9HHva/VAfcqFM9
LEd3q8nOuk0c+nvmD0R1KpFrE5eNAWcRN3ZD4dodB2UnD1Ca7GI=
=2mCN
-----END PGP SIGNATURE-----

--mDB+fc3ahoOZCE0L--
