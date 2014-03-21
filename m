From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/2] Add Tegra124 bct data access for jtag
 control and chip uid
Date: Fri, 21 Mar 2014 13:29:14 -0600
Message-ID: <532C930A.9030902@wwwdotorg.org>
References: <1395394886-8145-1-git-send-email-pchiu@nvidia.com> <1395394886-8145-2-git-send-email-pchiu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395394886-8145-2-git-send-email-pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/21/2014 03:41 AM, Penny Chiu wrote:
> Add support for read secure_jtag_control and unique_chip_id from
> cfg file and write them into BCT structure, and bct_dump can also
> parse the two fields and show the data.

> diff --git a/src/bct_dump.c b/src/bct_dump.c

> @@ -37,7 +37,9 @@ static value_data const values[] = {
>  	{ token_block_size_log2,     "BlockSize     = 0x%08x;\n" },
>  	{ token_page_size_log2,      "PageSize      = 0x%08x;\n" },
>  	{ token_partition_size,      "PartitionSize = 0x%08x;\n" },
> -	{ token_odm_data,            "OdmData       = 0x%08x;\n\n" },
> +	{ token_odm_data,            "OdmData       = 0x%08x;\n" },
> +	{ token_secure_jtag_control, "JtagCtrl      = 0x%08x;\n" },
> +	{ token_unique_chip_id,      "ChipUid       = %s;\n" },

Please (in a separate patch up-front) add an additional field to this
table, which is the function to use to format the data value. I would
expect the result to be:

{ token_page_size_log2,      "PageSize      = ", format_u32_hex8 },
{ token_partition_size,      "PartitionSize = ", format_u32_hex8 },
{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
{ token_unique_chip_id,      "ChipUid       = ", format_chipuid },

This would (a) make it consistent with parse_item s_top_level_items[] in
src/parse.c (b) remove the need for the dumping loop in main() to make
custom decisions about particular tokens; everything can be moved into
the format_xxx() functions.

> @@ -154,17 +156,34 @@ int main(int argc, char *argv[])
>  
>  	/* Display root values */
>  	for (i = 0; i < sizeof(values) / sizeof(values[0]); ++i) {
> +		if (values[i].id == token_unique_chip_id) {
> +			u_int8_t uid[16];
> +			char uid_str[35] = "0x";
>  
> +			e = g_soc_config->get_value(values[i].id,
> +							(u_int32_t *)uid,
> +							context.bct);
> +			if (e != 0)
> +				continue;

If there's an error getting the value, shouldn't the tool at least warn
the user, if not return an error? Why would get_value() ever return an
error?

Please send a separate patch to eliminate the need for the (u_int32_t *)
cast. get/set_value() should accept a void* not a uint32_t*. Same for
context_get/set_value(). That way, you won't need to introduce separate
functions for context_get/set_chipuid().

> +
> +			for (j = 15; j >= 0; j--)
> +				sprintf(uid_str, "%s%02x", uid_str, uid[j]);

That's a bit dangerous; I would guess some implementations of sprintf()
could end up in an infinite loop there. It would be better to do
something more like:

char *s = uid_str;
for (j = 15; j >= 0; j--, s += 2)
	sprintf(s, "%02x", uid[j]);

Also, why not use a more descriptive variable name than j - perhaps
"byte_index"?

...
> +			e = g_soc_config->get_value(values[i].id,
> +							&data,
> +							context.bct);
> +
> +			if (e != 0) {
> +				if (values[i].id == token_secure_jtag_control)
> +					continue;
> +				data = -1;

Why would this ever fail? I think the tool should error out if it does.

Perhaps this is because only some tokens are only supported on some
SoCs? If so, the top of the loop should really look like:

for (i = 0; i < sizeof(values) / sizeof(values[0]); ++i) {
	if (!g_soc_config->token_supported(values[i].id))
		continue;

> diff --git a/src/parse.c b/src/parse.c

> +/*
> + * Parse the given string and transfer to chip uid.
> + *
> + * @param str		String to parse
> + * @param chipuid	Returns chip uid that was parsed
> + * @return the remainder of the string after the number was parsed
> + */
> +static char *
> +parse_chipuid(char *str, u_int8_t *chipuid)
> +{
> +	while (*str == '0')
> +		str++;
> +
> +	if (tolower(*str) == 'x') {

Why allow more than one 0, and why ignore and mis-formatted data (i.e.
the character after 0 not being x)?

This should be:

if (*str++ != '0')
	raise an error;
if (*str++ != 'x')
	raise an error;

> +		str++;
> +		paddings = strlen(str) % 2;
> +		byte_index = strlen(str) / 2 + paddings;

Please validate that byte_index is not out-of-range, so that writes to
*chip_uid don't overflow the buffer.

> +		while (*str != '\0' && byte_index > 0) {
> +			u_int32_t value = 0;
> +
> +			strncpy(byte_str, str, 2 - paddings);
> +			byte_str[2-paddings] = '\0';
> +			str = str + 2 - paddings;
> +
> +			sscanf(byte_str, "%x", &value);
> +			*(chipuid + byte_index - 1) = value;

Uggh. Why strcpy() the data at all, and why use the heavy-weight
sscanf() for data conversion?

I assume the input data can be modified. If not, then just strdup() the
whole string in 1 pass.

Instead, since the string is parsed backwards, you can write a NULL
immediately after every chunk to be parsed. Something like the code
below. Also, use strtoul() to convert rather than sscanf(); it's much
simpler. While you're at it, please send a separate patch to fix all the
same issues in parse_u32; it's basically re-implementing strtoul()!

while (*str != '\0' && byte_index > 0) {
	char *endptr;
	chipuid[byte_index] = strtoul(str, &endptr, 16);
	if (*endptr)
		raise an error;
	byte_index--;
	*str = 0;
	str += 2 - paddings;
	paddings = 0;
}

> +static int parse_value_chipuid(build_image_context *context,
...
> +	return context_set_chipuid(context, value);

As mentioned above, this should be able to use context_set_value(), by
fixing that function's prototype.

> diff --git a/src/set.c b/src/set.c

> +/*
> + * General handler for setting chip uid in config files.
> + *
> + * @param context	The main context pointer
> + * @param data		The value to set
> + * @return 0 for success
> + */
> +int context_set_chipuid(build_image_context *context,

Please fix context_set_value() to handle the UID token type, rather than
introducing a separate function for this one token.
