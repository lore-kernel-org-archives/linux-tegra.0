From: Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] scatterlist: Update size type to support greater then 4GB
 size.
Date: Tue, 11 Dec 2018 22:46:52 -0800
Message-ID: <39a4f02c-d054-2651-2381-a8d86cdf3c13@grimberg.me>
References: <1544595853-18492-1-git-send-email-amhetre@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544595853-18492-1-git-send-email-amhetre@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ashish Mhetre <amhetre@nvidia.com>, herbert@gondor.apana.org.au, davem@davemloft.net, axboe@kernel.dk, adrian.hunter@intel.com, ulf.hansson@linaro.org, linux-crypto@vger.kernel.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, vdumpa@nvidia.com, mmaddireddy@nvidia.com
Cc: linux-tegra@vger.kernel.org, Snikam@nvidia.com
List-Id: linux-tegra@vger.kernel.org


>   struct nvme_sgl_desc {
>   	__le64	addr;
> -	__le32	length;
> +	__le64	length;
>   	__u8	rsvd[3];
>   	__u8	type;
>   };

in what world changing a wire protocol for this make sense?

please get rid of this hunk, NVMe will never cross the 32 bit sg element 
size.
