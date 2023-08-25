Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A12AC3DA66
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 17:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbjHYRL4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 13:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbjHYRLe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 13:11:34 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9185A2108;
        Fri, 25 Aug 2023 10:11:32 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1ccc0d2e697so750794fac.0;
        Fri, 25 Aug 2023 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692983491; x=1693588291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TXtssFWEbngFOBY6yX34qGGzd1NAEnaVWIBTkGjN80=;
        b=LR2PBsansT5Cso6XEXkTcjclHoN7Ck55DqhoFZyrIsWAxmoRm/frhcloh/j1EZmo91
         Jwftyc5+H9110krpwC+1P6Igy7Ss7WNU+CceLb1RM1G5n8w58Zj3dMKKXVy3RlIM0XCv
         ZzRIuoGeTcLZMzTOrkOyIsWDwzO7UC9pVRH9ehlmEe8ZQf44YpqQJu0/VzHGx8WO57ZX
         XSwexAHKwRMXrIY91KaLPPEoTypvldKpe+JsuhcJrDD/z3f0uYRNDqDCxEZyjO1lXbb0
         Rbni/zKDfD5vw2GQ4f/JVZuKP0Bvf4/cTzTQK4N60vn1LtlI8c8oMcCkLskVf8CRPm0y
         NDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692983491; x=1693588291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TXtssFWEbngFOBY6yX34qGGzd1NAEnaVWIBTkGjN80=;
        b=Q6sKYQQeF5FLL2H9k/SwkxTWsqKCvqS/OpO/xvh4Dqy325+HAFFT2dzwzEeBSrqLvy
         0cMgG/AWfru+LPOo5GByMVKgGTRHVxR40snYPD/Qf0v9uuk7hF2/IFBeZ24tHQzvONT5
         EfkGiAbO89IhZ2r3Vv3MKcRGarYQi7f6bbCRPQ87xjDmyBBQ/zsUUgOzbp/sBIpb+6pA
         angSq2Ekj0loEsQVExmlavLzNgEvoWxD9sb/i+W6xcHpVk+lh4wX+G722255Qyoc1PaO
         /f0SjW/XTiury1nfCtBV8TOZBZn2hsJ2noWxBoePCVt1DwjDL+ZulRW3ICXOVzzxcNyW
         p8ZQ==
X-Gm-Message-State: AOJu0YzyW/Xz/Hfq0hK/xLkE5Oj4SLV4wtqfU6uhk9UMnvfx2aV2JTq6
        oC69siRUAQ9s2OrHr7isGOlYUPSgcBg=
X-Google-Smtp-Source: AGHT+IHWE8uA0T/glQdvRBHB1C8RwiwLy4ooXIfQ29VrR+JNv+mxP2N9hdHDFgDu/L7kpDIiG+svzQ==
X-Received: by 2002:a05:6870:14d0:b0:1c0:25c0:ebe5 with SMTP id l16-20020a05687014d000b001c025c0ebe5mr3484282oab.53.1692983491594;
        Fri, 25 Aug 2023 10:11:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090a3d4300b002636dfcc6f5sm2004478pjf.3.2023.08.25.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 10:11:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 10:11:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ninad Malwade <nmalwade@nvidia.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 0/4] hwmon: ina3221: Add selective summation support
Message-ID: <482ac044-e163-478c-8e67-5f03d7dc7820@roeck-us.net>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825164249.22860-1-nmalwade@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Aug 26, 2023 at 12:42:45AM +0800, Ninad Malwade wrote:
> The current INA3221 driver always sums the shunt voltage for all enabled
> channels regardless of the shunt-resistor used for each channel. Summing
> the shunt-voltage for channels is only meaningful if the shunt resistor
> is the same for each channel. This series adds device-tree support to
> allow which channels are summed in device-tree.
> 

V2, but no change log. I am not going to review this series.

Guenter

> Jon Hunter (2):
>   dt-bindings: hwmon: ina3221: Add summation-bypass
>   arm64: tegra: Populate ina3221 for Tegra234 boards
> 
> Ninad Malwade (1):
>   hwmon: ina3221: Add selective support for summation channel control
> 
> Thierry Reding (1):
>   dt-bindings: hwmon: ina3221: Convert to json-schema
> 
>  .../devicetree/bindings/hwmon/ina3221.txt     |  54 --------
>  .../devicetree/bindings/hwmon/ti,ina3221.yaml | 127 ++++++++++++++++++
>  .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  53 ++++++++
>  .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  29 ++++
>  drivers/hwmon/ina3221.c                       |  39 +++++-
>  5 files changed, 243 insertions(+), 59 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
> 
> -- 
> 2.17.1
> 
