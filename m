From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH V2 4/5] Add Tegra124 bct data access for jtag
 control and chip uid
Date: Tue, 08 Apr 2014 14:09:17 -0600
Message-ID: <5344576D.3070703@wwwdotorg.org>
References: <1396967422-6018-1-git-send-email-pchiu@nvidia.com> <1396967422-6018-5-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396967422-6018-5-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2014 08:30 AM, Penny Chiu wrote:
> Add support for read secure_jtag_control and unique_chip_id from
> cfg file and write them into BCT structure, and bct_dump can also
> parse the two fields and show the data.

> diff --git a/src/bct_dump.c b/src/bct_dump.c

> @@ -174,17 +190,30 @@ int main(int argc, char *argv[])
>  		if (!g_soc_config->token_supported(values[i].id))
>  			continue;
>  
> +		if (values[i].id == token_unique_chip_id) {
> +			u_int8_t uid[16];
> +
> +			e = g_soc_config->get_value(values[i].id,
> +						uid,
> +						context.bct);
> +			if (e != 0)
> +				for (j = 0; j < 16; j++)
> +					uid[j] = -1;
> +
> +			values[i].format(values[i].message, uid);
> +		} else {
> +			e = g_soc_config->get_value(values[i].id,
>  						&data,
>  						context.bct);
>  
> +			if (e != 0)
> +				data = -1;
> +			else if (values[i].id == token_block_size_log2 ||
> +				 values[i].id == token_page_size_log2)
> +				data = 1 << data;
>  
> +			values[i].format(values[i].message, &data);
> +		}

I was hoping to avoid that outer if condition completely. Wouldn't the
following work:

u_int8_t data[MAX_PARAM_SIZE];
e = g_soc_config->get_value(values[i].id, data, context.bct);
if (e)
    memset data[] to zero
values[i].format(values[i].message, data);

0 seems just as valid in the error case as -1.

I would prefer the special case for token_block_size_log2 adn
token_page_size_log2 to go away too. Why aren't those tokens set to
their actual values?

In order to calculate MAX_PARAM_SIZE, perhaps something like:

union param_types;
    u32 val;
    u_int8_t uuid[16];
};
#define MAX_PARAM_SIZE sizeof(param_types)

> diff --git a/src/parse.c b/src/parse.c

> +parse_chipuid(char *str, u_int8_t *chipuid)

> +	paddings = strlen(str) % 2;
> +	byte_index = strlen(str) / 2 + paddings;

There needs to be error-checking to make sure that byte_index < sizeof
*chipuid.

If byte_index is less than sizeof *chipuid, should the value be left- or
right-aligned within *chipuid? Right now it's left-justified. That may
be fine, but I just wanted to check. Is it an error if the length of the
string doesn't exactly match sizeof *chipuid?

> +	while (*str != '\0' && byte_index > 0) {
> +		char *endptr;
> +
> +		strncpy(byte_str, str, 2 - paddings);
> +		byte_str[2-paddings] = '\0';

Need spaces around the - operator.

> +static int parse_value_chipuid(build_image_context *context,
> +			parse_token token,
> +			char *rest)
> +{
> +	u_int8_t value[16];
> +
> +	assert(context != NULL);
> +	assert(rest != NULL);
> +
> +	memset(value, 0, sizeof(value));

Shouldn't this memset() be inside parse_chipuid(), so that
parse_chipuid() either fails, or succeeds and fills in the entire UID value?
