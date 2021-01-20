Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED150C433E9
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 15:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD93223340
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 15:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732655AbhATPmb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 10:42:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390459AbhATPln (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 10:41:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93C3A2339E;
        Wed, 20 Jan 2021 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157262;
        bh=gOJc3C8Wwekb3go3seB5oPNrVTUtWcwhcbh8D4TbC5o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jxL/nIVvytLx/0cVE1cfadpytR5LLfCrdBp0tPhMhhoyogFRWSHKHU0JxG0w1qIh8
         ywkLWswknoyCBoGxy/Bu2XqgRGp78b3z3Z+y/QK58jPbZIHQGoG5jj9WE/zbCVKP2A
         PX2XqdJ97VVtN9tt5CvZVHUkLmm7wZxCMBDa3VWbdiqKRK1Q0JZVQ+W7AIhAaN6wfn
         RMuucu4/sYkvVtPzggnIu7Y3sghSW5MN2qJswh/wb9kIWgndoB9Xp0EqTITa7dNrix
         cgtwocMjMt0yUPrMTOdTk89h1OyWw+y8STVy973WSsGqzaYMQAn72sxX4EhIk/cNNn
         QLiaLTzzbbvxw==
Received: by mail-ej1-f45.google.com with SMTP id l9so28442839ejx.3;
        Wed, 20 Jan 2021 07:41:02 -0800 (PST)
X-Gm-Message-State: AOAM5316BQqZjqXe6bYEu8GNHDHOovOnJNJkWg0Yca2CdFaV76IoMaEv
        j7v/cFLsyhU5fCb20nacvgxZ1i0TqvH3r1UbWg==
X-Google-Smtp-Source: ABdhPJwZ5i0/6FgIziPOPZ6uauH5phxtPtQ+X6vhCFzpfbmRHZtGN74w11l8S3vFWtlgoi5/tEEj0Xl8i0QljfgBVWY=
X-Received: by 2002:a17:906:c9d8:: with SMTP id hk24mr6155382ejb.468.1611157261241;
 Wed, 20 Jan 2021 07:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com> <20210120080522.471120-3-saravanak@google.com>
In-Reply-To: <20210120080522.471120-3-saravanak@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 Jan 2021 09:40:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKx-Y5HsYt1L4v2-4+vXeBSoM26WKC7mNAShuibUYbXWA@mail.gmail.com>
Message-ID: <CAL_JsqKx-Y5HsYt1L4v2-4+vXeBSoM26WKC7mNAShuibUYbXWA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] of: property: Add fw_devlink support for interrupts
To:     Saravana Kannan <saravanak@google.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 20, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
>
> This allows fw_devlink to create device links between consumers of an
> interrupt and the supplier of the interrupt.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/property.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
