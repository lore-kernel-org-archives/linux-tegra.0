Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E1BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Jan 2022 17:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244706AbiA0Rip (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Jan 2022 12:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbiA0Rin (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jan 2022 12:38:43 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E490C061714
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jan 2022 09:38:43 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id me13so7355146ejb.12
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jan 2022 09:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V5C74FdRuwoqpy1ViP/6GNBHpsGNGyUemK6FLnqIKus=;
        b=ObBTSXJZMANXgPLlcRDvZmDpM9KWzEyPz5AKJGGdQu1XE+FnSA0pJtbPkNJmuj2yxh
         AhqbFznG4jNh3flYvle88ujpEqYo6/nKmjuFZPhp8GyAF2RmHGxcuHBe5z7gZKEGY6tG
         LA73RCpgDJqJG0ZTyHMYk83uOVxrEozO6cbJB+smdXHwinxQPYpflGqi4LiWehAOVJ2v
         PdBLm8JpDuAO2CsmaaB/tXGSW1M/J+2m5cCM6cHJ2vk+AVHhkMAyv4rMvpU4b4/kNnFB
         UfCfrUVCMplnzWyfFV4ZY02E3wPXsxlH2hJtpSZN842ukUnvzIYxDDR9ZEF4ZmDF7l0P
         HyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V5C74FdRuwoqpy1ViP/6GNBHpsGNGyUemK6FLnqIKus=;
        b=dB5QfrD8UUx5rwRzrbzuKagKMY4MI05ms1ObnUcy2eZSf6sIxlMFxTRDLFxgeQNjw+
         SgNGNmSp3KtJyBHNiETXTlKBjq7S8gziSZXukKIpGjJKoX2iL3+mIoziEBOZMceV3h5h
         idtZwUYWYWt4f3FOWzi4D3HYkKq8ctIe5uiFQfW6hfdgWp2wBu2oasKrzM3viJYEXlaC
         CcDPxIK9ulW5L1E907ytYqzyXodl6au2+ramrLq5NMzOvrjfFmNH45HWHu0pTJyMBpbh
         9I1q4p9ZaBHnFxIeDYxJe8wRY7yVZU2MSHy4dTZbE1tMzt70BzSpyNr0IXHu0/gh2LwO
         keFw==
X-Gm-Message-State: AOAM530xKtq9yoewRgl3zhST4rpg3upAqTSWYVbncCk88U3UwBW6/YVM
        Q0pmAP1F/b2z2Qi5WTzdUjFQLTNzaRn7PA==
X-Google-Smtp-Source: ABdhPJwbwj4iZ4539t2iMlsQnN5OsKUNWNgMMPlqfk7h70aUhyR1H5t3uVkg1q/BbW6nK5m1ewWk2g==
X-Received: by 2002:a17:906:6a0f:: with SMTP id qw15mr3934099ejc.66.1643305121701;
        Thu, 27 Jan 2022 09:38:41 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id co19sm11742662edb.7.2022.01.27.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:38:40 -0800 (PST)
Date:   Thu, 27 Jan 2022 18:38:38 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Disable ISO SMMU for Tegra194
Message-ID: <YfLYnujnXl3PW+MM@orome>
References: <20220113143152.167583-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0dffjVEj5IQlPdcO"
Content-Disposition: inline
In-Reply-To: <20220113143152.167583-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.1.5 (31b18ae9) (2021-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0dffjVEj5IQlPdcO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 02:31:52PM +0000, Jon Hunter wrote:
> Commit e762232f9466 ("arm64: tegra: Add ISO SMMU controller for Tegra194")
> add the ISO SMMU for display devices on Tegra194. The SMMU is enabled by
> default but no hooked up to the display controllers yet because we do not
> have a way to pass frame-buffer memory from the bootloader to the kernel.
> However, even though the SMMU is not hooked up to the display controllers
> SMMU faults are being seen if a display is connected. Therefore, keep the
> ISO SMMU disabled by default for now.
>=20
> Fixes: e762232f9466 ("arm64: tegra: Add ISO SMMU controller for Tegra194")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--0dffjVEj5IQlPdcO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHy2J4ACgkQ3SOs138+
s6Gr/hAAucNUdaMBv0qZZxSiXI36sutrC3grlWlyHsjYbx6KvM200OdCm8uAKrt6
MmUrwpdNYljKeJmPhcJpL4tErGL1mwd5VeybuYSCvt+uI22eFKQKBJfDNX/d+kUP
U/fIm3z9WcLCvuHWa6vLu4Cv0koFm6U7IaGYF/GBqwfOsE0KzMeATxnuplYfMaiJ
Q7bPh28eFuOZeu9+7H8XAwvHls2nyZLp2SLCEjKAme6zJz1MrTqYdp6kyj7VaPn5
RzPOUplv8OhwZuxPvcx0cev9DMQYyy/pZNVC8HftbvGaFmE+6PkbqiEo4qe+YOk+
+/z7RZ0G2PpLWHTf23HvmLf4NHyVjPns6trRqINlY03lYmD/OB4fLastwTIIMzko
UtuUuqW0eui9AmhNN7JQgllG7DkhXgWH08QJa4jPvuAa7Znh2CjeHrdC0iHafQ9M
9qxTwnhUTtzixlBUlxaLgkUhY+yqkIWfvOFZ7I07dxPSpBdI6JEX3ITLHwT1mzth
mZTczUeDvOeohzVa6Mk3kU3E0DMcQgYGtTwkZGD/phavWw8uae8LvNBrRx8x2xey
VFMIxCj/cDP37aDZeMJrDa/yOhMExba0fbHwyswLLlTtCnSpdlKU0Ty34cUvKQXr
ayeFsfID6QC/Kw7EvHZq3BQVs7Xln40p1+Ib//Rv2+lQ6GxCwYo=
=96cx
-----END PGP SIGNATURE-----

--0dffjVEj5IQlPdcO--
