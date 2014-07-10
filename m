From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] Rename last_bl_blk to last_blk
Date: Thu, 10 Jul 2014 18:26:17 +0800
Message-ID: <53BE6A49.9050103@nvidia.com>
References: <1404987710-26375-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404987710-26375-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sorry, this is a series for cbootimage. I forgot to add the prefix. Will 
add in next version.

Thanks,
Vince

On 07/10/2014 06:21 PM, Vince Hsu wrote:
> Also update the next_bct_blk. Then we have the correct pointer
> to the next block for the next image write.
>
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   src/cbootimage.h  | 2 +-
>   src/data_layout.c | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/src/cbootimage.h b/src/cbootimage.h
> index 6def766f1770..baade00f5e33 100644
> --- a/src/cbootimage.h
> +++ b/src/cbootimage.h
> @@ -95,7 +95,7 @@ typedef struct build_image_context_rec
>   	u_int8_t *bct;
>   
>   	char *bct_filename;
> -	u_int32_t last_bl_blk;
> +	u_int32_t last_blk;
>   	u_int32_t bct_size; /* The BCT file size */
>   	u_int32_t boot_data_version; /* The boot data version of BCT */
>   	u_int8_t bct_init; /* The flag for the memory allocation of bct */
> diff --git a/src/data_layout.c b/src/data_layout.c
> index c848a6141b2b..73663beffbe2 100644
> --- a/src/data_layout.c
> +++ b/src/data_layout.c
> @@ -552,8 +552,9 @@ write_bootloaders(build_image_context *context)
>   				current_blk++;
>   				virtual_blk++;
>   			}
> -			context->last_bl_blk = current_blk;
> +			context->last_blk = current_blk;
>   		}
> +		context->next_bct_blk = context->last_blk + 1;
>   		free(buffer);
>   	}
>   
