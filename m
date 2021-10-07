Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D8CC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32DAD60FC3
	for <linux-tegra@archiver.kernel.org>; Thu,  7 Oct 2021 18:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243383AbhJGSEi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 7 Oct 2021 14:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhJGSEh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 7 Oct 2021 14:04:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADD8C061570;
        Thu,  7 Oct 2021 11:02:43 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so21604115wro.3;
        Thu, 07 Oct 2021 11:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OrsTvMe8NDPVzuvM/JLONOOxm7elM7fyW3SqKle0ocI=;
        b=N5BtfdO3ZwI+TDoijZcJiv+1PMU92RLrp3eg4+l9A2uY/dv1JE9+eY2e4OBiEAKFRV
         5iqoDUBSFLqu2jkkylU2oTCru3xiNJaQE61s237NcNYWFBythIqg7BxPf3rmeiC1G3jd
         rAi7tFurkMzMPhsBPB/zJT3XQb2GVTxjejVyJFw+ILh9Ow3NwT/LIzJZTWJ4yzoFawzW
         HwBNZzkfXKHNzpL8QyU0E5YdCRW6pmf18HkCVEHfOja9D6j7/qja9ngCx08RVbmABpCk
         O23VAWwK7lxPUU042X7FAL+nrjngurJYaCTCZyIMh5FXjRx/cm9jYHuJg3N5+uX8Je4/
         K0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OrsTvMe8NDPVzuvM/JLONOOxm7elM7fyW3SqKle0ocI=;
        b=N3eCfg2f6fdbF1tZ1ZZP6GuydO50g4g/d/zT8LN7lYgrShbYLUT6hMs6I++p9GMZA5
         DFjjWZZBYH6GclSdlc09j13SUZoijaSRldiUCDM/EFqMD/MQhCL+qWxuoq9HqdhhyJ8u
         ZDj4ey70Qed704jXsZJPSmwEpkRo7PMpGn0S7Xugy5VciP0PPEe67GC6mm8vm7i/xWDe
         z7R93vOZLBJ6my9hUhr1RKsku5eATzmvTzayoGSQnW5trtq8EjAOvlqBdVM/Jyyfdilq
         84OUVTxp/8QmJYFuxz9ct5zOKpnI1RD46zWrVvHB4OG2MKoTk7TLBjbm2Gai5Z6xpwvH
         VLsQ==
X-Gm-Message-State: AOAM532C1Pw61OKKJYMq8KnaM55LzOLHnh3oDHSfVZ0Uc7Mv+csM4ta2
        f9Hc3eg2Wtk0AcyO57Eoa18=
X-Google-Smtp-Source: ABdhPJyOMyVzzAf83r4dZTSAmNmazukvrmIZDb3/rPHKO2t/iCv1V6aoGK6Mcv3kNPBFKKArmuAsBA==
X-Received: by 2002:adf:b348:: with SMTP id k8mr7152106wrd.435.1633629762279;
        Thu, 07 Oct 2021 11:02:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d24sm86507wmb.35.2021.10.07.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:02:41 -0700 (PDT)
Date:   Thu, 7 Oct 2021 20:02:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     jonathanh@nvidia.com, digetx@gmail.com, ulf.hansson@linaro.org,
        maz@kernel.org, gustavoars@kernel.org, jckuo@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: Fix an error handling path in
 'tegra_powergate_power_up()'
Message-ID: <YV82QCxcIMvGf8m4@orome.fritz.box>
References: <46d3af4a83e2e7b680c857e8969167f0d2d94841.1624809134.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mRfYWhdc1hVQERNa"
Content-Disposition: inline
In-Reply-To: <46d3af4a83e2e7b680c857e8969167f0d2d94841.1624809134.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mRfYWhdc1hVQERNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 05:54:31PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful 'tegra_powergate_enable_clocks()'
> call, it must be undone by a 'tegra_powergate_disable_clocks()' call, as
> already done in the below and above error handling paths of this function.
>=20
> Update the 'goto' to branch at the correct place of the error handling
> path.
>=20
> Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ This patch is speculative /!\
> Review with care.
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--mRfYWhdc1hVQERNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfNkAACgkQ3SOs138+
s6HDNxAAlmbETstOr2jVaug3GwuF2xY3haZWXP3oIix+Zso2ieOcrWnxhiCpVQ1T
DPgLqJCyJvhw3Id6o+dHsM5htGokdc8M5i5F2PIaniGra+CLXFrqjSWrSizdeta6
YnXWKfdoeW1i59UCSnmvSI5jZCU3NVCY6zj9qjzb/Y9SEWe0ctIorRny0POvfLxN
mWE106LuYb5BbKXio9E2UKEK03a+LDnkvV47Z0Pd3nOFZgTWBFwQrQTaLbt1av/9
gfALq9V4jkfspDqjKj2UxTsEhH5pXN5eaKoDCiJcJsKIi+QGUfmrD40wvCTYE1Ot
oCrvbUPe9nzGeoBKp2JRfIBT3xTwNAluSFn9NQouOX4W1sBsoAQixZtn3UPD/kOG
wEOR/1kOm3SV3pqctP/Zqwe/FpaC3v4h70+5oxQ5W0IFx/1X7q3KnGGN6IZHjnkU
p22m9CfUanG3jgIacM9cHXFshTfz5HDNq9wVOv/+0DQsry/Fn3Kg9jw6PU9tvxF4
nJPQvqi1bNGiqJtSZXggh0cvMqXdKs+nIsdxQ9LKls+pQas0CoQinyVpsocyoG3X
F65UNCs+UlMnRreCIx8IyFOhUwwFt2Z/JajPrZ5zV42r3fCpCmFV3BawHFlcIcPH
PXDflfPAJJkqyz2bjkhL0D3fhV77Y3MmC/dtxrCRyIWeHSBoCbM=
=6UPU
-----END PGP SIGNATURE-----

--mRfYWhdc1hVQERNa--
