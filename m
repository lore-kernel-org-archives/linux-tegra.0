Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9BFC48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 14:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51F9961581
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 14:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhFOOuO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 10:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhFOOuN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 10:50:13 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68FAC061574;
        Tue, 15 Jun 2021 07:48:08 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c11so25446991ljd.6;
        Tue, 15 Jun 2021 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=clEVR/zfUJi5D/57ZZwImqTFisrof1Zq/k7sm8XKMHc=;
        b=WjE08ORhTUeBZWsndFhUtl7vOmfn18NHQvGoij0ykABy4hT50sgMGYdlrdvJoNJzlc
         crOcrQbFnZQ5nvuoMBvk1VS4mZE4q7cwGHQjVVGMomCVV6wv6Hk7oEHB+TIiGObu1fA9
         YeANnZLXgErbDp3g2NDRs7H1OVFZodseDMQuzfeHCpag9gCtUTmeSO/DPhaeRy4dznVs
         lcOZpPifrHso+ZB0TQr/APipMrrKiFfdNtRHITpXlwL4EJ1lcQqxdaWDQ7H98qATdLe6
         Gx5smTXzmQ4JgqUNyyZ7zAv+yk33Rg+cIdN/i/gM/65VBqtxONA1A3CNlfMoD8tGqIIQ
         5mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=clEVR/zfUJi5D/57ZZwImqTFisrof1Zq/k7sm8XKMHc=;
        b=GxUxLP0mkeTbKlWMGMTRRJSXstdCpRiyXzkhanzj1b1bIZ6DuHWPlnHFxz7KJAiHYG
         9ncqynSdCF5z4jYrzYOu8ui1kL67NSLMdgKXL6e7u9O2Mp2l8+eOX98z6CutMtvEPrFr
         i1IUiav8MZT/HalTLn3TKDWnuDcNmCCp5RPNGE6xjLxhUVX4+m4Sqkd2iTTeQA3+gwhY
         ARvAjq7LP5QwU6x8h/UvKCDmau+BiuymDu6zaQIB59k1Sb7d7H3kGMWSKoCvr+Tt0iwE
         qLq+Jz7CYH4ClZgdNPdOuNm4T1UrD1MkEOhbZSo7whHh0fmVTRHTV9RT44cdFU2o1yYx
         R0UQ==
X-Gm-Message-State: AOAM5301E4rBlp/AdPbyisAQfwPuIDg0kkYhSjjdf48fogegYO5456qd
        cDc/Rgugh3ZqgocMDiRNz9sBvC5pw/0=
X-Google-Smtp-Source: ABdhPJymzubM+iNhTfRxhuGfHJxhRsHFz0X1L0JnUeAgSZbN1JAVUJKo7GgEl8I1Q9iwNDzq1UMccg==
X-Received: by 2002:a05:651c:1039:: with SMTP id w25mr16052977ljm.143.1623768487208;
        Tue, 15 Jun 2021 07:48:07 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id t3sm1830552lfl.78.2021.06.15.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 07:48:06 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] usb: phy: tegra: Wait for VBUS wakeup status
 deassertion on suspend
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210613145936.9902-1-digetx@gmail.com>
 <20210615010516.GA28352@nchen>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b00a214c-02dd-9cc5-ff6f-acfd19841528@gmail.com>
Date:   Tue, 15 Jun 2021 17:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615010516.GA28352@nchen>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.06.2021 04:05, Peter Chen пишет:
> On 21-06-13 17:59:35, Dmitry Osipenko wrote:
>> Some devices need an extra delay after losing VBUS, otherwise VBUS may
>> be detected as active at suspend time, preventing the PHY's suspension
>> by the VBUS detection sensor. This problem was found on Asus Transformer
>> TF700T (Tegra30) tablet device, where the USB PHY wakes up immediately
>> from suspend because VBUS sensor continues to detect VBUS as active after
>> disconnection. We need to poll the PHY's VBUS wakeup status until it's
>> deasserted before suspending PHY in order to fix this minor trouble.
>>
>> Fixes: 35192007d28d ("usb: phy: tegra: Support waking up from a low power mode")
>> Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/usb/phy/phy-tegra-usb.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>> index fc5c6cab58ba..ff482c694200 100644
>> --- a/drivers/usb/phy/phy-tegra-usb.c
>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>> @@ -64,6 +64,7 @@
>>  #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
>>  
>>  #define USB_PHY_VBUS_WAKEUP_ID			0x408
>> +#define   VBUS_WAKEUP_STS			BIT(10)
>>  #define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
>>  
>>  #define USB1_LEGACY_CTRL			0x410
>> @@ -645,6 +646,15 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
>>  	void __iomem *base = phy->regs;
>>  	u32 val;
>>  
>> +	/*
>> +	 * Give hardware time to settle down after VBUS disconnection,
>> +	 * otherwise PHY will immediately wake up from suspend.
>> +	 */
>> +	if (phy->wakeup_enabled && phy->mode != USB_DR_MODE_HOST)
>> +		readl_relaxed_poll_timeout(base + USB_PHY_VBUS_WAKEUP_ID,
>> +					   val, !(val & VBUS_WAKEUP_STS),
>> +					   5000, 100000);
>> +
> 
> Where will clear VBUS_WAKEUP_STS? Or it will be cleared by HW after VBUS lower than
> B Session Valid?

It's cleared by hardware. Tegra documentation doesn't explicitly saying
what voltage level is used by the VBUS_WAKEUP sensor, but it implies the
session-valid level.

There are two sensors that could be used for detection of
cable-insertion into B-device USB port of Tegra: VBUS_WAKEUP and
A_SESS_VLD (from perspective of Tegra as a B-device).

The VBUS_WAKEUP sensor may not work in some hardware configurations,
always outputting 0. Seems it depends on whether port is OTG-capable
(VBUS_WAKEUP works) or fixed to a device mode. IIUC, only VBUS_WAKEUP
sensor can generate wake event that can resume system for a deepest
suspend state.
