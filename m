Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32701C4727D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E560623741
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUvmS7FQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgIXKVn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgIXKVn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:21:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C78C0613CE;
        Thu, 24 Sep 2020 03:21:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so3187818wrn.6;
        Thu, 24 Sep 2020 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F7hKavhEcupnToKUFzbg3DWL90gfwumnqBNWj3kdfcE=;
        b=UUvmS7FQpCtHfwVQUrlQgsHWgbBJa/ItZg7JlzPUch8LP+TJAGvdjwJZLS+Gfl/yAy
         It005gDiuLxpg/iTcrZQxl+qucOX8hgrvmTz40ZFbNX28UljalzIA7Bqu8XoqpCpGzG9
         oAB3kwuleVD6MXP4x6aSYYRlDnWbXK6MPOHUARkhwjYkeFkWg8P6+tisZYQWu9V/9iUv
         L+wCGwBtTgIwfMFrrgF0zR48u6A4DIjZOdLGExSXJX0N2z1WIxiXyldRBlu9Ii+tLA+f
         BfCTw4MW+ielaX9l4vxNqR7C6y76BhlwVzU9AkqG5PiVEMoQ0CE41OuXKbiE4pmgqx06
         uK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F7hKavhEcupnToKUFzbg3DWL90gfwumnqBNWj3kdfcE=;
        b=CBJH1dy0ET0xP752hjX56k+a180aHA257AxCTmKVAiNAHVqFzS5mUzbkl/l6ZcN8Oi
         ALBrqRtqbhplVPOy85wn35NQAY++30yU/JoueUyeRykq2XAFWJok5ME/3MRLSJriDwst
         EBc88De236M1tYwGDdbRElonloJ6oPqtIp4z+9a66CeFunq6ar7RYG1nYCHhh32M3vq/
         qJmtSpXc0O2kazNZbk8Oc8yQ1TvHRnRl5k6c4KYnizSdamsGa9h6VMLTMewW/ZHgi9DM
         oPlldVY5xot75/Ppv88TdOtd4nBFQNDGGIOFU27IBWuBfV7jMHsCBMHXUexGFOPvidFG
         W0dQ==
X-Gm-Message-State: AOAM533yjkUkXroqpZMJUhMURhj6Hfii+TPRFS5J6CZkcOidG1+qjADD
        YAjHOot7XETdTadLhVenZRo=
X-Google-Smtp-Source: ABdhPJyUOvK4kZ/jUWxtxlWqb7JBR1DiNby1Da9/TxNUdxyX9VeEZwrEMbhiMEnyjd1n4P+7CiOf0w==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr4625705wrn.12.1600942902078;
        Thu, 24 Sep 2020 03:21:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id 70sm3121819wmb.41.2020.09.24.03.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 03:21:40 -0700 (PDT)
Date:   Thu, 24 Sep 2020 12:21:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] usb: phy: tegra: Use IS_ERR() to check and simplify code
Message-ID: <20200924102139.GF2483160@ulmo>
References: <20200910115607.11392-1-tangbin@cmss.chinamobile.com>
 <87imc3eiug.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline
In-Reply-To: <87imc3eiug.fsf@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 10:26:15AM +0300, Felipe Balbi wrote:
> Tang Bin <tangbin@cmss.chinamobile.com> writes:
>=20
> > Use IS_ERR() and PTR_ERR() instead of PTR_ERR_OR_ZERO() to
> > simplify code, avoid redundant judgements.
> >
> > Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> > Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>=20
> Applied for next merge window. Make sure to get this driver out of
> drivers/usb/phy and moved into drivers/phy ASAP.

Sergei had commented on this patch with valid concerns, see here in case
you don't have his reply in your inbox:

    http://patchwork.ozlabs.org/project/linux-tegra/patch/20200910115607.11=
392-1-tangbin@cmss.chinamobile.com/#2526208

I agree with those concerns. This patch is broken because it will output
the wrong error code on failure. I don't fully agree with Sergei's point
that this patch isn't worth redoing. I do like the idiomatic error
handling better, but I think we shouldn't be breaking the error messages
like this.

Thierry

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sczMACgkQ3SOs138+
s6Fl0w//W0lviwOWICGtlYukVhARQtGJ/GQCFz2gLD1NWsmrnfdCuN868rubQfyF
DNj6B7RShzGs9SWzKRfmL9IeOp2TZ30YbjOSHNYqGaErbuj2p0sXuqoSF0fg5aRq
2Sp9G6uJSgmOZDPZvWsI4s5UEt58um+LM9zsROCG5y5rQGkSSWdROp7xY0yDy+0T
s06ufbcZqLTTwbxHI00kNeHTurdDhhzP3LZpXHUYs39ge7oArp/g3a0JaxnnFN4g
bTE1o5LA5mYKN6fSgNH7C08bkrJu7GKpoocjPlCbuv8seoDCtGE3q0y07zJo+Mlh
h3hp6t7xGzO+QNfOgEoHwadLDhXq/2+ycAKMf/mmmsadzeILc2uWC3qRxSEuP/Pd
ghj/01b4o4aEPqfbbc0+x5+YYpcOZuyTxVz77VZljgw2e09iAdBhpQ18ssA/O9Tw
dw/+zPMpz9rpHBV/RWnO0i/01sDST3M7T8odcfcScoUeM6HMgMqtAf2LFxldflf8
69CeZOFfdzCyZGYU4QNn1cRzU36/VaJ8voOkcIagzUM8oZYylxvDlhviT5RFr1kf
Wxt9+Bl2CmnzIwAMI5MKln6i3bDndFYCn99eoJ5mk2o82PrgZgdCIRDaY2dJ4h1t
v/SBOkjnksCkxlnWPfHN67VpridtIb4ZrBdh7ZEenz7xXEi8dE8=
=gIrU
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
