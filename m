From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V2 2/5] Accept void pointer as input data type
 for get/set_value functions
Date: Tue, 08 Apr 2014 13:48:58 -0600
Message-ID: <534452AA.9020205@wwwdotorg.org>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com> <1396967422-6018-3-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-3-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:30 AM, Penny Chiu wrote:
> This change uses void * as input data type for
> cbootimage_soc_config.get/set_value and context_set_value functions.
> This makes the functions can accept various data types based on
> different tokens.

> diff --git a/src/set.c b/src/set.c

>  int context_set_value(build_image_context *context,

>  	case token_block_size:
> -		context->block_size = value;
> -		context->block_size_log2 = log2(value);
> +		context->block_size = *((u_int32_t *)value);
> +		context->block_size_log2 = log2(*((u_int32_t *)value));
>  
>  		if (context->memory != NULL) {
>  			printf("Error: Too late to change block size.\n");
>  			return 1;
>  		}
>  
> -		if (value != (u_int32_t)(1 << context->block_size_log2)) {
> +		if (*((u_int32_t *)value) != (u_int32_t)(1 << context->block_size_log2)) {

That could be context->block_size rather than *((u_int32_t *)value).

>  	case token_page_size:
> -		context->page_size = value;
> -		context->page_size_log2 = log2(value);
> +		context->page_size = *((u_int32_t *)value);
> +		context->page_size_log2 = log2(*((u_int32_t *)value));
>  		context->pages_per_blk= 1 << (context->block_size_log2- 
>  			context->page_size_log2);

I wonder why this case doesn't validate that page_size is a power of two
like the block_size does? Still, that's a pre-existing issue, so doesn't
block this patch. If you could send a patch to fix that, it would be
awesome.
