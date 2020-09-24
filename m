Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2263C4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB6B423772
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600943845;
	bh=GxzdceeR4inlmujUvpF3RJQGR6+MXYGTsrLSa6e1U1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=R92hz/hoOBHv4yfxRxUlNOho8vuMvkR3EadxzRI0OdwMn1s9kET5u8CQZr2R015UK
	 C++DplIVFPSEyK40AqlYpDyXmjNqg3VlesTK2l0ORNQGz4nMABT4a6E2LUFQzUTL79
	 0omLgykL2Dgz/t01WX8dl4uEtekyDK7CqmehxLj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIXKhZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 06:37:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIXKhZ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 06:37:25 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C04762053B;
        Thu, 24 Sep 2020 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600943844;
        bh=GxzdceeR4inlmujUvpF3RJQGR6+MXYGTsrLSa6e1U1I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TOHm0UDS+bnJQStr7iv06+r1cm1Je7M99SRBgLCwve/UuJXDzeFW79rVyjuviAfaW
         qA15G8tVBfaxg90RJo0rhzlLTNxFUUB9yX069xpyMvovoYdHUhXG9IWPv7mX23W18b
         HXdaPqYjVaLkStK2g47Q/cPvSCCSC3XM2glSYR04=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] usb: phy: tegra: Use IS_ERR() to check and simplify code
In-Reply-To: <20200924102139.GF2483160@ulmo>
References: <20200910115607.11392-1-tangbin@cmss.chinamobile.com>
 <87imc3eiug.fsf@kernel.org> <20200924102139.GF2483160@ulmo>
Date:   Thu, 24 Sep 2020 13:37:17 +0300
Message-ID: <87pn6bcvfm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thierry Reding <thierry.reding@gmail.com> writes:

> On Thu, Sep 24, 2020 at 10:26:15AM +0300, Felipe Balbi wrote:
>> Tang Bin <tangbin@cmss.chinamobile.com> writes:
>>=20
>> > Use IS_ERR() and PTR_ERR() instead of PTR_ERR_OR_ZERO() to
>> > simplify code, avoid redundant judgements.
>> >
>> > Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
>> > Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>>=20
>> Applied for next merge window. Make sure to get this driver out of
>> drivers/usb/phy and moved into drivers/phy ASAP.
>
> Sergei had commented on this patch with valid concerns, see here in case
> you don't have his reply in your inbox:
>
>     http://patchwork.ozlabs.org/project/linux-tegra/patch/20200910115607.=
11392-1-tangbin@cmss.chinamobile.com/#2526208
>
> I agree with those concerns. This patch is broken because it will output
> the wrong error code on failure. I don't fully agree with Sergei's point
> that this patch isn't worth redoing. I do like the idiomatic error
> handling better, but I think we shouldn't be breaking the error messages
> like this.

Sure thing, dropped for now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9sdt0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbZCg/+ImSwyaEYV6RDMjwOS5MSrkEXEUjxOfUU
8I3U0ehVCPiI7lOc9uWUn0QtLxN6/MSvfRxYLaSxc0w3LAIHHYWr4i07PowIEz5b
FdCPzcsqYtkfsr20ENpoz78l90579YbVu+eXfwcmxtXTR/0btQTAhTrsdDQC/LaC
epJgNBEJgsPN08JRPb0fdBBSehsdcul+JlRnBsx3PklwrAoX/nHMTM1x4fiboMHQ
IlN7Qug6E8xLK/+0z995a6Sg9nZeyZMX57kx11tQiZcJ14xG7PfQGz0eeqKiujna
bkgcxfe13hTQELFLM7oqhp/EBG5MibwjrN7Ez5tB1CeCc5916YCKZn6m7VUwgnTB
yCTo7lQ97WAlJg7tQdcFO7kwCS+s6CF+qJ/Fh4rEpv1P+DprQx9Fk7mSw/7IoLTW
fbRcGiKoREfMOJUAxFU7bNeYLQawqVUB2ykPIdlBzDGLZdysCGhgd3cbZwaSCNMT
Q3/Y5vo6FcNkm4lfmzGG00z+j346ObVq3DSne4JBEuEYPqp5/i3N32UpoBSfhoJ9
ukySrGgzMlt5w8cSgWVEvAv/kDWB0dxIdd2eXN53C2+Fvj1C6I7LvAQWc5pcLpxP
6zKyZFUx/XoB6/Wa+wuCuD7ZX21svVcgjJl9QEC/wdHLe08CMelglZuHrzMLEnNC
2O8JUY5b9q4=
=lCLm
-----END PGP SIGNATURE-----
--=-=-=--
