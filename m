Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974D8C6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 10:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbjDDKe4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 06:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbjDDKe4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 06:34:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F169610B
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 03:34:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id h8so128653040ede.8
        for <linux-tegra@vger.kernel.org>; Tue, 04 Apr 2023 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680604493;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXAnUa6AWVTFDx0v/rlj96rY+EfFkpNkyegz8fkzP+8=;
        b=QAOGrKlFsfyCWowehn4AOGDAt1nTm6Ak1tHOPqmmPu/klljlPCp96haxf9fpQ/+1aX
         INxtu07i6EbgIWfPxfXphedhAD1HBW7dQMvOcXQ9btjBtWpWO0UYlFWHNceW7IO4yO1b
         gHndho2kofoKNn/2AfPIKfxTxo3Ba/btSL+NoMFdiSpy6dZx8eoveqhQ9ClHT2HQ73lj
         pJiDyYiq88HahVHx3tNKxEx1HTzlGs6sMqkbUtJqaiclFD76GZEi9nRIJlusZC/DOork
         r2op4nJlH0KQT//ws3mcNMuSD5m9h3mkmvMPIeLZXoTzoAgJp4j6Mo9usweNxlafVST3
         ctgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680604493;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXAnUa6AWVTFDx0v/rlj96rY+EfFkpNkyegz8fkzP+8=;
        b=4m5wDBhm/8quG+7QplLcvOLSn4Xp5j8denIerFtz37zmx8WLOzEuKVP26S5bvB7VIC
         kAAsjUGGC53GFUPf4Cdb2qSPMwAShZF1Gmcnhi9vYfnqGQf37mP89ADreTxUraRCkL7x
         //DLdpuYT/IQ7lXZvpejpZDxmSLoqsqfwcMz5IuRNkRP3cqztB2FBbSOJM8cEZuhoUBn
         UB6HYhfDixfQEOxVzxiZ3NNcN3E/9x2MV6Oy1J5F9rwAzeZXLLeee0Pzryj6mOqHMI2O
         y+MK7/IrEMqhk+FZfbFZ7kI0br4SZva4TVx4IH3KU5yjKVso5Q2F5aCamxmONP4Rej5+
         38ZA==
X-Gm-Message-State: AAQBX9cbaMtNzPK6CIbrpcn9AL/cemf2djEP0AYT+pq1wwUmz/VyaB3v
        wlubZLvEomOWiOnTPY/RmnABja23CyM=
X-Google-Smtp-Source: AKy350a4DWPrzYtjdDe6upIxsY/hKjNXM5oTqF9kGicTFS4QoScYZSkSCwWeezGpQBfiiAn79z7Caw==
X-Received: by 2002:a17:906:f258:b0:947:c8d5:fb2a with SMTP id gy24-20020a170906f25800b00947c8d5fb2amr1584357ejb.48.1680604493318;
        Tue, 04 Apr 2023 03:34:53 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k4-20020a508ac4000000b00501dd53dbfbsm5682657edk.75.2023.04.04.03.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:34:53 -0700 (PDT)
Date:   Tue, 4 Apr 2023 12:34:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     krzysztof.kozlowski@linaro.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: read values from correct device
Message-ID: <ZCv9S0gkugnELjV7@orome>
References: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2CNe8kmelRCjVunI"
Content-Disposition: inline
In-Reply-To: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2CNe8kmelRCjVunI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 11:40:50PM +0000, Diogo Ivo wrote:
> When reading MR18 for Dev1 the code was incorrectly reading the
> value corresponding to Dev0, so fix this by adjusting the index
> according to the Tegra X1 TRM.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--2CNe8kmelRCjVunI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQr/UsACgkQ3SOs138+
s6GPIA//e94a74YaV8wvwanQKCA8Fhefv38h/q5bNrpVERjzcuvEtIvra8GajW0U
Zz1pQm94NyTv/IMnq1dcOB8hzkLSoHgoFky94GvrCUode6KCMdMgqyJNhWH0Le5U
rAl0c/cXs46KFuDPnVeJlQlZxBN6sQZpRKd894DaCQKaH9Bg1e3g22vsEXdm68lt
hqh6/RRdNH61V9D4Y+uBkf7iVr+eXtFQGLNIr3MOerGnue6xiEV4Ln8DXJrZcYJD
GaCeiN4x0S1uyhjQrtWIjyIEJc1M1sL1vaA5Nw3WDMgv7BQmS5ABcX5mUK8jQLEw
Z8wlFkSL7nHMFdHchEbRAudnQ9e+9ilkn/h+y0HUvJTCKMYG8bqOnCNyAjLZOf7g
7IIO1X5u4f+tz60bKJj3XyKuv+jCc2CkCvcJFhAsZmU/kZHmXz0QxhP7Ztldr3yC
evZuRjuzY8JOZyvWVE3amcibxjIvl8TY2Mw0TwEVB91ZZb6bHjAxPami3mn6WajV
2jJJA1gQtT3qrXMkuFdOQiwhuFOCcx3XCax/Xi7hCltndBvaalfmyJ1gsIVr/9ob
O/3PgoukZFRPRrILhK6uSi4az414uYWMN5vyOIY9VZt9my4BD4x5aQTEg0+sFxG/
BFpuVDZ4oofUZV0gcY4EqqRCU8VPiBTpIfrMym+EDfqCoUKyN/I=
=axAz
-----END PGP SIGNATURE-----

--2CNe8kmelRCjVunI--
