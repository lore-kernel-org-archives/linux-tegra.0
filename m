Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E78C4338F
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 14:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E663C61077
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Aug 2021 14:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbhHLOGE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235893AbhHLOGE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 10:06:04 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9905CC061756;
        Thu, 12 Aug 2021 07:05:38 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 6so4591420wme.5;
        Thu, 12 Aug 2021 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gCDjSdGmMmFayqS/w0wcH67gpjms1ttBauqoja6I+GM=;
        b=T2zV3h5wi4ux23VQLa6j0Mmae1jNVqAE8g1rUN4zn42xmUCrbtDZfGrxb18YEqDFX0
         +ngapgWCpayR5qpyK/6gBCp+hUKLBBioEB1xDXo7eZ1bJH9mNOitW4x1rI9DrNbfTcsL
         ZlnM9AjU+B8d5IL8ItB0wcBeGo8iO2SOQt0ejwGwbbe9vhGWNZkWmdpdB1tQoEeRpX+3
         I8xbPid0R19Ql8ZsB5Bym+r+lTwtbeQHLbx8NsxtRv2/QAKMPL+P5i9pBZ7NxOU7v0yi
         BvvYZaH3eQdu3cM6K4RPy2oF10N/eIDDiLaCTSc1TKXGbQ5xda938RkAc2c5Sy61mqOm
         GX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gCDjSdGmMmFayqS/w0wcH67gpjms1ttBauqoja6I+GM=;
        b=l6+3SyKilbXlK4uV+EATSZO1RgJQ6jc3jIEH0Jwn1TRfT9jmnIA3DARBSTp09Ljd3b
         vho2kPlgu/sn0W8wV87s/J+kxx0XNk1ZGT8OUbCgTlWJgGRn9cQDPEN64n26dSxEo3/r
         K8fUKuH3De3UeY+8xGjDMbLns8N/ektJM6bKQ1gM3TvwzG0jjbpLSiJif8JAD6YjgdT3
         /RT6OL6terjU0TvLPJ1S8ozUEvgQjIi+fnWJIWNK86C07YT4+EkrRcstaS5tYpPEFUeM
         R43ru7kPKDLAJQuKv35UuLNDC+kB+T817dINaqTeXx+33m7ZgRBmdRaxK3pTe8dcE3Jw
         KlHw==
X-Gm-Message-State: AOAM533Nvjxyd5SO4qpjKWWxsNyr8+PSuRR08iysDmikxGq22LS0Xc81
        zzzB4inY7JkJB1L5+6KdOTY=
X-Google-Smtp-Source: ABdhPJz9EMI76kP6P5Vj6wrELsLVExFUAgms1NhbkcsyHnLo9tqBbiA5y5COhe83quSgMBLooq/LmA==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr16343721wms.115.1628777137205;
        Thu, 12 Aug 2021 07:05:37 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t1sm9776873wma.25.2021.08.12.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 07:05:35 -0700 (PDT)
Date:   Thu, 12 Aug 2021 16:05:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: stop using seq_get_buf
Message-ID: <YRUqrla4ifUklyQu@orome.fritz.box>
References: <20210810155439.1813109-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0qiiN2Cz4uGRsY22"
Content-Disposition: inline
In-Reply-To: <20210810155439.1813109-1-hch@lst.de>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0qiiN2Cz4uGRsY22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 05:54:39PM +0200, Christoph Hellwig wrote:
> Opencode a copy of mrq_debug_read in bpmp_debug_show so that it
> can use seq_write directly instead of poking holes into the seq_file
> abstractions using seq_get_buf.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 58 ++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 11 deletions(-)

Applied, thanks.

Thierry

--0qiiN2Cz4uGRsY22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEVKqsACgkQ3SOs138+
s6GNRxAAjDj8BNmeet39DjxT0LACH41W6JaSq8XDFTBl+DdquwBbi2mj8H5K4x/+
EWl9TomDS/Ex+EcinNQxDLwRuz/j7xpv2TomAOZHKfZVxHVjJmbhuc5cP44wxRUj
ypA+T7r9gmbyPcvdqU7OZJoyDJevWDVNyJKvtWrsHcriJuzBSRkcxAWJyvAQQV+8
7cLKn/eUlXcoS3t1If7S58sinL9cM+ZbvVhQDTl0OrWdkoozanZlz32ikObchbJ0
V/WY8HiBwvnmNbL3YJwosUUPbpWjsWwDHYuciW0FzpcWCIAbpKclPKd22zaZ7DXQ
o726Q2LJ+H3y3aViyiEFzTK9zTW2s3AcsDErOpGEujLk4wRr/6On3mRp68bfLZBQ
LBl3zHGWZ9T50g8TiT1G3gqwg273Tlxb/RvVnoJ2rr24z5crCZWI4I9QPoJiliaE
yCIMUt6u6Ev9H5F7K1OIgiq8NlTNHdWcJ8zhNmg2khwRaeDwafb+9zMCCN5gFW4M
D/uyAtfUW4Ki4N7aYrcl/omQmm+g09zHdOtDCdwR/E2xyXaXGpU3iBIM3nduRWk+
6oMBTotYqzcrn9chVnMFaGj6sybGByfZrQ1JurgskU1tElckQ2Hodi2vQHY+WAq9
s+u0bsR6zdKa89skJUkyj9YCI3iuWu6O+OQOkN214aPKFXNpTMU=
=tDO2
-----END PGP SIGNATURE-----

--0qiiN2Cz4uGRsY22--
