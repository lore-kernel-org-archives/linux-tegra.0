Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A696DC7EE2C
	for <linux-tegra@archiver.kernel.org>; Thu, 18 May 2023 11:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjERLlK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 May 2023 07:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjERLkw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 May 2023 07:40:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB05B1FCC;
        Thu, 18 May 2023 04:40:30 -0700 (PDT)
Received: from [192.168.2.250] (109-252-144-198.dynamic.spd-mgts.ru [109.252.144.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C0A86605960;
        Thu, 18 May 2023 12:39:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684409970;
        bh=CjxRnlIRzCPLtzL73CgkaG1PIMrWMkIhni/Oo/WszUU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TwIgAu610/teFve9Ia9pyhfIYXV/9oeFBnMKDzrbTWZdXGNm51y0d5ckMl+ShvePR
         +mmG2f0SWVarp7TlPluCTsZlvxpt0jaYVCGsWEu6V4KMzSxFYn2ieE0nU3/C6M7smF
         IQ8mfw3bAczPsxijTiYxb3ibkLU/hjykLOROyaz6rd1+E/nn9A6jju2SLXvImKzXsO
         H7DRj16TtzURS6TP81SXVVvGI+C/DEWcmOQwqs2+m2wk9yqKo26Xu3JwcI5MMnR1P1
         lYPK9sLq3O9P+hOSwaZp5pUvjcbcQ2xa9oqoh7Zs30MPwHL6LUkmz8EYfIhWnmJrjW
         +tYHCD/BMa+vA==
Message-ID: <2c8980d9-4ef9-d1d7-d93b-cac97837c80b@collabora.com>
Date:   Thu, 18 May 2023 14:39:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/5] kernel/reboot: add device to sys_off_handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-3-af44a4cd82e9@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-3-af44a4cd82e9@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/9/23 22:03, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> If the dev is known (e.g. a devm-based sys_off_handler is used), it can
> be passed to the handler's callback to have it available there.
> Otherwise, cb_data might be set to the dev in most of the cases.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  include/linux/reboot.h | 3 +++
>  kernel/reboot.c        | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/linux/reboot.h b/include/linux/reboot.h
> index 2b6bb593be5b..c4cc3b89ced1 100644
> --- a/include/linux/reboot.h
> +++ b/include/linux/reboot.h
> @@ -129,11 +129,14 @@ enum sys_off_mode {
>   * @cb_data: User's callback data.
>   * @cmd: Command string. Currently used only by the sys-off restart mode,
>   *       NULL otherwise.
> + * @dev: Device of the sys-off handler. Only if known (devm_register_*),
> + *       NULL otherwise.
>   */
>  struct sys_off_data {
>  	int mode;
>  	void *cb_data;
>  	const char *cmd;
> +	struct device *dev;
>  };
>  
>  struct sys_off_handler *
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index 6ebef11c8876..395a0ea3c7a8 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -55,6 +55,7 @@ struct sys_off_handler {
>  	enum sys_off_mode mode;
>  	bool blocking;
>  	void *list;
> +	struct device *dev;
>  };
>  
>  /*
> @@ -324,6 +325,7 @@ static int sys_off_notify(struct notifier_block *nb,
>  	data.cb_data = handler->cb_data;
>  	data.mode = mode;
>  	data.cmd = cmd;
> +	data.dev = handler->dev;
>  
>  	return handler->sys_off_cb(&data);
>  }
> @@ -511,6 +513,7 @@ int devm_register_sys_off_handler(struct device *dev,
>  	handler = register_sys_off_handler(mode, priority, callback, cb_data);
>  	if (IS_ERR(handler))
>  		return PTR_ERR(handler);
> +	handler->dev = dev;
>  
>  	return devm_add_action_or_reset(dev, devm_unregister_sys_off_handler,
>  					handler);
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

