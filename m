From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v5 2/5] Add support to dump rsa related fields
 for t210
Date: Mon, 12 Oct 2015 16:50:38 -0600
Message-ID: <561C393E.2050707@wwwdotorg.org>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-3-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444441574-17205-3-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
> Add support to dump rsa pubkey, bct's rsa-pss signature and
> bootloader's rsa-pss signature.

> diff --git a/src/bct_dump.c b/src/bct_dump.c

> +#define ARSE_RSA_PARAM_MAX_BYTES	256
>   typedef union {
>   	u_int32_t val;
>   	u_int8_t uid[16];
> +	u_int8_t rsa_param[ARSE_RSA_PARAM_MAX_BYTES];
>   } param_types;

Shouldn't that be replaced by something that uses the new get_size() 
functionality now implemented in patch 1?
