Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7111C4727F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D94A21D7F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 12:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/uiZ9J2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgI1Myo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 08:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgI1Myo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 08:54:44 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DBEC061755;
        Mon, 28 Sep 2020 05:54:44 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so983285wmd.5;
        Mon, 28 Sep 2020 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rYxYmSPSlKHJNuyTnVmBf92AIgqLsIDS6+bNfIKzBOI=;
        b=f/uiZ9J2wDYbxzP4nCnLDSCb/JeCxxtL/tewdvYGpcaY1AhOz0TNDO2ya69nfewfbK
         4QWnnDa4EIozAwsOnOwzAdX6rewBlqYp5HsdmuP+Yv2MZFix37LxfTnJJYkM/QGlUiwe
         jeTUiIJV/FJj+n6KNMy6t2xv/BACw9bzhcdtcyz7xHETTHOLX0kNjR31a46lM0pm95uB
         eca9KBxUHA+y/OJELpA0G+XxzcLzDAVuTSLtHf09UfzHYsXJvfgFIPDUgmmQn3czGVHa
         mKO2H87kwZyGXdDKxj+pTaxCV9+JXyK1l6gazdQP++Vb6mYqBPUsK9Bi1n5WfXdIFhPi
         32MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rYxYmSPSlKHJNuyTnVmBf92AIgqLsIDS6+bNfIKzBOI=;
        b=FmsV1D7OPWSyYFSwkCLIJAC7ncPjKufz7mR5tZYiXZVvnRIXteDvADJirp9PioM8km
         UqL0KA8aJHThPbFrUpiFkmFALYtM7r4ewaAIvtcCfuao/ptUFfrWei9EaivpKDGBUTp5
         mWSHDHjqhwxKXGrlgazn+KFzftrYCer3oZK1bbtInlWxvelmXsnsnfQYkbYWegdC4VPF
         kG7BugMNbHZv5S7zasibRnxFiC+RHrpangsfrNMCErJuBrO3kHn9zC2ZvRHBGBVODRcy
         xudmmypb6nHWU3Il5J312ypS3z2BUgsfY9SpBj9WEICfKGcy2DaHGnnO371W1X1seHhh
         S8XA==
X-Gm-Message-State: AOAM531OzW1iR/C+acfTlb7TLvVZyChkUjSxr65bqJOs4t+86Jo3VaXr
        K1+QnSipp2ByE+P+bDRM3NoCXzbUkxA=
X-Google-Smtp-Source: ABdhPJxPfYvwg2Qa2IcRtFo+t1RnFC+hG2dUggvFdJnTsza1RTXfZ4gcrYniucd8YeTTD2HP9vMFcg==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr1481722wmj.65.1601297682561;
        Mon, 28 Sep 2020 05:54:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z8sm1415537wrl.11.2020.09.28.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 05:54:41 -0700 (PDT)
Date:   Mon, 28 Sep 2020 14:54:38 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 00/15] Tegra XHCI controller ELPG support
Message-ID: <20200928125438.GC3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-1-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:26PM +0800, JC Kuo wrote:
> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> state for power saving when all of the connected USB devices are in
> suspended state. This patch series includes clk, phy and pmc changes
> that are required for properly place controller in ELPG and bring
> controller out of ELPG.
>=20
> JC Kuo (15):
>   clk: tegra: Add PLLE HW power sequencer control
>   clk: tegra: Don't enable PLLE HW sequencer at init

Is it safe to apply this second patch before the others have applied?
Since we now need to explicitly enable the HW sequencer, it won't be
enabled before the corresponding patch does that. So applying patch 2
before the others sounds like it would break existing users of the HW
sequencer.

Thierry

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x3Q4ACgkQ3SOs138+
s6G+Ug//R/fLvXqIt1mer+0OLbF1HvLSpph1Uzb1i9yiyzJaXGzgYzOpQByhqtr9
V4iplc1w03WbTKIxv1Rg+S7MHCz7Y5nPfz/5bceODM49/y48soHgYD1Se/c3d1HP
3ixAHNP4/uHlILzQdT10pN6xNvCiQOWqxxmCxZ0/WDMV8MvMZbcYcGBkduwa37tp
RDxbCaL6o7hTuPi8IKAyqbYbMgneofhUmOju+ea3Hu1QGTT+B7wDbPwJ4/Jl4PEr
iWZGbrdUUX6EQzkNX4U9fQ68Gzx69B6YRj9hv5gbC6l/31G3C1srtUcYJjKfP9gp
jSCFDo6pTzQl6Itgf2h0OHgVviUtgw8REKrrrCw6I5kn/sWm5tEf2vLbufzlnuSw
qdaA5BJgpGn+ASodbthVTHdfJCfGFe4Jk8n2O/0bn9NxHDAzBZ+eCGAcsotfQcwd
o/d3Cdl0JME7bh3IDpU68Ngjqy6XgGivcdrot/lcRrUf9cAH9VNEOZLBvJ+u7GnO
MH7BUQgOXqei/EZCiak7KwIhfFtpPH7iRlqbQSAu9HCx4sfw6BawmWUlBL4q6Wmm
7adpmRA+TJOaY0JD5YrwyRgmvV7/TLHIGi/mGqwZWUJpVgIMqmLYA5NJmpo0yz/I
2CC52aFd5iJnVYJvxmBbYfJpMKDDiyXf+ttnZKCHskVEt+JaI9M=
=aVne
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
