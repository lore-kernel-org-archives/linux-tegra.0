Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE33EB64DC
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Jul 2023 13:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjGFN2I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Jul 2023 09:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbjGFN2B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jul 2023 09:28:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93064172B;
        Thu,  6 Jul 2023 06:27:47 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso632811f8f.2;
        Thu, 06 Jul 2023 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688650066; x=1691242066;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP+Be5x94KOxJdNX22HWEfwU0tt0ZFxg470C7ejjtiA=;
        b=jiRkx4IU2b4QkssUl5ksD4+GG37t62JFslOPj1EKFxMufLKrSkpzIXrEOTrSOD19dV
         3yciLzT+//FnvWpx92cUHH7gFmW+XTx1sQ6hudefhc9fWxFnEH/ggCEXv+ixCuNiTP9g
         KHyaN+OqWIoTFu9lgEfZlYNII9E4BzrutwZt+57aGwEnDKTpHSvSOhPTDMJZUCAGGqbG
         A+6kIKPqzHT38/LKFWId4b6wIqIany+2ZWd87FwkqZh700kR0nfHwzzWYNVU1gAZsXaN
         rujxVqEDJ1OxZ0vFcIxT8yaSPjTOAzEWto4b7wwxydMfZa3L+cbrJQZvU66J36WjVPIW
         taaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688650066; x=1691242066;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP+Be5x94KOxJdNX22HWEfwU0tt0ZFxg470C7ejjtiA=;
        b=KLMUDMZZNL8VD1DvImhPc21nuzopH934nDWA1qjnkAozYH+eVP7CIMMfaJKOaG3Lsc
         p72ScRlpWdQ6wp8+g9ugoQBeZl6DDkRsBk3YPP3NB3/PYl9MYMKlfhDEIMgg5XSDle10
         q2lPVCcF2jWdVex9cAXyWPd9IzMSZT9x+NlUDi/xguwENtwDD5LUKZKh3inw7/HILlbu
         +przz56TIUF5HMC8LLWLNVZLfJD/TfuDwj/jbZjEPkppMb4TEkTcN4ScOWYOpB1pQcfG
         vnmjK0ohp1OR5D/0FwtmLlhsOQlSDan4DjMvdRZLFVZbJWX9etx2OuNtNcrYJa6LxNga
         Om+Q==
X-Gm-Message-State: ABy/qLb627UwM1vjCyH09xNca3dn9RTQZVyMTRcLOmZ6hQpRLS1shOhT
        33gebeRIPeEGzwMwv+5Fc5I=
X-Google-Smtp-Source: APBJJlGAnOUuZiZbUEvafsHLoUDbIsD1teIpH67LcsObIoqmJ2UHIsLJiLd4fz3GwgC9/7d3d31ohg==
X-Received: by 2002:a5d:684c:0:b0:314:4915:689 with SMTP id o12-20020a5d684c000000b0031449150689mr1551687wrw.34.1688650065607;
        Thu, 06 Jul 2023 06:27:45 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f18-20020adff992000000b003142e438e8csm1917330wrr.26.2023.07.06.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:27:45 -0700 (PDT)
Date:   Thu, 6 Jul 2023 15:27:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: tegra: Convert to json-schema
Message-ID: <ZKbBTye-aaDOYpCy@orome>
References: <20230705153056.2514908-1-thierry.reding@gmail.com>
 <20230705204723.GA1866650-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ZoPfLZzEvSOhvP2"
Content-Disposition: inline
In-Reply-To: <20230705204723.GA1866650-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9ZoPfLZzEvSOhvP2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 02:47:23PM -0600, Rob Herring wrote:
> On Wed, Jul 05, 2023 at 05:30:56PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the Tegra timer bindings from the free-form text format to
> > json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/timer/nvidia,tegra20-timer.yaml  | 121 ++++++++++++++++++
> >  .../bindings/timer/nvidia,tegra210-timer.yaml |  70 ++++++++++
> >  2 files changed, 191 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegr=
a20-timer.yaml
> >  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegr=
a210-timer.yaml
>=20
> Convert? Where's the removal?

Ugh... nevermind. Somebody beat me to it and I hadn't noticed that the
plain text files had rebased out. These were merged into a combined DT
binding in nvidia,tegra-timer.yaml.

Sorry for the noise.

Thierry

--9ZoPfLZzEvSOhvP2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSmwU8ACgkQ3SOs138+
s6H8oA//RVV42lNhkvxeYrO+yxypLhP99790vYMQfXVArb2yWm1iyjhSDVZBQgk3
FKSz6mzNxuITmktGeB1xdL4yTqMNP5t8+AuoJlt2a8PqEmAR2iEFc8m9a0Tkk7zP
IJNb1kBfX2/L5v5i3neh6THYoy0Jh3ucvuPFix7a5ElCEydoagDDPSSL34MJB6T7
GkbbGQN5ls90r/8Q4t28BjmGWVO62oho6OSKlffweIus3wGrr1jaPFrrCuycX5Ja
UJ3JgpO5BLL/6z/sti7cuoUGiR/gMefsKgMbOeZe4PBZ8PE7tAbw5udejDvyEoYQ
1TCMj1Zp1MtjTGYmyU4U03CzL8bKz4A4wa4z+bfnSSm2yvOVoVSI+rYbiuLOEzkR
aP2iE8L1RE5Z3Jb+WPT8v4ZkmhNgrQsfnYk9tboz17B43JFGPpdh6KQGoDi+JT/3
XHIUNupLtkCQLlt9SY8u4JP9wtiPbDOkpSWss9FEkL/KmcGAKJ4pG803Q2Vix+Fa
5DLfXaetrCK8rlrS8Zvu7s5nl1v43vuMkEEydDxPltpnlc6eHAt7yyPPxnatYenr
/ko4ZJ4LAYCRTp6Em7u1/xMPhEV+Sj8tN2/+Sw6lkzK2E84ti2K55LqsaTFxCt3x
c4slT4Ns8p+tRLxJtO04EqgV7TR4pPYh2SCfxPWFmuGywW41zss=
=tnwl
-----END PGP SIGNATURE-----

--9ZoPfLZzEvSOhvP2--
