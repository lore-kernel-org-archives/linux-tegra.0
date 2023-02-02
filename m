Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDAFC636D3
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Feb 2023 23:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjBBXOl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 18:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjBBXOk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 18:14:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818C983051
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 15:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675379629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kXVHvL7Zc9SvpXlyodElHL/El9p9PH7Vp09KDuKNQ7k=;
        b=Cuto8m/GTif1qbdKin9pJFm4D/PWvd98G6hpppXldkGxSa6ux5b7FhNEiWD0JoHFlOMk7p
        oD44iiCNXZW5fB7l1qrZkp5sL7GEuYsSXu4gGfFvtkQSzpXZBvXHUotlx3gObU5i6+vSST
        6hBwBOBszHrzsHmf1XIgpQMIAc5ICJE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-CWowoSiZP_uQqHKNw1erUg-1; Thu, 02 Feb 2023 18:13:46 -0500
X-MC-Unique: CWowoSiZP_uQqHKNw1erUg-1
Received: by mail-io1-f69.google.com with SMTP id r11-20020a6b8f0b000000b0071853768168so2043060iod.23
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 15:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXVHvL7Zc9SvpXlyodElHL/El9p9PH7Vp09KDuKNQ7k=;
        b=XQTZfXTy/6b5pBTxtG2F96Fn9ZhC5mphatyYWpLEY/SUDAriOZQemQQn7Qroy2+bDc
         HMu+3XqdGHMWMIOPvpaezP1aiHHcEoqhjNs++dSwd1PzwqPTDtet8M/+8/uJO3uHGwD5
         d9VDt131e/wLaz74jPw/kRp1jMv3HQDG+BkiiXs3NoYnqRXTqoSkzytFYyipimZWCrBv
         NC9giaobGiqr4dtyIeNiFXq+iz6Go12+p7sXi5mlPl6f/q8ISuwyzCCxQOjh4dgBaCwO
         zjF3pW+ULTDIhDu5lRC3SYNPSGo31AMJj5GMKt9914xT3cvvfei2E+K7ITq4ZOWE43O5
         7NSw==
X-Gm-Message-State: AO0yUKX3Y7GC9zfFMleVlgZF0+/t78qqs8CLYWwA2iFGd7famg2Xjuy/
        w9dik5RCJpIBRRsiQT62kFoxyn6BsXiBjTylsfff+7kjXjZV8zlBbSGjmtqSLq4cuhBCEFJoTBr
        RrCFzA13VYNwpHzxYu2hLtWw=
X-Received: by 2002:a05:6602:2dc2:b0:707:d9c9:458e with SMTP id l2-20020a0566022dc200b00707d9c9458emr3293873iow.1.1675379625357;
        Thu, 02 Feb 2023 15:13:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8MFntk5bjnEw1nbcEwPglzwxtEbs/VR6tLktByEWuRryxfTh9CCM+W/HuYuBK+h7W/qw1aLw==
X-Received: by 2002:a05:6602:2dc2:b0:707:d9c9:458e with SMTP id l2-20020a0566022dc200b00707d9c9458emr3293860iow.1.1675379625133;
        Thu, 02 Feb 2023 15:13:45 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id a7-20020a5e8e07000000b007192441e5e6sm274085ion.45.2023.02.02.15.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:13:44 -0800 (PST)
Date:   Thu, 2 Feb 2023 18:13:41 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 11/23] interconnect: qcom: msm8974: fix registration race
Message-ID: <Y9xDpSxL+3Iny+hF@x1>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-12-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201101559.15529-12-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Feb 01, 2023 at 11:15:47AM +0100, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: 4e60a9568dc6 ("interconnect: qcom: add msm8974 driver")
> Cc: stable@vger.kernel.org      # 5.5
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

