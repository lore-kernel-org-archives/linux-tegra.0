Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E0EC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Nov 2021 04:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238179AbhKYE3N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 24 Nov 2021 23:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238918AbhKYE1N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Nov 2021 23:27:13 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48E73C0613F6;
        Wed, 24 Nov 2021 20:23:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bi37so12917860lfb.5;
        Wed, 24 Nov 2021 20:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yW96xTqN22+VgfWvofFKJ2uQthCcWS6JMEwqDhv1mBo=;
        b=XubA+7GtvDkj0ES1YstwmKTLp3xvVzHzRaeqB//qspqLlT8c48Wlax7bQSlzp42qNC
         +stMeEnSn6dW90xZoBfnm4+YUAwZdF5NTf56STCg0KHDg5/wUrPGZGtbtfcvcx0EmYAl
         OFb9mNbpoQ1kvJpKgux/RtthQduVob3vB7uRzR1CE5fWlugQqqrl43yTIpGlayo3utdl
         0210Y4AAyzU1iD5uyNIYK87Gvqp2UyfZZZXC1YbpHxShhim6MTnFSYP90wJsv4kHD+iE
         UzBK0TCOQHc8Z5y7fo35nnCF+o829D1RtNIzvCexl4mWWq42ixAFQe632iS1Ianz7p9F
         5fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yW96xTqN22+VgfWvofFKJ2uQthCcWS6JMEwqDhv1mBo=;
        b=xRIAvGZLw6T2O0XXHVuYtCVlW+sbZY1khFHlIfxrz5iyaLJEYLuzamd0dnpMkFOBi7
         Ju0eNpdADYRvzkko8trJbRzhBqJ/1tqpYD4NyYsb9b5v7rxf6mmqQMMHAgXKJFkZudjN
         VzomzQHfREuBTzI9b33S8jFNwEJGb5UNXcBoV23sk7gFP4uYQVdbqKLQSQqbN9My7ecI
         3McymngF+gG6yLWLtKW4twNC0IdNIvUbpXZMdQ+HJvw7lCBybLBLM9UBVoI+g2UUBLOK
         0wHPUaRVly/P4FzQXR7tFaGTSLvqxI3FsT5JQvw/F+KXzVphaFf/69SLaGyppNuNutP+
         YvLQ==
X-Gm-Message-State: AOAM533ItGeFPGkWkGMgqfMQBYkSh4ngauJ6KR/cCYjW+gyD8Djlc3Ep
        mzvEoTjIdJk2wRU4irl06yCavKoEF4Y=
X-Google-Smtp-Source: ABdhPJzSViA3nbJpeKg2as0KQ93wxdxlYCRirpiJ3L9FZiRWPS2phT5FbugeHgNJ3EZGhLvHMdIfaA==
X-Received: by 2002:a19:495c:: with SMTP id l28mr21433144lfj.484.1637814181497;
        Wed, 24 Nov 2021 20:23:01 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id v2sm144156ljg.46.2021.11.24.20.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 20:23:01 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia,tegra-audio: Convert multiple
 txt bindings to yaml
To:     Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        ~okias/devicetree@lists.sr.ht, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <39c21327-c2ec-b9c5-95c2-047ac347fd23@gmail.com>
Date:   Thu, 25 Nov 2021 07:23:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.11.2021 23:42, Rob Herring пишет:
>> +  assigned-clocks: true
>> +
>> +  assigned-clock-parents: true
>> +
>> +  assigned-clock-rates: true
> These properties are always allowed when 'clocks' is present. So you 
> don't have to list them.
> 

That is a very nice new feature!
