From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 4/4] Add new configuration keyword "ReSignBl"
Date: Wed, 7 Oct 2015 11:11:08 -0600
Message-ID: <5615522C.50100@wwwdotorg.org>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443819420-26562-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/02/2015 02:57 PM, Jimmy Zhang wrote:
> This feature is needed in case an image is updated at later stage
> after it has been created.
>
> How to use:
>    Add keyword "ReSignBl" to configuration file, for example resign.cfg:
>      ReSignBl;
>
>    Invoke cbootimage to resign image, for example bootloader.bin:
>      $ cbootimage -s tegra210 --update resign.cfg bootloader.bin bootloader.bin-resigned
>
>    Where bootloader.bin-resigned is the resigned bootloader.bin

Since the public key signing code has all been moved outside of 
cbootimage, I think this feature is now just recomputing the AES hash. 
I'm not sure that signing is the correct word now, is it? I wonder if 
the keyword should be RehashBl rather than ReSignBl?

> diff --git a/src/cbootimage.h b/src/cbootimage.h

> @@ -64,6 +64,7 @@ typedef enum
>   	file_type_bct,
>   	file_type_mts,
>   	file_type_bin,
> +	file_type_blocks,
>   } file_type;

The only place this is used is as a parameter to read_from_image(). That 
function only seems to care whether this parameter is equal to 
file_type_bl or not. Doesn't re-using file_type_bin make sense?

> diff --git a/src/crypto.c b/src/crypto.c

> +int
> +sign_bl(build_image_context *context,
> +	u_int8_t *bootloader,
> +	u_int32_t length,
> +	u_int32_t image_instance)
> +{
> +	int e = 0;
> +	u_int8_t  *hash_buffer;
> +	u_int32_t  hash_size;
> +
> +	g_soc_config->get_value(token_hash_size,
> +			&hash_size, context->bct);

Ah, so there's already a function that can return the size of various 
objects in the BCT. That will make option (b) in my review of patch 2 
much easier then...

> diff --git a/src/data_layout.c b/src/data_layout.c

> +int resign_bl(build_image_context *context)
...
> +}
> \ No newline at end of file

There should be one.
