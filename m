From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2 2/4] Add support for update pubkey and rsa-pss
 signatures
Date: Thu, 8 Oct 2015 14:39:31 -0600
Message-ID: <5616D483.4040306@wwwdotorg.org>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-3-git-send-email-jimmzhang@nvidia.com>
 <56154969.6080501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56154969.6080501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In V3 (which actually should have been labelled v4 I think) none of the 
review comments below were addressed.

On 10/07/2015 10:33 AM, Stephen Warren wrote:
> On 10/02/2015 02:56 PM, Jimmy Zhang wrote:
>> Create new configuration keywords:
>>     RsaKeyModulusFile: pubkey modulus
>>     RsaPssSigBlFile:   bootloader rsa pss signature
>>     RsaPssSigBctFile:  bct rsa pss signature
>>
>> Sample Configuration file update_bl_sig.cfg
>>     RsaKeyModulusFile = pubkey.mod;
>>     RsaPssSigBlFile = bl.sig;
>>
>> where pubkey.mod and bl.sig are files that contain the public key
>> modulus and bootloader's rsa-pss signature respectively.
>>
>> public key modulus and signature are created through utilities
>> outside cbootimage.
>>
>> Command line example:
>>   $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin
>> image.bin-bl-signed
>>
>> Above three new keywords added in this CL are only implemented support
>> for T210.
>
>> diff --git a/src/cbootimage.h b/src/cbootimage.h
>
>> +#define ARSE_RSA_MAX_MODULUS_SIZE    2048
>> +#define ARSE_RSA_PARAM_MAX_BYTES    (ARSE_RSA_MAX_MODULUS_SIZE / 8)
>
> These values are currently defined in the chip-specific location
> src/tNNN/nvboot_bct_tNNN.h, and this patch only removes a single on of
> those 3 copies when creating this new centralized value. At best that
> makes the code inconsistent, and at worst could cause compile errors due
> to multiple definitions.
>
> Instead, can you leave this value in the T210-specific location. More
> related to this below.
>
>> diff --git a/src/parse.c b/src/parse.c
>
>> +static int parse_rsa_param(build_image_context *context,
>> +            parse_token token,
>> +            char *rest)
>> +{
>> +    char filename[MAX_BUFFER];
>> +
>> +    assert(context != NULL);
>> +    assert(rest != NULL);
>> +
>> +    if (context->generate_bct != 0)
>> +        return 0;
>> +
>> +    /* Parse the file name. */
>> +    rest = parse_filename(rest, filename, MAX_BUFFER);
>> +    if (rest == NULL)
>> +        return 1;
>
> That doesn't look like the correct error check. Rather, other function
> that parse filenames (and other fields) appear to do something like the
> following after parsing all the fields:
>
>          /* Parse the end state. */
>          rest = parse_end_state(rest, e_state, MAX_STR_LEN);
>          if (rest == NULL)
>                  return 1;
>
> I suspect that code should be present in this function too?
>
>> diff --git a/src/set.c b/src/set.c
>
>> +int
>> +set_rsa_param(build_image_context *context, parse_token token,
>> +        char *filename)
>> +{
>> +    int    result;
>> +    u_int8_t *rsa_storage;    /* Holds the rsa param after reading */
>> +    u_int32_t actual_size;    /* In bytes */
>> +    file_type rsa_filetype = file_type_bin;
>> +
>> +        /* Read the image into memory. */
>> +    result = read_from_image(filename,
>> +                0,
>> +                ARSE_RSA_PARAM_MAX_BYTES,
>> +                &rsa_storage,
>> +                &actual_size,
>> +                rsa_filetype);
>> +
>> +    if (result) {
>> +        printf("Error reading file %s.\n", filename);
>> +        exit(1);
>> +    }
>> +
>> +    if (actual_size != ARSE_RSA_PARAM_MAX_BYTES) {
>> +        printf("Error: invalid size, file %s.\n", filename);
>> +        exit(1);
>> +        }
>
> I would suggest removing anything from this function that restricts the
> file size to any particular value, since this is generic code, and in
> theory at least each SoC defines its own RSA size parameters.
>
> Looks like an indentation error there too.
>
>> diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
>
>> @@ -2198,6 +2201,24 @@ t210_bct_set_value(parse_token id, void *data,
>> u_int8_t *bct)
>>           memcpy(&bct_ptr->unique_chip_id, data, sizeof(nvboot_ecid));
>>           break;
>>
>> +    case token_rsa_key_modulus:
>> +        memcpy(&bct_ptr->key, data, sizeof(nvboot_rsa_key_modulus));
>> +        break;
>> +
>> +    case token_rsa_pss_sig_bl:
>> +        /*
>> +         * Update bootloader 0 since there is only one copy
>> +         * of bootloader being built in.
>> +         */
>> +        memcpy(&bct_ptr->bootloader[0].signature.rsa_pss_sig,
>> +            data, sizeof(nvboot_rsa_pss_sig));
>> +        break;
>> +
>> +    case token_rsa_pss_sig_bct:
>> +        memcpy(&bct_ptr->signature.rsa_pss_sig,
>> +            data, sizeof(nvboot_rsa_pss_sig));
>> +        break;
>
> Instead, I think the file size can be validated here?
>
> Hmm, I don't see a size parameter to this function:-(
>
> Given that, I think that either:
>
> a) Add a size parameter to this function. This has the disadvantage of
> needing to update a bunch of call sites. I don't know how many; perhaps
> this isn't a big deal?
>
> or:
>
> b) Modify set_rsa_param() so that it doesn't check the file size against
> a single global define ARSE_RSA_PARAM_MAX_BYTES, but rather calls a
> function that's implemented in src/t210/*.c that tells it what size the
> token should be.
>
> This would also solve my other objection that currently set_rsa_param()
> assumes that all the RSA-related parameters must be the same size. While
> that is true at present, I'm not sure that it my be true in all cases in
> the future.
>
> This is probably the most flexible, and not too hard to implement.
>
> or:
>
> c) Remove the duplicate defines (e.g. ARSE_RSA_MAX_MODULUS_SIZE) from
> the T114/124/132 files too. This has the disadvantage that if some
> future chip changes the RSA sizes, we'll have to undo this change at
> that time, and switch back to (a) or (b).
