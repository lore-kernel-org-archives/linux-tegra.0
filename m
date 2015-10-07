From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 3/4] Add support to dump rsa related fields
 for t210
Date: Wed, 7 Oct 2015 10:45:29 -0600
Message-ID: <56154C29.90708@wwwdotorg.org>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-4-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443819420-26562-4-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/02/2015 02:56 PM, Jimmy Zhang wrote:
> Add support to dump rsa pubkey, bct's rsa-pss signature and
> bootloader's rsa-pss signature.

It also seems to dump some AES hashes too.

> diff --git a/src/bct_dump.c b/src/bct_dump.c

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
> +		if (byte_index && ((byte_index + 1) % 64 == 0))
> +			printf(";\n");
> +	}
> +
> +	if (byte_index && (byte_index % 64 != 0))
> +			printf(";\n");
> +}

The same comment about hard-coding ARSE_RSA_PARAM_MAX_BYTES applies here 
as in the previous commit.

It would be nice if this function wrote the values to a file. That way, 
the output of bct_dump would be something you could feed into cbootimage 
directly. With this patch, the user has to manually convert the inline 
hex data into a binary file before the output is useful.

Still, solving that might be challenging. If bct_dump wrote to a 
user-supplied filename, the files could simply be named 
"${filename}.RsaKeyModulus" etc. However, since bct_dump prints to 
stdout, that's not possible. Perhaps since bct_dump is mostly a debug 
aid, we can live with this issue for now.
