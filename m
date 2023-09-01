Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC24BCA0FE4
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Sep 2023 16:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240775AbjIAQo0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Sep 2023 12:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238689AbjIAQo0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Sep 2023 12:44:26 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703B3E70;
        Fri,  1 Sep 2023 09:44:23 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68c3ec0578bso1851354b3a.2;
        Fri, 01 Sep 2023 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693586663; x=1694191463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/T9AmD8qqBO/NrQRXARywcj3uq+wOvs9bAK3ZixdG8=;
        b=oONmvlQgM4JLPeUxfBxEk2ZcOQgP5KOHYOc0DXfv24cLYjoMgOqePry+59lY4tm/5C
         RvLxxVjLBipXMddK0QZwut+ul6QnCniJF9KcVxpGTgytKvQee2vuGrYq2LW0p8aI/9Cv
         ChFqrmFYvIMEXQ+ovzk06mQvpuQzCI21G+hnTDxOhfaDmawPk934+YeNREss8sFlbLYX
         SHxOviPAm1c/MDL2kcRmukrvuDh0ld3S2gwCwLbKnowyX8qbazccEZF4R0wIUWAdWe5P
         O4Q4q2Yuf5MGj3sFosluio7VnCQD4vUljgxgrE4QG0+SNmbOQfo1Dubb/cQdESbDDxfc
         /7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693586663; x=1694191463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/T9AmD8qqBO/NrQRXARywcj3uq+wOvs9bAK3ZixdG8=;
        b=JBImJskW2pqbsGjJexjD2JYf19faBiyA6my3CacL4937MrwjWaJgCJc5LZG8CWEmRZ
         R1FyTEVArb1JyzEoK7UsW7ajBm8SoJvz23xzA07sXamvsRlPoj6UMD1ahG2Kl6ooWrHF
         k4ZQnZTnKSjofVSQiBb76JwIaoxckt23eVGwbAmEjjawV/7nbIXK29x1Gi2MLE1k8AKe
         0tMc4UKGSFujNGKmYhqKfaJWX2m8MjOC6buNFfQFq5nnIaQ3O8nnVaz71Y13Q0D1h4om
         FIiD1KFxcig9pzG1Vm0FFkq+TksDFRAxQcAO7jsRob0j1XJZmvikNWIS9+2AdrVqf8LK
         Qkog==
X-Gm-Message-State: AOJu0YwjM/dpKHsDjdKzak1TeldBTZfYKfA12fxzy/faGPAv0tkFK0vk
        AoWAz77r8b3zwb8R8wTy6UQ=
X-Google-Smtp-Source: AGHT+IEOrXizclrkZrPq3b/RMV23H9t8Zew7gG/2OI6huzWldlMLUdP2z501grd+r+XXRz7ufJQUCg==
X-Received: by 2002:a05:6a20:9744:b0:14d:446f:7211 with SMTP id hs4-20020a056a20974400b0014d446f7211mr3507150pzc.53.1693586662780;
        Fri, 01 Sep 2023 09:44:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z8-20020aa791c8000000b006870ed427b2sm3242014pfa.94.2023.09.01.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 09:44:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 1 Sep 2023 09:44:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, thierry.reding@gmail.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Message-ID: <20f55b16-f4df-4bdf-ba60-0c6c64efadee@roeck-us.net>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
 <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
 <00faf6d0-e84b-20f6-1c8b-8e0e8d610f16@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00faf6d0-e84b-20f6-1c8b-8e0e8d610f16@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 01, 2023 at 05:34:00PM +0100, Jon Hunter wrote:
> 
> On 26/08/2023 09:53, Krzysztof Kozlowski wrote:
> > On 25/08/2023 18:42, Ninad Malwade wrote:
> > > Convert the TI INA3221 bindings from the free-form text format to
> > > json-schema.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
> 
> ...
> 
> > > +            compatible = "ti,ina3221";
> > > +            reg = <0x40>;
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            input@0 {
> > > +                reg = <0x0>;
> > > +                status = "disabled";
> > 
> > Why is this node present? Binding said nodes are optional, so I assume
> > it can be just skipped. If all children must be there, then you should
> > actually require them in the binding (and mention it briefly in commit msg).
> 
> 
> I have taken a look at this and if the 'input@0' is omitted above the driver
> still enables it. It only disables it or marks as disconnected if the node
> is present but no enabled. So we can mark these as required.
> 
> Is there a better way to mark them as required apart from listing all input
> channels under required?
> 

Channels should by default be enabled because they are enabled by default
in the chip. Requiring that all nodes be listed in devicetree just to
select the default behavior would be overkill.

Jusat because the chip has the ability to disable channels, that should
really not be made the default.

Guenter
