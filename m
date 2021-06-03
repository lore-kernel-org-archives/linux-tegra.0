Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F67FC47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 06:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12CCD613EE
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 06:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhFCGY1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 02:24:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:45148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229721AbhFCGY1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 3 Jun 2021 02:24:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A271A613E6;
        Thu,  3 Jun 2021 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622701363;
        bh=xrHqQNPyQxbDHIJrVe9ozUXLA6yyK2qccA7eRzNvtTM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=opUWEPkS45HK0fcgCw1tHcOCECupjOuSxjzbzwhbtyfKXiU3RhmvdokqzZv0ek3Qf
         n3UxHhFG7ERjPBwTe+5u9lmxJ91T5UYxo1XiwfyU5eYOKrcu/IXOFRG0D2R3VNzTxp
         ZIT2t6gAFYKKge++kFJFXYEMGHQQ+9l2OyocgIOYneuNvScurWPV48jMnkCIVUe5Qk
         kW6RSiFJyaZh4PgZ/+6gK1pWxlhJMTJxA0ECtaWe/pRRCLmGNdYAirvXLkKhkTLLaG
         +fhpMssDTRcCZTqwwjXSWks+LtMEdjSR7kMITh0626KWXtNlwj9e7pFTwKMXQzYaDm
         /UEwUzEvprjKg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/2] usb: gadget: tegra-xudc: Use dev_err_probe()
In-Reply-To: <20210519163553.212682-2-jonathanh@nvidia.com>
References: <20210519163553.212682-1-jonathanh@nvidia.com>
 <20210519163553.212682-2-jonathanh@nvidia.com>
Date:   Thu, 03 Jun 2021 09:22:35 +0300
Message-ID: <87tumfcvro.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jon Hunter <jonathanh@nvidia.com> writes:

> Rather than testing if the error code is -EPROBE_DEFER before printing
> an error message, use dev_err_probe() instead to simplify the code.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4dSsRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgsMQf/ekWg8LGwOk4QxWUTaVWluHXvXpAKqZEa
RQ21emuXLFXuQMJC8+e4p7A37simuEODvQ9aqDpgsnHSGqJhIUzwG/FDeqJcHspO
z6a9mFgtk7QrAqhP/NAwk9kUiMd06ATC9GzTNxclKybL5Z8Tc63XsXyesWCMldqa
rJ8GO/J7FaEFXAc9VMgk4TOvCyHAETWJaLdcwfs8pV+qnNBBD8Am/1xEn8SC9WdH
q/8FW40ghu5CBRNXSlBeKDXl9nVh8wS3RXgIHVF8Qhr1kFfEP0NjB2KjnDAERx3Y
AQNNa4wGb/udPVamYRzlos4L/JtOg3B/rTNK8wuaWcu3xFN1eijcsg==
=ishV
-----END PGP SIGNATURE-----
--=-=-=--
