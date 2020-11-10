Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B62FC388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 18:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E407420829
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 18:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0SJQaiv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbgKJSWR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJSWR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 13:22:17 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9251C0613CF;
        Tue, 10 Nov 2020 10:22:16 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so4138576wml.2;
        Tue, 10 Nov 2020 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cYvJfHjuscK/tQLjt2qihh1n1W+yA/1YFVyK1P82TAw=;
        b=k0SJQaiv7jQV1anYPGtP4qX7ALoNABosujIO0+Y9KidFIpN287u97UW5qFQ6QqMAdP
         AKIqXmF6ued/EaFd/+020PpmLGKjYtDiUMU2u+Urbc4RyugsoY1caTBGbMv5xWuEKV0H
         9GNgq7wk4zoeOQ6ISHJmU32vlIDSBUaj9nh30qk/yAAAjs37F4F7/toB8y1OGg6wVHX7
         EPOCAEc2SHvmq5kE8C1tjC6fcuas20mu1DzSNpN8PTiNMCM7obcOOlRVlj2k4Hxk+oJU
         hsL1XXr1gH/WdBnOWClIxyXjDD8HSCeqPa93KyFYRqAkCZGixpxc0WaaMr/RlttCvDhA
         lNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cYvJfHjuscK/tQLjt2qihh1n1W+yA/1YFVyK1P82TAw=;
        b=dssVrZIfcgxYv5kLknfB5+cCd9kp27H4gBmup/Q1yUa9GUFfBC9Gy8+/kqomiawado
         c5og/SomPciUryxXlIi2Chjn877OB+IdkktyAaymKTeIgyFJ5cd2JrkvM8k4+gDs1DJJ
         r1TFNNa1oGitWvyK65/iMM5ywWmmvmDUszoqHnxBJeHRwMtOpmkmL+cpWXuUFYqNXH6k
         5fuSi6kOJIPNevt5vProOf9YLBBPS8VuCB2HANpY8JMV0UsHm6x5jWENZCIM0z2V5AOX
         ImaHE+pd8tnSF6vEN34TV3qQPg97AQvp84SAdkzhGt1rmbpQXF8lEJQXLBfOtlHwKVCI
         8/CQ==
X-Gm-Message-State: AOAM531k07ueVeTEUiIjkJYDXmSqSYPGPNaveJSZjVJPgA+g+ZBUWvu6
        EMNYAW7K4Z1CLnQT5NS60J86BOGiVEo=
X-Google-Smtp-Source: ABdhPJxS2FWRbdtTxQ1iSp2MuSbDUUIgU12RbKbo1oXnz1v0nzhjGAwvce4BbePOu3juIgugsGTL7Q==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr373874wmf.189.1605032535569;
        Tue, 10 Nov 2020 10:22:15 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o205sm3985646wma.25.2020.11.10.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:22:14 -0800 (PST)
Date:   Tue, 10 Nov 2020 19:22:12 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra186: Add missing CPU PMUs
Message-ID: <20201110182212.GI2297135@ulmo>
References: <20201013095851.311478-1-maz@kernel.org>
 <20201110173601.GA2297135@ulmo>
 <3da5c9b1f93699634aad997b77536a92@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Content-Disposition: inline
In-Reply-To: <3da5c9b1f93699634aad997b77536a92@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 06:08:31PM +0000, Marc Zyngier wrote:
> On 2020-11-10 17:36, Thierry Reding wrote:
> > On Tue, Oct 13, 2020 at 10:58:51AM +0100, Marc Zyngier wrote:
> > > Add the description of CPU PMUs for both the Denver and A57 clusters,
> > > which enables the perf subsystem.
> > >=20
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
>=20
> [...]
>=20
> > >=20
> > > +	pmu_denver {
> > > +		compatible =3D "nvidia,denver-pmu", "arm,armv8-pmuv3";
> >=20
> > checkpatch complains that this isn't documented. Did I miss the DT
> > bindings patch or do we not have one for this?
>=20
> We don't. But I don't think adding a compatible string for each
> and every micro-architecture makes much sense unless we have something
> useful to add to that compatible string. Such as a full description
> of the implementation specific events.

I'm wondering if this isn't going to upset Rob's json-schema bot and
make him mad.

Thierry

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q2lIACgkQ3SOs138+
s6G+TA/9F6MvLXbUY8goi8p4El2Lxs3U2bJuZ6UfdFXkKiUkx5kY7mtRU/4YQEJJ
Kork+UnSGtwi1wFXtOPv24b2PZ2xlQoqedvKXrWehBJR75TeRHUxwRQI9XvqubG/
Xhlh3kQfMx7dQDK70Q4v2r9w7i9IM09aio3si/xE0+C8oE5lcS3Qb5sUJP+1/M+s
h5SYShD8OAzcmC/G2uun+XSd+RXOpUiP96kWizUdBN6dC2iJdJFhhXd4gEQ9pn2N
i1wwMuE9QA1lFFafk8SZ70f60vPpbIaFt1s0OZc+sN+UN2/EJJj0/LpAvLHdlBGl
ObUHsSQmeKtP/4SKo4OAONZWHuqzutZkyDsyKsZh1Jy5SqR7eJk8xuy9XZ9iT75a
7flZqrYD2L6iTeVXaNip1B5Xed3ObxYWxKaAxy7I0ukLfTZedpainsqXAudNMpJ3
1bIkWNAdwpgGJGmUIZjszoZxxV0H8FnH3cDGDSBkO9+PAwiMIsrKStW1xnZCgQxQ
5/cIGHRTXkvMOBbprMG4I7dfehmiL4a/vJBlx6nyTUKTv6S3EYEBNOm6SGB0+bxC
2uy2vDt5f6KWx1sTo5VmcgmoSbLvHniGFqlE8pyZNi1LWgmozj+ZY4l2sJOFSQ9F
EapjZcu03ZiIdYFREY51jxDvz36O8aZdbRbyOZYlGVyKuZgjqwA=
=Ssqv
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
