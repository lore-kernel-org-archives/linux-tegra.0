From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v5 1/5] Add support for update pubkey and
 rsa-pss signatures
Date: Mon, 12 Oct 2015 16:49:05 -0600
Message-ID: <561C38E1.6000103@wwwdotorg.org>
References: <1444441574-17205-1-git-send-email-jimmzhang@nvidia.com>
 <1444441574-17205-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444441574-17205-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/09/2015 07:46 PM, Jimmy Zhang wrote:
> Create new configuration keywords:
>     RsaKeyModulusFile: pubkey modulus
>     RsaPssSigBlFile:   bootloader rsa pss signature
>     RsaPssSigBctFile:  bct rsa pss signature
>
> Sample Configuration file update_bl_sig.cfg
>     RsaKeyModulusFile = pubkey.mod;
>     RsaPssSigBlFile = bl.sig;
>
> where pubkey.mod and bl.sig are files that contain the public key
> modulus and bootloader's rsa-pss signature respectively.
>
> public key modulus and signature are created through utilities
> outside cbootimage.
>
> Command line example:
>   $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin image.bin-bl-signed
>
> Above three new keywords added in this CL are only implemented support
> for T210.

I'd like to see a changelog per patch so I don't have to refer back to 
the cover letter each time.

> diff --git a/src/crypto.c b/src/crypto.c

> +void
> +swap_endianness(

Nit: It's more like "byte order" (serialization) rather than endianness, 
although they're related concepts.

> +	u_int8_t *out,
> +	u_int8_t *in,

Nit: You could make "in" const to since it's not written.

> +	const u_int32_t size)

... certainly that'd be more useful than making size const.

> +{
> +	u_int32_t i;
> +
> +	for (i = 0; i < size / 2; i++) {
> +		u_int8_t b1 = in[i];
> +		u_int8_t b2 = in[size - 1 - i];
> +		out[i] = b2;
> +		out[size - 1 - i] = b1;

Nit: It'd be nice to put "size - 1 - i" into a variable rather than 
duplicate the calculation.

> diff --git a/src/set.c b/src/set.c

> +int
> +set_rsa_param(build_image_context *context, parse_token token,
> +		char *filename)
> +{
> +	int	result;
> +	u_int8_t *rsa_storage;	/* Holds the rsa param after reading */
> +	u_int32_t size;		/* Bytes to read */
> +	u_int32_t actual_size;	/* In bytes */
> +
> +	if (g_soc_config->get_value_size == NULL) {
> +		printf("Error: get_value_size() is not supported.\n");

I think code that calls that function should be able to assume the 
function pointer is non-NULL. This could be achieved by either having 
each SoC-specific file provide an implementation of that function. For 
the SoCs that don't support this, you could share a common dummy 
implementation that always returns an error.

> diff --git a/src/parse.h b/src/parse.h

>   	/*
> +	 * Get the size of specified bct field
> +	 *
> +	 * @param id  	The parse token
> +	 * @param data	Return size from bct field
> +	 * @param bct 	Bct pointer
> +	 * @return 0 and -ENODATA for success and failure
> +	 */
> +	int (*get_value_size)(parse_token id,
> +			void *data,
> +			u_int8_t *bct);

The existing get/set functions use a void* since they can operate on 
different fields with different data types. However, the result of 
retrieving a field's size is always a size_t. The "bct" parameter also 
doesn't seem to be used; do you think there could ever be a use for it? 
I think the following prototype should be used so that we can get as 
much type safety as possible:

// Returns >0 for size, -ve for error, never returns 0.
size_t (*get_value_size)(parse_token id);
