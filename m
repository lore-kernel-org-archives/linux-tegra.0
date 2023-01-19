Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AF8C6379F
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 15:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjASPKT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 10:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbjASPKR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 10:10:17 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2347A71795;
        Thu, 19 Jan 2023 07:10:11 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v5so3244704edc.3;
        Thu, 19 Jan 2023 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3hWPa5eaE1VlRQVh/vMNXzrQxeXSBHyXqQOtX9y708=;
        b=e0fz5LvLSsENChDm0SAC0yL0oNM0POBFQiCdbDweehEDuMJIEONyAGgtdUPGFCiqqR
         Id/h6C/GazpqSxZamu9mjDNvex5dlA4fvF0jc+PtHw3gABqKvJPtUMEVkOcXcj8J1AAR
         PLnRLIaYYudfxKXoyTbYwC728sbH/Vp/SYtuqM2fpiS+nF//YyLm6+ZVhWrxrT4Q0hRY
         a0hOqlk1Pq1a/Ske4YxV88ZkoibTzl5/lm2iQWzGROYUNhTFj+PXvZ5oyDZul+1npUtc
         /aWgddo2LOXbI2ntusjEDbihUUDWi123jkrB+cgnn/akq4wL7jLWwAljnm3yAd/mP764
         vDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3hWPa5eaE1VlRQVh/vMNXzrQxeXSBHyXqQOtX9y708=;
        b=IGSTwekJcpUxLLTe01WpSCQQrqWaq/qaz5N9rRK79cSR5YRAO57hhk7k2qnhuxHKlz
         pqybxq4UsydcnrSEWCXHtqOJBwuKwr23/jmulf61N2higJWt9DG8tMQ8xGvHoG/jDYu/
         5LKh10v2UfhVxrj9Zdua+7ZYIc7xe1vM+9jTOy+AhePvcyDeK+2uftOQbGK8N66lSm2+
         t5xXzrnxWi9hF3IJNtYmU53aBsz1eADyMBIF5uGrfJYfsaL2pfpzd9Ij6GkpC6Es/7hD
         GX0LqUpQpK15xIMfHe6F4arKinjABmo+tvLujQsFSH/VRPnvpPD1oxHWHkqpt7ZMbgRO
         exTw==
X-Gm-Message-State: AFqh2kpI7Vw7IbhzcFH+XSSls+n75qYoMHnutYtlSAsbBxrL/afv43/D
        ezYpIdRtu7GBUCJPMVfa7GE=
X-Google-Smtp-Source: AMrXdXsTwyv07suDfVAoeVH9mB1DXCTlXvaAj3SNIzmRc1ujB0XCruBScq2XQFPO2DZi0mB2a8FvoA==
X-Received: by 2002:aa7:c994:0:b0:499:bf81:be6 with SMTP id c20-20020aa7c994000000b00499bf810be6mr12264790edt.37.1674141009481;
        Thu, 19 Jan 2023 07:10:09 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d9-20020a1709063ec900b007c0d6b34d54sm16278717ejj.129.2023.01.19.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 07:10:08 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:10:07 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson
 Xavier NX
Message-ID: <Y8ldT2CdwFpNAZoB@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-9-thierry.reding@gmail.com>
 <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bQw0EXWTigETpFy5"
Content-Disposition: inline
In-Reply-To: <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bQw0EXWTigETpFy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 03:55:21PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add the framebuffer carveout reserved memory node as well as a simple-
> > framebuffer node that is used to bind to the framebuffer that the
> > bootloader has set up.
>=20
> I don't know about the current status of this patchset, but feel free to
> send whatever update you have.

Sorry, got side-tracked a few times during the last few weeks. I've had
to rework some parts of this for the recent changes to the format
helpers, but nothing major. I'll send out the updated version shortly
once I've tested all cases.

Thierry

--bQw0EXWTigETpFy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPJXU4ACgkQ3SOs138+
s6Hlww/+IzPc1AX147Ir+grpgjfk1Xmbl2ycd89CjRpRo6yWlN4RZ8Yuc9D8nWjI
oed/TJUnvyih1nZwL6OrqR2m1H9yo2fE10w9bRCTO4dde/4p0H+8oKJbOSyLnzFk
y7e7QaJXGqZWOj9wl6g1ba1aqnRPsucDfpwXQcf8xHuhcHuZZtBAJCAJ6sV6aC97
+2IGqM6ExaLhEw8CIB6EFpl2r/SA0ig/qrEQhZ/YqqZNw/TShUlNs++C1HH9CN3X
hVMBe4IoK28yuAfg+P95ESHdF3V9sqi4j9bUtc7cpTFu2+7HwRBzeePA0bEtsMIm
AKknYPEM+fKfT0K2MrcAm9VNzGLaFhuAaq20O5VK/cm1SCCBCMEgpyw38w51pOBh
P6i+zZHDub/lRsPP/mOfM1yKD9HvbKLMH4jsKnhivD1o3eMOY3XWC6mpCXjyXlaV
4kB+EdmcLB/a9rFU4YClFIASgeruC6oQOyfcKgAXpFer9FarKzyxLGjNNUnz4eHw
QTucGI0Lwzubyws7HfhFgbexIRHQrI0U3iSJ7j9dc9iiC6V8Nu9pkvQQuBfLU62B
D0VyuqOp/Y7sVFQL7fLIqXVrJ9wr/IrmDRVo3ylbQX8Xs4AoqtGyQwUTd/59Jsb7
MoYbuKJPP+qQBesE2cY2hhS+LfpIIP5RdP2VUe6knqEA8ercDRI=
=c2qP
-----END PGP SIGNATURE-----

--bQw0EXWTigETpFy5--
