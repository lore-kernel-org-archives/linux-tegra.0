Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27B1CCA47F
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Jun 2022 22:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiF1Wv1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Jun 2022 18:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiF1Wv1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jun 2022 18:51:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52B93A735
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jun 2022 15:51:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A876B66018E4;
        Tue, 28 Jun 2022 23:51:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656456685;
        bh=/Xa85kzcd+3TxYdpCXZHSekH8rF5MDz3C8vqm/YZhmA=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=edGFzE3hZvQjX5emNeX9cmYpsE1FtsToie/JAquPNhQTp1CYdPPRQdSlarr3RY2Kl
         dViOi3z3v5KcLRyqyMWCD+0DoCnfsAQ/kuAnLTQC+P7TrVUBUaNBCQEyQgT+DJXMFd
         cG8VE5FkiWQrwuGEXyBlZDjyQ4/tIP4tcKJa5ZG3DtkVM7Pq7Ucbz02lgRGjmSQv4/
         TS+1rxovfL1mtOWXI4O1zH8Mof2CITGSftTuqpjIXRfIJx5Luyb40MKOwbzsG2LC0j
         B0SAvhTle+F8OcW1vi81PC/4CZzHcMPJqhX2IczrETLWCYHYnwDx/kKL18S72P57XQ
         MrXGBU8S8TK8Q==
Message-ID: <55eebcb4-aeba-5b24-4830-07a526d58f35@collabora.com>
Date:   Wed, 29 Jun 2022 01:51:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] drm/tegra: Fix vmapping of prime buffers
Content-Language: en-US
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@collabora.com
References: <20220628224239.578324-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220628224239.578324-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/29/22 01:42, Dmitry Osipenko wrote:
> The code assumes that Tegra GEM is permanently vmapped, which is not
> true for the scattered buffers. After converting Tegra video decoder
> driver to V4L API, we're now getting a BUG_ON from dma-buf core on playing
> video using libvdpau-tegra on T30+ because tegra_gem_prime_vmap() sets
> vaddr to NULL. Older pre-V4L video decoder driver wasn't vmapping dma-bufs.
> Fix it by actually vmapping the exported GEMs.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 7c7dd84e6db8..81991090adcc 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -704,14 +704,23 @@ static int tegra_gem_prime_vmap(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct drm_gem_object *gem = buf->priv;
>  	struct tegra_bo *bo = to_tegra_bo(gem);
> +	void *vaddr;
>  
> -	iosys_map_set_vaddr(map, bo->vaddr);
> +	vaddr = tegra_bo_mmap(&bo->base);
> +	if (IS_ERR(vaddr))
> +		return PTR_ERR(vaddr);
> +
> +	iosys_map_set_vaddr(map, vaddr);
>  
>  	return 0;
>  }
>  
>  static void tegra_gem_prime_vunmap(struct dma_buf *buf, struct iosys_map *map)
>  {
> +	struct drm_gem_object *gem = buf->priv;
> +	struct tegra_bo *bo = to_tegra_bo(gem);
> +
> +	tegra_bo_munmap(&bo->base, map->vaddr);
>  }
>  
>  static const struct dma_buf_ops tegra_gem_prime_dmabuf_ops = {

BTW, previously I only tested video dec on T30 using the grate-driver
kernel that properly vmaps GEMs. That's why it wasn't caught earlier.

-- 
Best regards,
Dmitry
