From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 4/8] Add new configuration keyword "PkcKey"
Date: Mon, 21 Sep 2015 15:41:20 -0600
Message-ID: <56007980.6060203@wwwdotorg.org>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> Use "PkcKey" to specify rsa key filename and load in
> rsa private keys from file.
>
> When keyword "PkcKey" is present, rsa pss signatures are generated
> for both bootloader and bct. rsa pubkey will also be filled into bct.

Oh, so the config file can either specify a literal value for all the 
hashes, or specify a key and have cbootimage generate them? It would be 
good to add some form of high-level documentation of the use-cases into 
README.txt

> PkcKey syntax:
>
>    PkcKey = <rsa_key_filename> [, --save];
>
> Examples:
>
>     PkcKey = rsa_priv.txt;
>       Load in keys from file rsa_priv.txt
>
>     PkcKey = rsa_priv.pem, --save;
>       Load in keys from file rsa_priv.pem and save pubkey and pubkey hash
>       value to file pubkey.mod and pubkey.sha respectively.

Can't the output filenames be either specified in the config file, or 
derived from the filename passed to PkcKey (so rsa_priv.pem -> 
rsa_priv.mod, rsa_priv.sha, rather than presumably hard-coding 
"pubkey.mod", "pubkey.sha")?

> Two key formats are supported.
>     1. Polar SSL format
>        P = ...
>        Q = ...
>
>     2. Open SSL format
>         -----BEGIN RSA PRIVATE KEY-----
>         ...
>         -----END RSA PRIVATE KEY-----

Do we need to support two formats; can't the openssl (or other) cmdline 
application convert the data file between the formats to reduce the 
complexity in cbootimage?

> diff --git a/src/cbootimage.h b/src/cbootimage.h

> +typedef enum
> +{
> +	false = 0,
> +	true = 1,
> +} bool;

This is a standard type; the definition should come from a standard 
system header file.


> @@ -110,6 +117,7 @@ typedef struct build_image_context_rec
>
>   	char *bct_filename;
>   	char *rsa_filename;
> +	void *pkckey;

Please expand on what this variable means (comment or better field name).

> diff --git a/src/crypto.c b/src/crypto.c

> - * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.

Please don't delete old copyright dates, but just add to them. i.e. 
"2012, 2015".

> +#include "libm/pkcs1-rsa.h"
> +#include "libm/hash.h"

I would expect libm/include/ to be in the #include path via a -I 
directive, so those would be:

#include <mcrypto/pkcs1-rsa.h>
#include <mcrypto/hash.h>

(At least the examples that ship with libmcrypto appear to expect the 
library gets installed with the <libmcrypto/> path available, so we 
should match that in any code using libmcrypto)

> +static u_int8_t *pkc_get_pubkey(void *key)
> +{
> +	NvTegraPkcKey *pPkcKey = (NvTegraPkcKey *)key;
> +	return (u_int8_t *)pPkcKey->Modulus.Number;
> +}

pkc_get_pubkey_modulus()? Since presumably *pPkcKey contains more than 
just the Modulus field?

> +int
> +pkc_sign_buffer(void *key, u_int8_t *buffer, u_int32_t size, u_int8_t **pSign)
...
> +	/* TODO: define constant for ssk.len */
> +	ssk.len = (UINT)pPkcKey->Modulus.Digits; /* length in digits of modulus in term of 32 bits */

What is the implication of this TODO? Why isn't this dynamic assignment 
acceptable?

> @@ -283,17 +321,116 @@ sign_bct(build_image_context *context,

> -	e = sign_data_block(bct + Offset, length, hash_buffer);
> -	if (e != 0)
> +	if ((e = sign_data_block(bct + Offset, length, hash_buffer)) != 0)
>   		goto fail;

The original code was cleaner.

> -	e = g_soc_config->set_data(token_crypto_hash,
> +	if ((e = g_soc_config->set_data(token_crypto_hash,

Same here. It's much better to assign the return code to a variable then 
test that variable rather than smash everything together into one 
hard-to-read expression. The same comment applies elsewhere too.

> +	/*  pkc signing? */
> +	if (context->pkckey) {
...
> +		g_soc_config->set_value(token_pub_key_modulus,
> +					pkc_get_pubkey(context->pkckey),
> +					bct);
> +	}
> +
> + fail:
> +	free(hash_buffer);
> +	return e;
> +}
> +
>   		goto fail;
>
>    fail:
>   	free(hash_buffer);
>   	return e;
>   }
> +void
> +SwapEndianness(

Something is wrong with the indentation at the end of that function, and 
there should be a blank line between the functinos.

> +int
> +pkc_savefile(const char *pFilename,
> +		u_int8_t *buffer, size_t bytes, const char* ext)
> +{
> +	int ret = 0;
> +	char *fn = malloc(sizeof(pFilename) + sizeof(ext) + 1);

sizeof yields the size of the pointer. I suspect you mean strlen.

> +	FILE *output_file;
> +
> +	sprintf(fn, "%s%s", pFilename, ext);
> +
> +	printf("Saving file %s\n", fn);
> +	output_file = fopen(fn, "w+");

I assume this is a binary file given the use of fwrite() below. I don't 
see any mixture of reading and writing. So that should be "wb".

> +	if (output_file == NULL) {
> +		printf("Error opening raw file %s.\n", fn);
> +		ret = -1;
> +		goto fail;
> +        }

Indentation is wrong there; I suggest scanning all the patches for 
TABs-vs-spaces.


> +int
> +pkc_save_pubkey(
> +	void *pKey,
> +	const char *pFileName)

I think this is saving the modulus and hash, not the key itself? So, 
pkc_save_pubkey_modulus_and_hash()?


> diff --git a/src/crypto.h b/src/crypto.h

> +#define PUBKEY_FILENAME		"pubkey."

that shouldn't be hard-coded.

> +#define PUBKEY_MODULUS		"mod"
> +#define PUBKEY_MODULUS_HASH	"sha"

Those names don't imply they're filename extensions. 
PUBKEY_FILENAME_EXT_{MODULUS,HASH} would be better.

> +#define BCT_FILENAME	"bct."
> +#define BL_FILENAME	"bl."

FILENAME_PREFIX/SUFFIX?

> +#define EXT_SIGNATURE	"sig"

FILENAME_EXT_SIGNATURE?

> +#define NV_BIGINT_MAX_DW 64

A comment re: why that's the right max size would be useful.

> +}NvTegraPkcsVersion;
> +}NvTegraPkcKey;

Missing space after }.

> diff --git a/src/data_layout.c b/src/data_layout.c

> @@ -620,6 +620,24 @@ write_image(build_image_context *context, file_type image_type)
>   					token_bl_crypto_hash,
>   					(u_int32_t*)hash_buffer,

> +				/* save bl sig to file bl.sig */
> +				pkc_savefile(BL_FILENAME, (u_int8_t *)sign,
> +						RSA_KEY_BYTE_SIZE, EXT_SIGNATURE);

This filename also shouldn't be hard-coded.

> diff --git a/src/parse.c b/src/parse.c

> +static int
> +parse_pkckey_file(build_image_context *context, parse_token token, char *rest)

> +	/* check save option */
> +	if (*rest == ',') {
> +		++rest;
> +
> +		/* Parse option. */
> +		if (strstr(rest, OPTION_SAVE) != NULL)
> +			save_key = 1;

This should error out if there's any other unexpected garbage.

> +	}

else error?

> diff --git a/src/rsa_key_parse.c b/src/rsa_key_parse.c

> +static void pkc_string_to_prime(u_int8_t *pBuffer, u_int8_t *pPrimeNum)
> +{
> +	u_int32_t i = 0;
> +
> +	while (i < (RSA_KEY_BYTE_SIZE * 2)) {
> +		*pPrimeNum = HEX_TO_DEC(pBuffer[i]) * 16 +
> +			HEX_TO_DEC(pBuffer[i + 1]);
> +		i += 2;
> +		pPrimeNum++;
> +	}

What if the string is too short or has an odd length; are those problems 
possible?


> +static bool
> +pkc_extract_polar_ssl_primes(

> +	/* Parse POLARSSL format */
> +	pTokenP = (u_int8_t *)strstr((char *)pBuffer, PRIME_PATTERN_P);
> +	pTokenQ = (u_int8_t *)strstr((char *)pBuffer, PRIME_PATTERN_Q);
> +
> +	if (pTokenP != NULL && pTokenQ != NULL) {

There would be fewer indentation levels if this was:

if (!pTokenP || !pTokenQ)
     return false;

> +		printf("PKC key in PolarSSL format\n");

Shouldn't that be debug output only? The tool shouldn't be noisy all the 
time.

> +static int
> +NvTegraPkcAsnParser(
> +    NvU8 *pBuf,
> +    NvU32 BufSize,
> +    NvU8 *pP,
> +    NvU8 *pQ)
> +{
> +    NvS32 i = 0;
> +    NvS32 LocalSize = 0;
> +    NvU32 Index = 0;
> +    NvU32 SequenceNum = 0;
> +    NvU32 IntegerNum = 0;
> +    NvU32 Expo = 0;
> +    NvU8 Type = 0;

All these initializations just hide used-before-initialized bugs. Can 
you please try removing them? The same comment applies elsewhere.

> +            case INTEGER:                       /*  INTEGER */
> +                switch(IntegerNum)
> +                {
> +                    case 0:     /*  PrivateKeyInfo version  */
> +                    case 1:     /*  PrivateKey version  */
> +                    case 3:     /*  Modulus */
...
> +                    case 2:     /*  Public Exponent */

All those instances of multiple spaces should be collapsed to just 1. 
The same comment may apply elsewhere.

> +                    case 4:     /*  P */
...
> +                        for (i = 0, Index++; i < LocalSize; i++)
> +                        {
> +                            *(pP++) = pBuf[Index++];
> +                        }

That looks like memcpy. {} aren't needed.

> +                    case 5:     /*  Q */

Cases 4 and 5 are identical, save for whether writing to pP or pQ. Can 
they be combined?

> +            default:
> +                /*  Ideally control should not come here for a .pk8 file */
> +                return NvError_BadParameter;

"Ideally" implies "should not happen, but we accept it if it happens". 
This seems to error out if that happens, which is a strong assertion.

> +static bool
> +pkc_extract_open_ssl_primes(

> +    if ((memcmp(pBuffer, DerFormat, sizeof(DerFormat)) != 0) &&
> +        (memcmp(pBuffer, PEMFORMAT_START, sizeof(PEMFORMAT_START) - 1) != 0))
> +    {
> +        return false;
> +    }

Is it guaranteed that in PEM format, there are no blank lines or other 
data at the start/end of the file? I don't expect so since that's the 
entire point of the large strings that are used as PEM format markers, 
but perhaps.

> +    DerKeySize = BufSize - sizeof(PEMFORMAT_END);
> +    pPemStart = pBuffer + sizeof(PEMFORMAT_START);
> +
> +    if (memcmp(pBuffer + DerKeySize, PEMFORMAT_END,
> +        sizeof(PEMFORMAT_END) - 1) != 0)
> +    {
> +        return false;
> +    }

What if the file is shorter than DerKeySize + strlen(PEMFORMAT_START) + 
strlen(PEMFORMAT_END)?

> +    printf("PKC key in Open SSL format\n");
> +
> +    if (memcmp(pBuffer, DerFormat, sizeof(DerFormat)) != 0)
> +    {

Please be consistent about wrapping/not-wrapping braces. I think this 
project uses wrapped braces.

> +        DerKeySize = DerKeySize - sizeof(PEMFORMAT_START);
> +
> +        e = NvBase64Decode(pPemStart, DerKeySize, NULL, &Base64Size);
> +	if (e != NvSuccess) {
> +		printf("Base 64 decoding size failed\n");
> +		goto fail;
> +	}
> +
> +
> +        pBase64Buf = malloc(Base64Size);

Two blank lines there, and indentation issues throughout the function.

> +fail:
> +
> +    if (pBase64Buf != NULL)
> +        free(pBase64Buf);

free() handles NULL.

> +    if (e != NvSuccess)
> +        return false;
> +
> +    return true;

that's: return e == NvSuccess;

> +static bool
> +pkc_extract_private_keys(
> +	u_int8_t *pBuffer,
> +	u_int32_t BufSize,
> +	u_int8_t *pP,
> +	u_int8_t *pQ)
> +{
> +	return
> +	((pkc_extract_open_ssl_primes(pBuffer, BufSize, pP, pQ) == true) ||
> +	(pkc_extract_polar_ssl_primes(pBuffer, BufSize, pP, pQ) == true));

Wonky indentation. No need for "== true";

> +static NvU32 NvInverseDigit(NvU32 x)
> +{
> +    NvU32 i = 1;
> +    NvU32 j = 2;
> +    do
> +    {
> +        i ^= (j ^ (j & (x * i)));
> +        j += j;
> +    }
> +    while (j);

"while" should be wrapped with }

What does this function do and how/why? A comment is needed.

> +static NvU32
> +NvBigIntIsZero(
> +    const NvU32 *x,
> +    const NvU32 Digits)
> +{
> +    NvU32 i;
> +    for (i = 0; i < Digits; i++)
> +    {
> +        if (x[i] != 0)
> +        {
> +            return NV_FALSE;
> +        }

No need for {}.

> +static NvU32
> +NvBigIntSubtract(
> +    NvU32 *z,
> +    const NvU32 *x,
> +    const NvU32 *y,
> +    const NvU32 Digits)
> +{
> +    NvU32 i, j, k;
> +    for (i = k = 0; i < Digits; i ++)
> +    {
> +        j = x[i] - k;
> +        k = (j > (~k)) ? 1 : 0;
> +        j -= y[i];
> +        k += (j > (~y[i])) ? 1 : 0;
> +        z[i] = j;
> +    }
> +    return k;

">" should evaluate to 1 or 0, so you can drop the ?:.

It would help to use sane variable names, e.g k -> borrow, j -> tmp or 
something like that.

I would also have expected simpler checks for borrow and only a single 
check to be necessary. i.e. a final "if (j > x[i])". I assume that an 
NvBigInt is unsigned? NvBigIntcompare's implementation seems to imply so.

I wonder why all these math functions are re-implemented rather than 
making use of the "big digits" code in libmcrypto? Where did all this 
math code come from?

> +static NvU32 NvBigIntGetBit(const NvU32 *x, NvU32 i)
> +{
> +  NvU32 b = 0;
> +
> +  return (((x[i >> 5] >> (i & 0x1f)) ^ b) & 1);

Why "^ b" when b is hard-coded to 0?

I haven't reviewed the rest of the math functions in any way.

> +NvBase64Decode(

> +    if (pOutBuf == NULL)
> +    {
> +        /* Valid if the caller is requesting the size of the decoded
> +         * binary buffer so they know how much to alloc.
> +         */
> +        *pOutBufSize = 0;
> +    }
> +    else
> +    {
> +        /* Validate the size of the passed input data buffer.
> +         * In theory the input buffer size should be 3/4 the size of
> +         * the decoded buffer. But if there were some white
> +         * space chars in input buffer then it is possible that the
> +         * input buffer is smaller.
> +         * First validate against 2/3rds the size of the input buffer
> +         * here. That allows for some slop.
> +         * Below code makes sure output buffer size is big enough.
> +         */
> +        if (*pOutBufSize < (InBufSize * 2)/3)

If there's a known maximal minimum size for the buffer, why not just 
return that in the !pOutBuf case rather than executing the big/slow loop 
below?

> +    /* This loop is less efficient than it could be because
> +     * it's designed to tolerate bad characters (like whitespace)
> +     * in the input buffer.
> +     */
> +    while (i < InBufSize)
> +    {
> +        NvU8 CurrVal;
> +        NvU32 ValidLen = 0;
> +        NvU8 ValidBuf[4];
> +
> +        // gather 4 good chars from the pInBufput stream

Inconsistent comment style.

> +        if (pOutBuf == NULL)
> +        {
> +            // just measurpInBufg the size of the destpInBufation buffer

Search/replace typos there.

> +        switch (ValidLen)
> +        {
> +            case 4:
> +                // 4 pInBufput chars equals 3 pOutBufput chars
> +                pOutBuf[2] = (unsigned char ) (((ValidBuf[2] << 6) & 0xc0) | ValidBuf[3]);
> +                // fall through
> +            case 3:
> +                // 3 pInBufput chars equals 2 pOutBufput chars
> +                pOutBuf[1] = (unsigned char ) (ValidBuf[1] << 4 | ValidBuf[2] >> 2);
> +                // fall through
> +            case 2:
> +                // 2 pInBufput chars equals 1 pOutBufput char
> +                pOutBuf[0] = (unsigned char ) (ValidBuf[0] << 2 | ValidBuf[1] >> 4);
> +                pOutBuf += ValidLen - 1;
> +                break;
> +            case 1:
> +                // Unexpected
> +                break;
> +            case 0:
> +                // conceivable if white space follows the end of valid data
> +                break;
> +            default:
> +                // Unexpected
> +                break;
> +        }

Shouldn't at least cases 1, return an error?

There are lots of formatting errors in this patch that I didn't 
explicitly call out. Lots of cleanup is required.

I didn't review the math code. It'd be best if it was replaced with 
something pre-existing rather than re-inventing the wheel.

Someone familiar with our chip security needs to review the crypto usage 
in this code.

> diff --git a/src/rsa_key_parse.h b/src/rsa_key_parse.h

> +#define HEX_TO_DEC(c)                                   \
> +    (((c) >= '0' && (c) <= '9') ? (c) - '0' :           \
> +     ((c) >= 'a' && (c) <= 'f') ? (c) - 'a' + 10 :      \
> +     ((c) >= 'A' && (c) <= 'F') ? (c) - 'A' + 10 : -1)

I believe that's already in libmcrypto's hex2byte().

> +/* Explicitly sized signed and unsigned ints. */
> +typedef unsigned char      NvU8;  /**< 0 to 255 */
> +typedef unsigned short     NvU16; /**< 0 to 65535 */
> +typedef unsigned int       NvU32; /**< 0 to 4294967295 */
> +typedef unsigned long long NvU64; /**< 0 to 18446744073709551615 */
> +typedef signed char        NvS8;  /**< -128 to 127 */
> +typedef signed short       NvS16; /**< -32768 to 32767 */
> +typedef signed int         NvS32; /**< -2147483648 to 2147483647 */
> +typedef signed long long   NvS64; /**< 2^-63 to 2^63-1 */

Let's not introduce even more types. cbootimage already has types for these.

> +#define NV_TRUE	1
> +#define NV_FALSE 0

Let's just use defines from system header files for these.

> +#define NvSuccess			0
> +#define NvError_BadParameter		-10
> +#define NvError_InsufficientMemory	-11

Can't we use error codes from <errno.h>?

> +#endif /* #ifndef INCLUDED_RSA_KEY_PARSE_H_N */

Just "#endif"; no need for the comment.
