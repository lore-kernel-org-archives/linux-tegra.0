Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F52C55178
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 18:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C3CD2078E
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604602647;
	bh=T+0TkUHG5HbBMGq6VNiMPT1+lj6eoupRaVtBoh6oVqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=r7ExFY/h2kmQXoVtOnevIbmjGkDsXRzi9HJTc9ySQcqoWGZJ1TCx8v81JKDlHnHxa
	 N/rzoT6LZKMrfStbrDdwhOJIm2iTZiGH1FFcbwBytrU3Icgu2YRgzS+up2x+Df/ca7
	 OVOCbLq7l0QE/CuwKR7Q2WrrvsMbtBJ7OtctzWXA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgKES50 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:57:26 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32800 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731922AbgKES50 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 13:57:26 -0500
Received: by mail-oi1-f194.google.com with SMTP id k26so2788966oiw.0;
        Thu, 05 Nov 2020 10:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WnQsMTKjjzoBMIW/8e87OL9+hdBG/baC1b1ucIUuRWY=;
        b=cIG8yUSMptLgEXQslZz/gRVBcH8/LuGNVml1AkiCrEwvOwerivfG6jE0NVqgIL5KGw
         uTkr5CCFx538xhKgqapomgJ3mJT3lkIwkGc2ERNLirYY4gO2sJPioe2T7EgYCC+HE589
         +yR96KHqMEJtsKd9LSBp2Fa2kY2iDDjB4Eyl2aXjmAc0ay2Yu0a2l3uhjR542rAn44em
         N+pnKayJx4uj0a1yfiJvuWuG0NO5I2nxZ00RB1NtVYwAUcVAi1miYM6+QZ60rtvEkH2M
         ncsLPRX5WusONC6WcsWO4S7qIq63iLiAU4CdV13eT3Ia6bURR1w6bZiNytDRKom27OfJ
         5GtQ==
X-Gm-Message-State: AOAM532A1lIt8RAIQ2w+jpF84Za8DyrEaO88CCqTtY2crH7c0DJ2cdQk
        kEoqKvVD4TYMeIiZJb1rRA==
X-Google-Smtp-Source: ABdhPJwZQEQpvDSDrT3RpvJyDJdgKmUhp4gPZDLHZWI7e04Frr3hI/wQeuhbY4LAulNhJ42T1Q0UNw==
X-Received: by 2002:a54:4094:: with SMTP id i20mr585100oii.0.1604602644876;
        Thu, 05 Nov 2020 10:57:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a22sm543802oib.52.2020.11.05.10.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 10:57:24 -0800 (PST)
Received: (nullmailer pid 1632231 invoked by uid 1000);
        Thu, 05 Nov 2020 18:57:23 -0000
Date:   Thu, 5 Nov 2020 12:57:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     devicetree@vger.kernel.org, maz@kernel.org,
        linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
        robh+dt@kernel.org, tglx@linutronix.de,
        linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
        jason@lakedaemon.net, dmaengine@vger.kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: interrupt-controller: arm,gic: Update
 Tegra compatibles
Message-ID: <20201105185723.GA1631882@bogus>
References: <1604571846-14037-1-git-send-email-spujar@nvidia.com>
 <1604571846-14037-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604571846-14037-4-git-send-email-spujar@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 05 Nov 2020 15:54:05 +0530, Sameer Pujar wrote:
> Update Tegra compatibles to support newer Tegra chips and required
> combinations.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml:56:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml:58:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml:59:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1394860

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

