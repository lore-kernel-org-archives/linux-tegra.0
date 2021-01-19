Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E50DC10DCE
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDD9122DFB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 18:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389743AbhASRcU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 12:32:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389055AbhASRcR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 12:32:17 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64DEC061573;
        Tue, 19 Jan 2021 09:31:36 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v15so16892180wrx.4;
        Tue, 19 Jan 2021 09:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HwQ7smaLEtNvkmHMibo6rkKhwmggDii6CwKV9YcaQnM=;
        b=IQmb4F/D5RBk6+m5NZjGrzszyICYFm3hX1JxmI8UdhMIMDZeQEXBFednR40AuIdARb
         EeQFYSp4xZ8Zve02t4kECcH/sq++nVOFbnyA0S78HX2RV/CDoSgrgCUerHg0XT0ZIVkE
         P0H0JZ4boXtuohUDusTMg2EKr856w99cTwFiAUsXtaiI/17ZGpH0E5Mk4KzQ42EYwPDz
         Da4kgr8w1qe5lLRdSr/Db8dqBprQ0txJ0XirsNHDBhZZN9tIYphKIxfG23b/dXBDAEoM
         R+PSc+VEqeC1qZK7Hw0U/285dGEiOoh29sZvrFz7yJTcQ2v6rlXty4k6lzFHPQrGTGBx
         6zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HwQ7smaLEtNvkmHMibo6rkKhwmggDii6CwKV9YcaQnM=;
        b=bpVQ9yVe5j0oJiJzZpJzp26QWwpgPo+WE43YcjGW9qZopbTUWzWxD6PWePzgSOFPzw
         R0TBpiGe9o1VoeEeEyvISkE5k7L3KH3+XA6nS7V9mWZQ8QqgpHjIX57aJJDANWGr3JJT
         0CASra5vMOERjLpNgCmQkhgjIbDzSEntsco2gmWHGUBoTrsqaCxt38MWcpfsWSUgtq46
         B7AbFBMf7l9Ldb08s+bEJLDKCysdO6YQW5Hwh2zGxf8fUnKMrXVRiD0mLfuC3uMExxsx
         93SBsIFXfLgf9F2BS2fpcyg57C/cHAmMmuyvUJYpj75mTYEudNBN6QdPQtqnNuyiew6V
         pU8A==
X-Gm-Message-State: AOAM533HlwSjDntMRrv2CM7AzY+23Y1fdpCIXu2Q3JSOzVPzNk12xP+G
        k0oFURJj78m6r/VWwaBxAUI=
X-Google-Smtp-Source: ABdhPJz/Yv8ulkqJ/Azr75tKpCRQi/tbKsDErcdUxVGeaQAEyMzhpnuXiq5NprvTliL5gASyclaHqg==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr5377519wrq.238.1611077495584;
        Tue, 19 Jan 2021 09:31:35 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g14sm5805612wru.45.2021.01.19.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:31:34 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:31:33 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Message-ID: <YAcXddCDkWYIIqsK@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com>
 <YAGzJM7BJqLV0xxY@ulmo>
 <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="af5QIX/cdXc7DM/N"
Content-Disposition: inline
In-Reply-To: <b84c6d9f-e113-e249-cd76-248e2cd646ff@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--af5QIX/cdXc7DM/N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:31:35AM +0300, Dmitry Osipenko wrote:
> 15.01.2021 18:22, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >>  static int hda_tegra_first_init(struct azx *chip, struct platform_dev=
ice *pdev)
> >>  {
> >>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> >> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device=
 *pdev)
> >>  		return err;
> >>  	}
> >> =20
> >> -	err =3D hda_tegra_init_clk(hda);
> >> +	hda->clocks[hda->nclocks++].id =3D "hda";
> >> +	hda->clocks[hda->nclocks++].id =3D "hda2hdmi";
> >> +	hda->clocks[hda->nclocks++].id =3D "hda2codec_2x";
> >=20
> > Originally the code did this in this order: "hda", "hda2codec_2x" and
> > "hda2hdmi". I don't expect the exact order to be very relevant, but was
> > there any particular reason to change it?
>=20
> The reason was "to make code look nicer". This was a conscious decision
> since indeed the clocks order shouldn't matter for this driver.

Yeah, it's probably fine. In case this ends up causing trouble after all
we can always change the order back.

Thierry

--af5QIX/cdXc7DM/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHF3UACgkQ3SOs138+
s6GPyQ/+Lynszet/5a+5cGwVUEi6sgRIdNW4xJL79sg5+ldGPV0VGBVLEEuX/vVJ
E+rhv53SOczraDUeSuu399geLmdy3uJdAvouUn40VWvxQbaBe5TJSGcHwQAzHT2u
3g/wzUk0nOqboYsTE79Tf7tn/+EGIGDT4hO9UI4zIe482GQ7WRtnHZIs8SncxcvQ
yGUWgjE8U8hOKYs8Nq7zJEaslAuyYHwjjzEmpQ7DLZg3L9jEYnhZccIEuFgct338
ki6J52wF4xaMP+a+Rwr2eteorNqc3SZp74J3s2Q/xD5dAhTDc2VQHnwZEaSxovNn
5MgvYv46TWH3MOEFGuOBPOepT72wsK2q2pnYd4a6ov5wyJVe3aOY6b/DUYj5VZEH
NkmgUZYxObxFZox2EXoAvSmR331w4heRqcuq54lSw5XdIOMMTxLrwkv0GNRvM1WN
owkkxWQY9PTvCJn/FICmMXuj9jhotup+294pIeDwo88u6IYuwsuknm5N4tMF4RDc
3YE4Rb2ptq05hVmbPGJbDbGn9qDXPDgEQ8Qe+ZfgTPCF27FAvarNgJs4WGoF4wYN
aX14+yMHW191WsnpTlpKpJXnZvy9z6/SzmXPSzeMhthBByDmIk8JGbqyingJlFAS
ZRHssj6TpRts8RcQJu6FvoANQyqgEvJvgGhVDBvdgOcd4bN8Gmc=
=t2N3
-----END PGP SIGNATURE-----

--af5QIX/cdXc7DM/N--
