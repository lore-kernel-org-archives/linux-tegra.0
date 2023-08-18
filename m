Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EC1C678DF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Aug 2023 01:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356991AbjHRB3q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 21:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357154AbjHRB3i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 21:29:38 -0400
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3743B3AB0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 18:29:15 -0700 (PDT)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
        by cmsmtp with ESMTP
        id WmuJqHTiuDKaKWoCjqIYpj; Fri, 18 Aug 2023 01:23:09 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id WoCiq6kxuHSofWoCiq01UJ; Fri, 18 Aug 2023 01:23:08 +0000
X-Authority-Analysis: v=2.4 cv=HbEH8wI8 c=1 sm=1 tr=0 ts=64dec7fc
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=gq5M5jF_6ledRb6gi8cA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=W+APBRg8o314jt6uDyEC5Jfo0rqlMRI2vlmhW48WDnc=; b=x9708Lvq1QS5gdgOrWgU2Dz/81
        yg6ukbzySI1imcLy9auwCMq0UiMxlb9NocCPLrQ6QysF5E9gd/kjWZFHlxR9QzRXxAAXRiub3zdCJ
        JDNyw4ICkjeTr1hQ759pO7XJQN9BFwjVInmM9/0oifwkRcW3dOcAy0yW2cFGi72gNDVCxkFekjGLh
        FcomvuO+gMaFy56Wml0/apxdxoUKPw3RHT46MwPjvwaMDdq4oHgEokjtnIPL7DHKQraiXPbF1YG0J
        W+8IsM6jInBbomIFsVaX6n+64uwf4wmu7EbffvhThJYTFN3Ys7q1b4IPdobHJRkXaJ+e4nXe9D74B
        DhsLPgGA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56012 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qWoCc-000V6X-0c;
        Thu, 17 Aug 2023 20:23:02 -0500
Message-ID: <bbf77b66-5bb1-35b3-30d1-58a9b2a60b20@embeddedor.com>
Date:   Thu, 17 Aug 2023 19:24:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/21] dmaengine: qcom: bam_dma: Annotate struct
 bam_async_desc with __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-7-keescook@chromium.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-7-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWoCc-000V6X-0c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:56012
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 171
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAKrnd3HwMP4oX8jHOzec/PT25Qk8s6DYoeIMwyr8q/QAoamrVpISa2dgmoSdbCl9Tg0kLIF+O/p4j7ITxsGSuqs9CnPjmDiZKBEey39kMTPh7jHL6US
 0pI/TvdxYSNl58uC5yaK3vYzFfcOHL30kGSr9Yv2Opjq3DZPSegFX+uIxiavg2o8kBGb7q+TicGx9e55IW0BdHSYIxX3EvjkQLKNizGtNJt5dVWtH5pCxDvR
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 8/17/23 17:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct bam_async_desc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/qcom/bam_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 4c3eb972039d..65b89bb7a56b 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -74,7 +74,7 @@ struct bam_async_desc {
>   	struct list_head desc_node;
>   	enum dma_transfer_direction dir;
>   	size_t length;
> -	struct bam_desc_hw desc[];
> +	struct bam_desc_hw desc[] __counted_by(num_desc);
>   };
>   
>   enum bam_reg {
