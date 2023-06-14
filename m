Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D702EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jun 2023 09:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbjFNJ1M (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jun 2023 05:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbjFNJ1K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jun 2023 05:27:10 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B051713
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jun 2023 02:27:08 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-977c89c47bdso84494266b.2
        for <linux-tegra@vger.kernel.org>; Wed, 14 Jun 2023 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734827; x=1689326827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wQ6sXNSnoiLXE/DbardJ3wfMBPxkEflPlrPVrnR8kc=;
        b=Pv/xsOk6BGAlH84yLUIM/cjp3Wh3JVsJc5jKSzfLlibRtXmWd7CQb0+1sLrj+Wt1sE
         kkc/cg1ChQ0aozISeEF9H6J/zd8ARemoScMQgSpB7miB629CfdYSI8I9U2I09GOIfzpz
         s80KrVjFwiWeLcUvrJlAWUw3Y6e9VTGgX4U2EvpeBQzDt8Apt7TVc4CmmwSSx3ncCuEX
         72YeV46uB4LV8HE7ReCuz+5A0Hxx4Ifxn6yCnZbuv6Rv9UJGIyVQMaIa2Ia0Q7vw0rZe
         bnIvNMJiWP2i83KvEDdRv6WtT0elVDSigQR7JOvDARLL1n9kAfQcjmOcFf8lc7FuibMB
         XGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734827; x=1689326827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wQ6sXNSnoiLXE/DbardJ3wfMBPxkEflPlrPVrnR8kc=;
        b=laJ+XeQGwdwdJ/OAz4WbiR6g8fw7oF6kRoSrGc6OzHVKpukz/rQnGDUfy685ItPE+q
         AjZ+PAtkFUX0JtJVrAY83PZASno+8deT5YH/MlkdgaR1Ko6LnDN9Qf+g/KL7jIMAGyIU
         9hQWZagoNbnMtHlaRr6Lgy2Lxp8q/QmR2InDFc7+RwaMDk57eD9g8FI3d3bhbELWybiP
         G/6JjBchmOapQsVJTsOstIVyYmL5Y/3Paw/xw8EucSZfwLKKxpolgwOnQyysOPKoYagI
         J3YbUjipPXGi0ycUDHrl7cTzvfUgK2UercVH2uCsMgy1xra2tF6xWX0ods5tD6VWqS0V
         6pWA==
X-Gm-Message-State: AC+VfDz0b519896Jndub2Ev1i77JCwCtuVm4kbHYfp/Q3G4keMAlRQN7
        L17z62ZTHH+AO/IGgBWWaALidXXbC3A=
X-Google-Smtp-Source: ACHHUZ4zb4lEwBTLKRU5rl2jzJYGuBHmFC+EM3N0NE4TNv4mMBQsS4XQiWcK9ylFMyz4NC/c4pQF6A==
X-Received: by 2002:a17:906:730b:b0:973:bcf6:1d4 with SMTP id di11-20020a170906730b00b00973bcf601d4mr18042481ejc.76.1686734826688;
        Wed, 14 Jun 2023 02:27:06 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906379800b0096a6bf89259sm7747066ejc.167.2023.06.14.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:27:06 -0700 (PDT)
Date:   Wed, 14 Jun 2023 11:27:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/6] dt-bindings: Changes for v6.5-rc1
Message-ID: <ZImH6MwUTGA6s16Q@orome>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
 <20230609193620.2275240-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gxmdR8maKjlNkRiC"
Content-Disposition: inline
In-Reply-To: <20230609193620.2275240-3-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--gxmdR8maKjlNkRiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 09:36:17PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.5-dt-bindings
>=20
> for you to fetch changes up to 5f027147e4796e9fc11083b2ad50a91c1ac36ede:
>=20
>   dt-bindings: tegra: Document Jetson Orin Nano Developer Kit (2023-06-06=
 14:39:20 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.5-rc1
>=20
> Several new modules and devices are documented and fixes incorporated
> for the Tegra234 GPIO controller pin mappings as well as the possible
> Tegra XUDC PHY connections.
>=20
> ----------------------------------------------------------------
> Prathamesh Shete (1):
>       dt-bindings: gpio: Remove FSI domain ports on Tegra234

Hi Arnd, Olof,

turns out that this patch in particular is more problematic than
initially thought and is causing issues for various distributions.

I think we want to back out this one patch and replace it by a version
that simply removes the wrong FSI ports without renumbering the
subsequent ones.

The tegra-for-6.5-memory and tegra-for-6.5-arm64-dt tags are based on an
earlier point of the dt-bindings branch, so it should be fine to pull
those in irrespective of this.

Thierry

--gxmdR8maKjlNkRiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSJh+gACgkQ3SOs138+
s6GHDg/8D38+6hVSWbefVVoEGmosbIwt/9mgBvgZiEG40e6E+LVpsptHuFU6/KBA
Xh5NdHcO3LXFa7BAabgT3lYBsW7nR1QHI9sH1+nVlPouFk3UkSckZG+t/KEjgQbE
vRYmBtDAaQC6oaQkAJIA+6ckrOInHL5OPFcd1kVGqoBPRHKq5GalVVFYKmgSbQF1
3i13LWTcUnEvFPec4kPwIvFL2LyQW8DgE1bZRfzDsY6XD5NgvA5ZjvG1KXOeOzHr
IPsEE+B+pPcDmMFOp71fHvORkDjpGbwo2GkqF8xXdL9yxzIUCWkVcJtgkO8aSn18
ZGw5Q4DrlpIugdso4P7GY0tbsC1H2fxCio67hQrXuY9E8v6Teg6VBiQxf9VOtZVr
XdPyXxCjJj1BgnkFiGXn9ICq0lgs/PBEk9+HH86t+X+9YZHC9MZV3jWydaLUvwqv
6pWCQX40q8dmTPg3WuWyR6xVtFr+IUpWSC2oqX55Ziyd8heJwz3alcdW3ufIcQhl
9XGCOkZuvxkg5lKYcfh2HSXcZzRa5tb+BCMGUWqRI3arxB7bqW4t7IKNCktZSCTo
LLGYOBq2py7MtGQ1uc2tcRdAJISVcE/4ZI/PKU1acOOCi+fHgd1oICmx2XpRSmzm
7++r/RM3CNu0pL+kxCJxMSL5Jot9C7UnZGKsCwGxftvsSXgvhcs=
=CuIk
-----END PGP SIGNATURE-----

--gxmdR8maKjlNkRiC--
