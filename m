Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FC7C4741F
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA24E20E65
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMuP/8jt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgI1NxR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgI1NxR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:53:17 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09891C061755;
        Mon, 28 Sep 2020 06:53:17 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so1444686wrs.5;
        Mon, 28 Sep 2020 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f1wKe3InkkDui+crhECsBUh95jgL+WD2EWQapKErJFg=;
        b=ZMuP/8jtF1vW9aFVHx7E5Aa2kuzgcFAkjJywaboHIAFRIWAcVOwBRC+CKi8b3mP1LE
         n4cpD+f3wOz3wnz9jAqEW07Efs2ozICUu5zR0PDwuDQiRWDiUn5HPfLXkl1QKh60CU6x
         A/wwMxEdoQlkPuXKjBw64Ppg06Io2GmBYGtPuLVtQn2DEQm8cl0zc6znEIIsUVLky0AO
         D1HB7tJRACk/lRS1hKiNa2ChGM2K/ztSxndwz7CuYKFcPrG2PNcCxf7ZkqNvHeOOBTlX
         Y5ojfUJ34c6q23cYx1iv5QUm9ppG0oOxqTpf6LwvqYBPLQihSuZqTWC/adlM/d0TOrsS
         wJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f1wKe3InkkDui+crhECsBUh95jgL+WD2EWQapKErJFg=;
        b=gWfCYa2kL+aurj8i4N9cUjgudMs+KoRC1uCKMG+9CRu4i6DEHTwwNQUlJcQO+F36mc
         zhpeGNDsr3eGkpTSHC4SW0UUw61s04l1R9O8mIbWe2EhVL8Z3ZRfNWrokkE/p7c7FXCu
         NrH0R90PDC/X5Pf7+eGQkG9rXWtYqakU7tL8Wjzr+tRrOti5iDPxRjXK+G2Vb2YhADWv
         TpFBHMCD/4q4h9MfRasJt4fhY69lhs0S5Tx8THLyU/4jmvZa9mF+LXFEq1i6fOkSicZI
         3XoccfykArxvQnYnvJ+CSy5EOsyV622gdQ6QOtx5PQ7dV0CRzv5QXK2iZ7GQ8Jv6ulHo
         yXYg==
X-Gm-Message-State: AOAM531oAqxLUKImVPwSUJ9A1rawMAlrIq81Mdvkl17IBwpuCG8Ugu7F
        QIse9Mvfwfu9tF0XDkxEDU0=
X-Google-Smtp-Source: ABdhPJx3vpDJaU6EF8eGPYr6q+PONsBtwiVkw7Y+seDHSlVwTqpGsbABEe7+L7L2U8kgE/m/ssY0RA==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr1854780wrm.216.1601301195761;
        Mon, 28 Sep 2020 06:53:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id a20sm1275976wmm.40.2020.09.28.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:53:14 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:53:11 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 14/15] usb: host: xhci-tegra: Unlink power domain
 devices
Message-ID: <20200928135311.GN3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-15-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="57SHPaztv6dlLu/a"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-15-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--57SHPaztv6dlLu/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 04:10:40PM +0800, JC Kuo wrote:
> This commit unlinks xhci-tegra platform device with ss/host power
> domain devices. Reasons for this change is - at elpg entry, PHY

s/elpg/ELPG/

> sleepwalk and wake configuration need to be done before powering
> down ss/host partitions, and PHY need be powered off after powering

s/ss/SS/ here (because it's an abbreviation) and in a few cases below.

Otherwise this seems fine, though it'd be good if Jon could take a look
since he's more familiar with the power domain setup here.

Thierry

--57SHPaztv6dlLu/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x6scACgkQ3SOs138+
s6HLARAAqe5/57RnQmyIKmyK6Bjs3+oFASB6867fC7++5l4KWQh8kZV1a6/JCURA
oelg3tHAt4ep9Mwi+tgCHMrbeKu3sALcv6WGXpvkeyOrBNF488KUF5I/f9NvNZU8
fAjqbobs+cR5GOJAYvpMRHpLE+ZAzR5FQbvJobscf3lfq3wf87K+R98V8y6lyDTM
Du+ZyEg0ejIT2bFru2AVd0cTx4bQaWrG2m3JBZNEyhc9y800gXqS2ryZGmhxWfza
qQ4VpTFPsxgxikcScFwnpYoNaHbUcYHi8jvqrutRmttpMzcS9SxsOjTorEOfYWa1
qXbCBJ+fPCXDmz5lAD0I/M6j1Quqb2W7VjilPSuFkfnygAituDVAFRMU5AboeCvr
eqeo5Qxgp2SisYMjD4hMF37BVv1GwuavmiZU/yGpNGpzODg5AiXR7D1kSZdtZK4J
/9T9HY5cvYSXMVJN+AuXHDPsmOrd4qrXYsyNFlVODa5i1qAGGYuhSZfnh+bpmTne
lDKZ2tnd2IglYDndfIB+1wwQ3VCIHub0INxsrBXDvVjkJjLvP9IFG8HHTtgwojcN
PyUtAuJyO6Jx/Rw/+3/swfBh/wpMUNSk41I44EbBrempYwuUNn4iJEz2bXkqNdFi
ko2A4Uqukeml8mfHsAGnHGZ4+28Gy37ry10RaxlkckSoowmHOiY=
=RgVx
-----END PGP SIGNATURE-----

--57SHPaztv6dlLu/a--
