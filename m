Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEE6C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:19:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7AB42074B
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJdRZ7E+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgI1NTF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1NTF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:19:05 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858ADC061755;
        Mon, 28 Sep 2020 06:19:04 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k18so1115471wmj.5;
        Mon, 28 Sep 2020 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/fPjYpUSpJbkMbYXsGEGtLI/1DxIVKDjwp2KDfXe47U=;
        b=HJdRZ7E+IHuW7zTD64WNC1hBCdwTCsBxE4qlY7DuwUoY+j3Op4Y7XTwijdErW0E/Pz
         ZWxg4RMQpTzuA031ClXQPe6dLNk7fMxeNUqZYY8G348QPEg0wmLZvjHnP2B5+zxBf8i8
         HukElwjXEycszX3pC54B3R3rZ2TKsVA+joMUm8xx93XiTd4skav04DlwQHcO+ptZ9bB4
         uAM62Yka+Vg40hVhhU1mDFpE5U6bmWk2jx08LWD4lO+zRh+1uk/IW/sFjupnY5jI1nuX
         wDpHkNS9zWOWIyURopqoMnS43flgIGjjArT9c+zU8Qzct6It1L8tGgVZXnMbSZcTNe2F
         JDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/fPjYpUSpJbkMbYXsGEGtLI/1DxIVKDjwp2KDfXe47U=;
        b=f46blrcLQWTQYPWMjbdPfBo77k8eiLJsMnLU6fPhN7FxxV8G9xhzDdb81uEKykugO+
         SUBai8Qu1hhyhqFD7FpK+Yg5pT6CvY4mQHa+WKa8nrKUbVxnTbTnm2V/R+huLPZJW4QR
         PPg4qkxMBX7jDC+S2rhHmeYSB07ywhJxdDewM7q0oOkLXd1WuDJNCfTkMJcGoZzTJEuB
         NrvUw3ttBES/xUmwfQ0x7BA8T2wPNvUW3zjatS5FV9nMNZHrtIIzzg3iT1OFP59FTVFO
         9flFDtrpvJwSgHdGFz7X8i4M689jq/o2gpX8C2OInRCh96i/ht7xc+GglHi0gZW8+2P6
         4Kug==
X-Gm-Message-State: AOAM53292bWnwp0C1sH1XW8i04U3QjSaM1802E0qosiQjX4blcczMHyx
        JAJmI9O+k6htE/MrUT62/yQ=
X-Google-Smtp-Source: ABdhPJyREY0CoxSrnbqNFVZ1NBWQC3OO0lSgZl79gWDg8d7KgLs6O8BlJsQptCHI+UezQKh9vrtRBw==
X-Received: by 2002:a1c:7207:: with SMTP id n7mr1599344wmc.134.1601299143213;
        Mon, 28 Sep 2020 06:19:03 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v17sm1700776wrc.23.2020.09.28.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:19:01 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:18:59 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 09/15] arm64: tegra210: XUSB PADCTL add "nvidia,pmc"
 prop
Message-ID: <20200928131859.GJ3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-10-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W13SgbpmD6bhZUTM"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-10-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:35PM +0800, JC Kuo wrote:
> PMC driver provides USB sleepwalk registers access to XUSB PADCTL
> driver. This commit adds a "nvidia,pmc" property which points to
> PMC node to XUSB PADCTL device node.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    no change
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index 829f786af133..67c90a0ea32e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1040,6 +1040,7 @@ padctl: padctl@7009f000 {
>  		reg =3D <0x0 0x7009f000 0x0 0x1000>;
>  		resets =3D <&tegra_car 142>;
>  		reset-names =3D "padctl";
> +		nvidia,pmc =3D  <&tegra_pmc>;

I hadn't noticed before but it looks like the DT bindings haven't been
updated with this new property.

Thierry

--W13SgbpmD6bhZUTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x4sIACgkQ3SOs138+
s6HWqg/8DMiLknpahQo13U3TFzvtXjlf/yVXUEReLgWrewX9W9a2ib8WRVvMYlCx
cHJu0tKxedFdq/kn0mAz/k01k9g/UIpHFHAkUlx6qASr1N5e9PPPRdijhnqMY8wY
guCIo1aRPIK+IH6U19pUojHz8LTk9pNUADJ/6rFP+Rbp1gwn7wEOvas8McrzgB3B
dPXYLg38wAWIVMDMMQvnap/JgMlacB08KukY1xZiIuEe2gz10ZZvDw8xQxbcWfWj
KGUAsW0lqBJ8Jk0KSs0geCrrTQ7fI6tCD07mtzIh4mrE/2Y6llj+R5JLxV+hu7l3
13qIRTlMWmtvzDEaD+KX04ddS02XMWp7W+Dk/HwvvaLYENhagBOVM394yK2Yqhkn
L+nTJGrgcGxyX0f2XIQaa1ZeOg0hVIyi2mu7xtsf4j8KpO+gh35W9CdBR7rp0EFi
D3i40FrPZKvoeGCpe3G80b3ukcfE2ptiozLpgjhWH+RlQgUNFBXjf3UzjAnclOBV
wAHcceynIKHCs2TWqB+0hm0dNwF7yoe9qWGuopC3JlWldQOfb3hQzxkSZgAtWraG
alkROifp2RzY7lfgz39QgLIgPu5C1baFsUPNEJCTpoxxJrLOGaBicWGfMGtqDH5B
+zm8gB0/d1sDrq7jY+ZzQ5AYVhithkqyaDsm1gC6kNjBrpLKND8=
=cN4A
-----END PGP SIGNATURE-----

--W13SgbpmD6bhZUTM--
