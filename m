Return-Path: <SRS0=KKuN=C6=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382B3C43463
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 13:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB1D1218AC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Sep 2020 13:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6SzV0mE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgIUNOu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgIUNOu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 09:14:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224FAC061755
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2020 06:14:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w5so12709629wrp.8
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2020 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GYuJEDkq2Xeoyfr/dX2vEMIy/92WJ0DAv1Z6gQ60pMA=;
        b=i6SzV0mEtz8yslsrYACSaEpQJi9KNJ057oEBjacVFmTldRLIb6GbrBEV9c/TPYWHtz
         K+k+fgpGpeNRV55zQRg09B1fcECjSFMw7modBqVg8ddavuFaOCDy6ASCamD+OBGhNeK7
         IocypC2/nsfqFbkCOXu+xdhmQcOq6ed0TPAygZ5x5I2T9WzdGND99hUE60MqwBYkN2+d
         B6gSq2PtBfg5Z9WMBcwZjrT/T56nYEkkKbNUn0bI930/8TctPpPgxBB4+wzOsVTakzwu
         3G98jqKvvIsJGGGwzVEbqdivegZBn/So6ItGLGw0rwMYuL6rOgYw56m3EtRvhyFSYVS/
         TM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GYuJEDkq2Xeoyfr/dX2vEMIy/92WJ0DAv1Z6gQ60pMA=;
        b=DWIKARLGocYTKc3CoVqyyfBhUBRnuPqabC27Oi4nOfMkyIVXRX3Y1hLHmi38kFiyXD
         JfC8UIpv/YULbV/7DXmV/UJGpuz63ZDYoID+1Xt6FdNDsxZPyUE6a9f7SmWH2lDE8jKo
         rAoeJ4u0WYCFnhXijdrZDolZHIWoZWM1N6pbhm+JFbdB7H3wQeiJ5lqtxP4znYa2cHHC
         YOK+Ju+YykaBU+y7bizjbaQVzzusqk4yYieKMm1LQim8kzNlLg1fAXMTvmNBXQK/lyO6
         tC6uNJoPkLouGurGmqzbLct/lNRFdpoVvu27wsiRN+Pggw0hQwZleBFEQpjF8UYb6Puh
         KA+g==
X-Gm-Message-State: AOAM530JXxS5w9yJmMg2QuSsoRfXAi8eslWtOwXIHHP4TkRTXpLrEl7d
        vYQf8osGoVwMmzRosqf8A0Y=
X-Google-Smtp-Source: ABdhPJwPbgajSzt7bJl/72MswHO4OAc709NeI6cn1kED5zczbrGuQfk4cqOmc5dEFpPovrVNDs8Reg==
X-Received: by 2002:adf:f203:: with SMTP id p3mr53251006wro.339.1600694088828;
        Mon, 21 Sep 2020 06:14:48 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k6sm19565936wmi.1.2020.09.21.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 06:14:47 -0700 (PDT)
Date:   Mon, 21 Sep 2020 15:14:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: tegra-clk not found in 5.9-rc1
Message-ID: <20200921131446.GB3955907@ulmo>
References: <CABr+WT=9nqtFNOsGpT=JM6fFc703NFR5U61vRxfvKBeqBMnEvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <CABr+WT=9nqtFNOsGpT=JM6fFc703NFR5U61vRxfvKBeqBMnEvA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 09:25:47PM +0200, Nicolas Chauvet wrote:
> Hi,
>=20
> I've just discovered that tegra-clk pull-request wasn't merged in
> clk-next for 5.9-rc1
> Seems like only the patch from Dmitry was merged directly.
>=20
> So I hope that the serie can be merged into 5.10-rc1 instead.
>=20
> Sorry if that was already known.

As discussed on IRC I had generated the pull request for the clk tree
but apparently not sent it out. I've done so now.

Thierry

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9op0YACgkQ3SOs138+
s6FS4w/9HBnXa6ugkeBKZXFjzhxuWZDomlBVItk3lfugecglsP3tRcopB4AOo66x
o9ILFiKAo36okBdKYqk4JB/CdCxtItwbbtIHIdoeF4n4vKvMMk3zvNNrhxGHS20l
OqtjN7p3pMQ6hIWxWZ9Rhmm0UJm0PCbCbWhSSEpr0KnZM8c09ia27eL3qUGhDmgl
ROOftpcf980/h8olMwN6OpBI1A8JEpSxDxSneJGBf553JrKcBCGpsa1hqqztMECU
aZ4NpOe5FKinJxpsEN6DEeq7GdDEsQnz0PdPTdt6Ct1W2qnAdnEs06RbVYan57q/
QHiTZ5eoJhwCi8XfrnntyKl0xUDjuiaXO4amJFUuEcO56t3f4UvJbjJvIsj7T4Kv
RlajzRf2Fp3pB+Y/+216cLdpzwsD6abzxfUcp84SGf22ebuIN8f8LbeaG9lD9LjK
nTGEi1eoo7j+foh3aM6HibWhPIY5cnXUHFVzek/NajRue92sRcp9yjfh3TK0O/7g
+Fh+DsqtrXRl6x0XOA3rJuiIIkWDkkDxSOy+kDaP0jaFXGDo4rVIIPAyKbXpvuky
0sNU4GGVbc2eU7ER9Sa+pmg0XXNiCc+ippnEdg9BUDXYBB+BrnuzPBamz96MJ695
7IrVryC1/liLM6hwDUTmbXS5S0tuSq++0NuOq9kEEIGvOgL1oao=
=+TRk
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
