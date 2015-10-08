From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 3/5] Add support to dump rsa related fields
 for t210
Date: Thu, 8 Oct 2015 14:42:09 -0600
Message-ID: <5616D521.1040907@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-4-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-4-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
> Add support to dump rsa pubkey, bct's rsa-pss signature and
> bootloader's rsa-pss signature.

> +static void format_rsa_param(char const * message, void * data)
> +{
> +	u_int8_t *rsa = (u_int8_t *)data;
> +	int byte_index;
> +
> +	printf("%s", message);
> +	for (byte_index = 0; byte_index < ARSE_RSA_PARAM_MAX_BYTES;
> +					++byte_index) {
> +		printf("%02x", *rsa++);
> +
> +		if ((byte_index + 1) % 64 == 0)
> +			printf(";\n");
> +	}
> +
> +	if (byte_index % 64 != 0)
> +		printf(";\n");

The calculations related to byte_index changed here, but weren't 
mentioned in the changelog. The new version looks fine though.
