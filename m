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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABB8C433C1
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF306157E
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 07:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhC2HOn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 03:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbhC2HO3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 03:14:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327F5C061574;
        Mon, 29 Mar 2021 00:14:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r12so17787938ejr.5;
        Mon, 29 Mar 2021 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3i61lbYtht1bCl8e/9X51r7cabit5ewoNnhghpFbgB4=;
        b=Ie1AnPs9rGSxNFYqSvt0EusYJvzck2q7ygXAvCLx2RY2J50vtvhFP0y4uA9Q5nxvx9
         PidhP6edYbGS7obwIl9nyLyLOpqEBRTOP84T05EHxQ5zg20rmUubOkc28iX6XE22aYfP
         8i5kqbk49k4OcXC1flXKeeh7vBBJvuRRHapTPEG/FQ9YBUeb3NMPu0n5cfog1+GXWvqk
         X8vShelYAPhGXPytY5mZy9SKV8QQnPIsEcp6jhYCn9vdOJIupz/Mur/RsMO2a+wvpRii
         3jYJzW2Z52GBwnPZ/hzLnF05PtxbiKoFz/iY5TucUhmEx9vuu+5Wj6GVf0YjiqPA5cSe
         ZT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3i61lbYtht1bCl8e/9X51r7cabit5ewoNnhghpFbgB4=;
        b=EC/ayPXe5hik3a8p1obKhaPnEJxsdAu64e4YMhhQytgo1jMV/4uGDezhN0DDzX+mUZ
         mgz8/C1ZrSHhTa6ENyii0alCN0ycGVJOuhFUOqCsoSLRAHYqFsqXwugD9vsarInJELCW
         MMMxiqXq2Ofbjcf+LXQsAzJhcpgTdUggezlXteDRvsgBpg11+GoAHlxYtDjnxkjSI4wA
         Sdg4s2RhWrTJ4aDIcf15Qk1CpIR4ikF9ng9FHcEpJCCnRxkK2FKlLs6s8BzMLZkpsHd9
         7xWuJGiTtY4I8egEel69bE2vnJ7sLlCKfR/A5rTY4u52gl0hBVZFYM59l6Yn5PRhj/38
         oLOw==
X-Gm-Message-State: AOAM530PPMYCtFI+P+Se5ZW649SzL0oK064FmkpwiOYtDur/R9+KX2wr
        P83PABgjWYN0KcjkmLTZDTM=
X-Google-Smtp-Source: ABdhPJz0Wyo214HyWDDtxNsLzkbmyW4AFgsBR1ewRxx746ERv+oPB8VFTAjV7+GjDSv0aqTEjGU2eQ==
X-Received: by 2002:a17:907:33cd:: with SMTP id zk13mr27102009ejb.224.1617002067914;
        Mon, 29 Mar 2021 00:14:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g25sm8253594edp.95.2021.03.29.00.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 00:14:26 -0700 (PDT)
Date:   Mon, 29 Mar 2021 09:14:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 13/17] ASoC: tegra: tegra20_das: align function prototypes
Message-ID: <YGF+a+/FXkGvT1WY@orome.fritz.box>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-14-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xtdBqiT13sHPbdgA"
Content-Disposition: inline
In-Reply-To: <20210326215927.936377-14-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--xtdBqiT13sHPbdgA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:59:23PM -0500, Pierre-Louis Bossart wrote:
> cppcheck warnings:
>=20
> sound/soc/tegra/tegra20_das.c:35:40: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]
>=20
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                        ^
> sound/soc/tegra/tegra20_das.h:98:47: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
>                                               ^
> sound/soc/tegra/tegra20_das.c:35:40: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                        ^
> sound/soc/tegra/tegra20_das.c:35:49: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dac' argument 2 names different:
> declaration 'dac_sel' definition 'dac'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                                 ^
> sound/soc/tegra/tegra20_das.h:98:59: note: Function
> 'tegra20_das_connect_dap_to_dac' argument 2 names different:
> declaration 'dac_sel' definition 'dac'.
> extern int tegra20_das_connect_dap_to_dac(int dap_id, int dac_sel);
>                                                           ^
> sound/soc/tegra/tegra20_das.c:35:49: note: Function 'tegra20_das_connect_=
dap_to_dac' argument 2 names different: declaration 'dac_sel' definition 'd=
ac'.
> int tegra20_das_connect_dap_to_dac(int dap, int dac)
>                                                 ^
> sound/soc/tegra/tegra20_das.c:53:40: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                        ^
> sound/soc/tegra/tegra20_das.h:108:47: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
>                                               ^
> sound/soc/tegra/tegra20_das.c:53:40: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 1 names different:
> declaration 'dap_id' definition 'dap'.
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                        ^
> sound/soc/tegra/tegra20_das.c:53:49: style:inconclusive: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition
> 'otherdap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                                 ^
> sound/soc/tegra/tegra20_das.h:108:59: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition 'otherdap'.
> extern int tegra20_das_connect_dap_to_dap(int dap_id, int other_dap_sel,
>                                                           ^
> sound/soc/tegra/tegra20_das.c:53:49: note: Function
> 'tegra20_das_connect_dap_to_dap' argument 2 names different:
> declaration 'other_dap_sel' definition 'otherdap'.
> int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
>                                                 ^
> sound/soc/tegra/tegra20_das.c:75:40: style:inconclusive: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'. [funcArgNamesDifferent]
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                        ^
> sound/soc/tegra/tegra20_das.h:118:47: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'.
> extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
>                                               ^
> sound/soc/tegra/tegra20_das.c:75:40: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 1 names different:
> declaration 'dac_id' definition 'dac'.
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                        ^
> sound/soc/tegra/tegra20_das.c:75:49: style:inconclusive: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'. [funcArgNamesDifferent]
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                                 ^
> sound/soc/tegra/tegra20_das.h:118:59: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'.
> extern int tegra20_das_connect_dac_to_dap(int dac_id, int dap_sel);
>                                                           ^
> sound/soc/tegra/tegra20_das.c:75:49: note: Function
> 'tegra20_das_connect_dac_to_dap' argument 2 names different:
> declaration 'dap_sel' definition 'dap'.
> int tegra20_das_connect_dac_to_dap(int dac, int dap)
>                                                 ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/tegra/tegra20_das.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--xtdBqiT13sHPbdgA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhfmsACgkQ3SOs138+
s6HkchAAltA7zPKOIL5EHYwQ8SynrcJVRybPjCnp5hAYOxFdncbR4b5rvEhZ8a2S
Es3+Six6tVloierFTCCftuwK9YUuso9z+8TtkV0DCciC/GFfbW1IO22hROSo2/Nv
g9JQnkjrHAzKhJS+wMRXKIDhhRlQ729bf01cEkINfNPaCvYp/amv0kMyyl2ElymD
yJOx4XBlmMpwgBTKoPlTNVuGaBqkMV4AWi8IlENba8HSridV7NUeP4hxFPnkC1Vk
1O8uG3KoyydD73hy81XqfyDW/pxquC6xA0fxcCpW08b2SnUcjCNMm9haVZQgkoId
3h6IugwleJZvjRcmeuswp/CS+DB/CWo6qHvwDAUAz+ipa5BpovK31VrEKg5B7Zmn
TAfTPCdbDHLTRsjJ4ds5uU7QG7dT3QDPzy87+Lzv5SiIKLK1ZtZowR7wQ41rszjk
k5bPswLndoqDVSK4+9r1aLoYWRdX/7WkzaNNSW+0HcipR3/EZThkAmgAjvoxGDzv
XnhkDtMBoDnN476Xr2GsuzPgbfhQZHjXeZ19YkpVtg3srQpdZha2RG+5gGmmpBAx
HBkJ5BeNwzyboiX/4gXXWaUEoTH54LwMxCFGLE0cIhbXCAeeKtYeThRT+VvxKsNB
F2dIt8OnEynsXoIoTZj/ZvEiki/VOUi3FPIkV3MSOAomuwY5/fM=
=/+6d
-----END PGP SIGNATURE-----

--xtdBqiT13sHPbdgA--
