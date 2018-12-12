From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] scatterlist: Update size type to support greater then
 4GB size.
Date: Tue, 11 Dec 2018 22:29:50 -0800 (PST)
Message-ID: <20181211.222950.1995970751331458343.davem@davemloft.net>
References: <1544595853-18492-1-git-send-email-amhetre@nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544595853-18492-1-git-send-email-amhetre@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: amhetre@nvidia.com
Cc: herbert@gondor.apana.org.au, axboe@kernel.dk, adrian.hunter@intel.com, ulf.hansson@linaro.org, linux-crypto@vger.kernel.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, vdumpa@nvidia.com, mmaddireddy@nvidia.com, Snikam@nvidia.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Ashish Mhetre <amhetre@nvidia.com>
Date: Wed, 12 Dec 2018 11:54:13 +0530

> diff --git a/include/linux/nvme.h b/include/linux/nvme.h
> index 68e91ef..0a07a29 100644
> --- a/include/linux/nvme.h
> +++ b/include/linux/nvme.h
> @@ -587,7 +587,7 @@ enum {
>  
>  struct nvme_sgl_desc {
>  	__le64	addr;
> -	__le32	length;
> +	__le64	length;
>  	__u8	rsvd[3];
>  	__u8	type;
>  };

Isn't this a device or protocol defined datastructure?  You can't just
change it like this.
