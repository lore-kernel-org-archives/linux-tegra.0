Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ADEC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Mar 2022 17:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbiCFSAN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Mar 2022 13:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbiCFSAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Mar 2022 13:00:11 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB423EF37
        for <linux-tegra@vger.kernel.org>; Sun,  6 Mar 2022 09:59:18 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u3so976857ljd.0
        for <linux-tegra@vger.kernel.org>; Sun, 06 Mar 2022 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:cc:in-reply-to:content-transfer-encoding;
        bh=+3qIoUHRI10NawzgN7rY9zgH4hZ9L/0AXMb8gxkoyO8=;
        b=Hyf8QST7RabGM2AVPbepQ6PRMhnVUKjpY2ID6klmfHrP9u2Y1jVMlTZSoJTugaWIcy
         A7pgyGhX7wFjjuEZ1McHmS3It7RbKBo18zMuaABlcdE6b/CGRovuWlDeQW9CKAqVfl9h
         D0zdZIHUuQIPlxZ5z6lTvAW02dmOKHW4GZ+7VkchuwTMxo3X9Dt1Sb227xMRgk5EKQlE
         Gy3OcckpUYuNXH5LbrZkQH98p93gRpHKz40q7Zs2mQed3cct14AnJj+UT6KXUB4XHvY4
         dxm+E2TOF/16is5uevzlpNk6Y9YR746dh0XfZymb9mEWFZYw/GqQoWfWdVLmyclp2kbC
         35Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:cc:in-reply-to
         :content-transfer-encoding;
        bh=+3qIoUHRI10NawzgN7rY9zgH4hZ9L/0AXMb8gxkoyO8=;
        b=Co15YP71vX+mwSiqLKVLnX1WLeObZI7+kOHB9DHfsrRALbmCidMT/gxcESU+ucYWEB
         f/KR7US1gghw+0ctFt5pBE+oY0iaAzZJXjzVaVgoBd872hLfhoLmvnUYLW546+ug8/UD
         Ujm6+CMwAuXjS1V0zzoQY0SV52o7s9rWe/vyvBtKDMlDAH3/DiftJbhJrZWCyww0G27X
         UBZsMaAs3pERo8cWxSeRbUKwiaEZY3P2mH/s7QdaA4ukPhETNdcCqtRTVxWFRO/+f7q5
         pQFfdWkHl7hR6EalvL/CkP7XZAsNkd41YnGjBmC8is9hJRBsOJAJ0EnCeo97lTWmYhqs
         89OQ==
X-Gm-Message-State: AOAM533WC6FydO3/5mFGU5fQxCFSYp+AGVaQSSBP37MiPsZIpezH8XVD
        8mCI7OMddy2gi/iEvnK7arV3iH8ezeU=
X-Google-Smtp-Source: ABdhPJy1W0usnFBRGD+mPuXzUkbEmQiut+NoaNV08IYxZ6Sab28FYiFvuyeMJppGLn3gbIs04b2Lwg==
X-Received: by 2002:a05:651c:1192:b0:246:1d6b:d323 with SMTP id w18-20020a05651c119200b002461d6bd323mr5248289ljo.360.1646589554666;
        Sun, 06 Mar 2022 09:59:14 -0800 (PST)
Received: from [192.168.2.145] (109-252-136-171.dynamic.spd-mgts.ru. [109.252.136.171])
        by smtp.googlemail.com with ESMTPSA id s3-20020ac25fe3000000b004481d8f1bfcsm1490642lfg.1.2022.03.06.09.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 09:59:14 -0800 (PST)
Message-ID: <1cded859-d3ce-f285-3b02-5d81fbfdeafc@gmail.com>
Date:   Sun, 6 Mar 2022 20:59:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ARM: tegra: Move panels to AUX bus
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <20211220104855.428290-3-thierry.reding@gmail.com>
 <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
In-Reply-To: <47a01cd9-c3ee-912b-fa9d-73449990a7d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.12.2021 22:30, Dmitry Osipenko пишет:
> 20.12.2021 13:48, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Move the eDP panel on Venice 2 and Nyan boards into the corresponding
>> AUX bus device tree node. This allows us to avoid a nasty circular
>> dependency that would otherwise be created between the DPAUX and panel
>> nodes via the DDC/I2C phandle.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  arch/arm/boot/dts/tegra124-nyan-big.dts   | 15 +++++++++------
>>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 15 +++++++++------
>>  arch/arm/boot/dts/tegra124-venice2.dts    | 14 +++++++-------
>>  3 files changed, 25 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
>> index 1d2aac2cb6d0..fdc1d64dfff9 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan-big.dts
>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>> @@ -13,12 +13,15 @@ / {
>>  		     "google,nyan-big-rev1", "google,nyan-big-rev0",
>>  		     "google,nyan-big", "google,nyan", "nvidia,tegra124";
>>  
>> -	panel: panel {
>> -		compatible = "auo,b133xtn01";
>> -
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> +	host1x@50000000 {
>> +		dpaux@545c0000 {
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "auo,b133xtn01";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  
>>  	mmc@700b0400 { /* SD Card on this bus */
>> diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> index 677babde6460..abdf4456826f 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> +++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
>> @@ -15,12 +15,15 @@ / {
>>  		     "google,nyan-blaze-rev0", "google,nyan-blaze",
>>  		     "google,nyan", "nvidia,tegra124";
>>  
>> -	panel: panel {
>> -		compatible = "samsung,ltn140at29-301";
>> -
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> +	host1x@50000000 {
>> +		dpaux@545c0000 {
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "samsung,ltn140at29-301";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  
>>  	sound {
>> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
>> index 232c90604df9..6a9592ceb5f2 100644
>> --- a/arch/arm/boot/dts/tegra124-venice2.dts
>> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
>> @@ -48,6 +48,13 @@ sor@54540000 {
>>  		dpaux@545c0000 {
>>  			vdd-supply = <&vdd_3v3_panel>;
>>  			status = "okay";
>> +
>> +			aux-bus {
>> +				panel: panel {
>> +					compatible = "lg,lp129qe";
>> +					backlight = <&backlight>;
>> +				};
>> +			};
>>  		};
>>  	};
>>  
>> @@ -1080,13 +1087,6 @@ power {
>>  		};
>>  	};
>>  
>> -	panel: panel {
>> -		compatible = "lg,lp129qe";
>> -		power-supply = <&vdd_3v3_panel>;
>> -		backlight = <&backlight>;
>> -		ddc-i2c-bus = <&dpaux>;
>> -	};
>> -
>>  	vdd_mux: regulator-mux {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "+VDD_MUX";
>>
> 
> You should add stable tag for 5.15 and also add separate patch to update
> the new arch/arm/boot/dts/tegra124-nyan-big-fhd.dts which we have in
> -next now.

Thierry, are you going to address this review comment? I see in
linux-next that you picked up this incomplete version of the patch.
