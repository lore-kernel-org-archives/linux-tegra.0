Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F686C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:48:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D50523104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbhASXg6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394764AbhASOJQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:09:16 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06606C061574;
        Tue, 19 Jan 2021 06:07:31 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id b64so21866930qkc.12;
        Tue, 19 Jan 2021 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NcDssZnsaNf6Rai7lpFa5M2x05CINEtN7cqGzRNqP6o=;
        b=W/9waIwjMSUaCUHTbG7tgovadbhyB7XK6FnrKjlg35+teIAmVI5tY684l+Ve/UpCCs
         Pb2/VmcNSqjI/OjkXAHgu2Zzv70FOaTkH4hV1ZwFKd5E5AQaciinT1yVl+D8pfmoD8Ee
         /eyjtclAHQD/hhSnr2Jic5rFraf37Ed2uh/dFM2vBqqbTI/w0t/bvTPr4xs3hxECXL1Z
         urSB6nkibYUjhuOW/CUeB6h8O8gHGo1J1I8pVeiwBS4qDYrx/M9TTHDl1AVmnFntuJa8
         1xbWBTuUk4By5UQgYHzOHrQIZF3EbsaBN1C3e7YYPzm9vIE525hNwxDW0rnTcfIU/2Rx
         2ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NcDssZnsaNf6Rai7lpFa5M2x05CINEtN7cqGzRNqP6o=;
        b=lgx/mFxb58KzZaIICwnSUe+HBL7gU0JtskUSMJ38qEooYDsKZ4WEmv5yfFM+ZlFlKW
         tB7TwsfsAMMYLPVveeGwUsFMLtW7NgCdyHEHdzNBHuyeru15kcfvc24vLD37JHmVYSau
         OFjGYOJynyJfvrwPN6NtAHYwXti5BwAY1qYWg6CsLEFnQWHoDEbNc7EpKKu8ET3H9LTk
         jgC2fNUwsJ1oSYsaEYp43bWHrYxDMlqv6Ulw02uslpwLDTUC/2Tayk4QB4VfZhylPhfe
         flwUZJ8/A0joOgLB4LZwPW5EaIGCmrjG/j3oy+pWebnzoa5Pe9l20HhikMSmvMzJ6Bg2
         6EKw==
X-Gm-Message-State: AOAM530F1dYxYP2EfY8uEN+bJe3lHPZZHU+Wka7gE6QO5SwEnNOo5dKg
        Ec+Zjlvlj7BJE/wjcII8qGQ=
X-Google-Smtp-Source: ABdhPJylMgz7+13MxjiyAA8Ex/73nFQsAX9snddHxgeIYr9csvoXPF6GW1zvTUYXOhsBogdMc9HGgw==
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr4435830qki.421.1611065250318;
        Tue, 19 Jan 2021 06:07:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l204sm12919713qke.56.2021.01.19.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 06:07:28 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:07:26 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v6 00/15] Tegra XHCI controller ELPG support
Message-ID: <YAbnnjLKW43cwlDS@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7FdDSoIoMbtVUw/Z"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-1-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7FdDSoIoMbtVUw/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:31PM +0800, JC Kuo wrote:
> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
> state for power saving when all of the connected USB devices are in
> suspended state. This patch series includes clk, phy and pmc changes
> that are required for properly place controller in ELPG and bring
> controller out of ELPG.
>=20
> JC Kuo (15):
>   clk: tegra: Add PLLE HW power sequencer control
>   clk: tegra: Don't enable PLLE HW sequencer at init
>   phy: tegra: xusb: Move usb3 port init for Tegra210
>   phy: tegra: xusb: tegra210: Do not reset UPHY PLL
>   phy: tegra: xusb: Rearrange UPHY init on Tegra210
>   phy: tegra: xusb: Add Tegra210 lane_iddq operation
>   phy: tegra: xusb: Add sleepwalk and suspend/resume
>   soc/tegra: pmc: Provide USB sleepwalk register map
>   arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
>   dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra210
>   phy: tegra: xusb: Tegra210 host mode VBUS control
>   phy: tegra: xusb: Add wake/sleepwalk for Tegra186
>   usb: host: xhci-tegra: Unlink power domain devices
>   xhci: tegra: Enable ELPG for runtime/system PM

Greg, Kishon,

it might be best if one of you merged the whole set, except perhaps the
arm64 device tree change, because there's a lot of build-time
dependencies here that would be non-trivial to resolve otherwise. I
could prepare branches that model the dependencies correctly, but the
USB branch with the last two patches is ultimately going to depend on
all the rest anyway and pull that in, so the result is the same.

Thierry

--7FdDSoIoMbtVUw/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG554ACgkQ3SOs138+
s6H9rw//UahFAahmjZKmXDHNOMVyQVuQtoD55kh38++h2kK7+GW3eNx3ndswu1eY
7rSMJGd1P99gd271mofobnujRwVBcV1P0UYnNfVaDRdyZU98REoiwuX5VtsZ2gVZ
I8xPGc8Ud9PmkisXH4PWAu6Taykd22dHbKwzY+l5srVWsALIG+t9i2o8ccw6FZFJ
q5VYjqpKRJNlb9eziJ1OkgW4PH9Rwl1Bf9rrDRp/i5RQzNjPLnZaaOg6BFjPrQ3X
MLQB7ucVAHVs5BK5hAzBwLt/AXdvblbTq6IovTfl11PwZzDXNHEo/d/Oy0r0u4kG
ihvqqw25mczwWoUAuNI2QYUvs456tfuPdA/DrM0a4W3+R/IORj71C6HTgh/67K15
AOzhYOlW1ekwl/UtNTOp4vtFSbl0+2Rv3PMenSYFxMWG6GfNFhp5iB87pfB+uTUt
KO6FMrinD2QeM+A+eZBUFT1HhTikmicI+2vjN7d7RUrbH5gEwz9aJOhTdDQqpExh
NTvY75CO+Dasb38bAtr2I4NAIl0MIE1lF+7k3Py9z67gVZagY4r7a75RKwMRusGv
Nm4iCrs7OR2aaUL5j5+ANShl7j1x5nnDTcFxUwQElXsiegtxZ1nILZNsaJT4dt0n
CBRcCdWceMfX97Bf3Ec8jjQZTDDWaGkai75jG2kxalg5ZPbQgv4=
=LKox
-----END PGP SIGNATURE-----

--7FdDSoIoMbtVUw/Z--
